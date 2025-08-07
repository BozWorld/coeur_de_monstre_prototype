extends Control

@export var main_scene: PackedScene

func _ready():
    # Avec la nouvelle architecture, pas besoin d'initialiser StoryManager ici
    # Le menu principal doit rester simple et indépendant
    print("Menu principal prêt")
    
    # Optionnel : Réinitialiser l'état du jeu si nécessaire
    if _GameManager:
        # Réinitialiser les variables du jeu entre deux parties
        # GameManager.reset_game_state()
        pass

func _on_bt_play_pressed() -> void:
    # Signaler au GameManager que le joueur commence une nouvelle partie
    if _GameManager:
        # Optionnel : signaler le début d'une nouvelle partie
        # GameManager.new_game_requested = true
        pass
        
    # Changer de scène simplement
    var nouvelle_scene = main_scene
    get_tree().change_scene_to_packed(nouvelle_scene)

func _on_bt_quit_pressed() -> void:
    get_tree().quit()