import re
import glob
import sys

'''
==================================================
Parser de EventLog do TheONE para formato GraphViz
==================================================
Autor: ÁLVARO SHIOKAW ALVAREZ
Python: 3.4.3
- Usar por commandline, sendo que para executar o programa, fazemos:
  python Convert_EventLog_to_GraphViz.py <arquivo_de_entrada_com_o_eventlog> <rotulo_a_ser_usado_para_os_nos> <total_de_nos>
  - O rótulo dos nós é aquela string que escolhemos pra aparecer em cada node, por exemplo "n", logo seria
    n0, n1, n2, ...
  - O total de nodes, é o total de nodes que vamos utilizar no default_settings, sempre iniciando do id 0 até total-1,
    por exemplo, se vou usar um total de 10 nodes, teria ids com rótulos, por exemplo, n0 até n9.

- Usa lista de objetos Edge.

- Cada objeto Edge envolve um par específico de nodes
	- É feito o tratamento para que, se host1--host2 é uma aresta,
	  host2--host1 deve se referir à  MESMA aresta.

 -O log de conexão é uma lista contendo como elementos sublistas da linha do log dividida em elementos desta lista,
  de onde extrairemos as infomrações se é CONN UP, CONN DOWN, nós envolvidos e o tempo do evento.
'''
# =====================
# = VARIÁVEIS GLOBAIS =
# =====================
edge_list = [] # Lista que contém todos objetos Edge, referentes às conexões que ocorreram.
node_label = str(sys.argv[2])
node_total = int(sys.argv[3])

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

    def setHost1(self,node1):
    	self.host1 = str(node1)

    def setHost2(self,node2):
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
def checkExistingEdge(node1,node2):
	""" Método que verifica se já existe uma aresta com os nós node1 e node2. """
	is_existing_edge = False
	for item in edge_list:
		if ((item.getHost1() == str(node1) and item.getHost2() == str(node2)) or
			(item.getHost1() == str(node2) and item.getHost2() == str(node1))):
			is_existing_edge = True
	return is_existing_edge
# -------------------------------------------------------------------------------------------
# ======================
# = PROGRAMA PRINCIPAL =
# ======================
# --- Abre os arquivos para operar: ---
source_file = open(sys.argv[1],"r")
target_file = open("TVG.dot","w")

# --- Escreve cabeçalho do grafo: ---
target_file.seek(0)
target_file.write("graph {\n")

# --- Declarando todos nós que o grafo vai usar: ---
# No default_settings.txt sei o total de nós e seu rótulo
for x in range(0,node_total):
	target_file.write("\t" + str(node_label) + str(x) + ";\n")


# --- Procurando por eventos CONN, no source file: ---
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
		if(checkExistingEdge(current_line_list[2], current_line_list[3]) == False):
			# Adiciona novo objeto Edge, com o que foi lido na linha, à lista.
			new_edge = Edge()
			new_edge.setHost1(current_line_list[2])
			new_edge.setHost2(current_line_list[3])
			edge_list.append(new_edge)

		# Independente de ser aresta repetida ou não, coloca
		# o key-value pair no objeto correspondente aresta:
		for item in edge_list:
			if (((item.getHost1() == str(current_line_list[2])) and (item.getHost2() == str(current_line_list[3]))) or
			    ((item.getHost1() == str(current_line_list[3])) and (item.getHost2() == str(current_line_list[2])))):
				item.addConnectionEvent(current_line_list)

# --- Escrevendo eventos CONN, no target file: ---
for item in edge_list:
	target_file.write("\t" + str(item.getHost1()) + "--" + str(item.getHost2()) + " [label=\"")
	has_pair_of_brackets = False # Flag para ver se fechou colchetes, e se fechou colcheges e abriu outro, entao é intervalo adicional
	for element in item.getConnection_EventLog():
		if (element[4] == "up"):
			if (has_pair_of_brackets == True): # Pra chegar aqui, no mínimo passou teve um "[" e "]"
				target_file.write(" U ")
				has_pair_of_brackets = False # Reseta a flag para procurar outros pares.
			target_file.write("[" + str(element[0]) + ",")
		if (element[4] == "down"): # else:
			target_file.write(str(element[0]) + "]")
			has_pair_of_brackets = True # Se chegou aqui no "]", é pq já teve o "[", logo registra que abriu e fechou colchetes!
		
	target_file.write("\"];\n")

# --- Fecha cabeçalho do grafo: ---
target_file.write("}")

# --- Fecha os arquivos: ---
target_file.close()	# Sempre que abre um arquivo é bom fechá-lo!
source_file.close()	# Sempre que abre um arquvo é bom fechá-lo!