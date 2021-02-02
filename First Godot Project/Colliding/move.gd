
extends KinematicBody2D



func _ready():
	set_process(true)


func _process(delta):
	var vel = Vector2()
	var speed = 100
	if Input.is_key_pressed(KEY_RIGHT):
		vel = Vector2(1, 0)
	set_pos(get_pos() + vel * (speed* delta))


func kill():
	set_pos(initial_pos)
