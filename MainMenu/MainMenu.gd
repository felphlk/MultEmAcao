extends Control
signal Go
# Declare member variables here. Examples:
#export(NodePath) var MenuCor
#onready var rect=get_node(MenuCor)
var a=["res://MainMenu/R.png","res://MainMenu/B.png","res://MainMenu/V.png","res://MainMenu/Y.png"]
var co=[Color(255,0,0),Color(0,0,255),Color(0,255,0),Color(240,249,0)]
var enable=[0,0]
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_key_pressed(KEY_ENTER)):
			hide()
			emit_signal("Go")
