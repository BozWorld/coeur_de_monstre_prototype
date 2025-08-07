# story_manager.gd
extends Node

var _ink_player: InkPlayer
var last_full_text = ""

signal full_text_ready(full_text)
signal choices_available(choices)
signal story_loaded(success)
@export var name_character: String = "elise"
@export var level: int = 1

func _ready():
	# Connecter les signaux du GameManager
	_GameManager.story_requested.connect(_on_story_requested)
	_GameManager.variable_updated.connect(_on_variable_updated)
	_GameManager.sequence_started.connect(_on_sequence_started)



func _initialize_ink_player() -> void:
	_ink_player = InkPlayer.new()
	add_child(_ink_player)
	_ink_player.ink_file = load("res://ink/jsons/sequence1_bosquet.json")
	_ink_player.connect("loaded", Callable(self, "_on_story_loaded"))
	_ink_player.create_story()

func _on_story_loaded(success: bool) -> void:
	print("Story loaded: ", success)
	if success:
		_ink_player.set_variable("name", name_character)
		_ink_player.set_variable("level", level)
		_ink_player.set_variable("lien_dice", _GameManager.get_lien_dice())
		_ink_player.set_variable("adversite_dice", _GameManager.get_adversite_dice())
		_ink_player.set_variable("intuition_dice", _GameManager.get_intuition_dice())
		_continue_story()
		# create_choice_buttons()
	else:
		print("Failed to load the story")
	print("Emitting story loaded signal")
	emit_signal("story_loaded", success)

func create_choice_buttons():
	var choices = []
	if _ink_player and _ink_player.has_choices:
		choices = _ink_player.current_choices
		emit_signal("choices_available", choices)
	else:
		print("No choices available")

func apply_choice_and_continue(index):
	if _ink_player:
		_ink_player.choose_choice_index(index)
		_continue_story()
func _on_story_requested(story_name: String):
	# Charger l'histoire demandée
	_initialize_ink_player()

func _on_variable_updated(name: String, value):
	# Mettre à jour les variables Ink si le player existe
	if _ink_player:
		_ink_player.set_variable(name, value)
		print("Variable updated: ", name, " = ", value)
	else:
		print("can't access")

func _on_sequence_started(sequence_name: String):
	# Continuer l'histoire jusqu'au prochain point
	_continue_story()

func _continue_story():
	var full_text = ""

	# Chercher des tags de test de dés
	var needs_dice_roll = false
	var instinct_type = "intuition"  # Par défaut
	var difficulty = 1
	
	while _ink_player and _ink_player.can_continue:
		var text = _ink_player.continue_story()
		full_text += text + "\n"

	for tag in _ink_player.get_current_tags():
		if tag == "dice_test: true":
			needs_dice_roll = true
		elif tag.begins_with("instinct_required:"):
			instinct_type = tag.split(":")[1].strip_edges()
		elif tag.begins_with("tier_required:"):
			difficulty = int(tag.split(":")[1])
	
	# Si un jet de dés est requis, lancer la procédure
	if needs_dice_roll:
		var dice_distribution = {
			"lien": 0,
			"adversité": 0,
			"intuition": 0
		}
		
		# Bonus selon les stats du joueur
		match instinct_type:
			"intuition":
				dice_distribution.intuition = _GameManager.get_intuition_dice()
			"lien":
				dice_distribution.lien = _GameManager.get_lien_dice()
			"adversité":
				dice_distribution.adversité = _GameManager.get_adversite_dice()
		
		# Demander un jet de dés
		_GameManager.emit_signal("dice_roll_requested", dice_distribution)
		
		# Attendre le résultat
		var dice_result = await _GameManager.dice_roll_completed
		
		# Définir le résultat dans Ink
		_ink_player.set_variable("dice_result_success", dice_result.successes >= difficulty)

	
	# Stocker le dernier texte et émettre le signal
	last_full_text = full_text
	full_text_ready.emit(full_text)
	
	# Émettre les choix si disponibles
	if _ink_player and _ink_player.has_choices:
		choices_available.emit(_ink_player.current_choices)
	
func get_current_text() -> String:
	return last_full_text
