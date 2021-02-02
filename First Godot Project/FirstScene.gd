extends Node2D

onready var fruit = preload("res://fruit.tscn")
onready var fruit_container = get_node("fruit_container")
onready var score_label = get_node("Control/score_label")
onready var time_label = get_node("Control/time_label")
onready var game_timer = get_node("game_timer")


var screensize
var score = 0 

func _process(delta):
	time_label.set_text(str(int(game_timer.get_time_left())))

func _ready():
	screensize = get_viewport().size
	set_process(true)
	spawn_fruit(3)
	
	
func spawn_fruit(num):
	for i in range(num):
		var f = fruit.instance()
		fruit_container.add_child(f)
		f.connect("fruit_cut", self, "_on_fruit_cut")
		f.translate(Vector2(rand_range(1, screensize.x),rand_range(1, screensize.y)))

func _on_fruit_cut():
	score += 1
	score_label.set_text(str("Counter: ",score))


func _on_game_timer_timeout():
	get_node("Snip/Area2D").set_process(false)
