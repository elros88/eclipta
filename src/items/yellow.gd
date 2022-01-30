extends Area2D

signal yellow_collected

func _ready():
	$Panel.visible = false

func _on_Yellow_body_entered(body):
	emit_signal("yellow_collected")
	#Panel.visible = true
	queue_free()
	


