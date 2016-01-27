import re
import glob
import sys
'''
=============================================================
Parser dos Traces do CRAWDAD para formato aceitável do TheONE
=============================================================
Autor: ÁLVARO SHIOKAWA ALVAREZ
Python: 3.4.3

Para utilizar este script, no terminal digite:
Convert_CRAWDAD_to_TheONE.py [nome_do_trace_original_do_crawdad.txt]

A idéia do script é receber um trace do crawdad, e deste geraremos o mesmo script, removendo as colunas <unkwnown> e <location>, que
são inúteis para o TheONE. Além disso convertemos as medidas das coordenadas de pés (Como vem no trace original) para metros (O
TheONE trabalha em metros paras as coordenadas X e Y), além disso ordenamos o trace por ordem crescente de bus IDs, pois o
TheONE numera seus nós a partir de 0, logo isto facilita esta numeração.

Este trace refinado é utilizado para gerar o PathFile e ActiveFile.

---- FASE 1: Refinando o trace original e ordenando por bus ids ---
--> Salvo cada linha do trace como um elemento de uma lista
--> Ordeno essa lista por ordem crescente de bus_ids (Vai facilitar numerar os ids de 0 em diante para o TheONE)
--> Necessário tratar do problema bizarro onde, para um mesmo nó, e num mesmo tempo, temos posições diferentes.
	Exemplo: Node 900, no tempo 0 está na posição (5,5), aí na outra linha aparece o mesmo node 900, tambem no
			tempo 0, só que agora (6,6), isto vai bugar o TheONE... Precisamos deletar tais linhas repetidas!
--> Remover as duas colunas (Route) e (Unknown) que são inúteis para o TheONE (Pra ele só importa, tempo, id, X e Y)
--> Converter as medidas das posições X e Y para metros, pois os traces do CRAWDAD originalmente estão em pés, e o
	TheONE trabalha em metros!
--> Problema do tempo longo entre movimentos de um mesmo nó (Este não é bem um problema para as conexões...)

--> Converter os horários do formato hora:minuto:segundo para segundo, pois o TheONE trabalha com segundos!
--> Depois leio esta lista linha a linha nos passos seguintes!

---- FASE 2: Criando o PathFile ----
---> Com o trace ja ordenado e refinado, agora vamos começar a colocar TODAS as coordenadas de um dado nó.

---- FASE 3: Criando o ActiveFile ----
---> Colocamos agora os tempos mínimos e máximos de cada nó, referentes a quando o mesmo apareceu na simulação e quando o mesmo some.
'''
# -------------------------------------------------------------------------------------------
# ======================
# = PROGRAMA PRINCIPAL =
# ======================

# --- Abre os arquivos para operar: ---
source_file = open(sys.argv[1],"r")
target_file = open("Pre_Converted_Trace.txt","w")
source_file.seek(0)
target_file.seek(0)
file_list = [] # Lista que vai armazenar cada linha do arquivo!
sorted_file_list = [] # Lista que armazena o trace ordenado por ordem crescente de bus ids

''' ---- FASE 1: Refinando o trace original e ordenando por bus ids --- '''
# --- Lendo linhas do trace ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

sorted_file_list = sorted(file_list, key=lambda x: x[1]) #Ordena a nova lista pela coluna 1, ou seja, aonde tem os IDs de ônibus.


