extends KinematicBody2D

var points = Array()

func _ready():
	lemniscate_of_gerono(-4, 4)

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