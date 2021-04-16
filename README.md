## Data Science em Projetos de Indústria Química

### Projeto 1: Estatística Multivariável - Identificação de Outliers

### 1. Introdução 

O projeto consiste em descrever e analisar a distribuição de 5 vazões de processo e identificar outliers. Supõe-se que as variáveis estejam em estado estacionário, ou seja, que a variável tempo não tenha correlação com as vazões e as medidas em relação ao tempo são independentes entre si. As séries históricas das cinco vazões são mostradas na Figura 1.

Figura 1: Séries históricas das cinco vazões (x1, x2, x3, x4, x5).
      
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Fig.1.PNG)

### 2. Método

Os parâmetros descritivos da amostra são dados pelas equações 1. Os intervalos de confiança foram calculados pela distribuição de t de Student para a média e χ2 para a variância, considerando 95% de confiança. Supõe-se que a distribuição das variáveis siga uma distribuição normal e o quadrado distância estatística dada por Mahalanobis segue a distribuição χ2. Portanto, para identificar os outliers monovariáveis foi considerado 2 vezes o valor do desvio padrão em relação a média, o que representa mais de 95% de uma distribuição normal; para identificar os multivariáveis, 90% de confiança da distribuição χ2 foi utilizado.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Fig.%202.PNG)

### 3. Análise

Numa comparação visual das séries históricas mostradas na Figura 1, já é possível identificar outliers e possíveis correlações das variáveis. Evidencia-se que a vazão 1 não correlaciona com as demais e também que as vazões restantes estão de alguma forma relacionadas entre si. Outliers são vistos em todas as vazões exceto em x1. A seguir são analisadas a amostragem das cinco vazões.

A matriz de correlação e covariancia entre as variáveis de vazão estão mostradas nas Tabelas 2 e 3. Com já observado na comparação entre as séries históricas, a vazão não se correlaciona com as demais vazões. Os coeficientes de correlação entre as vazões são muito baixos, menores que 0.15. Por outro lado, x3 e x2 parecem bem correlacionadas, bem como x4 e x5, com valores acima de 0.90. A variável x2 correlaciona-se de alguma forma com as demais vazões (x3, x4, x5) com valores ao redor 0.9.

Figura 2: Histograma normalizado das cinco vazões (x1, x2, x3, x4, x5).
             
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Fig.%203.PNG)

Para identificar outliers multivariáveis, a distância estatística das observações foi tomada (Figura 3). O gráfico mostra três outliers multivariados. O correspondente ao tempo de coleta 18h já foi anteriormente identificado monovariavelmente, enquanto os coletados a 32h e o 42h somente pela análise da distância multivariável. Portanto, mostra-se fundamental a análise multivariável para identificação de outliers que se encontram escondidos nas distribuições individuais.

Figura 3: Série histórica da distância estatística ao quadrado
               
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Fig.%204.PNG)

### 4. Conclusão

A análise feita nos dados das vazões revelou que a vazão x1 não se correlaciona com as demais, além de não tender à uma distribuição normal. Possivelmente erros sistemáticos podem ter ocorrido na coleta. As demais vazões correlacionam-se linearmente, sendo os pares de vazões (x2, x3) e (x4, x5) os mais correlacionados entre si. No total, 3 outliers puderam ser identificados correspondendo ao tempo de coleta 18, 32 e 42h. Somente o de 18h pode ser identificado monovarialmente, equanto os demais pela análise multivariável da distância estatística.

Tabela 1: Parâmetros descritivos para as distribuições de vazões.
      
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Tab.%201.PNG)

Tabela 2: Matriz de Covariância
      
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Tab.%202.PNG)

Tabela 3: Matriz de correlação
      
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/Tab.%203.PNG)

