import pytest

from meal_max.models.battle_model import BattleModel
from meal_max.models.kitchen_model import Meal

@pytest.fixture()
def battle_model():
    """Fixture to provide a new instance of BattleModel for each test."""
    return BattleModel()

@pytest.fixture()
def mock_update_play_count(mocker):
    """Mock the update_play_count function for testing purposes."""
    return mocker.patch("meal_max.models.battle_model.update_play_count")

"""Fixtures providing sample meals for the tests."""
@pytest.fixture
def sample_meal1():
    return Meal(1, "Burger", "American", 5.0, 'MED')

@pytest.fixture
def sample_meal2():
    return Meal(2, "Pizza", "Itlaian", 7.0, 'LOW')

@pytest.fixture
def sample_meal3():
    return Meal(3, "Sushi", "Japanese", 4.0, 'LOW')

@pytest.fixture
def sample_combatants_list(sample_meal1, sample_meal2):
    return[sample_meal1,sample_meal2]


###############################################
# Test Initialization
###############################################

def test_battle_model_initialization(battle_model):
    assert len(battle_model.combatants) == 0, "Expected an empty list of combatants on initialization"

###############################################
# Add Combatants Test Cases
###############################################

def test_add_combatant(battle_model, sample_meal1):
    """Test adding a combatant to the combatant list"""
    battle_model.prep_combatant(sample_meal1)
    assert len(battle_model.combatants) == 1
    assert battle_model.combatants[0].meal == "Burger", "Expected 'Burger' to be added to the combatants"

def test_add_combatant_error(battle_model, sample_meal1, sample_meal2, sample_meal3):
    battle_model.prep_combatant(sample_meal1)
    battle_model.prep_combatant(sample_meal2)
    with pytest.raises(ValueError, match="Combatant list is full, cannot add more combatants."):
        battle_model.prep_combatant(sample_meal3)  # Trying to add a third combatant

###############################################
# Battle Score Test Case
###############################################

def test_get_battle_score(battle_model, sample_meal1):
    score = battle_model.get_battle_score(sample_meal1)
    assert score == 38.0, "Expected 'Burger' score is 38.0"

###############################################
# Battle Function Test Cases
###############################################

def test_battle(battle_model, sample_combatants_list):
    battle_model.combatants.extend(sample_combatants_list)
    winner = battle_model.battle()
    assert winner in ["Burger", "Pizza"], "Winner must be one of the initial combatants"

def test_not_enough_combatants(battle_model, sample_meal1):
    battle_model.prep_combatant(sample_meal1)
    with pytest.raises(ValueError, match="Two combatants must be prepped for a battle."):
        battle_model.battle()

###############################################
# Clear Combatants Test Case
###############################################

def test_clear_combatants(battle_model, sample_combatants_list):
    battle_model.combatants.extend(sample_combatants_list)
    battle_model.clear_combatants()
    assert len(battle_model.combatants) == 0, "Expected combatants list to be cleared"

###############################################
# Combatants Retrieval Test Case
###############################################

def test_get_combatants(battle_model, sample_combatants_list):
    battle_model.combatants.extend(sample_combatants_list)
    combatants = battle_model.get_combatants()
    assert len(combatants) == 2, "Expected to retrieve the list with two combatants"

