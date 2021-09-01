extends KinematicBody2D

export (int) var run_speed = 400
export (int) var jump_speed = -600
export (int) var gravity = 1200

const run_accel = 10

var velocity = Vector2(0, 0)
var jumping = false
var run_left = false
var run_right = false

func _ready():
	pass # Replace with function body.


func get_input():
	#velocity.x = 0
	run_right = Input.is_action_pressed('ui_right')
	run_left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	if jump and (is_on_floor() || is_on_wall()):
		jumping = true
		velocity.y = jump_speed
		$AnimatedSprite.play("jump")
	if run_right:
		if jumping:
			velocity.x = run_speed
		else:
			velocity.x = min(velocity.x + run_accel, run_speed)
		$AnimatedSprite.play("right")
	if run_left:
		if jumping:
			velocity.x = -run_speed
		else:
			velocity.x = max(velocity.x - run_accel, -run_speed)
		$AnimatedSprite.play("left")
	if !jumping && !run_right && !run_left:
		velocity.x *= 0.9
		$AnimatedSprite.play("idle")

func _physics_process(delta):
	if Global.paused: return
	#print("_physics_process() ", velocity)
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor() && velocity.y > 0:
		jumping = false
		$AnimatedSprite.play("idle")
		#$AnimatedSprite.play("jump")
	#print(velocity)
	velocity = move_and_slide(velocity, Vector2(0, -1))
	#move_and_collide(velocity*delta)
	#print(velocity)
	if is_on_wall():
		print("on_wall")
	#print(jumping)
