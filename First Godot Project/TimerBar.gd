extends Line2D

signal time;

func _decrease():
	points[1].x -= 50;
		
func _time():
	return points[1].x == 0;
	
func _on_Timer_timeout():
	_decrease();
	
	if _time():
		emit_signal("time");
	