'''
# Antes precisamos tratar do problema dos traces repetidos no tempo

-traces repetidos no tempo, ou seja, vc tem uma linha t1 ... x1, y1 e outra t1... x2,y2.

 Onde os valores de xs e ys são próximos. Neste caso eu pego só um deles porque o
simulador se atrapalha quando vê posições diferentes num mesmo tempo.

O que a Lourdes quis dizer é que num mesmo tempo, um mesmo nó não pode assumir posições iguais, o que faz sentido.
Se por exemplo no tempo 0, bus 900, está em (5,5), e na outra linha no mesmo tempo 0, ele está na posição (6,6) isso
vai bugar o TheONE, melhor tirar fora as posições repetidas.

Fácil, como a lista já está ordenada por ordem crescente de bus_ids, basta ir percorrendo ela desde o começo.

Digamos que o primeiro bus id seja 900 e esta no tempo 0 e tem posiçao (5,5), dai na outra linha
tenho id 900 tempo 0 porem posicao(6,6), o q posso fazer é tirar da lista esta entrada com o tempo 6, e continuar procurando
até que o tempo mude, mantendo o mesmo id. aí vc pega pro proximo tempo e repete o procedimento

Ou seja, o node 900 só pode ter uma UNICA linha listando o tempo 0, nao pode ter varias linhas com o tempo 0.
'''
new_sorted_list_without_repeated_elements = [] # Uma lista temporaria onde vc guarda os elementos NAO repetidos
# found_repeated_node = False # Até passar a primeira iteração isto aqui está falso, pois não tem ninguém para matar!
temp_time = "Só existem 3 coisas que você só faz uma vez na vida: NASCER, MORRER e VOTAR NO PT!"
temp_id = -9001 # Nunca que algum nó ali da lista teria um id negativo e ainda deste tamanho!
for index, element in enumerate(sorted_file_list): # Primeiro inicia as variáveis temp com valores absurdos que ninguém no trace terá!
	## if original
	found_repeated_node = False
	if ((temp_id == int(element[1])) and (temp_time == str(element[0]))): # Se ocorrer do nó "anterior" (Ou seja, seus valores salvos nas var temp) baterem com os valores do nó atual, é pq o nó atual é repetido. Pode mandar matá-lo!
		found_repeated_node = True # Como descobriu que os valores do nó "anterior" batem com os deste nó, é porque tem que matá-lo!	
	
	# Na primeira iteração, passa direto pelo if, pois os valores dos temp diferem dos valores do primeiro nó na primeira iteração
	temp_time = str(element[0]) # Salva o tempo do nó achado numa var temp para uso futuro na próxima iteração.
	temp_id = int(element[1]) # Salva o id do nó achado numa var temp para uso futuro na próxima iteração.
	
	if (found_repeated_node == False):
		new_sorted_list_without_repeated_elements.append(element)

sorted_file_list = new_sorted_list_without_repeated_elements
# Agora temos uma lista refinada, onde para cada nó, deletamos as ocorrências iguais de tempo, pra não confundir o TheONE.

for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	'''
	As linhas nos traces do crawdad seguem o seguinte formato:
	<month>-<day>:<time> <bus_id> <route_id> <unknown> <x_coord> <y_coord> 

	Exemplo de linha:
	31-10:00:00:00 2354 015 01500090 35221.750000 188824.765625

	Portanto, ao fazer o split, com white space como delimitador, temos:
	element[0] = 31-10:00:00:00 (<month>-<day>:<time>, ignorar o 31-10 e converter 00:00:00 para segundos)
	element[1] = 2354 (<bus_id>)

	element[2] = 015 (<route_id>, ignorar)
	element[3] = 01500090 (<unknown>, ignorar)
	
	element[4] = 35221.750000 (<x_coord>, converte pra metros fazendo valor*0.3408 segundo o site ConvertWorld.com)
	element[5] = 188824.765625 (<y_coord>, converte pra metros fazendo valor*0.3408 segundo o site ConvertWorld.com)
	'''
	# 1) Escrevendo a parte <month>-<day>:<time>
	converted_time_list = element[0].split(":") # Isola a data das horas, minutos e segundos, separando pelo ":"
	hours = int(converted_time_list[1])
	minutes = int(converted_time_list[2])
	seconds = int(converted_time_list[3])
	converted_time = hours*3600 + minutes*60 + seconds # Tempo convertido para segundos!
	target_file.write(str(converted_time) + " ") # Por fim escreve o tempo e um white space

	# 2) Escrevendo a parte <bus_id>
	target_file.write(str(element[1]) + " ") # Por fim escreve o bus id e um white space

	# 3) Escrevendo a parte <x_coord> multiplicada por 0.3408 para converter de pés para metros
	converted_coordinate = float(element[4])*0.3408
	target_file.write(str(converted_coordinate) + " ") # Por fim escreve a x coordinate e um white space

	# 4) Escrevendo a parte <y_coord> multiplicada por 0.3408 para converter de pés para metros
	converted_coordinate = float(element[5])*0.3408
	target_file.write(str(converted_coordinate) + "\n") # Por fim escreve a y coordinate
# --- Fecha os arquivos: ---
target_file.close()	# Sempre que abre um arquivo é bom fechá-lo!
source_file.close()	# Sempre que abre um arquivo é bom fechá-lo!

