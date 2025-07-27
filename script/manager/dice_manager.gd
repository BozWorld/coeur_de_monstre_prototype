extends Node
class_name DiceManager
const DICE_COUNT = 5
const SUCCESS_THRESHOLD = 4

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

