extends Control
var p1
var p2
var tileCor_P1
var tileCor_P2
var col=6
var lin=6
var player = 1
var clicado = []
var win=[]
signal fim
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(col):
		clicado.append([])
		win.append([])
		for y in range(lin):
			clicado[x].append(0)
			win[x].append(0)
func _process(delta):
	if(player==1):
		$Player.texture=p1
	if(player==2):
		$Player.texture=p2
	#if(Input.is_key_pressed(KEY_SPACE)):
		#win(player)
func _on_Teclado_confirma(valor):#Procura valor na tabela e checa onde esta para mudar a cor do resultado
	if($Resultado/Tabela.valores.has(str(valor))):
		for j in range(col):
			for i in range(lin):
				if($Resultado/Tabela.nod[j][i].valor==valor and clicado[j][i]>=1):
					$Label.text="Numero "+str($Resultado/Tabela.nod[j][i].valor)+"  já inserido"
					$Label.show()
					$LabelTimer.start()
				if($Resultado/Tabela.nod[j][i].valor==valor and clicado[j][i]==0):
					if (player == 1):
						$Resultado/Tabela.nod[j][i].get_node("ColorRect").color=tileCor_P1
						clicado[j][i]=1
						checkWinCond()
						who()
					elif (player == 2):
						$Resultado/Tabela.nod[j][i].get_node("ColorRect").color=tileCor_P2
						clicado[j][i]=2
						checkWinCond()
						who()
		
func checkWinCond():
	for i in range(col):
			if(checkAllClickedRight(i)):
				if(checkLateral(i)==1):
					win(player)
			if(checkAllClickedDown(i)):
				if(checkDown(i)==1):
					win(player)
				if(checkDown(i)==1):
					win(player)
func who():
	if(player==1):
		player=2
	else:
		player=1
func win(p):
	if(p==1):
		emit_signal("fim",p1,p)
	if(p==2):
		emit_signal("fim",p2,p)
func checkAllClickedRight(a):
	for i in range(col):
		if(clicado[a][i]>0):
			pass
		else:
			return 0
	return 1
func checkAllClickedDown(a):
	for i in range(col):
		if(clicado[i][a]>0):
			pass
		else:
			return 0
	return 1
func checkAllClickedDiag():
	for i in range(col):
		if(clicado[i][i]>0):
			pass
		else:
			return 0
	return 1
func checkLateral(coluna):#Checa linha
	var y=clicado[coluna][0]
	for j in range(col):
		if(clicado[coluna][j]==y):
			pass
		else:
			return 0
	return 1
func checkDown(linha):#Checa colunas
	var y=clicado[0][linha]
	for j in range(col):
		if(clicado[j][linha]==y):
			pass
		else:
			return 0
	return 1
func checkDiag():
	var y=clicado[0][0]
	for j in range(col):
		if(clicado[j][j]==y):
			pass
		else:
			return 0
	return 1







func _on_LabelTimer_timeout():
	$Label.hide()
	who()
	return
