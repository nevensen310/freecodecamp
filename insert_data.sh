#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
CLEAR=$($PSQL "truncate teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ "$WINNER" != "winner" ]]
  then
    # get team_id of winner
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    # if winner_id not there
    if [[ -z $WINNER_ID ]]
    then
      # enter into teams
      INSERT_WINNER=$($PSQL "insert into teams(name) values('$WINNER')")
      # get new team_id of winner
      WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    fi
    # get team_id of opponent
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    # if opponent_id not there
    if [[ -z $OPPONENT_ID ]]
    then
      # enter into teams
      INSERT_OPPONENT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      # get new team_id of opponent
      OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    fi
    INSERT_GAME_DATA=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done
