extends Node
# ############################################################################ #
class_name UiManager

# ############################################################################ #

@export var dice_roller_ui: Control
@export var start_button: Control

func _activate_interface() -> void:
	dice_roller_ui.visible = true
# func _ready() -> void:
	# dice_roller_ui.visible = true

	# Connecter les signaux si nécessaire
	# Exemple: dice_manager.dice_count_threshold_reached.connect(_on_dice_count_threshold_reached)


func _on_button_pressed() -> void:
	dice_roller_ui.visible = true
	start_button.visible = false
	pass # Replace with function body.
