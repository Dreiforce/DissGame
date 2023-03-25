extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.emit_signal("change_player_pos", $Position2D.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
