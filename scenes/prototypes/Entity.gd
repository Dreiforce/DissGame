extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func jump():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY


func move(direction):
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func _process(delta):
	change_animation()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()



func change_animation():
	if velocity.x > 0:
		$AnimatedSprite2D2.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite2D2.flip_h = true
	
	if velocity.y != 0: # negative Y is up
		$AnimatedSprite2D2.play("jump")
	else:
		if velocity.x != 0:
			$AnimatedSprite2D2.play("walk")
		else:
			$AnimatedSprite2D2.play("idle")

