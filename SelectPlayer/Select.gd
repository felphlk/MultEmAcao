extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprites=["res://Assets/blueSpider.png","res://Assets/greenSpider.png",
"res://Assets/yellowSpider.png"]
var jogador=0
var quem=[]
var cor
signal selected
# Called when the node enters the scene tree for the first time.
func _ready():
	$Texto.text+="ESCOLHA SUA COR JOGADOR " + str(jogador+1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(jogador==2):
		emit_signal("selected",quem[0],quem[1],quem[2],quem[3])
func _on_Aranha1_pressed():
	$ColorRect/Aranha1.disabled=true
	cor=Color("#21eae4")
	quem.append(sprites[0])
	quem.append(cor)
	jogador+=1
	$Texto.text="ESCOLHA SUA COR JOGADOR " + str(jogador+1)

func _on_Aranha2_pressed():
	$ColorRect/Aranha2.disabled=true
	cor=Color("#2be20c")
	quem.append(sprites[1])
	quem.append(cor)
	jogador+=1
	$Texto.text="ESCOLHA SUA COR JOGADOR " + str(jogador+1)

func _on_Aranha3_pressed():
	$ColorRect/Aranha3.disabled=true
	cor=Color("#cec913")
	quem.append(sprites[2])
	quem.append(cor)
	
	jogador+=1
	$Texto.text="ESCOLHA SUA COR JOGADOR " + str(jogador+1)
