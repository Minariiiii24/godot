extends Area2D

onready var effect = get_node("effect")
onready var sprite = get_node("Sprite")


signal fruit_cut

func _ready():
	effect.interpolate_property(sprite, 'scale', sprite.get_scale(), 
								Vector2(0.2, 0.2), 0.2, Tween.TRANS_QUAD, Tween.EASE_OUT)
	effect.interpolate_property(sprite, 'modulate', 1, 0, 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)

func _on_fruit_area_entered(area):
	if area.name == "Area2D":
		emit_signal("fruit_cut")
		var owners = get_shape_owners()
		shape_owner_clear_shapes(owners[0])
		effect.start()


func _on_effect_tween_all_completed():
	queue_free()
