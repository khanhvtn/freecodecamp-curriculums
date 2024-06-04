#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  else
   echo -e "\n~~~~~ MY SALON ~~~~~\n"
   echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  SERVICES=$($PSQL "select * from services");
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  IS_EXISTED_SERVICE_ID=$($PSQL "select * from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $IS_EXISTED_SERVICE_ID ]]
  then
  MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      ADD_CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
      UPDATTE_BOOK_APPOINTMENT "$CUSTOMER_ID" "$SERVICE_ID_SELECTED" "$SERVICE_TIME" "$CUSTOMER_NAME" "$SERVICE_NAME"
    else
      CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      UPDATTE_BOOK_APPOINTMENT "$CUSTOMER_ID" "$SERVICE_ID_SELECTED" "$SERVICE_TIME" "$CUSTOMER_NAME" "$SERVICE_NAME"
    fi
  fi
}

UPDATTE_BOOK_APPOINTMENT(){
  CUSTOMER_ID=$1
  SERVICE_ID=$2
  SERVICE_TIME=$3
  CUSTOMER_NAME=$4
  SERVICE_NAME=$5
  UPDATTE_BOOK_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  
}

MAIN_MENU
