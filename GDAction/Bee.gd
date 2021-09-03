extends KinematicBody2D

var main
var player
var ticks
var v = Vector2(0, 0)

var Bomb = load("res://Bomb.tscn")

func _ready():
	main = get_node("/root/MainScene")
	print("main = ", main)
	player = get_node("/root/MainScene/Player")
	print("player = ", player)
	$AnimatedSprite.play("fly")
	pass # Replace with function body.

func _physics_process(delta):
	if Global.paused: return
	if position.x - player.position.x < -10:
		#scale.x = -1
		$AnimatedSprite.flip_h = true
		v.x = 100
		ticks = OS.get_ticks_msec()
	elif position.x - player.position.x > 10:
		#scale.x = 1
		$AnimatedSprite.flip_h = false
		v.x = -100
		ticks = OS.get_ticks_msec()
	else:
		if OS.get_ticks_msec() - ticks >= 1000:
			ticks = OS.get_ticks_msec()
			var bomb = Bomb.instance()
			bomb.position = position
			main.add_child(bomb)
		return
	move_and_collide(v*delta)
