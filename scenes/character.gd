extends CharacterBody2D

signal hit

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	SignalManager.change_player_pos.connect(adjustPos)


func _physics_process(_delta):
	# Add the gravity.
	change_animation()
	if not is_on_floor():
		velocity.y += gravity * _delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()	



func change_animation():
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	
	if velocity.y != 0: # negative Y is up
		$AnimatedSprite2D.play("jump")
	else:
		if velocity.x != 0:
			$AnimatedSprite2D.play("walk")
		else:
			$AnimatedSprite2D.play("idle")

func adjustPos(globPos):
	set_deferred("global_position", globPos)
