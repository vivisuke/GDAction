extends KinematicBody2D

signal colliedWithPlayer()

export (int) var walk_speed = 100
export (int) var gravity = 800

var velocity = Vector2(0, 1)
var falling = true
var walk_left = true
var player
var playerCollision


func _ready():
	player = get_node("/root/MainScene/Player")
	#print(player.name)
	#print(player)
	pass # Replace with function body.


func _physics_process(delta):
	if Global.paused: return
	velocity.y += gravity*delta
	velocity = move_and_slide(velocity)
	if falling && velocity.y == 0:
		falling = false
		velocity.x = -walk_speed if walk_left else walk_speed
	if !falling && velocity.x == 0:
		walk_left = !walk_left
		velocity.x = -walk_speed if walk_left else walk_speed
		$AnimatedSprite.flip_h = !walk_left
	if get_slide_count() == 2:
		#print(get_slide_count())
		#print(get_slide_collision(0))
		#print(get_slide_collision(1))
		if get_slide_collision(0).collider == player || get_slide_collision(1).collider == player:
			#print("collied with player")
			emit_signal("colliedWithPlayer")
