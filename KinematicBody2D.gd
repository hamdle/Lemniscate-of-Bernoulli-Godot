extends KinematicBody2D

enum PLOT { Gerono, Bernoulli }

export var plot_type = PLOT.Gerono
export var timer_speed = 0.25
export var plot_scale = Vector2(100, 100)
export var from = 0.0
export var to = 1.0
export var step = 0.1

var points = Array()
var drawable_points = Array()
var count = 0

var move_count = 0

func _ready():
	# Run plot type
	if (plot_type == PLOT.Gerono):
		lemniscate_of_gerono(from, to)
	elif (plot_type == PLOT.Bernoulli):
		lemniscate_of_bernoulli(from, to)
		
	# Set timer
	$Timer.wait_time = timer_speed

func _physics_process(delta):
	move_and_slide(get_next_vector())

func _process(delta):
	update()
	pass
	
func _draw():
	# for p in drawable_points:
	#	draw_circle(p, 2, Color(255,0,0))
	pass


func lemniscate_of_gerono(start, end):
	var new_pos = Vector2()
	var scale = Vector2(100,100)
	var t = start
	while t <= end:
		new_pos.x = cos(t)
		new_pos.y = sin(2 * t) / 2
		#print(new_pos * plot_scale)
		points.append(new_pos * plot_scale)
		t += step
	
func lemniscate_of_bernoulli(start, end):
	var new_pos = Vector2()
	var pos_scale = Vector2(200,200)
	var t = start
	while t <= end:
		var scale = 2 / (3 - cos(2 * t))
		new_pos.x = scale * cos(t)
		new_pos.y = scale * sin(2 * t) / 2
		#print(new_pos * plot_scale)
		points.append(new_pos * plot_scale)
		t += step

func get_next_vector():
	var step1 = points[move_count]
	var next_move_count = move_count+1
	if next_move_count >= points.size():
		move_count = 0
		next_move_count = 0
		print("cycle")
	var step2 = points[next_move_count]
	move_count += 1
	var result = step1 - step2
	
	return result # * Vector2(40, 25)
	
func _on_Timer_timeout():
	if count >= points.size():
		print(self.name + " done plotting")
		$Timer.stop()
		return
	drawable_points.append(points[count])
	count = count + 1
	#print(count)
