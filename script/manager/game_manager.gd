extends Node

var player_data: PlayerData
var current_sequence: SequenceData
var story_manager: StoryManager
var dice_manager: DiceManager
var crisis_manager: CrisisManager
var current_social_points: int = 0
var current_adversity_points: int = 0
var current_intuition_points: int = 0
signal sequence_started(sequence_name)
signal sequence_completed(results)
signal crisis_triggered(crisis_type)
signal chapter_completed(chapter_name)
signal request_show_exploration_ui

func _ready() -> void:
	_StoryManager._initialize_ink_player()
	return

func begin_game():
	# Initialise les managers
	initialize_player_data()
	emit_signal("request_show_exploration_ui")
	# story_manager = StoryManager.new()
	# dice_manager = DiceManager.new()
	# crisis_manager = CrisisManager.new()
	
	# Charge le premier chapitre
	#load_chapter("chapter1")


func activate_dice_menu():
	return
	# # Affiche le menu des dés
	# if UiManager and UiManager.dice_roller_ui:
	# 	UiManager.dice_roller_ui.visible = true

func set_lien_dice(value: int) -> void:
	player_data._set_lien_dice(value)
	if story_manager:
		story_manager._set_variable("lien_dice", value)

func set_adversite_dice(value: int) -> void:
	player_data._set_adversite_dice(value)
	if story_manager:
		story_manager._set_variable("adversite_dice", value)

func set_intuition_dice(value: int) -> void:
	player_data._set_intuition_dice(value)
	if story_manager:
		story_manager._set_variable("intuition_dice", value)

func initialize_player_data():
	# Initialise les données du joueur
	player_data = PlayerData.new()
	player_data.health_points = 8
	player_data.instinc_dice = {
		"lien": 0,
		"adversité": 0,
		"intuition": 0
	}
	return

func choose_sequence(sequence_name: String):
	# Choisit une séquence à lancer
	# current_sequence = SequenceData.new(sequence_name)
	emit_signal("sequence_started", sequence_name)

func start_sequence(_sequence_name: String):
	# if UiManager:
	# 	UiManager.exploration_ui.visible = true
	# lance une sequence ( exploration / combat / social)
	pass
	
func complete_sequence(results: Dictionary):
	# traite les résultats de la séquence
	emit_signal("sequence_completed", results)

func trigger_crisis(crisis_type: String):
	# déclenche une crise spécifique
	print("Crise déclenchée : ", crisis_type)
	emit_signal("crisis_triggered", crisis_type)
