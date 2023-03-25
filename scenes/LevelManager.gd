extends Node

@onready var lvlPath = load("res://scenes/Level2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_level_changed.connect(changeLevels)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func changeLevels():
	get_child(0).queue_free()
	var nextLvl = lvlPath.instantiate()
	call_deferred("add_child", nextLvl)
