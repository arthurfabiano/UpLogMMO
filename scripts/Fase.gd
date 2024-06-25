extends Node2D

@onready var fps = $FPS
@onready var ip = $IP

var packed_jogador = preload("res://scenes/Jogador.tscn")

func _ready():
	Global.criacao_no_pai = self
	set_process(true)
	var lista_jogadores = Networking.retornar_lista()
	for i in range(lista_jogadores.size()):
		var obj = packed_jogador.instantiate()
		$Jogadores.add_child(obj)
		obj.position = Vector2(512, 300)
		obj.name = str(lista_jogadores[i][0])
		obj.set_multiplayer_authority(lista_jogadores[i][0])
		obj.set_nickname(lista_jogadores[i][1])
	pass

func _process(_delta):
	fps.text = "FPS: " + str(Engine.get_frames_per_second())
	ip.text = "IP: " + str(Networking.ip)

func _exit_tree():
	Global.criacao_no_pai = null
