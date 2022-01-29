extends KinematicBody2D

var velocity = Vector2()

const GRAVITY = 35
const SPEDD = 100
const JUMP = -1100

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED 
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP
		

	velocity.y = velocity.y + GRAVITY	
	velocity = move_and_slide(velocity, Vector2.UP)
