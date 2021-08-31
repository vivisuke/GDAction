extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player = $Player
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		Global.paused = !Global.paused
	pass


func _on_Flag_body_entered(body):
	print("Flag_body_entered ", body.name)
	if body == $Player:
		$Flag/AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_Spider_colliedWithPlayer():
	$Player/AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_Spike_body_entered(body):
	$Player/AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_Rotator_collide_with_player():
	$Player/AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_Coin_body_entered(body):
	if body == Global.player:
		$Coin.queue_free()
	pass # Replace with function body.
