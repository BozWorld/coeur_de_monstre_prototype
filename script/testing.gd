extends Node2D


var _ink_player: InkPlayer

func _ready() -> void:
	_initialize_ink_player()


func _initialize_ink_player() -> void:
	_ink_player = InkPlayer.new()
	add_child(_ink_player)
	_ink_player.ink_file = load("res://ink/jsons/testing_story.json")
	_ink_player.loads_in_background = true
	_ink_player.connect("loaded", Callable(self, "_on_story_loaded"))
	_ink_player.create_story()

func _on_story_loaded(success: bool) -> void:
	print("Story loaded: ", success)
	if success:
		_continue_story()
	else:
		print("Failed to load the story")

func _emit_story_loaded_signal(success: bool) -> void:
	print("Emitting story loaded signal")
	emit_signal("story_loaded", success)

func _continue_story() -> void:
	print("Continuing story")
	print(_ink_player.continue_story())
