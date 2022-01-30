extends KinematicBody2D

var velocity = Vector2(0,0)
var eclipse = false
export var direction = -1
export (String, MULTILINE) var message = ""
export var saved = false

const GRAVITY = 35
const SPEED = 100


signal hit_something

func _ready():
	if direction == 1 and eclipse:
		$AnimatedSprite.flip_h = true
	
	$Floor_Checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$Panel.visible = false
	$Panel/Label.text = message

func _physics_process(delta):
	
	if eclipse and not saved:
		velocity.x = 50*direction
		
		if $Panel.visible:
			$Panel.visible = false
		
		if $AnimatedSprite.animation != "eclipse":
			$AnimatedSprite.play("eclipse")
		
		if is_on_wall() or not $Floor_Checker.is_colliding():
			direction *= -1
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
			$Floor_Checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	else:
		$AnimatedSprite.play("day")
		velocity.x = 0
	
	velocity.y = 20	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Side_Checker_body_entered(body):
	if eclipse:
		emit_signal("hit_something")
		$Panel.visible = false
	else:
		$Panel.visible = true

func save_friend():
	if eclipse:
		eclipse = false
		saved = true
