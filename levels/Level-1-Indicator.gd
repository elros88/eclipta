extends CanvasLayer

var life = 6
const RECOVER = 3
func _ready():
	pass


func update_life():
	if life == 1:
		$Panel/healthbar.play("1")
	if life == 2:
		$Panel/healthbar.play("2")
	if life == 3:
		$Panel/healthbar.play("3")
	if life == 4:
		$Panel/healthbar.play("4")
	if life == 5:
		$Panel/healthbar.play("5")
	if life == 6:
		$Panel/healthbar.play("6")
	

func _on_potion_collected():
	life += RECOVER
	life = 6 if life >= 6 else life
	update_life()
