extends Control

export (PackedScene) var Tecla
# Declare member variables here. Examples:
signal confirma
var j=0
var nod=[]
var botaoR=["res://Assets/botao0 1.png","res://Assets/botao1 1.png","res://Assets/botao2 1.png","res://Assets/botao3 1.png"\
,"res://Assets/botao4 1.png","res://Assets/botao5 1.png","res://Assets/botao6 1.png",
"res://Assets/botao7 1.png","res://Assets/botao8 1.png","res://Assets/botao9 1.png"]
var botaoD=["res://Assets/botao0apertado 1.png","res://Assets/botao1apertado 1.png",
"res://Assets/botao2apertado 1.png","res://Assets/botao3apertado 1.png"\
,"res://Assets/botao4apertado 1.png","res://Assets/botao5apertado 1.png","res://Assets/botao6apertado 1.png",
"res://Assets/botao7apertado 1.png","res://Assets/botao8apertado 1.png","res://Assets/botao9apertado 1.png"]
var picked=[]
var selecionado=0
var quem=1
var can_click=1
var valor
#183.683 #970-880
# Called when the node enters the scene tree for the first time.
func _ready():
	var pos=Vector2(556,923)
	for j in range(0,10):
			var f=Tecla.instance()
			f.numero=j
			var tb=f.get_node("TB")
			tb.texture_normal=load(botaoR[j])
			tb.texture_pressed=load(botaoD[j])
			f.rect_position=pos
			if(j%2==1):
				pos+=Vector2(90,90)
			else:
				pos+=Vector2(90,-90)
			$Control.add_child(f)
			f.connect("clicou",self,"click")
func click(user):
		if(can_click==1):
			picked.append(user)
			if($Num1.text ==""):
				$Num1.text=str(picked[selecionado].numero)
			else:
				$Num2.text=str(picked[selecionado].numero)
			selecionado+=1	
		if (selecionado==2):
			can_click=0
func _on_Clear_pressed():
	picked.clear()
	can_click=1
	selecionado=0
	resetText()
	


func _on_Confirmar_pressed():
	if(selecionado==2):
		$Resposta.text=str(picked[1].numero*picked[0].numero)
		valor=picked[1].numero*picked[0].numero
		for i in $Control.get_children():
			picked.clear()
		selecionado=0
		$tResposta.start()	
		yield($tResposta,"timeout")
		can_click=1
		if(quem==1):
			quem=2
		else:
			quem=1
		emit_signal("confirma",valor)
		
		
		
		resetText()
		
func resetText():
	$Num1.text=""
	$Num2.text=""
	$Resposta.text=""
#func _input(ev):
#	if Input.is_key_pressed(KEY_0):
#		click(nod[0])
#	if Input.is_key_pressed(KEY_1):
#		click(nod[1])
#	if Input.is_key_pressed(KEY_2):
#		click(nod[2])
#	if Input.is_key_pressed(KEY_3):
#		click(nod[3])
#	if Input.is_key_pressed(KEY_4):
#		click(nod[4])
#	if Input.is_key_pressed(KEY_5):
#		click(nod[5])
#	if Input.is_key_pressed(KEY_6):
#		click(nod[6])
#	if Input.is_key_pressed(KEY_7):
#		click(nod[7])
#	if Input.is_key_pressed(KEY_8):
#		click(nod[8])
#	if Input.is_key_pressed(KEY_9):
#		click(nod[9])
func _process(delta):
	pass


func _on_s_pressed():
	print("oi")
