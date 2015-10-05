import re
import glob
import sys

'''
====================
Gerador do TVG Médio
====================
Autor: ÁLVARO SHIOKAWA ALVAREZ
Python: 3.4.3
- Usar por commandline, sendo que para executar o programa, fazemos:
  python Intermediate_TVG_Generator.py <TVG1> <TVG2> <TVG3>

- Ou seja, faço a média aritmética de 3 tvgs ( o original, e os dois fraudulentos).
- Vou ter que descobrir qual é o TVG de menor tamanho, e aplicar umas regexp NERVOSAS, encima dele.
'''
#Abre os arquivos de origem pra leitura
tvg_source_file_1 = open(sys.argv[1],"r")
tvg_source_file_1.seek(0)

tvg_source_file_2 = open(sys.argv[2],"r")
tvg_source_file_2.seek(0)

tvg_source_file_3 = open(sys.argv[3],"r")
tvg_source_file_3.seek(0)

# --- Abre arquivo de destino pra escrever: ---
target_file = open("Intermediate_TVG.dot","w")
target_file.seek(0)
# --- Abre cabeçalho do grafo: ---
target_file.write("graph {\n")

# --- Abre os tvgs para operar: ---
match_pair_of_nodes_tvg1 = []
match_pair_of_nodes_tvg2 = []
match_pair_of_nodes_tvg3 = []
pair_of_nodes_tvg1 = " "
pair_of_nodes_tvg2 = " "
pair_of_nodes_tvg3 = " "
for line_tvg1 in tvg_source_file_1:
	match_pair_of_nodes_tvg1 = re.findall(r"n[\d]+--n[\d]+",line_tvg1)
	match_intervals_tvg1 = re.findall(r"([\w]+\.[\w]+)",line_tvg1)
	pair_exists_in_all_tvgs = False
	if (match_pair_of_nodes_tvg1): # Isto aqui impede de printar linhas indesejadas que nada tenham haver com o par de nós	
		pair_of_nodes_tvg1 = str(match_pair_of_nodes_tvg1)
		
		# Vou procurar no TVG2 por um par de nós igual ao encontrado no match_pair_of_nodes_tvg1, ou seja, o do TVG1, bem como os seus intervalos!
		tvg_source_file_2.seek(0)
		for line_tvg2 in tvg_source_file_2:
			match_pair_of_nodes_tvg2 = re.findall(r"(n[\d]+--n[\d]+)",line_tvg2)
			pair_of_nodes_tvg2 = str(match_pair_of_nodes_tvg2)
			if (pair_of_nodes_tvg2 == pair_of_nodes_tvg1):
				pair_exists_in_all_tvgs = True
				match_intervals_tvg2 = re.findall(r"([\w]+\.[\w]+)",line_tvg2)
				break
			else:
				pair_exists_in_all_tvgs = False

		# Vou procurar no TVG3 por um par de nós igual ao encontrado no match_pair_of_nodes_tvg1, ou seja, o do TVG1, bem como os seus intervalos!
		tvg_source_file_3.seek(0)	
		for line_tvg3 in tvg_source_file_3:
			match_pair_of_nodes_tvg3 = re.findall(r"(n[\d]+--n[\d]+)",line_tvg3)
			pair_of_nodes_tvg3 = str(match_pair_of_nodes_tvg3)	
			if ((pair_of_nodes_tvg2 == pair_of_nodes_tvg1) and (pair_of_nodes_tvg3 == pair_of_nodes_tvg2) and (pair_of_nodes_tvg3 == pair_of_nodes_tvg1)):
				pair_exists_in_all_tvgs = True
				match_intervals_tvg3 = re.findall(r"([\w]+\.[\w]+)",line_tvg3)
				break
			else:
				pair_exists_in_all_tvgs = False

		if (pair_exists_in_all_tvgs == True): # Se chega aqui com true quer dizer que o par de nós existe nos 3 tvgs, com os seus intervalos podendo variar ou não.
			target_file.write("\t"+str(match_pair_of_nodes_tvg1[0])+ " [label=\"") # Escreve o primeiro par no tvg
			'''
				Agora que achou os pares e seus intervalos correspondentes, é hora de fazer as médias aritméticas
			'''
			found_lower_bound = False
			interval_completed = False
			# Itero em 3 listas de intervalos ao mesmo tempo, considerando o limite como a lista de tamanho menor!
			# Isto é importante pare evitar de dar null pointer exception (Ou então eu tentar colocar par de nós q não existe nos demais tvgs!)
			for i, (a,b,c) in enumerate(list(zip(match_intervals_tvg1,match_intervals_tvg2,match_intervals_tvg3))):
				if (interval_completed == True): # Se chegou aqui com True é porque no mínimo preencheu um intervalo
					target_file.write(" U ")
					interval_completed = False
				value1 = float(match_intervals_tvg1[i])
				value2 = float(match_intervals_tvg2[i])
				value3 = float(match_intervals_tvg3[i])
				intermediate_value = (value1+value2+value3)/3

				if (found_lower_bound == False): # Se é false é pq ainda nao escreveu o limitante inferior do intervalo
					target_file.write("[" + str(intermediate_value) + ",")
					found_lower_bound = True
				else:
					target_file.write(str(intermediate_value)+"]")
					found_lower_bound = False
					interval_completed = True; # Se achou o limitante superior, pode fechar o intervalo.
			target_file.write("\"];\n")
		pair_exists_in_all_tvgs = False	
# --- Fecha cabeçalho do grafo: ---
target_file.write("}")
# --- Fecha os arquivos: ---
tvg_source_file_1.close()
tvg_source_file_2.close()
tvg_source_file_3.close()
target_file.close()	# Sempre que abre um arquivo é bom fechá-lo!