extends GridContainer
export (PackedScene) var quadrado
var nod=[]
var valores = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "12", "14", "15", "16", "18", "20", "21", "24", "25", "27", "28", "30", "32", "35", "36", "40", "42", "45", "48", "49", "54", "56", "63", "72", "81"]
var already=[]
func _ready():
	for x in range(6):
		nod.append([])
		for y in range(6):
			nod[x].append(0)
	randomize()
	valores.shuffle()
	for j in range (6):
		randomize()
		valores.shuffle()
		for i in range (6):
			var q
			q = quadrado.instance()
			add_child(q)
			while (valores[i] in already):
				valores.shuffle()
			q.get_node("ColorRect/Label").text = valores[i]
			q.valor = int(valores[i])
			already.append(valores[i])
			nod[j][i]=q
	print(nod[0][1].valor)
