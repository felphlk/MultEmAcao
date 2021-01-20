extends GridContainer
export (PackedScene) var Tecla
# Declare member variables here. Examples:
# var a = 2
var j=0
var nod=[]
var selecinado=0
var cant_click=0
# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(0,10):
			var f=Tecla.instance()
			add_child(f)
			nod.append(f)
			f.get_node("TextureButton/Label").text=str(j)
			f.numero=j
			f.connect("clicou",self,"click")
func click(teste):
		if(cant_click==0):
			teste.get_node("Fundo").color=Color(255,0,0)
			selecinado+=1
		if (selecinado==2):
			cant_click=1