# Trunca o arquivo pra tirar o espaço em branco a mais
source_file = open("Pre_Converted_Trace.txt","a")
source_file.seek(0,2)
last_byte = source_file.tell()
source_file.truncate(last_byte-2)
source_file.close()	# Sempre que abre um arquivo é bom fechá-lo!


''' ---- FASE 2: Criando o PathFile ---- '''
# --- Abre os arquivos para operar: ---
source_file = open("Pre_Converted_Trace.txt","r")
target_file = open("Path_File.txt","w")
source_file.seek(0)
target_file.seek(0)
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
'''
Exemplos de arquivos entre () a explicação

de movimentos:

8 0 43200 0 3000 0 3000 (id_maximo_dos_nós tempo_mínimo tempo_máximo cord_x_mínima cord_x_máxima cord_y_mínima cord_y_máxima)
4 0,0,0 1000,0,750 2000,0,1500 3000,0,2250 4000,0,3000   (id_do_nó_ tempo_i,x_i,y_i tempo_i+k,x_i+k,y_i+k ...) 
5 0,750,0 1000,750,750 2000,750,1500 3000,750,2250 4000,750,3000   (as linhas que seguem é similar para o nó que segue,nó 5)
6 0,1500,0 1000,1500,750 2000,1500,1500 3000,1500,2250 4000,1500,3000   ... 
7 0,2250,0 1000,2250,750 2000,2250,1500 3000,2250,2250 4000,2250,3000   ...
8 0,3000,0 1000,3000,750 2000,3000,1500 3000,3000,2250 4000,3000,3000   ...

'''
# === Localizando o total de nós no trace ===
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

id_count = 1 # Como já está no primeiro bus_id, é como se já tivesse sido contado!

old_value = sorted_file_list[0][1] # Seta inicialmente um old id para comparar, sendo o primeiro bus id da ordem crescente
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (element[1] != old_value):
		old_value = element[1]
		id_count = id_count + 1
target_file.write(str(id_count) + " ") # Escreve por fim o total de ids!

# === Localizando o tempo mínimo do trace ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

old_value = int(sorted_file_list[0][0]) # Seta inicialmente o primeiro tempo que achar numa linha para comparar.
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (int(element[0]) <= old_value):
		old_value = int(element[0])
target_file.write(str(old_value)+ ".0" + " ") # Escreve por fim o menor tempo!

# === Localizando o tempo máximo do trace ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

old_value = int(sorted_file_list[0][0]) # Seta inicialmente o primeiro tempo que achar numa linha para comparar.
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (int(element[0]) >= old_value):
		old_value = int(element[0])
target_file.write(str(old_value)+".0" + " ") # Escreve por fim o maior tempo!

# === Localizando a coordenada X mínima ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

old_value = float(sorted_file_list[0][2]) # Seta inicialmente o primeiro tempo que achar numa linha para comparar.
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (float(element[2]) <= old_value):
		old_value = float(element[2])
target_file.write(str(old_value)+ " ") # Escreve por fim o menor X!

# === Localizando a coordenada X máxima ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

old_value = float(sorted_file_list[0][2]) # Seta inicialmente o primeiro tempo que achar numa linha para comparar.
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (float(element[2]) >= old_value):
		old_value = float(element[2])
target_file.write(str(old_value)+ " ") # Escreve por fim o maior X!

# === Localizando a coordenada Y mínima ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

old_value = float(sorted_file_list[0][3]) # Seta inicialmente o primeiro tempo que achar numa linha para comparar.
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (float(element[3]) <= old_value):
		old_value = float(element[3])
target_file.write(str(old_value)+ " ") # Escreve por fim o menor Y!

# === Localizando a coordenada Y máxima ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

old_value = float(sorted_file_list[0][3]) # Seta inicialmente o primeiro tempo que achar numa linha para comparar.
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (float(element[3]) >= old_value):
		old_value = float(element[3])
target_file.write(str(old_value)+ "\n") # Escreve por fim o maior Y e pula uma linha!

# === Localizando nó e criando suas tuplas ===
source_file.seek(0) # Reseta a leitura do trace para o começo do arquivo
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

