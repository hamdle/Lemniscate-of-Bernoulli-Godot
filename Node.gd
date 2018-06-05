extends Node

var pos = Vector2()
var pos_scale = Vector2(100, 100)

func _ready():
	pass

func _process(delta):
	lemniscate_of_bernoulli(OS.get_unix_time())
	
func _physics_process(delta):
	$Body2D.move_and_slide( pos * pos_scale )

func lemniscate_of_bernoulli(time):
	var t = time
	var scale = 2 / (3 - cos(2 * t))
	pos.x = scale * cos(t)
	pos.y = scale * sin(2 * t) / 2