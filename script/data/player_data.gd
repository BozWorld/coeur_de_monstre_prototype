extends Resource

class_name PlayerData

@export var health_points: int = 8
@export var instinc_dice: Dictionary = {
    "lien": 2,
    "adversité": 2,
    "intution": 1
}


@export var mutation: Array[String] = []
@export var companions: Array[String] = []
@export var inventory: Array[String] = []
@export var completed_sequences: Array[String] = []
@export var chapter_progress: Dictionary = {}

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
    
