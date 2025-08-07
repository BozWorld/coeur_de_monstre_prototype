extends Resource

class_name PlayerData

@export var health_points: int = 8
@export var instincts: Dictionary = {
    "lien": {"dice": 0, "points": 0, "tier": 1},
    "adversité": {"dice": 0, "points": 0, "tier": 1},
    "intuition": {"dice": 0, "points": 0, "tier": 1}
}
@export var mutations: Array[String] = []
@export var companions: Array[String] = []
@export var inventory: Dictionary = {}
@export var story_variables: Dictionary = {}


# Méthodes pour modifier les stats
func add_points(instinct_name: String, points: int) -> void:
    instincts[instinct_name]["points"] += points
    # Recalculer le tier
    update_tier(instinct_name)
    
func set_dice(instinct_name: String, dice: int) -> void:
    instincts[instinct_name]["dice"] = dice

func update_tier(instinct_name: String) -> void:
    var points = instincts[instinct_name]["points"]
    if points >= 5:
        instincts[instinct_name]["tier"] = 3
    elif points >= 3:
        instincts[instinct_name]["tier"] = 2
    else:
        instincts[instinct_name]["tier"] = 1

