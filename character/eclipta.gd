extends KinematicBody2D

var velocity = Vector2(0,0)

const GRAVITY = 35
const SPEED = 300
const JUMP = -900
export var eclipse = false

const YELLOW = preload("res://character/yellow-attack.tscn")

export var life = 3
var saved_friends = 0

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED 
		if not eclipse:
			$AnimatedSprite.play("running")
		else:
			$AnimatedSprite.play("running-night")	
		$AnimatedSprite.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
			
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		if not eclipse:
			$AnimatedSprite.play("running")
		else:
			$AnimatedSprite.play("running-night")	
		$AnimatedSprite.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
			
	else:
		if not eclipse:
			$AnimatedSprite.play("standing")	
		else:
			$AnimatedSprite.play("standing-night")	
	
	if not is_on_floor():
		if not eclipse:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("jump-night")
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP
		
	if Input.is_action_just_pressed("attack"):
		var yellow = YELLOW.instance()
		if sign($Position2D.position.x) == -1:
			yellow.set_attack_direction(-1)
		else:
			yellow.set_attack_direction(1)
		get_parent().add_child(yellow)
		yellow.position = $Position2D.global_position
		
	velocity.y = velocity.y + GRAVITY	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1)
