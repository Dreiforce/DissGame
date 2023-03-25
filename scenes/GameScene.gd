extends Node2D

@onready var pauseMenu = $CanvasLayer/PauseMenuGUI
@onready var gameOverMenu = $CanvasLayer/GameOverMenuGUI
@onready var mainPlayer = $MainNode/MainPlayer
@onready var powerUps = $MainNode/Node
@onready var HUD = $CanvasLayer/GameGUI

# Called when the node enters the scene tree for the first time.
func _ready():
	pauseMenu.exit_pressed.connect(exit_game)
	gameOverMenu.exit_pressed.connect(exit_game)
	
	for child in powerUps.get_children():
		child.on_entered.connect(hit)

var totalTime = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mainPlayer.position.y > 10000: 
		gameOverMenu.showGameOver()
		
	totalTime += int(delta*1000)
	if(totalTime % 2000 < 1000):
		$MainNode/NPC1.move(1)
	else:
		$MainNode/NPC1.move(-1)

func _input(event):
	if isGameOver() and Input.is_action_just_pressed("ui_cancel"):
		pauseMenu.togglePause()
		
	if Input.is_action_just_pressed("jump"):
		mainPlayer.jump()
	
	mainPlayer.move(Input.get_axis("move_left", "move_right"))

func isGameOver():
	return !gameOverMenu.is_visible_in_tree()

func exit_game():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
	
func hit():
	HUD.decrease_skill(HUD.SPEED)
