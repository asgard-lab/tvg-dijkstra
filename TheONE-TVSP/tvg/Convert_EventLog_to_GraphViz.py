import re
import glob
import sys

'''
==================================================
Parser de EventLog do TheONE para formato GraphViz
==================================================
Autor: Ã�LVARO SHIOKAWA ALVAREZ
Python: 3.4.2
- Usar por commandline, sendo que para executar o programa, fazemos:
  python Convert_EventLog_to_GraphViz.py <arquivo_de_entrada_com_o_eventlog> <rÃ³tulo_a_ser_usado_dos_nÃ³s>
  - O rÃ³tulo dos nÃ³s Ã© aquela string que escolhemos pra aparecer em cada node, por exemplo "n", entÃ£o terÃ­amos
    n0, n1, n2, ...
  - O total de nÃ³s, Ã© o total de nÃ³s que vamos utilizar no default_settings, sempre comeÃ§ando do id 0 atÃ© total-1,
    por exemplo, se vou usar um total de 9 nÃ³s, teria ids, com rÃ³tulo por exemplo, n0 atÃ© n8.

- TerÃ¡ uma lista de objetos Edge.

- Cada objeto Edge envolve um par especÃ­fico de nodes
	- SerÃ¡ feito o tratamento para que, se host1--host2 Ã© uma aresta,
	  host2--host1 deve se referir Ã  MESMA aresta.

- O log de conexÃ£o Ã© um dicionÃ¡rio com o par key-value respectivamente como:
  <tempo_do_evento>:<UP/DOWN>, por exemplo, 0:UP quer dizer que nesta aresta
  houve conexÃ£o do host1 e host2 no tempo 0.
'''
# =====================
# = VARIÃ�VEIS GLOBAIS =
# =====================
edge_list = [] # Lista que contÃªm todos objetos Edge, referentes Ã s conexÃµes que ocorreram.
node_label = str(sys.argv[2])
node_total = int(sys.argv[3])

# -------------------------------------------------------------------------------------------
# =====================
# = CLASSES E FUNÃ‡Ã•ES =
# =====================
# Classe Edge
class Edge(object):
    """ Uma classe que trata das conexÃµes entre pares de nÃ³s. """
    def __init__(self):
        self.host1 = "host1" # Um end node da conexÃ£o
        self.host2 = "host2" # Outro end node da conexÃ£o
        self.connection_eventlog = {} # DicionÃ¡rio com o histÃ³rico de conexÃµes desta aresta.

    def setHost1(self,node1):
    	self.host1 = str(node1)

    def setHost2(self,node2):
    	self.host2 = str(node2)

    def addConnectionEvent(self, connection_key, connection_value):
    	self.connection_eventlog[float(connection_key)] = str(connection_value)

    def getHost1(self):
    	return self.host1

    def getHost2(self):
    	return self.host2

# FunÃ§Ã£o checkExistingEdge
def checkExistingEdge(node1,node2):
	""" FunÃ§Ã£o que verifica se jÃ¡ existe uma aresta com os nÃ³s node1 e node2. """
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

# --- Escreve cabeÃ§alho do grafo: ---
target_file.seek(0)
target_file.write("graph {\n")

# --- Declarando todos nÃ³s que o grafo vai usar: ---
# No default_settings.txt sei o total de nÃ³s e seu rÃ³tulo
for x in range(0,node_total):
	target_file.write("\t" + str(node_label) + str(x) + ";\n")


# --- Procurando por eventos CONN, no source file: ---
source_file.seek(0) # Reseta o ponteiro de leitura para o comeÃ§o do arquivo.
for line in source_file: # LÃª log da simulaÃ§Ã£o linha por linha
	current_line_list = line.split() # Quebra o conteÃºdo da linha
	# current_line_list[0] = tempo do evento
	# current_line_list[1] = tipo do evento
	# current_line_list[2] = Se for CONN, aqui serÃ¡ o host1
	# current_line_list[3] = Se for CONN, aqui serÃ¡ o host2
	# current_line_list[4] = Se for CONN, aqui serÃ¡ up ou down
	if (current_line_list[1] == "CONN"): # Se achou CONN na lista atual
		# Se o par de nÃ³s encontrado jÃ¡ foi registrado como aresta,
		# nÃ£o adiciona esta mesma aresta de novo na lista edge_list!
		if(checkExistingEdge(current_line_list[2], current_line_list[3]) == False):
			# Adiciona novo objeto Edge, com o que foi lido na linha, Ã  lista.
			new_edge = Edge()
			new_edge.setHost1(current_line_list[2])
			new_edge.setHost2(current_line_list[3])
			edge_list.append(new_edge)

		# Independente de ser aresta repetida ou nÃ£o, coloca
		# o key-value pair no objeto correspondente aresta:
		for item in edge_list:
			if (((item.getHost1() == str(current_line_list[2])) and (item.getHost2() == str(current_line_list[3]))) or
			    ((item.getHost1() == str(current_line_list[3])) and (item.getHost2() == str(current_line_list[2])))):
				item.addConnectionEvent(current_line_list[0], current_line_list[4])

# --- Escrevendo eventos CONN, no target file: ---
for item in edge_list:
	target_file.write("\t" + str(item.getHost1()) + "--" + str(item.getHost2()))
	target_file.write(" [label=\"")

	sorted_connection_list = sorted(item.connection_eventlog.keys())
	for i, key in enumerate(sorted_connection_list):	
		if (item.connection_eventlog[key] == "up"):
			target_file.write("[")
			target_file.write(str(key))
			target_file.write(",")
		if (item.connection_eventlog[key] == "down"): # else:
			target_file.write(str(key-1))
			target_file.write("]")
			if (i < len(sorted_connection_list)-1):
				target_file.write(" U ")
		
	target_file.write("\"];\n")
	print("\n")

# --- Fecha cabeÃ§alho do grafo: ---
target_file.write("}")

# --- Fecha os arquivos: ---
target_file.close()	# Sempre que abre um arquivo Ã© bom fechÃ¡-lo!
source_file.close()	# Sempre que abre um arquvo Ã© bom fechÃ¡-lo!