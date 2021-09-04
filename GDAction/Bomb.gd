extends RigidBody2D

var main
var BombParticles = load("res://BombParticles.tscn")

func _ready():
	main = get_node("/root/MainScene")
	pass # Replace with function body.

func _on_Timer_timeout():
	$AnimatedSprite.hide()
	#$CPUParticles2D.restart()
	var bp = BombParticles.instance()
	bp.position = position
	main.add_child(bp)
	bp.get_node("CPUParticles2D").restart()
	bp.get_node("BombAudio").play()
	queue_free()
	pass # Replace with function body.
