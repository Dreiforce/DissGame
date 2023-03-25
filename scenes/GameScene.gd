extends Node2D

@onready var pauseMenu = $CanvasLayer/PauseMenuGUI
@onready var gameOverMenu = $CanvasLayer/GameOverMenuGUI
@onready var mainPlayer = $MainNode/MainPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pauseMenu.exit_pressed.connect(exit_game)
	gameOverMenu.exit_pressed.connect(exit_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mainPlayer.position.y > 10000: 
		gameOverMenu.showGameOver()

func _input(event):
	if isGameOver() and Input.is_action_just_pressed("ui_cancel"):
		pauseMenu.togglePause()

func isGameOver():
	return !gameOverMenu.is_visible_in_tree()

func exit_game():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
