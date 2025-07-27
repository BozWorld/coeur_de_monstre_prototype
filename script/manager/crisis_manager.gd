extends Node

class_name CrisisManager

signal crisis_completed(success:bool, reward: Dictionary)


func start_crisis(crisis_type: String, instinct_distribution: Dictionary):
    # lance le mini-jeu approprié pour la crise
    pass
    
func complete_crisis(_success: bool) -> Dictionary:
    # traite le résultats de la crise
    # retourne les récompenses ou pénalités
    return {}