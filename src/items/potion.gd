extends Area2D

signal potion_collected

func _ready():
	pass


func _on_Area2D_body_entered(body):
	emit_signal("potion_collected")
	queue_free()
