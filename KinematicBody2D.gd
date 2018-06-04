extends KinematicBody2D

var points = Array()

func _ready():
	# lemniscate_of_gerono(-4, 4)
	lemniscate_of_bernoulli(-4, 4)

func _draw():
	for p in points:
		draw_circle(p, 2, Color(255,0,0))

func lemniscate_of_gerono(start, end):
	var new_pos = Vector2()
	var scale = Vector2(100,100)
	var t = start
	while t <= end:
		new_pos.x = cos(t)
		new_pos.y = sin(2 * t) / 2
		print(new_pos * scale)
		points.append(new_pos * scale)
		t += 0.1
	
func lemniscate_of_bernoulli(start, end):
	var new_pos = Vector2()
	var pos_scale = Vector2(100,100)
	var t = start
	while t <= end:
		var scale = 2 / (3 - cos(2 * t))
		new_pos.x = scale * cos(t)
		new_pos.y = scale * sin(2 * t) / 2
		print(new_pos * pos_scale)
		points.append(new_pos * pos_scale)
		t += 0.1