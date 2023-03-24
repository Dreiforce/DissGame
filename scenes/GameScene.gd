extends Node2D

@onready var pauseMenu = $CanvasLayer/PauseMenuGUI

# Called when the node enters the scene tree for the first time.
func _ready():
	pauseMenu.exit_pressed.connect(exit_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		pauseMenu.pause()

func exit_game():
	get_tree().change_scene_to_file("res://MainMenu.tscn")