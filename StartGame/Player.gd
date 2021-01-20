extends Node

var color
var stringcolor
func _ready():
	pass # Replace with function body.

func stringToColor(color):
	if(color==Color(255,0,0)):
		return "Vermelho"
	if(color==Color(0,255,0)):
		return "Verde"
	if(color==Color(0,0,255)):
		return "Azul"
	else:
		return "Amarelo"
