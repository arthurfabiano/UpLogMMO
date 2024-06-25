extends Node2D

const PROJETIL = preload("res://scenes/projetil.tscn")

var velocidade = 150
var nickname = ""
var recarregado = true

func _ready():
	Global.jogador = self

func _enter_tree():
	Global.jogador = null

func _process(delta):
	if is_multiplayer_authority():
		var axys = Vector2.ZERO
		if Input.is_action_pressed("b_direita"):
			axys += Vector2(1 , 0)
		if Input.is_action_pressed("b_esquerda"):
			axys += Vector2(-1 , 0)
		if Input.is_action_pressed("b_cima"):
			axys += Vector2(0 , -1)
		if Input.is_action_pressed("b_baixo"):
			axys += Vector2(0 , 1)
		position += axys * velocidade * delta
		
		if Input.is_action_pressed("atirar") and Global.criacao_no_pai != null and recarregado:
			Global.instance_node(PROJETIL, global_position, Global.criacao_no_pai)
			recarregado = false
			$TempoRecarga.start()
	pass

func set_nickname(nickname):
	self.nickname = nickname
	$NicknameLabel.text = nickname
	pass

func _on_tempo_recarga_timeout():
	recarregado = true
