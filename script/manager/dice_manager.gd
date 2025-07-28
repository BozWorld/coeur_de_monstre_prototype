extends Node
class_name DiceManager

const DICE_COUNT = 5
const SUCCESS_THRESHOLD = 4

signal dice_count_threshold_reached(count: int)

var current_dice_count = 0
var dice_count_thresholds = [3, 5]  # Seuils à surveiller
var triggered_thresholds = []  # Seuils déjà déclenchés

func roll_dice(_instinct_distribution: Dictionary) -> Dictionary:
    # lance les dés selon la répartition d'instincs
    # retorune: { "successes": int, "results": Array, "tier": int }
    var results = []
    
    return { "successes": 0, "results": results, "tier": 0 }
func calculate_tier(successes: int) -> int:
    # 1-2 succès = Tier 1, 3-4 succès = Tier 2, 5+ succès = Tier 3
    return 0

func check_crisis_condition(successes: int) -> String:
    #retourne le type de crise si applicable ( "none", "incompetence", "transcendance")
    return "none"

func get_available_actions(instinct: String, tier: int) -> Array:
    # retourne les actions disponibles selon l'instinct et le tier
    return []

func add_dice():
    current_dice_count += 1
    _check_dice_count_thresholds()

func _check_dice_count_thresholds():
    for threshold in dice_count_thresholds:
        if current_dice_count >= threshold and threshold not in triggered_thresholds:
            triggered_thresholds.append(threshold)
            dice_count_threshold_reached.emit(threshold)
            print("Seuil de dés atteint : ", threshold)

func reset_dice_count():
    current_dice_count = 0
    triggered_thresholds.clear()

