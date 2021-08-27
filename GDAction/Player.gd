extends KinematicBody2D

export (int) var walk_speed = 400
export (int) var jump_speed = -600
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var walk_left = false
var walk_right = false

func _ready():
	pass # Replace with function body.


func get_input():
	velocity.x = 0
	walk_right = Input.is_action_pressed('ui_right')
	walk_left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	if jump and (is_on_floor() || is_on_wall()):
		jumping = true
		velocity.y = jump_speed
		$AnimatedSprite.play("jump")
	if walk_right:
		velocity.x += walk_speed
		$AnimatedSprite.play("right")
	if walk_left:
		velocity.x -= walk_speed
		$AnimatedSprite.play("left")
	if !jumping && !walk_right && !walk_left:
		$AnimatedSprite.play("idle")

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor() && velocity.y > 0:
		jumping = false
		$AnimatedSprite.play("idle")
		#$AnimatedSprite.play("jump")
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_wall():
		print("on_wall")
	#print(jumping)
