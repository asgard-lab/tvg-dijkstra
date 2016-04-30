============
tvg-dijkstra
============
Professor Orientador:	Cesar Augusto Cavalheiro Marcondes

Aluno: Álvaro Shiokawa Alvarez

- Página do projeto de mestrado do aluno Álvaro, no curso de mestrado em Ciência da Computação do Programa de Pós Graduação em Ciência da Computação (PPG-CC), referente ao trabalho de redes DTN modeladas como grafos dinâmicos.

- Desenvolvemos um algoritmo que atua em grafos TVG, algoritmo este apelidado de TVFP (Time-Varying Fastest Path),
  que busca o melhor caminho de um nó origem a um nó destino em um grafo TVG. É importante frisar que este melhor
  caminho sempre busca com que se encontre o nó destino o mais cedo possível, podendo ou não envolver um número
  menor de hops, ou seja, melhor caminho é o caminho que permite a mensagem chegar ao destino o mais cedo possível, através de uma jornada mais adiantada, ou foremost journey.

- Para a implementação deste projeto, estamos utilizando o simulador de redes DTN, o TheONE (Versão 1.6.0, lançada em 25/07/2015), feito em JAVA.

- O código fonte do TVFP se encontra dentro da pasta "one"", mais precisamento sua implementação está dentro da pasta "routing", em uma classe chamada de TVFPRouter.java, que é onde estão implementados e configuradas as decisões de roteamento em cada nó que utiliza o TVFP como protocolo de roteamento.

- Classes auxiliares foram implementadas para executar o trabalho de parsing do TVG, convertendo-as para as estruturas de dados em Java adequadas, a serem utilizadas no programa. Além disso alguns métodos que percorrem o TVG em busca do melhor caminho tambem foram implementados como classes auxiliares.
