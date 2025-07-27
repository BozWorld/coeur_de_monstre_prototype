extends Node2D

var random_data: String = "random_data"
var player_data: Dictionary = {
    "name": "Player",
    "health": 100,
    "instincts": {
        "courage": 0,
        "wisdom": 0,
        "compassion": 0
    }
}

func _ready() -> void:
    # Initialisation du jeu
    print("Game is ready")
    print("Random Data: ", random_data)
    print("Player Data: ", player_data)