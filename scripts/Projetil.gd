extends Sprite2D

var mov = Vector2(1,0)
var velocidade = 300
var dir_unica = true

func _process(delta):
	if dir_unica:
		look_at(get_global_mouse_position())
		dir_unica = false
	global_position += mov.rotated(rotation) * velocidade * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass
