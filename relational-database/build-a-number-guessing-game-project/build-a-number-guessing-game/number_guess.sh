#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RAND_NUM=$((1 + $RANDOM % 1000))
ATTEMPTS=0
IS_NEW_USER=1

MAIN(){
  echo "Enter your username:"
  read USERNAME
  USERNAME_LENGTH=${#USERNAME}
  if [ $USERNAME_LENGTH -gt 0 -a $USERNAME_LENGTH -le 22 ]; 
  then
    # Search User
    TARGET_USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
    if [[ -z $TARGET_USER_ID ]];
    then
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
      ADD_NEW_USER=$($PSQL "insert into users(username, frequent_games) values('$USERNAME', 0)")
      TARGET_USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
    else
      BEST_GAME=$(echo $($PSQL "select min(best_guess) from games where user_id=$TARGET_USER_ID") | sed 's/ //g')
      GAMES_PLAYED=$(echo $($PSQL "select frequent_games from users where user_id=$TARGET_USER_ID") | sed 's/ //g')
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
    START_GUESS
     
  else
    echo -e "\nUsername can not exceed 22 characters"
    MAIN
  fi  

}

START_GUESS(){
  MESSAGE=$1
  if [[ -z $MESSAGE ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $MESSAGE
  fi

  read USER_GUESS_NUM
  if [[ $USER_GUESS_NUM =~ ^[0-9]+$ ]]
  then
    if [[ $USER_GUESS_NUM -gt $RAND_NUM ]]
    then
      ATTEMPTS=$(($ATTEMPTS + 1))
      START_GUESS "It's lower than that, guess again:"
    elif [[ $USER_GUESS_NUM -lt $RAND_NUM ]]
    then
      ATTEMPTS=$(($ATTEMPTS + 1))
      START_GUESS "It's higher than that, guess again:"
    else
      ATTEMPTS=$(($ATTEMPTS + 1))
      echo "You guessed it in $ATTEMPTS tries. The secret number was $RAND_NUM. Nice job!"
      SAVE_USER_INFO
    fi
  else
    START_GUESS "That is not an integer, guess again:"
  fi
}
SAVE_USER_INFO(){
  NEW_GAMES_PLAYED=$(($GAMES_PLAYED + 1))
  UPDATE_USER_RESULT=$($PSQL "update users set frequent_games=$NEW_GAMES_PLAYED where user_id=$TARGET_USER_ID")
  ADD_GAME_RESULT=$($PSQL "insert into games(user_id, best_guess) values($TARGET_USER_ID, $ATTEMPTS)")
}

MAIN
