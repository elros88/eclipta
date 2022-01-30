extends Area2D

signal red_collected

func _ready():
	$Panel.visible = false

func _on_Red_body_entered(body):
	emit_signal("red_collected")
	#Panel.visible = true
	queue_free()

