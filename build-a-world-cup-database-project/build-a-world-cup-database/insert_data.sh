#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    # add winner team id if exist
    if [[ -z $WINNER_TEAM_ID ]]
    then
      INSERT_WINNER_TEAM_ID_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $INSERT_WINNER_TEAM_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Insert into teams, $WINNER
         WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
      fi
    fi

    # add opponent team id if exist
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      INSERT_OPPONENT_TEAM_ID_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $INSERT_OPPONENT_TEAM_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Insert into teams, $OPPONENT
        OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
      fi
    fi

    # insert games
    INSERT_GAMES_RESULT=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND','$WINNER_TEAM_ID','$OPPONENT_TEAM_ID',$WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo Insert into games, $YEAR,$ROUND,$WINNER_TEAM_ID,$OPPONENT_TEAM_ID
    fi
  fi
done 
