extends Node2D

var counter = 0
signal close_game()

func _ready():
	pass

func _process(delta):
	
	if Input.is_action_just_pressed("jump"):
		 counter += 1
	
	if counter == 0:
		$AnimatedSprite.play("0")
	if counter == 1:
		$AnimatedSprite.play("1")
	if counter == 2:
		$AnimatedSprite.play("2")
	if counter == 3:
		$AnimatedSprite.play("3")
	if counter == 4:
		emit_signal("close_game")
		get_tree().quit()
	
