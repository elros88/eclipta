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
		$Foe1.eclipse = false
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-1")
	if bg_counter == 1:
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-2")
		$Player.eclipse = true
		$Foe1.eclipse = true
	if bg_counter == 2:
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-3")
	if bg_counter == 3:
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-2")
		

func _on_Foe1_hit_something():
	$Indicator.life -= 1
	$Indicator.update_life()
	if $Indicator.life <= 0:
		$Timer.stop()
		get_tree().change_scene("res://levels/level-1.tscn")

