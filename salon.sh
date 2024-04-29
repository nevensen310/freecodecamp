#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_MENU() {

  echo Please select a service:
  echo -e "\n1) Hair Cut\n2) Shave\n3) Hair Cut w/ Wash\n"

  # get service
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  # if not found
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] | [[ -z $SERVICE_NAME ]]
  then
  # show menu again
  echo -e "That is not a valid service number.\n"
  SERVICE_MENU
  else
    # get phone number
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE
    # get customer_id and customer_name
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
    # if not fount
    if [[ -z $CUSTOMER_ID ]]
    then
      # get customer_name
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME
      # enter customer in customers table
      ENTER_CUSTOMER_DATA=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      # get new customer_id
      CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    fi
    # get appointment time
    echo -e "\nWhat time would you like your appointment to be?"
    read SERVICE_TIME
    # enter appointment in appointments table
    ENTER_APPOINTMENT_DATA=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

}

SERVICE_MENU
