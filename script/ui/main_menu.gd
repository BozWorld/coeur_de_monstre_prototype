extends Control

@export var main_scene: PackedScene

func _on_bt_play_pressed() -> void:
    var nouvelle_scene = main_scene
    get_tree().change_scene_to_packed(nouvelle_scene)
    pass # Replace with function body.


func _on_bt_quit_pressed() -> void:
    get_tree().quit()
    pass # Replace with function body.