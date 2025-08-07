extends Node


const SAVE_FILE = "user://save_game.json"
# --- Signaux pour la communication ---
signal story_requested(story_name)
signal ui_visibility_requested(ui_name, visibility)
signal dice_roll_requested(instinct_distribution)
signal sequence_started(sequence_name)
signal sequence_completed(results)
signal crisis_triggered(crisis_type)
signal variable_updated(name, value)
signal choice_buttons_requested(choices)
# --- Données du jeu ---
var player_data: PlayerData

var current_sequence: String = ""
var current_social_points: int = 0
var current_adversity_points: int = 0
var current_intuition_points: int = 0
var party_beginned: bool = false

signal stats_updated(instinct_name, points, tier)
signal mutation_unlocked(mutation_id)

func _ready():
	# Aucune référence directe aux autres managers
	print("GameManager initialized")

func begin():
	emit_signal("ui_visibility_requested", "dice_roller_ui", true)
	initialize_player_data()

func begin_game():
	emit_signal("ui_visibility_requested", "dice_roller_ui", false)
	emit_signal("ui_visibility_requested", "exploration_ui", true)
	emit_signal("story_requested", "sequence1_bosquet")

func _on_choice_selected(index):
	var story_manager = get_node("/root/MainScene/story_manager")
	if story_manager:
		story_manager.apply_choice_and_continue(index)
	# _StoryManager._ink_player.choose_choice_index(index)
	# _StoryManager._continue_story()
	
func _on_choices_ready(choices):
	emit_signal("choice_buttons_requested", choices)
	
func initialize_player_data():
	player_data = PlayerData.new()
	player_data.health_points = 8
	player_data.instincts = {
		"lien": {"points": 0, "dice": 0},
		"adversité": {"points": 0, "dice": 0},
		"intuition": {"points": 0, "dice": 0}
	}

func update_story_variables() -> void:
	# Synchroniser avec StoryManager à chaque changement
	var story_manager = get_tree().get_first_node_in_group("story_manager")
	if story_manager and story_manager._ink_player:
		# Synchroniser les dés
		story_manager._ink_player.set_variable("lien_dice", player_data.instincts["lien"]["dice"])
		story_manager._ink_player.set_variable("adversite_dice", player_data.instincts["adversité"]["dice"])
		story_manager._ink_player.set_variable("intuition_dice", player_data.instincts["intuition"]["dice"])
		
		# Autres variables importantes
		for mutation in player_data.mutations:
			story_manager._ink_player.set_variable("has_" + mutation, true)

# --- Fonctions façade pour simplifier l'accès ---
func set_lien_dice(value: int) -> void:
	if player_data:
		player_data.set_dice("lien", value)
	emit_signal("variable_updated", "lien_dice", value)

func get_lien_dice() -> int:
	if player_data:
		return player_data.instincts["lien"]["dice"]
	return 0

func set_adversite_dice(value: int) -> void:
	if player_data:
		player_data.set_dice("adversité", value)
	emit_signal("variable_updated", "adversite_dice", value)

func get_adversite_dice() -> int:
	if player_data:
		return player_data.instincts["adversité"]["dice"]
	return 0
func set_intuition_dice(value: int) -> void:
	if player_data:
		player_data.set_dice("intuition", value)
	emit_signal("variable_updated", "intuition_dice", value)

func get_intuition_dice() -> int:
	if player_data:
		return player_data.instincts["intuition"]["dice"]
	return 0

func start_sequence(sequence_name: String):
	current_sequence = sequence_name
	emit_signal("sequence_started", sequence_name)
	emit_signal("ui_visibility_requested", "exploration_ui", true)

func save_game() -> bool:
	var save_data = {
		"health": player_data.health_points,
		"instincts": player_data.instincts,
		"mutations": player_data.mutations,
		"companions": player_data.companions,
		"current_sequence": current_sequence,
		"inventory": player_data.inventory,
		"timestamp": Time.get_datetime_string_from_system()
	}
	
	# Sauvegarder l'état d'Ink si disponible
	var story_manager = get_tree().get_first_node_in_group("story_manager")
	if story_manager and story_manager._ink_player:
		save_data["ink_state"] = story_manager._ink_player.get_state()
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		return true
	return false

func load_game() -> bool:
	if not FileAccess.file_exists(SAVE_FILE):
		return false
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	var save_data = JSON.parse_string(file.get_as_text())
	
	# Restaurer les données du joueur
	player_data.health_points = save_data["health"]
	player_data.instincts = save_data["instincts"]
	player_data.mutations = save_data["mutations"]
	player_data.companions = save_data["companions"]
	player_data.inventory = save_data["inventory"]
	current_sequence = save_data["current_sequence"]
	
	# Restaurer l'état d'Ink
	if "ink_state" in save_data:
		var story_manager = get_tree().get_first_node_in_group("story_manager")
		if story_manager and story_manager._ink_player:
			story_manager._ink_player.set_state(save_data["ink_state"])
	
	return true
