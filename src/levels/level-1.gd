extends Node2D

onready var timer = get_node("Timer")
var bg_counter = 0

const PHASES = 3

export var friends = 7
export (String, MULTILINE) var message = ""
var friends_saved = 0

var audio_file = "res://resource/sound/Level I Loop.wav"

func _ready():
	$Timer.set_wait_time(32)
	$Timer.start()
	$Messages/redattack.visible = false
	$Messages/greenattack.visible = false
	$Messages/yellowattack.visible = false


func _on_Timer_timeout():
	bg_counter += 1
	bg_counter = 0 if bg_counter > PHASES else bg_counter
	
	if bg_counter == 0:
		$ParallaxBackground/Eclipse/AnimatedSprite.play("sun")
		$Player.eclipse = false
		$Foes/Foe1.eclipse = false
		$Foes/Foe2.eclipse = false
		$Foes/Foe3.eclipse = false
		$Foes/Foe4.eclipse = false
		$Foes/Foe5.eclipse = false
		$Foes/Foe6.eclipse = false
		$Foes/Foe7.eclipse = false
		$Foes/Foe8.eclipse = false
		$Foes/Foe9.eclipse = false
		$Foes/Foe10.eclipse = false
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-1")
		$ParallaxBackground/Mountains/AnimatedSprite.play("day")
		$ParallaxBackground/Mountains2/AnimatedSprite.play("day")
		$EclipseSound.stop()
		$DaySound.play()
	if bg_counter == 1:
		$ParallaxBackground/Eclipse/AnimatedSprite.play("1")
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-2")
		$ParallaxBackground/Mountains/AnimatedSprite.play("transition")
		$ParallaxBackground/Mountains2/AnimatedSprite.play("transition")
		$Player.eclipse = true
		$Foes/Foe1.eclipse = true
		$Foes/Foe2.eclipse = true
		$Foes/Foe3.eclipse = true
		$Foes/Foe4.eclipse = true
		$Foes/Foe5.eclipse = true
		$Foes/Foe6.eclipse = true
		$Foes/Foe7.eclipse = true
		$Foes/Foe8.eclipse = true
		$Foes/Foe9.eclipse = true
		$Foes/Foe10.eclipse = true
		$TransitionSound.play()
		$EclipseSound.play()
		$DaySound.stop()
			
	if bg_counter == 2:
		$ParallaxBackground/Eclipse/AnimatedSprite.play("eclipse")
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-3")
		$ParallaxBackground/Mountains/AnimatedSprite.play("night")
		$ParallaxBackground/Mountains2/AnimatedSprite.play("night")
	if bg_counter == 3:
		$ParallaxBackground/Eclipse/AnimatedSprite.play("2")
		$ParallaxBackground/Sky/AnimatedSprite.play("sun-2")
		$ParallaxBackground/Mountains/AnimatedSprite.play("transition")
		$ParallaxBackground/Mountains2/AnimatedSprite.play("transition")


func _on_Foe_hit_something():
	$Indicator.life -= 1
	$Indicator.update_life()
	if $Indicator.life <= 0:
		$Timer.stop()
		get_tree().change_scene("res://levels/level-1.tscn")


func _on_Door_exit_level():
	if friends_saved >= friends:
		get_tree().change_scene("res://character/credits.tscn")


func _on_Foe_saved():
	friends_saved += 1
	$MonsterScream.play()
	if friends_saved < friends:
		$Items/Door/AnimatedSprite.play("close")
		$Items/Door.open = false
	else:
		$Items/Door/AnimatedSprite.play("open")
		$Items/Door.open = true


func _physics_process(delta):
	if Input.is_action_just_pressed("red"):
		$Messages/redattack.visible = false
	if Input.is_action_just_pressed("green"):
		$Messages/greenattack.visible = false
	if Input.is_action_just_pressed("yellow"):
		$Messages/yellowattack.visible = false
		
	if Input.is_action_pressed("A"):
		$Panel.visible = false


func _on_Red_red_collected():
	print("red")
	$Messages/redattack.visible = true
	$Player.redattack = true


func _on_Yellow_yellow_collected():
	$Messages/yellowattack.visible = true
	$Player.yellowattack = true

func _on_Green_green_collected():
	$Messages/greenattack.visible = true
	$Player.greenattack = true
