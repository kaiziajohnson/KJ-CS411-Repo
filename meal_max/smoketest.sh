#!/bin/bash

# Define the base URL for the Flask API
BASE_URL="http://localhost:5000/api"

# Flag to control whether to echo JSON output
ECHO_JSON=false

# Parse command-line arguments
while [ "$#" -gt 0 ]; do
  case $1 in
    --echo-json) ECHO_JSON=true ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
  esac
  shift
done


###############################################
#
# Health checks
#
###############################################

# Function to check the health of the service
check_health() {
  echo "Checking health status..."
  curl -s -X GET "$BASE_URL/health" | grep -q '"status": "healthy"'
  if [ $? -eq 0 ]; then
    echo "Service is healthy."
  else
    echo "Health check failed."
    exit 1
  fi
}

# Function to check the database connection
check_db() {
  echo "Checking database connection..."
  curl -s -X GET "$BASE_URL/db-check" | grep -q '"database_status": "healthy"'
  if [ $? -eq 0 ]; then
    echo "Database connection is healthy."
  else
    echo "Database check failed."
    exit 1
  fi
}

##########################################################
#
# Kitchen Management
#
##########################################################

<<<<<<< HEAD
create_song() {
=======
create_meal() {
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
  meal=$1
  cuisine=$2
  price=$3
  difficulty=$4

  echo "Adding meal ($meal - $cusine, $price) to the kitchen..."
<<<<<<< HEAD
  curl -s -X POST "$BASE_URL/create-song" -H "Content-Type: application/json" \
=======
  curl -s -X POST "$BASE_URL/create-meal" -H "Content-Type: application/json" \
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
    -d "{\"meal\":\"$meal\", \"title\":\"$title\", \"price\":$price, \"difficulty\":\"$difficulty\"}" | grep -q '"status": "success"'

  if [ $? -eq 0 ]; then
    echo "Meal added successfully."
  else
    echo "Failed to add meal."
    exit 1
  fi
}

<<<<<<< HEAD
delete_song_by_id() {
=======
delete_meal() {
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
  meal_id=$1

  echo "Deleting meal by ID ($meal_id)..."
  response=$(curl -s -X DELETE "$BASE_URL/delete-meal/$meal_id")
  if echo "$response" | grep -q '"status": "success"'; then
    echo "Meal deleted successfully by ID ($meal_id)."
  else
    echo "Failed to delete meal by ID ($meal_id)."
    exit 1
  fi
}

get_meal_by_id() {
  meal_id=$1

  echo "Getting meal by ID ($meal_id)..."
<<<<<<< HEAD
  response=$(curl -s -X GET "$BASE_URL/get-song-from-catalog-by-id/$meal_id")
  if echo "$response" | grep -q '"status": "success"'; then
    echo "Song retrieved successfully by ID ($meal_id)."
=======
  response=$(curl -s -X GET "$BASE_URL/get-meal-by-id/$meal_id")
  if echo "$response" | grep -q '"status": "success"'; then
    echo "Meal retrieved successfully by ID ($meal_id)."
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
    if [ "$ECHO_JSON" = true ]; then
      echo "Meal JSON (ID $meal_id):"
      echo "$response" | jq .
    fi
  else
    echo "Failed to get meal by ID ($meal_id)."
    exit 1
  fi
}

<<<<<<< HEAD
get_song_by_compound_key() {
  artist=$1
  title=$2
  year=$3

  echo "Getting song by compound key (Artist: '$artist', Title: '$title', Year: $year)..."
  response=$(curl -s -X GET "$BASE_URL/get-song-from-catalog-by-compound-key?artist=$(echo $artist | sed 's/ /%20/g')&title=$(echo $title | sed 's/ /%20/g')&year=$year")
  if echo "$response" | grep -q '"status": "success"'; then
    echo "Song retrieved successfully by compound key."
    if [ "$ECHO_JSON" = true ]; then
      echo "Song JSON (by compound key):"
      echo "$response" | jq .
    fi
  else
    echo "Failed to get song by compound key."
=======
############################################################
#
# Battle Management
#
############################################################

clear_combatants(){
  echo "Clearing the combatant list."
  response=$(curl -s -X POST "$BASE_URL/clear-combatants")

  if echo "$response" | grep -q '"status": "success"'; then
    echo "All combatants cleared successfully."
  else
    echo "Failed to clear combatants."
    exit 1
  fi
}

get_battle_score() {
  id=$1
  echo "Calculating battle score for combatant with ID: $meal_id..."
  response=$(curl -s -X GET "$BASE_URL/get-battle-score/$meal_id")

  if echo "$response" | grep -q '"status": "success"'; then
    score=$(echo "$response" | jq -r '.score')
    echo "Battle score for combatant ID $meal_id: $score"
    if [ "$ECHO_JSON" = true ]; then
      echo "Battle Score JSON:"
      echo "$response" | jq .
    fi
  else
    echo "Failed to calculate battle score for combatant ID $meal_id."
    exit 1
  fi
}

get_combatants() {
  echo "Retrieving current list of combatants..."
  response=$(curl -s -X GET "$BASE_URL/get-combatants")

  if echo "$response" | grep -q '"status": "success"'; then
    echo "Combatants retrieved successfully."
    if [ "$ECHO_JSON" = true ]; then
      echo "Combatants JSON:"
      echo "$response" | jq .
    fi
  else
    echo "Failed to retrieve combatants."
    exit 1
  fi
}

prep_combatant() {
  meal=$1
  price=$2
  cuisine=$3
  difficulty=$4

  echo "Adding meals to combatant list: $meal, Price: $price, Cuisine: $cuisine, Difficulty: $difficulty..."
  response=$(curl -s -X POST "$BASE_URL/prep-combatant" -H "Content-Type: application/json" \
    -d "{\"meal\": \"$meal\", \"price\": $price, \"cuisine\": \"$cuisine\", \"difficulty\": \"$difficulty\"}")

  if echo "$response" | grep -q '"status": "success"'; then
    echo "Combatant $meal added successfully."
    if [ "$ECHO_JSON" = true ]; then
      echo "Response JSON:"
      echo "$response" | jq .
    fi
  else
    echo "Failed to add combatant $meal."
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
    exit 1
  fi
}

######################################################
#
# Leaderboard
#
######################################################

# Function to get the meal leaderboard sorted by meal stats
get_meal_leaderboard() {
  echo "Getting meal leaderboard sorted by meal stats..."
<<<<<<< HEAD
  response=$(curl -s -X GET "$BASE_URL/song-leaderboard?sort=meal_stats")
=======
  response=$(curl -s -X GET "$BASE_URL/meal-leaderboard?sort=meal_stats")
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
  if echo "$response" | grep -q '"status": "success"'; then
    echo "Meal leaderboard retrieved successfully."
    if [ "$ECHO_JSON" = true ]; then
      echo "Leaderboard JSON (sorted by meal stats):"
      echo "$response" | jq .
    fi
  else
    echo "Failed to get meal leaderboard."
    exit 1
  fi
<<<<<<< HEAD
}
=======
}

# Health checks
check_health
check_db

meal: str, cuisine: str, price: float, difficulty: str
#Create meals
create_meal "Burger" "American" 5.0 'MED'
create_meal "Pizza" "Itlaian" 7.0 'LOW'
create_meal "Sushi" "Japanese" 4.0 'LOW'

delete_meal 3
get_meal_by_id 2

prep_combatant "Burger" "American" 5.0 'MED'
prep_combatant "Pizza" "Itlaian" 7.0 'LOW'
prep_combatant "Sushi" "Japanese" 4.0 'LOW'

get_combatants
get_battle_score 1
get_battle_score 2

clear_combatants

echo "All tests passed successfully!"
>>>>>>> 9eba516 (Finshed Smoketest.sh and fixed some unchanged character in Kitchen_model_test)
