extends Control

class_name DiceRollerUIDebug
    
const DICE_COUNT = 5
const SUCCESS_THRESHOLD = 4
const MAX_INSTINCTS = 2

var current_dice_count: int = 0
var current_social_lvl: int = 0
var current_social_dice: int = 0

var current_adversity_lvl: int = 0
var current_adversity_dice: int = 0

var current_intuition_lvl: int = 0
var current_intuition_dice: int = 0


func _process(delta: float) -> void:
    if current_social_dice + current_adversity_dice + current_intuition_dice > DICE_COUNT:
        print("your stat is social: ", current_social_dice, " adversity: ", current_adversity_dice, " intuition: ", current_intuition_dice)
        return
    pass
    
    
func _on_button_social_pressed() -> void:
    if current_dice_count <= DICE_COUNT:
        if current_social_dice >= MAX_INSTINCTS:
            print("Maximum number of social dice reached.")
            return
        if current_social_dice < MAX_INSTINCTS:
            current_dice_count += 1
            current_social_dice += 1
            current_social_lvl += lancer_de_6_faces()
            print("Current social dice: ", current_social_dice)
            print("Current social level: ", current_social_lvl)
    else :
        print("Maximum number of dice reached.")
        return

func lancer_de_6_faces() -> int:
    var rng = RandomNumberGenerator.new()
    rng.randomize()  # Initialise avec une graine basée sur le temps
    var resultat = rng.randi_range(1, 6)
    return resultat



func _on_button_adversite_pressed() -> void:
    if current_dice_count <= DICE_COUNT:
        if current_adversity_dice >= MAX_INSTINCTS:
            print("Maximum number of adversity dice reached.")
            return
        if current_adversity_dice < MAX_INSTINCTS:
            current_dice_count += 1
            current_adversity_dice += 1
            current_adversity_lvl += lancer_de_6_faces()
            print("Current adversity dice: ", current_adversity_dice)
            print("Current adversity level: ", current_adversity_lvl)


func _on_button_intution_pressed() -> void:
    if current_dice_count <= DICE_COUNT:
        if current_intuition_dice >= MAX_INSTINCTS:
            print("Maximum number of social dice reached.")
            return
        if current_intuition_dice < MAX_INSTINCTS:
            current_dice_count += 1
            current_intuition_dice += 1
            current_intuition_lvl += lancer_de_6_faces()
            print("Current intuition dice: ", current_intuition_dice)
            print("Current intuition level: ", current_intuition_lvl)