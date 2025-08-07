extends Control

class_name DiceRollerUIDebug
	
const DICE_COUNT = 5
const SUCCESS_THRESHOLD = 4
const MAX_INSTINCTS = 2

var current_dice_count: int = 0
var current_social_lvl: int = 0
var current_social_dice: int = 0

var current_adversity_lvl: int = 0
var current_adversity_dice: int = 0

var current_intuition_lvl: int = 0
var current_intuition_dice: int = 0
var printed: bool = false

@export var button_social: Button
@export var button_adversity: Button
@export var button_intuition: Button
@export var button_start: Button
@export var _result_label: RichTextLabel
@export var result_panel: Panel
@export var label_social_count: RichTextLabel
@export var label_adversity_count: RichTextLabel
@export var label_intuition_count: RichTextLabel

signal dice_roll_completed(results)

func _ready() -> void:
	button_social.pressed.connect(_on_button_social_pressed)
	button_adversity.pressed.connect(_on_button_adversite_pressed)
	button_intuition.pressed.connect(_on_button_intution_pressed)
	button_start.pressed.connect(_on_bt_start_pressed)

	# Initialisation des compteurs
	current_dice_count = 0
	current_social_lvl = 0
	current_social_dice = 0
	current_adversity_lvl = 0
	current_adversity_dice = 0
	current_intuition_lvl = 0
	current_intuition_dice = 0

func _process(delta: float) -> void:
	if current_dice_count >= DICE_COUNT and not printed:
		button_start.visible = true
		result_panel.visible = true
		_result_label.text = "Social:" + str(current_social_lvl) + "\n" + \
		"Adversity:" + str(current_adversity_lvl) + "\n" + \
		"Intuition:" + str(current_intuition_lvl)
		printed = true
	pass
	
func _on_button_social_pressed() -> void:
	if current_dice_count < DICE_COUNT:
		if current_social_dice >= MAX_INSTINCTS:
			print("Maximum number of social dice reached.")
			return
		if current_social_dice < MAX_INSTINCTS:
			current_dice_count += 1
			current_social_dice += 1
			current_social_lvl += lancer_de_6_faces()
			label_social_count.text = str(current_social_lvl)
	else :
		print("Maximum number of dice reached.")
		return

func lancer_de_6_faces() -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()  # Initialise avec une graine basée sur le temps
	var resultat = rng.randi_range(1, 6)
	return resultat



func _on_button_adversite_pressed() -> void:
	if current_dice_count < DICE_COUNT:
		if current_adversity_dice >= MAX_INSTINCTS:
			print("Maximum number of adversity dice reached.")
			return
		if current_adversity_dice < MAX_INSTINCTS:
			current_dice_count += 1
			current_adversity_dice += 1
			current_adversity_lvl += lancer_de_6_faces()
			label_adversity_count.text = str(current_adversity_lvl)
	else :
		print("Maximum number of dice reached.")
		return


func _on_button_intution_pressed() -> void:
	if current_dice_count < DICE_COUNT:
		if current_intuition_dice >= MAX_INSTINCTS:
			print("Maximum number of intuition dice reached.")
			return
		if current_intuition_dice < MAX_INSTINCTS:
			current_dice_count += 1
			current_intuition_dice += 1
			current_intuition_lvl += lancer_de_6_faces()
			label_intuition_count.text = str(current_intuition_lvl)
	else :
		print("Maximum number of dice reached.")
		return


func _on_bt_start_pressed() -> void:
	_GameManager.current_social_points = current_social_lvl
	_GameManager.current_adversity_points = current_adversity_lvl
	_GameManager.current_intuition_points = current_intuition_lvl
	_GameManager.set_lien_dice(current_social_dice)
	_GameManager.set_adversite_dice(current_adversity_dice)
	_GameManager.set_intuition_dice(current_intuition_dice)
	_GameManager.begin_game()
	_GameManager.start_sequence("sequence1_start")
	print("your social points: ", _GameManager.current_social_points, " adversity points: ", _GameManager.current_adversity_points, " intuition points: ", _GameManager.current_intuition_points)
	pass # Replace with function body.

# Dans ton DiceManager
func complete_roll(results):
	emit_signal("dice_roll_completed", results)
