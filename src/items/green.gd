extends Area2D

signal green_collected

func _ready():
	$Panel.visible = false

func _on_Green_body_entered(body):
	emit_signal("green_collected")
	#Panel.visible = true
	queue_free()