already_marked_node_id = False
converted_node_id = 0 # Vamos começar marcando os nós desde 0 pois é assim que o TheONE trabalha, aceita que dói menos.
old_value = int(sorted_file_list[0][1]) # Armazena o id do bus so para fins de quando trocar de bus_id
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (int(element[1]) != old_value): # Se achou um id de bus diferente, reseta o marcador de id
		old_value = int(element[1])
		already_marked_node_id = False
		target_file.write("\n")
		converted_node_id = converted_node_id+1 # Como mudou de node, incrementa o id para acompanhar o novo node!
	if (already_marked_node_id == False): # Se ainda não marcou o ID do node, marca o mesmo.
		target_file.write(str(converted_node_id)) #Escreve o nome do bus id convertido para o TheONE e um white space
		already_marked_node_id = True
	target_file.write(" " + str(element[0])+","+str(element[2])+","+str(element[3])) # Começa a marcar as tuplas

# --- Fecha os arquivos: ---
target_file.close()	# Sempre que abre um arquivo é bom fechá-lo!
source_file.close()	# Sempre que abre um arquivo é bom fechá-lo!

''' ---- FASE 3: Criando o ActiveFile ---- '''
# --- Abre os arquivos para operar: ---
source_file = open("Pre_Converted_Trace.txt","r")
target_file = open("Active_File.txt","w")
sorted_file_list = [] # Reseta o conteúdo desta lista
file_list = [] # Reseta o conteúdo desta lista
source_file.seek(0)
target_file.seek(0)

# --- Lendo linhas do trace refinado ---
'''
de tempos de atividade: mostra o intervalo dos tempos dos quais vc quer consideras o movimentos indicados no arquivo de movimentos

Exemplos de arquivos entre () a explicação

4 0 43200  (id_do_nó tempo_inicial ultimo_tempo)
5 0 43200 (similar nas outras linhas)
6 0 43200
7 0 43200
8 0 43200
'''
# === Localizando o total de nós no trace ===
# --- Lendo linhas do trace refinado ---
for line in source_file:
	current_line_list = line.split() #Divide a linha do trace pelo delimitador white space em uma lista
	sorted_file_list.append(current_line_list) #Salva a lista aqui como elemento desta lista

already_marked_node_id = False
already_marked_minimum_time = False
converted_node_id = 0 # Fazemos os nodes começarem do id 0 pois é assim que o TheONE trabalha, aceita que dói menos!
old_value = int(sorted_file_list[0][1]) # Armazena o id do bus so para fins de quando trocar de bus_id
old_maximum_time = int(sorted_file_list[0][0]) # Joga a princípio um tempo qualquer aqui só pra comparar
for element in sorted_file_list: # Leitura do trace do crawdad refinado linha a linha
	if (int(element[1]) != old_value): # Se achou um id de bus diferente, reseta o marcador de id
		old_value = int(element[1])
		target_file.write(" " + str(old_maximum_time) + ".0" + "\n") # Já que achou um id diferente, o último id antes dele tinha o maior tempo
		already_marked_node_id = False # Novo id, não foi marcado ainda
		already_marked_minimum_time = False # Novo id, ainda não marcou seu tempo minimo
		converted_node_id = converted_node_id+1 # Como mudou de node, incrementa o id para acompanhar o novo node!
	if (already_marked_node_id == False): # Se ainda não marcou o ID do node, marca o mesmo.
		target_file.write(str(converted_node_id)) #Escreve o nome do bus id e um white space
		already_marked_node_id = True # Como já escreveu o nome dele, não entra mais aqui no if até achar bus id diferente
	if (already_marked_minimum_time == False): # Por padrão o primeiro tempo do nó será o seu tempo mínimo em que aparece
		target_file.write(" " + str(element[0]) + ".0") # Já marco o tempo mínimo do nó no active file!
		already_marked_minimum_time = True # Já que marquei o minimum time, não entro mais aqui no if até achar bus id diferente
	#if (int(element[0]) >= old_maximum_time):
	old_maximum_time = int(element[0])
target_file.write(" " + str(old_maximum_time) + ".0" + "\n") # Em virtude de não achar um cara na frente pra marcar, o último no tem que marcar aqui fora.

# --- Fecha os arquivos: ---
target_file.close()	# Sempre que abre um arquivo é bom fechá-lo!
source_file.close()	# Sempre que abre um arquivo é bom fechá-lo!

# Trunca o arquivo pra tirar o espaço em branco a mais
source_file = open("Active_File.txt","a")
source_file.seek(0,2)
last_byte = source_file.tell()
source_file.truncate(last_byte-2)
source_file.close()	# Sempre que abre um arquivo é bom fechá-lo!