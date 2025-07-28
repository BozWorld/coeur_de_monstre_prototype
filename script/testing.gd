extends Node2D


var _ink_player: InkPlayer

@export var name_character: String = "inconnu"
@export var level: int = 1

# Signals
signal story_loaded(success: bool)

func _ready() -> void:
	_initialize_ink_player()


func _initialize_ink_player() -> void:
	_ink_player = InkPlayer.new()
	add_child(_ink_player)
	_ink_player.ink_file = load("res://ink/jsons/sequence1_bosquet.json")
	_ink_player.loads_in_background = true
	_ink_player.connect("loaded", Callable(self, "_on_story_loaded"))
	_ink_player.create_story()

func _on_story_loaded(success: bool) -> void:
	print("Story loaded: ", success)
	if success:
		_ink_player.set_variable("name", name_character)
		_ink_player.set_variable("level", level)
		_continue_story()
	else:
		print("Failed to load the story")
	print("Emitting story loaded signal")
	emit_signal("story_loaded", success)

func _set_variable(name: String, value: Variant) -> void:
	_ink_player.set_variable(name, value)

func _continue_story() -> void:
	print("Continuing story")
	var full_text = ""
	
	# Récupérer le texte initial avant les choix
	while _ink_player.can_continue:
		var text = _ink_player.continue_story()
		print("Fragment: [" + text + "]")
		full_text += text + "\n"
	
	print("\n----- TEXTE COMPLET -----")
	print(full_text)
	print("-------------------------\n")
	
	# Afficher les choix disponibles
	if _ink_player.has_choices:
		print("Choix disponibles:")
		for i in range(_ink_player.current_choices.size()):
			print(str(i) + ": " + _ink_player.current_choices[i].text)

func get_all_story_content() -> Dictionary:
	var full_text = ""
	var all_tags = []
	
	# Récupérer tout le texte jusqu'aux choix
	while _ink_player.can_continue:
		var text = _ink_player.continue_story_maximally()
		full_text += text
		# Récupérer les tags
		var tags = _ink_player.current_tags
		for tag in tags:
			if not all_tags.has(tag):
				all_tags.append(tag)
	
	return {"text": full_text, "tags": all_tags}
