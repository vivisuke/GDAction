extends Node2D

enum {
	TILE_NONE = -1,
	TILE_GROUND,
	TILE_GRASS,
	TILE_SPIKE,
	TILE_COIN,
}

var spiked = false
var score = 0

func _ready():
	Global.player = $Player
	update_score_label()
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton && event.is_pressed():
		Global.paused = !Global.paused
	elif event is InputEventKey && Global.paused:
		Global.paused = false
	pass
	
func _physics_process(delta):
	var plpos = $Player.position + Vector2(0, 16)
	var xy = $TileMap.world_to_map(plpos)
	#print(xy)
	var item = $TileMap.get_cell(xy.x, xy.y)
	#print(item)
	if item == TILE_SPIKE:
		if !spiked:
			spiked = true
			$Player/AudioStreamPlayer2D.play()
	else:
		spiked = false
	if item == TILE_COIN:
		$TileMap.set_cell(xy.x, xy.y, TILE_NONE)
		score += 10
		update_score_label()

func update_score_label():
	$ParallaxBackground/ParallaxLayer3/ScoreLabel.text = "%05d" % score

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
