extends KinematicBody2D

export (int) var walk_speed = 100
export (int) var gravity = 800

var velocity = Vector2(0, 1)
var falling = true
var walk_left = true


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += gravity*delta
	velocity = move_and_slide(velocity)
	if falling && velocity.y == 0:
		falling = false
		velocity.x = -walk_speed if walk_left else walk_speed
	if !falling && velocity.x == 0:
		walk_left = !walk_left
		velocity.x = -walk_speed if walk_left else walk_speed
		$AnimatedSprite.flip_h = !walk_left
