extends Node


var player_data: PlayerData
var current_sequence: SequenceData
var story_manager: StoryManager
var dice_manager: DiceManager
var crisis_manager: CrisisManager
@export var UiManager: UiManager
var current_social_points: int = 0
var current_adversity_points: int = 0
var current_intuition_points: int = 0
signal sequence_started(sequence_name)
signal sequence_completed(results)
signal crisis_triggered(crisis_type)
signal chapter_completed(chapter_name)


func begin_game():
    # Initialise les managers
    player_data = PlayerData.new()
    dice_manager = DiceManager.new()
    UiManager.dice_roller_ui.visible = true
    # story_manager = StoryManager.new()
    # dice_manager = DiceManager.new()
    # crisis_manager = CrisisManager.new()
    
    # Charge le premier chapitre
    #load_chapter("chapter1")

func start_sequence(sequence_name: String):
    # lance une sequence ( exploration / combat / social)
    pass
    
func complete_sequence(results: Dictionary):
    # traite les résultats de la séquence
    pass

func trigger_crisis(crisis_type: String):
    # déclenche une crise spécifique
    pass