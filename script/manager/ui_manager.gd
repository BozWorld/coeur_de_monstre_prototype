# ui_manager.gd
extends Node

@export var dice_roller_ui: Control
@export var start_button: Control
@export var exploration_ui: Control
@export var exploration_label: RichTextLabel
var ChoiceButton = load("res://scene/UI/button.tscn")

func _ready():
	# Connecter au GameManager
	_GameManager.ui_visibility_requested.connect(_on_ui_visibility_requested)
	_GameManager.choice_buttons_requested.connect(_on_choice_buttons_requested)
	# Connecter au StoryManager si dans la même scène
	var story_manager = get_node_or_null("../story_manager")
	if story_manager:
		story_manager.choices_available.connect(_on_choice_buttons_requested)
		story_manager.full_text_ready.connect(_on_full_text_ready)
	else:
		# Chercher dans l'arbre
		story_manager = get_tree().get_nodes_in_group("story_manager")
		if story_manager.size() > 0:
			story_manager[0].full_text_ready.connect(_on_full_text_ready)
	
	# Initialiser l'UI
	if dice_roller_ui:
		dice_roller_ui.visible = false
	if exploration_ui:
		exploration_ui.visible = false

func _on_choice_buttons_requested(choices):
	var choice_container = $ExplorationUI/Panel/choice_container/VBoxContainer
	for child in choice_container.get_children():
		child.queue_free()
	
	for i in range(choices.size()):
		var button = ChoiceButton.instantiate()
		button.text = choices[i].text
		button.pressed.connect(func():
			_GameManager._on_choice_selected(i)
		)
		choice_container.add_child(button)

func _on_ui_visibility_requested(ui_name: String, visibility: bool):
	match ui_name:
		"dice_roller_ui":
			if dice_roller_ui:
				dice_roller_ui.visible = visibility
		"exploration_ui":
			if exploration_ui:
				exploration_ui.visible = visibility
				if visibility:
					start_button.visible = false
		"start_button":
			if start_button:
				start_button.visible = visibility

func _on_full_text_ready(full_text: String) -> void:
	if exploration_label:
		# Animation de texte qui apparaît progressivement
		exploration_label.visible_characters = 0
		exploration_label.text = full_text
		
		var tween = create_tween()
		tween.tween_property(exploration_label, "visible_characters", full_text.length(), 1.0)
		tween.play()

func _on_button_pressed():
	# Le bouton doit maintenant communiquer via GameManager
	_on_ui_visibility_requested("dice_roller_ui", false)
	_GameManager.begin_game()

func create_choice_button(choice_text: String, index: int) -> Button:
	var button = ChoiceButton.instantiate()
	button.modulate.a = 0  # Invisible au départ
	button.text = choice_text
	
	button.pressed.connect(func():
		_GameManager._on_choice_selected(index)
	)
	
	# Animation d'apparition
	var tween = create_tween()
	tween.tween_interval(index * 0.1)  # Délai progressif par bouton
	tween.tween_property(button, "modulate:a", 1.0, 0.3)
	
	return button
