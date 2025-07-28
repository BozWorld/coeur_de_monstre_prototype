extends Node


var player_data: PlayerData
var current_sequence: SequenceData
var story_manager: StoryManager
var dice_manager: DiceManager
var crisis_manager: CrisisManager

signal sequence_started(sequence_name)
signal sequence_completed(results)
signal crisis_triggered(crisis_type)
signal chapter_completed(chapter_name)

func start_sequence(sequence_name: String):
    # lance une sequence ( exploration / combat / social)
    pass
    
func complete_sequence(results: Dictionary):
    # traite les résultats de la séquence
    pass

func trigger_crisis(crisis_type: String):
    # déclenche une crise spécifique
    pass