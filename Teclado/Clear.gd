extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var white=Color(255,255,255)
var black=Color(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Clear_mouse_entered():
	var font=$Label.get("custom_fonts/font")
	font.set("outline_size",5)


func _on_Clear_mouse_exited():
	var font=$Label.get("custom_fonts/font")
	font.set("outline_size",0)
