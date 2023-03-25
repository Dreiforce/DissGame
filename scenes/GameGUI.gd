extends Control

var SPEED = "speed"
var JUMP = "jump"
var INTELLIGENCE = "intelligence"
var STRENGTH = "strength"

@onready var speedBar = $GridContainer/SPDProgressBar
@onready var jumpBar = $GridContainer/JMPProgressBar
@onready var intelligenceBar = $GridContainer/INTProgressBar
@onready var strengthBar = $GridContainer/STRProgressBar

var dict_skill_to_bar

var dict_skill_to_val = {
	SPEED: 0,
	JUMP: 0,
	INTELLIGENCE: 0,
	STRENGTH: 0,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	init_dict()
	reset_skills(4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func decrease_skill(skill):
	update_skill(skill, dict_skill_to_bar[skill].value - 1)


func update_skill(skill: String, value: int):
	dict_skill_to_val[skill] = value
	dict_skill_to_bar[skill].value = value


func reset_skills(value: int):
	for skill in dict_skill_to_val:
		update_skill(skill, value)


func init_dict():
	dict_skill_to_bar = {
		SPEED: speedBar,
		JUMP: jumpBar,
		INTELLIGENCE: intelligenceBar,
		STRENGTH: strengthBar,
	}
