This is a repository of projects that I have done to work towards freecodecamp certifications.

 ~~~ Relational Databases Certification ~~~
1. Celestial Bodies Database
  - universe.sql generates a database with five tables (galaxies, stars, planets, moons, and nasa_missions) full of mostly made up data about them
2. World Cup Database
  - worldcup.sql generates a database with two tables (games and teams) that holds data from two years worth of world cup tournaments
  - insert_data.sh scrapes data form a csv file into the two tables of the worldcup database
  - queries.sh queries the tables in the database to answer questions like: how many goals did winning teams score in all games combined?
3. Salon Appointment Scheduler
  - salon.sql creates a database with two tables (appointments and customers) that holds data about the salon's appointments and customers
  - salon.sh takes user input about type of service requested, personal information, and appointment time and updates the tables of the database accordingly to keep track of appointments
4. Periodic Table Database
  - periodic_table.sql creates a database with two tables (elements and properties) that contains some of the elements on the periodic table as well as information about them such as melting/boiling point and atomic mass
  - element.sh allows you to enter an atomic number, an element's symbol, or an element's name as an argument and tells you infomration about the element you chose.
5. Number Guessing Game
  - number_guess.sql creates a database with two tables (games and users) that contains data from each game played as well as username of each player to help keep track of the games they have played
  - number_guess.sh asks the user for a username and tells them data from their previous games played if they have played before. A random number is generated and the user attempts to guess the number with feedback from the game whether the random number is higher or lower. After the number has been guessed, it enters data from the game into the games table
