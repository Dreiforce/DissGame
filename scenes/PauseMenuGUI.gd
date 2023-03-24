extends Control

signal continue_pressed
signal exit_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_continue_pressed():
	unpause()
	continue_pressed.emit()


func _on_exit_pressed():
	unpause()
	exit_pressed.emit()

func pause():
	show()
	get_tree().paused = true

func unpause():
	hide()
	get_tree().paused = false


