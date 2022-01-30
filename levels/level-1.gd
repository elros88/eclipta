extends Node2D

onready var timer = get_node("Timer")
var bg_counter = 0

const PHASES = 3

func _ready():
	$Timer.set_wait_time(4)
	$Timer.start()


func _on_Timer_timeout():
	bg_counter += 1
	bg_counter = 0 if bg_counter > PHASES else bg_counter
	
	if bg_counter == 0:
		$Player.eclipse = false
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-1")
	if bg_counter == 1:
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-2")
	if bg_counter == 2:
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-3")
		$Player.eclipse = true
	if bg_counter == 3:
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-2")
		
