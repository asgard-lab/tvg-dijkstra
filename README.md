============
tvg-dijkstra
============
Professor Orientador:	Cesar Augusto Cavalheiro Marcondes
Aluno: 					Álvaro Shiokawa Alvarez

- Página do projeto de mestrado do Álvaro, referente ao trabalho de redes DTN modeladas como grafos dinâmicos.

- Desenvolvemos um algoritmo que atua em grafos TVG, algoritmo este apelidado de TVFP (Time-Varying Fastest Path),
  que busca o melhor caminho de um nó origem a um nó destino em um grafo TVG. É importante frisar que este melhor
  caminho sempre busca com que se encontre o nó destino o mais cedo possível, podendo ou não envolver um número
  menor de hops, ou seja, melhor caminho é o caminho que permite a mensagem chegar ao destino o mais cedo possível, através de uma jornada mais adiantada, ou foremost journey.

- Para a implementação deste projeto, estamos utilizando o simulador de redes DTN, o TheONE (Versão 1.6.0, lançada em 25/07/2015), feito em JAVA.

- O código fonte do TVSP se encontra dentro da pasta "one"", mais precisamento sua implementação está dentro da pasta "routing", em uma classe chamada de TVSPRouter.java.
