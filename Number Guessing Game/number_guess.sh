#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# get username
echo Enter your username:
read USERNAME
# get user_id
USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'")
# if not found
if [[ -z $USER_ID ]]
then
  # first time message
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  # add user into table
  INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME')")
  # get new user_id
  USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'")
else
  # get user data
  GAMES_PLAYED=$($PSQL "select count(*) from games where user_id = $USER_ID" | tr -d " ")
  BEST_GAME=$($PSQL "select min(guesses) from games where user_id = $USER_ID" | tr -d " ")
  # welcome back message
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate number
RANDNUM=$(( 1 + RANDOM % 1000 ))
echo -e "\nGuess the secret number between 1 and 1000:"
# Guesses
GUESSES=0
# loop untill guess = random number
while [[ 1 == 1 ]]
do
  # get guess
  read GUESS
  # if not number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    continue
  else
    # add 1 to guesses
    (( GUESSES++ ))
    # if higher
    if [[ $GUESS > $RANDNUM ]]
    then
      # higher message and add one to guess count
      echo -e "\nIt's lower than that, guess again:"
    # if lower
    elif [[ $GUESS < $RANDNUM ]]
    then
      # lower message and add one to guess count
      echo -e "\nIt's higher than that, guess again:"
    else
      # winning message
      echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RANDNUM. Nice job!"
      break
    fi
  fi
done

INSERT_GAME_DATE=$($PSQL "insert into games(user_id, guesses) values($USER_ID, $GUESSES)")
