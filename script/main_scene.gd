extends Node2D

func _ready() -> void:
	print("Main scene is ready.")
	# Initialize the main scene here, if needed.
	# StoryManager et UIManager sont des nœuds enfants dans la scène
	var story_manager = $story_manager
	var ui_manager = $ui_manager
	
	# Configurer les groupes pour faciliter l'accès
	story_manager.add_to_group("story_manager")
	ui_manager.add_to_group("ui_manager")
	_GameManager.begin()
