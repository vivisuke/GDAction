extends Area2D

signal collide_with_player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	rotation += 1.5*delta
#	pass


#func _on_Area2D_body_entered(body):
#	if body == Global.player:
#		emit_signal("collide_with_player")
#	pass # Replace with function body.
