extends Resource

class_name PlayerData

@export var health_points: int = 8
@export var instinc_dice: Dictionary = {
    "lien": 0,
    "adversité": 0,
    "intuition": 0
}


@export var mutation: Array[String] = []
@export var companions: Array[String] = []
@export var inventory: Array[String] = []
@export var completed_sequences: Array[String] = []
@export var chapter_progress: Dictionary = {}


func _set_lien_dice(value: int):
    instinc_dice["lien"] = value

func _set_adversite_dice(value: int):
    instinc_dice["adversité"] = value

func _set_intuition_dice(value: int):
    instinc_dice["intuition"] = value

func get_lien_dice() -> int:
    return instinc_dice["lien"]

func get_adversite_dice() -> int:
    return instinc_dice["adversité"]

func get_intuition_dice() -> int:
    return instinc_dice["intuition"]

func add_mutation(mutation_name: String):
    mutation.append(mutation_name)

func has_mutation(mutation_name: String) -> bool:
    return mutation.has(mutation_name)

func modify_health(amount: int):
    health_points += amount

func distribute_dice(distribution: Dictionary):
    for dice_type in distribution:
        if instinc_dice.has(dice_type):
            instinc_dice[dice_type] = distribution[dice_type]
    
