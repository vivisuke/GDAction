extends StaticBody2D

var pos0
var ticks0

func _ready():
	pos0 = position
	ticks0 = OS.get_ticks_msec()
	pass # Replace with function body.

func _physics_process(delta):
	var ticks = OS.get_ticks_msec() - ticks0
	#print(ticks/1000, " ", sin(ticks/1000.0*3.14))
	position.y = pos0.y + 64*3*sin(ticks/4000.0*3.14)
	
