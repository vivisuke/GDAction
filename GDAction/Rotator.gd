extends StaticBody2D

signal collide_with_player


func _ready():
	pass # Replace with function body.



func _on_RotatorArea2D_body_entered(body):
	if body == Global.player:
		emit_signal("collide_with_player")
	pass # Replace with function body.
