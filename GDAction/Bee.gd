extends KinematicBody2D

var player
var v = Vector2(0, 0)

func _ready():
	player = get_node("/root/MainScene/Player")
	print(player)
	$AnimatedSprite.play("fly")
	pass # Replace with function body.

func _physics_process(delta):
	if Global.paused: return
	if position.x - player.position.x < -10:
		#scale.x = -1
		$AnimatedSprite.flip_h = true
		v.x = 100
	elif position.x - player.position.x > 10:
		#scale.x = 1
		$AnimatedSprite.flip_h = false
		v.x = -100
	else:
		return
	move_and_collide(v*delta)
