extends Node
# ############################################################################ #
class_name UiManager

# ############################################################################ #

@export var dice_roller_ui: Control
@export var start_button: Control
@export var exploration_ui: Control
@export var exploration_label: RichTextLabel


func _ready() -> void:
	# Initialisation de l'interface
	_GameManager.request_show_exploration_ui.connect(_on_show_exploration_ui)
	_StoryManager.full_text_ready.connect(_on_full_text_ready)


func _on_full_text_ready(full_text: String) -> void:
	if exploration_label:
		exploration_label.text = full_text
		print("Full text ready: ", full_text)
func _on_show_exploration_ui():
	if exploration_ui:
		exploration_ui.visible = true
		dice_roller_ui.visible = false


func _activate_interface() -> void:
	dice_roller_ui.visible = true
# func _ready() -> void:
	# dice_roller_ui.visible = true

	# Connecter les signaux si nécessaire
	# Exemple: dice_manager.dice_count_threshold_reached.connect(_on_dice_count_threshold_reached)


func _on_button_pressed() -> void:
	dice_roller_ui.visible = true
	start_button.visible = false
	exploration_ui.visible = true
	print("Interface activated")
	pass # Replace with function body.
