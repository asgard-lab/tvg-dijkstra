import re
import glob
import sys

'''
=================================================================
Gerador de TVGs intermediários a partir de dois TVGs como entrada
=================================================================
Autor: ÁLVARO SHIOKAWA ALVAREZ
Python: 3.4.3
- Usar por commandline, sendo que para executar o programa, fazemos:
  python Intermediate_TVG_Generator.py <Eventlog_1> <Eventlog_2> n

- Terá uma lista de objetos Edge.

- Cada objeto Edge envolve um par específico de nodes
	- Será feito o tratamento para que, se host1--host2 é uma aresta, então host2--host1 deve se referir à MESMA aresta.
	  Isto é uma medida para não considerar arestas repetidas (No TheONE as conexões tem uma origem e destino, mas do
	  ponto de vista do TVG, é a mesma aresta, tanto faz quem que manda pra quem, desde que seja o mesmo par de nós.)

 -O log de conexão é uma lista contendo como elementos sublistas da linha do log dividida em elementos desta lista,
  de onde extrairemos as infomrações se é CONN UP, CONN DOWN, nós envolvidos e o tempo do evento.
'''
# =====================
# = VARIÁVEIS GLOBAIS =
# =====================
edge_list_1 = [] # Lista que contém todos objetos Edge, referentes às conexões que ocorreram, do primeiro eventlog
edge_list_2 = [] # Lista que contém todos objetos Edge, referentes às conexões que ocorreram, do segundo eventlog
edge_list_3 = [] # Lista que contém todos objetos Edge já com intervalos intermediários calculados.
node_label = str(sys.argv[3])

# -------------------------------------------------------------------------------------------
# =====================
# = CLASSES E MÉTODOS =
# =====================
# Classe Edge
class Edge(object):
	""" Uma classe que trata das conexões entre pares de nós. """
	def __init__(self):
		self.host1 = "host1" # Um end node da conexão.
		self.host2 = "host2" # Outro end node da conexão.
		self.connection_eventlog = [] # Lista com o histório de conexões desta aresta.

	def setHost1(self, node1):
		self.host1 = str(node1)

	def setHost2(self, node2):
		self.host2 = str(node2)
	
	def addConnectionEvent(self, connection_event):
		self.connection_eventlog.append(connection_event)

	def getConnection_EventLog(self):
		return self.connection_eventlog

	def getHost1(self):
		return self.host1

	def getHost2(self):
		return self.host2

# Método checkExistingEdge
def checkExistingEdge(node1,node2,edge_parameter):
	""" Método que verifica se já existe uma aresta com os nós node1 e node2. """
	is_existing_edge = False
	for item in edge_parameter:
		if ((item.getHost1() == str(node1) and item.getHost2() == str(node2)) or
			(item.getHost1() == str(node2) and item.getHost2() == str(node1))):
			is_existing_edge = True
	return is_existing_edge
# -------------------------------------------------------------------------------------------
# ======================
# = PROGRAMA PRINCIPAL =
# ======================
# --- Abre os arquivos de destino para operar: ---
target_file = open("Intermediate_TVG.dot","w")

# --- Escreve cabeçalho do grafo TVG intermediário: ---
target_file.seek(0)
target_file.write("graph {\n")

# --- Procurando por eventos CONN, no source file do primeiro EventLog: ---
source_file = open(sys.argv[1],"r") # Abre o arquivo referente ao primeiro EventLog!
source_file.seek(0) # Reseta o ponteiro de leitura para o começo do arquivo.
for line in source_file: # Lê log da simulação linha por linha
	current_line_list = line.split() # Quebra o conteúdo da linha
	# current_line_list[0] = tempo do evento
	# current_line_list[1] = tipo do evento
	# current_line_list[2] = Se for CONN, aqui será o host1
	# current_line_list[3] = Se for CONN, aqui será o host2
	# current_line_list[4] = Se for CONN, aqui será up ou down
	if (current_line_list[1] == "CONN"): # Se achou CONN na lista atual
		# Se o par de nós encontrado já foi registrado como aresta, adiciona esta mesma aresta de novo na lista edge_list!
		if(checkExistingEdge(current_line_list[2], current_line_list[3],edge_list_1) == False):
			# Adiciona novo objeto Edge, com o que foi lido na linha, à lista.
			new_edge = Edge()
			new_edge.setHost1(current_line_list[2])
			new_edge.setHost2(current_line_list[3])
			edge_list_1.append(new_edge)

		# Independente de ser aresta repetida ou não, coloca o key-value pair no objeto correspondente aresta:
		for item in edge_list_1:
			if (((item.getHost1() == str(current_line_list[2])) and (item.getHost2() == str(current_line_list[3]))) or 
				((item.getHost1() == str(current_line_list[3])) and (item.getHost2() == str(current_line_list[2])))):
				item.addConnectionEvent(current_line_list)
source_file.close()	# Sempre que abre um arquvo é bom fechá-lo!


# --- Procurando por eventos CONN, no source file do segundo EventLog: ---
source_file = open(sys.argv[2],"r") # Abre o arquivo referente ao primeiro EventLog!
source_file.seek(0) # Reseta o ponteiro de leitura para o começo do arquivo.
for line in source_file: # Lê log da simulação linha por linha
	current_line_list = line.split() # Quebra o conteúdo da linha
	# current_line_list[0] = tempo do evento
	# current_line_list[1] = tipo do evento
	# current_line_list[2] = Se for CONN, aqui será o host1
	# current_line_list[3] = Se for CONN, aqui será o host2
	# current_line_list[4] = Se for CONN, aqui será up ou down
	if (current_line_list[1] == "CONN"): # Se achou CONN na lista atual
		# Se o par de nós encontrado já foi registrado como aresta, adiciona esta mesma aresta de novo na lista edge_list!
		if(checkExistingEdge(current_line_list[2], current_line_list[3],edge_list_2) == False):
			# Adiciona novo objeto Edge, com o que foi lido na linha, à lista.
			new_edge = Edge()
			new_edge.setHost1(current_line_list[2])
			new_edge.setHost2(current_line_list[3])
			edge_list_1.append(new_edge)

		# Independente de ser aresta repetida ou não, coloca o key-value pair no objeto correspondente aresta:
		for item in edge_list_2:
			if (((item.getHost1() == str(current_line_list[2])) and (item.getHost2() == str(current_line_list[3]))) or 
				((item.getHost1() == str(current_line_list[3])) and (item.getHost2() == str(current_line_list[2])))):
				item.addConnectionEvent(current_line_list)
source_file.close()	# Sempre que abre um arquvo é bom fechá-lo!


# --- Agora que começa a as médias dos elementos das listas. Ele vai iterar pela lista de menor número de nós.---
'''
Antes de começar a iterar nas listas, ele descobre qual das listas tem menor número de elementos, e vai iterar por esta.
O motivo é que se uma lista tem menos números de elementos, significa que tem menos nós que na outra lista.

Então ela
'''
for (item in )

# --- Fecha cabeçalho do grafo: ---
target_file.write("}")