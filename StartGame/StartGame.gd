extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_restart=0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Principal.hide()
	$Select.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_key_pressed(KEY_R) and can_restart==1):
		get_tree().reload_current_scene()
func _on_MainMenu_Go():
	$MainMenu.hide()
	$Select.show()
	
	


func _on_Select_selected(player1,tileCor1,player2,tileCor2):
	$Select.hide()
	$Principal.show()
	$Principal.p1=load(player1)
	$Principal.p2=load(player2)
	$Principal.tileCor_P1=tileCor1
	$Principal.tileCor_P2=tileCor2


func _on_Principal_fim(background,p):
	$Fim/TelaFinal/Vencedor.texture=background
	$Principal.hide()
	$Fim.show()
	$Fim/TelaFinal/Label.text="Jogador "+str(p)+" Venceu"
	can_restart=1;
	
