extends Area2D

var open = false
signal exit_level

func _ready():
	pass


func _on_Area2D_body_entered(body):
	if open:
		emit_signal("exit_level")
