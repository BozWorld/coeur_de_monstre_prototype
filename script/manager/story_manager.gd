extends Node

class_name StoryManager

var story: InkPlayer
var current_variable: Dictionary = {}

func load_chapter(chapter_name: String):
    # Charge un chapitre spécifique de l'histoire
    pass

func process_ink_tags(tags: Array) -> Dictionary:
    var action_data = {}
    for tag in tags:
        var parts = tag.split(":")
        action_data[parts[0]] = parts[1]
    return action_data

func execute_consequences(consequences: String):
    for consequence in consequences.split(","):
        var parts = consequence.split(":")
        if consequence.begins_with("+"):
            # ajouter une information
            pass
        elif consequence.begins_with("-"):
            # retirer quelque chose
            pass

func start_sequence(sequence_name: String):
    # Lance une séquence d'histoire
    pass

func get_available_action() -> Array:
    # retourne les actions disponibles selon le contexte
    return []

func choose_action(action_index: int) -> Dictionary:
    # éxécuté un choix et retourne les conséquences
    return {}

func update_story_variables(new_vars: Dictionary):
    # Met à jour les variables de l'histoire
    for key in new_vars:
        current_variable[key] = new_vars[key]