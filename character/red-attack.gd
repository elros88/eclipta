extends Area2D

var velocity = Vector2(0,0)
const SPEED = 320
var direction = 1

signal hitted

func _ready():
	pass

func set_attack_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("attack")
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	emit_signal("hitted")
	if "Foe" in body.name:
		body.save_friend()
	queue_free()
