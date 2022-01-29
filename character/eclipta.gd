extends KinematicBody2D

var velocity = Vector2(0,0)

const GRAVITY = 35
const SPEED = 200
const JUMP = -900

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED 
		$AnimatedSprite.play("running")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("running")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("standing")	
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP
		
	velocity.y = velocity.y + GRAVITY	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1)
