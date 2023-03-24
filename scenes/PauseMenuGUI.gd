extends Control

signal continue_pressed
signal exit_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func togglePause():
	if get_tree().paused:
		unpause()
	else:
		pause()

func _on_continue_pressed():
	unpause()

func _on_exit_pressed():
	exit()

func pause():
	show()
	get_tree().paused = true

func unpause():
	hide()
	get_tree().paused = false
	continue_pressed.emit()

func exit():
	hide()
	get_tree().paused = false
	exit_pressed.emit()
