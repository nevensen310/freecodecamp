#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if no argument given
if [[ -z $1 ]]
then
  # ask for element
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number = $1" | tr -d " ")
    NAME=$($PSQL "select name from elements where atomic_number = $1" | tr -d " ")
    SYMBOL=$($PSQL "select symbol from elements where atomic_number = $1" | tr -d " ")
  else
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol = '$1' or name = '$1'" | tr -d " ")
    NAME=$($PSQL "select name from elements where symbol = '$1' or name = '$1'" | tr -d " ")
    SYMBOL=$($PSQL "select symbol from elements where symbol = '$1' or name = '$1'" | tr -d " ")
  fi
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    TYPE=$($PSQL "select type from properties left join types using(type_id) where atomic_number = $ATOMIC_NUMBER" | tr -d " ")
    ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER" | tr -d " ")
    MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER" | tr -d " ")
    BOILING_POINT=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER" | tr -d " ")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi
