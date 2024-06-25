extends Sprite2D

var velocidade = 75
var mov = Vector2.ZERO
var atordoado = false
var recuo = 6
var hp = 3

func _process(delta):
	if Global.jogador != null and atordoado == false:
		mov  = global_position.direction_to(Global.jogador.global_position)
	elif atordoado:
		mov = lerp(mov, Vector2.ZERO, 0.3)
		
	global_position += mov * velocidade * delta
	
	if hp <= 0:
		queue_free()
	pass

func _on_hit_box_area_entered(area):
	if area.is_in_group("dano"):
		modulate = Color.WHITE
		area.get_parent().queue_free()
		mov = -mov * recuo
		atordoado = true
		hp -= 1
		$TimerRecuo.start()
	pass

func _on_timer_recuo_timeout():
	modulate = Color("a30080")
	atordoado = false
	pass
