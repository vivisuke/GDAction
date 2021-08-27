extends KinematicBody2D

export (int) var walk_speed = 100
export (int) var gravity = 1200

var velocity = Vector2(-walk_speed, 0)
var walk_left = true

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity)
	#print("vel.x = ", velocity.x)
	#print("get_slide_count() = ", get_slide_count())
	#for i in get_slide_count():
	#	var collision = get_slide_collision(i)
	#	print("I collided with ", collision.collider.name)
	if velocity.x == 0:
		walk_left = !walk_left
		velocity.x = -walk_speed if walk_left else walk_speed
		$AnimatedSprite.flip_h = !walk_left
