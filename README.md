## Data Science em Projetos da Indústria Química

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


### Projeto 2: Estatística Multivariável - Reconciliação de Dados

### 1. Introdução 

O projeto 2 consiste no estudo de caso de reconciliação de dados em uma planta de isopreno. Foram dadas vazões mássicas coletadas das correntes F1, F1A, F2, F3, durante um ano de operação, cerca 300 000 dados. As correntes se associam conforme mostrado na Figura 1. Foi pedida a reconciliação dos dados, bem como a identificação e correção de possíveis erros grosseiros e sistemáticos.

### 2. Método

#### 2.1. Tratamento dos Dados

Os dados brutos foram tratados por meio da eliminação de outliers multivariados. Considerando que os ruídos são variáveis randômicas que seguem a distribuição normal, a identificação e exclusão dos outliers foi feita calculando-se o quadrado da distância de Mahalanobis das observações em relação à média. Já que essa distância ao quadrado comporta-se como uma distribuição χ2, o critério de exclusão foi estabelecido pela teste de hipótese de pertencimento para 95% de confiança monocaudal. Os cálculos foram feitos por meio de rotinas implementadas em Python 3.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Fig1.PNG)

Figura 1: Esquema de associação das correntes de uma planta de isopropeno

#### 2.2. Identificação de Erros Sistemáticos

A identificação de possíveis erros sistemáticos foi feita em duas etapas: (i) teste para verificação global de erro sistemático e (ii) identificação da vazão com erro grosseiro, caso (i) for positivo. O problema de reconciliação de dados para o presente caso é tratado como um problema de minimização do erro quadrático entre o valor da variável medido (y) e o "verdadeiro"(x), sujeito à equação de conservação de massa (equação 1b), resultando em

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq1.PNG)

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq2.PNG)

Sabe-se que o valor da função objetivo no ponto ótimo corresponde a equação 2

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq3.PNG)

onde

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq3.PNG)

e

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq4.PNG)


Tal razão segue uma distribuição χ2; portanto, um teste de pertencimento à essa distribuição com 90% de confiança será realizado, constituindo-se na etapa (i).
Se houver erro grosseiro, cada variável será testada para identificar em qual delas ele está presente (etapa (ii)). Como o sistema para reconciliação é redundante em medidas, o teste consiste em eliminar uma das variáveis na função objetivo e verificar o valor dessa função no ponto ótimo. Os valores da função objetivo obtidos com a retirada de diferentes variáveis serão comparados. O critério para determinar a vazão com erro será dada por aquela vazão que apresentar o menor erro quadrático quando retirada do processo de minimização, ou seja, quando for estimada somente pelo balanço de massa. Para o cálculo de otimização foi utilizado o MS Excel 2007.
      
### 3. Resultados e Discussão

#### 3.1. Estatítica Descritiva

Os dados brutos foram tratados e cerca de 6% foram considerados outliers. Os histogramas e os parâmetros de média e variância são mostrados na Figura 2 e na Tabela 1.

Figura 2: Distribuição das vazões F1, F1A, F2 e F3, coletadas ao longo de um ano da planta de isopropeno.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Fig2.PNG)

Tabela 1: Parâmetros descritivos da distribuição das vazões F1, F2, F1A e F3.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Tab1.PNG)

#### 3.2. Identificação de Erros Sistemáticos

Na etapa i, a minimização para o sistema de reconciliação redundante, ou seja, com todas
as variáveis medidas foi realizada, resultando no erro quadrático de 0.77. O valor de corte para o teste de pertencimento à distribuição χ2 com 1 grau de liberdade (1 equação) e 90% de confiança é 0.02, muito abaixo do obtido na otimização, significando que existe erro sistemático nas vazões medidas.

Portanto, a segunda etapa procurou determinar em qual das vazões estaria esse erro. A
primeira suspeita foi a vazão F3, já que o seu desvio foi muito superior as demais vazões, cerca de 64% superior ao segundo colocado (F2). Retirou-se, pois, a vazão F3 do conjunto das variáveis medidas, sendo somente estimada pela equação de conservação de massa. O valor do erro quadrático foi de 2:7e-11 e o valor de F3 estimado pelo balanço foi de 7776 kg/h.

Para confirmar que a vazão F3 era a que continha erro, fez-se o mesmo procedimento para
as demais vazões, comparando os valores da função objetivo obtidas. Todos os valores foram superiores a 2:7e-11, indicando que é mais provável que F3 esteja com o erro sistemático. Dessa forma, pode-se pensar em recalibrar o instrumento de medição ou adicionar o valor equivalente a 758 kg/h nos valores obtidos da vazão F3.

### 4. Conclusão

Uma vez que as varáveis medidas compõem um sistema redundante para a reconciliação de
dados, é simples identificar a presença de erros sistemáticos. O procedimento ocorreu em duas principais etapas. A primeira indicou globalmente a presença de erros grosseiros. A segunda detectou que a vazão F3 continha erro sistemático, que retirava cerca de 758 kg/h do valor final. Portanto, recomenda-se a calibração do medidor ou o acréscimo desse valor nos cálculos. Pode-se verificar também se não há vazamentos na tubulação.


### Projeto 3: Estatística Multivariável - Principal Component Analysis (PCA)

### 1. Introdução 
A tarefa consiste na análise de componentes principais de uma unidade de evaporação de licor (N aCl(aq) e N aOHaq), constituída por três evaporadores em série, como mostra a Figura 1. O licor e o vapor para aquecimento fluem em contracorrente. 

Figura 1: Variância e Variância Acumulada em Função do Número de Componentes Principais.
   
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.fig.1.PNG)

A nomeação das variáveis é dada pela Tabela 1.

Tabela 1: Referência das variáveis

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.tab.1.PNG)

### 2. Método

#### 2.1. Tratamento de Dados

Os dados brutos foram tratados por meio da eliminação de outliers multivariados. Considerando que os ruídos são variáveis randômicas que seguem a distribuição normal, a identificação e exclusão dos outliers foi feita calculando-se o quadrado da distância de Mahalanobis das observações em relação à média. Já que essa distância ao quadrado comporta-se como uma distribuição χ2, o critério de exclusão foi estabelecido pelo teste de hipótese de pertencimento para 95% de confiança monocaudal. Os cálculos foram feitos por meio do software R.

#### 2.2. Análise de Componentes Principais - PCA

Uma análise de componentes principais preocupa-se em explicara estrutura da variância-covariância de um conjunto de variáveis através de algumas combinações lineares dessas variáveis. Os objetivos gerais da aplicação de PCA são (1) redução de dados e (2) interpretação.
Embora os componentes p sejam necessários para reproduzir a variabilidade total do sistema, muitas vezes grande parte dessa variabilidade pode ser explicada por um pequeno número de componentes principais. Em caso afirmativo, há (quase) tanta informação nos componentes k como nas variáveis p originais. Os componentes principais k podem então substituir as variáveis p iniciais e o conjunto de dados original, consistindo de n medições em p variáveis, é reduzido a um conjunto de dados que consiste em n medições em k componentes
principais.
Uma análise dos componentes principais frequentemente revela relacionamentos que não
foram previstos e, portanto, permite interpretações que normalmente não seriam levadas em consideração. A análise de componentes principais transforma a base de variáveis em uma nova base com componentes (as novas variáveis) não correlacionados e de máxima variância com objetivo de reduzir o número de variáveis ou mesmo de identificar as variáveis que mais representam osistema. Isso corresponde atransformar as variáveis iniciais Xi nos componentes Yi de tal forma que


![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.eq.1a.PNG)


sendo 


![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.eq.1b.PNG)


![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.eq.1c.PNG)


as matrizes de covariância e a matriz com seus autovetores unitários, respectivamente.
Como o caso em estudo compreende variáveis distintas, como temperatura e pressão, a
troca de base para a dos componentes principais não será feita, somente a identificação das variáveismais importantes do processo. As variáveis serão normalizadas, amatriz de correlação calculada e será feita também a sua decomposição espectral. Dentre os diversos critérios para determinar os componentes principais, o critério da importância relativa dos componentes será levado em conta, uma vez que a intenção é identificar somente as principais variáveis. Caso fosse a intenção de mudar a base do sistema, seria mais interessante utilizar o critério da variância acumulada, por exemplo.

A partir da determinação dos principais componentes, as variáveis mais importantes serão
determinadas como sendo aquelas que contribuem mais para explicar os principais componentes, ou seja, aquelas que apresentarem os maiores loadings.
Análises de componentes principais são mais um meio para um fim do que um fim deles
mesmo, pois eles frequentemente serverm como passos intermediários em investigações maiores. Por exemplo, os componentes principais podem ser entradas para uma regressão, bem como, para análise de clusters, e até mesmo, seleção de variáveis para alimentar redes neurais.

### 3. Resultados e Discussão

Dos dados brutos coletados, 12% foram considerados outliers e excluídos da análise de componentes principais. A análise sobre as variáveis padronizadas forneceu a Figura 2, sendo à esquerda, um scree plot da variância (número de PC’s em função da magnitude dos autovalores) e à direita, o gráfico da variância acumulada em função do número de PC’s. Como o objetivo da tarefa é identificar as variáveis mais relevantes estatisticamente para o processo, somente os três primeiros componentes foram selecionados, visto que, observando o scree plot da esquerda, a partir do PC3 não há tanta influência na magnitude dos autovalores. O PC1 explica a metade da variância dos dados, já os PC2 e PC3 explicam 20% dos dados.

Figura 2: Variância e Variância Acumulada em função do número de PC’s.
   
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.Fig.2.PNG)

A partir desses componentes, as contribuições individuais de cada variável para os componentes, os loadings, é mostrado na Figura 3. Observa-se que, as variáveis mais representativas, são X6 e a X8 no PC1 que corresponde à pressão no primeiro evaporador e à temperatura de alimentação do segundo evaporador. Tal fato deve-se à alta demanda energética do primeiro evaporador e sua influência na cadeia de calor nos demais evaporadores. Em seguida, tem-se as variáveis X4 e X7 no PC2, correspondente à pressão e à temperatura do evaporador 3. O terceiro evaporador influencia nos demais em relação à alimentação e sua composição. Apesar de não aparecer com as variáveismais importantes do sistema, aparecendo apenas no PC3, a vazão (X3) e a temperatura de alimentação (X1), não podem ser ignoradas. Pela análise o evaporador 2 é o mais dependente dos evaporadores e, portanto, tem menos influência na variância dos dados.

Figura 3: Os loadings de cada variável na composição dos PC’s (PC1, PC2 e PC3).
   
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/3.Fig.3.PNG)

### 4. Conclusão

A aplicação da análise de componentes principais nesse conjunto de dados foi bastante satisfatória, uma vez que reduziu o número de variáveis para menos da metade (46%). Não é, exatamente, uma análise com 100% de confiabilidade, pois há de se fazer considerações com base nas variáveis envolvidas, contudo, as variáveis selecionadas são consistentes e coerentes.


### Projeto 4: Estatística Multivariável - Clusters

### 1. Introdução
A tarefa consiste na análise de cluster em dados de uma unidade de evaporação de licor
(N aCl(aq) e N aOHaq), constituída por três evaporadores em série, como mostrado na Figura 1. O licor e o vapor para aquecimento fluem em contracorrente. A nomeação das variáveis é dada pela Tabela 1. A tarefa tem por objetivo estudar possíveis grupos nos dados apresentados. Dentro dos método aglomerativo, a presente tarefa testará as técnicas hierárquicas single linkage, complete linkage, average linkage e também a não hierárquica k-means.

Tabela 1: Referência das Variáveis

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.tab1.PNG)

A Figura 1 exemplifica o fluxograma do processo de evaporação de licor. As variáveis a
serem analisadas no processo estão ilustradas em cada etapa do processo.

Figura 1: Fluxograma simplificado da unidade de evaporação. As variáveis estão mostradas
juntamente com a identificação nos dados brutos.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig1.PNG)


### 2. Método

#### 2.1. Métodos de Agrupamento Hierárquico

Raramente podemos examinar todas as possibilidades de agrupamento, mesmo com os
mais rápidos computadores. Devido a esse problema, uma grande variedade de algoritmos de
clustering surgiram para encontrar clusters "razoáveis"sem ter que olhar para todas as configurações. Os métodos hierárquicos têm por princípio agrupar os dados de forma hierárquica e progressiva. Eles são divididos em duas principais frentes: divisiva e aglomerativa. A divisiva parte de um único grupo que contém todos os dados e divide-o sucessivamente com base na sua dissimilaridade. Contrariamente, o aglomerativo considera inicialmente cada dado como sendo um grupo isolado e aglomera-os sucessivamente por meio da sua similaridade.

O método aglomerativo, que será utilizado nessa tarefa, agrega minimizando a distância
(dissimilaridade) entre os grupos de várias formas distintas, dentre elas: Single linkage, Complete linkage e Average linkage. Em Single linkage, é minimizada a menor distância entre dados de grupos distintos; em Complete linkage, a minimização é na maior distância e em Average linkage a distância média entre os grupos.

###### 2.1.1. Single Linkage

As entradas para um algoritmo de single linkage podem ser distâncias ou semelhanças entre pares de objetos. Grupos são formados a partir das entidades individuais, fundindo-se os vizinhos mais próximos, onde o termo vizinho mais próximo conota a menor distância ou maior semelhança. Os resultados do clustering de ligação única podem ser exibidos graficamente na forma de um dendrograma ou diagrama de árvore. Os ramos da árvore representam clusters. Os ramos se juntam (mesclam) em nós, cujas posições ao longo de uma distância (ou semelhança) o eixo indica o nível em que as fusões ocorrem.

###### 2.1.2. Complete Linkage

O clustering de complete linkage prossegue praticamente da mesma maneira que o single
linkage, com uma exceção importante: em cada estágio, a distância (similaridade) entre clusters é determinado pela distância (semelhança) entre os dois elementos, um de cada cluster, que são mais distantes. Assim, o método garante que todos os itens em um cluster estejam dentro de uma distância máxima (ou semelhança) entre si.

###### 2.1.3. Average Linkage

A ligação média trata a distância entre dois clusters como a distância média entre todos os pares de itens em que um membro de um par pertence a cada cluster.
A distância utilizada nessa tarefa é a Euclidiana, definida por

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.eq1.PNG)


#### 2.2. Métodos de Agrupamento Não - Hieráquicos

As técnicas de clustering não hieráquicas são projetadas para agrupar itens, em vez de variáveis, em uma coleção de clusters K. O número de clusters, K, pode ser especificado antecipadamente ou determinado como parte do procedimento de clustering. Uma vez que uma
matriz de distância (de similaridades) não precisa ser determinada, e os dados brutos não precisam ser armazenados durante a execução do computador, métodos não-hierárquicos podem ser aplicados para conjuntos de dados muito maiores do que as técnicas hierárquicas. Os métodos não hierárquicos começam de (1) uma partição inicial de itens em grupos ou (2) um conjunto inicial de pontos de semente, os quais formarão o núcleo de grupos. Umamaneira de iniciar é selecionar aleatoriamente pontos iniciais entre os itens ou particionar aleatoriamente os itens em grupos iniciais. Um dos procedimentos não hierárquicos mais populares é o método K-means.
MacQueen sugere o termo K-means para descrever um algoritmo dele que atribui cada
item ao cluster com o centróide mais próximo (média). Na sua forma mais simples, o processo é composto por três etapas:

1. Particione os itens em K iniciais clusters.
2. Prossiga pela lista de itens, atribuindo um item ao cluster cujo centróide (média) é a mais próxima. (A distância é geralmente calculada usando a distância euclidiana com observações padronizadas ou não padronzadas.) Recalcule o centróide para o cluster que recebe o novo item e para o cluster que perdeu o item.
3. Repita a etapa 2 até que não ocorram mais atribuições. 

Ao invés de começar com uma partição de todos os itens em K grupos preliminares na etapa
1, poderíamos especificar K centróides iniciais (pontos de semente) e depois prosseguir para o passo 2. A atribuição final de itens aos clusters será, até certo ponto, dependente na partição inicial ou na seleção inicial de pontos de semente. A experiência sugere que as mudanças mais importantes na atribuição ocorrem com a primeira etapa de realocação. Para verificar a estabilidade do clustering, é desejável executar novamente o algoritmo com uma nova partição inicial. Depois que os clusters são determinados, as intuições relativas às suas interpretações são ajustadas pela reorganização da lista de itens, de modo que os que aparecem no primeiro cluster apareçam primeiro, os que aparecem no segundo cluster apareçam no segundo cluster e assim por diante. Uma tabela dos centróides do cluster (médias) e as variações dentro do cluster também ajudam as diferenças no grupo.

### 3. Resultados e Discussão

Os dados brutos foram tratados para que os outliers não contribuíssem com erros e configurar como possíveis clusters. O método escolhido de critério de similaridades entre os dados foi a distância euclidiana.

#### 3.1. Métodos Hierárquicos Aglomerativos

##### 3.1.1. Single Linkage

Para a técnica hierárquica, foram comparados três métodos para o estudo de clusters, realizados no software R. Os três métodos conhecidos como de Ligação (Linkage), são eles: single linkage (vizinho mais próximo), average linkage (distância média) e complete average (vizinho mais distante).

O método do vizinhomais próximo produziu o dendrogramamostrado na Figura 2. Existe
um agrupamento concentrado no campo esquerdo do gráfico. Esse método não mostrouse interessante para a aplicação nesses dados, uma vez que não representa bem a separação
dos dados. Isso se deve ao fato de os dados mostrarem uma certa similaridade, após a sua
padronização eremoção de outliers. Como ométodo se baseia no vizinhomais próximo, então
a separação será complicada, uma vez que não há muita diferença nos dados disponíveis para esse caso.

Figura 2: Dendograma produzido pelo método hierárquico de aglomeração Single Linkage.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig2.PNG)

O método Single Linkage tende a agrupar itens que estão de alguma forma conectados
(efeito chaining) e consegue com mais clareza dividir grupos que estão claramente separados. Entretanto, cluster que possuem muito ruído, ou seja, que não se separam com clareza não são identificados pelo método.
No software R, existe um comando que fornece a média dos valores de cada variável em
cada cluster. Dessaforma, variações nesses valores demédia apontam que a variável discrepante não possui grande inteferência na associação do cluster em questão. A Figura 3 mostra amatriz das médias para o método single linkage.

Figura 3: Matriz das Médias das Variáveis em cada Cluter

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig3.PNG)


##### 3.1.2. Average Linkage

O método da distância média produziu um dendrograma, observado na Figura 4 com altura de corte igual a 4. Este método, diferente do anterior (single linkage) consegue separar os
clusters de forma mais visual, facilitando a identificação dos grupos.

Figura 4: Matriz das Médias das Variáveis em cada Cluter

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.4.PNG)

A matriz das médias para este método é observada na Figura 5 a seguir. É possível observar a partir dessa seleção que o cluster 3 possui valores discrepantes para as variáveis X4 (pressão no estágio 3) , X5 (pressão no estágio 2), X7 (temperatura no estágio 3) e X8 (temperatura no estágio 2). Dessa forma, infere-se que o cluster 3 alocou os dados com maiores valores observados de pressão e temperatura e os demais clusters os valores observadosmédios e baixos dessas variáveis.

Figura 5: Matriz das Médias das Variáveis em cada Cluter

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig5.PNG)

##### 3.1.3. Complete Linkage

O último método aplicado ao conjunto de dados produziu um Dendrograma com altura
de corte igual a 9, mostrando grupos mais bem divididos que os métodos anteriores (single e average) como mostra a Figura 6 a seguir.

Figura 6: Dendograma produzido pelo método hierárquico de aglomeração Complete Linkage

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig6.PNG)

A matriz das médias para esse método pode ser observado na Figura 7 abaixo. Este método
não mostrou valores de variáveis discrepantes da média, sendo portanto, mais consistente.

Figura 7: Matriz das Médias das Variáveis em cada Cluter

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig7.PNG)

As Figuras (8, 9 e 10) a seguir nos mostram uma melhor visualização dos clusters propostos pelos métodos aplicados.
A Figura 8mostra a alocação dos dados para as variáveis X4 e X5 em 3 grupos. Como observado no Dendrograma, o método single não consegue separar bem os dados dos grupos, uma vez que o método não faz muita distinção nos valores, devido a sua metodologia de vizinho mais próximo. Dessa forma, como os dados não apresentam valores discrepantes entre si, em sua maioria, mesmo as variáveis X4 e X5 que apresentaram distinção nas matrizes das médias, não foi possível observar a divisão de forma interessante.

Figura 8: Alocação de dados das variáveis X4 e X5 a partir do método Single Linkage

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig8.PNG)

A Figura 9 a seguir mostra a aplicação do método average para a divisão dos grupos. Já é
possível observar umamelhorseparação dos grupos,mostrando que o grupo 2 alocou os dados
intermediários de pressão no estágio 2 e 3, pressões de valores baixos no grupo 1 e valores de pressão elevados no grupo 3. No geral, pode-se observar que os estágios 2 e 3 possuem mais valores intermediários ao invés de altos e baixos.

Figura 9: Alocação de dados das variáveis X4 e X5 a partir do método Average Linkage

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig9.PNG)

Já o método complete mostrou uma maior extensão para valores altos de pressão nos está-
gios 2 e 3, porém, com uma margem maior que a do método average, como mostra a Figura
10 a seguir. Contudo, os dados parecem não estarem completamente separados, uma vez que,
visualmente aparentam se conectar aos outros de forma mais invasiva que o método anterior (average).

Figura 10: Alocação de dados das variáveis X4 e X5 a partir do método Complete Linkage

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig10.PNG)

#### 3.2. Métodos Não-Hierárquicos 

##### 3.2.1. K-Means

A análise dos dados através da técnica não-hieráquica K-means necessita da informação do
número de grupos. Este número é fornecido por meio dos testes ANOVA, o qual calcula a
variação dentro do grupo. Este teste refere-se a variações causadas por diferenças dentro de grupos individuais (ou níveis). Em outras palavras, nem todos os valores dentro de cada grupo (por exemplo, médias) são os mesmos. A variação de cada grupo é relatada na saída da ANOVA como SS(W) ou que significa (Soma dos Quadrados Dentro do Grupos/Soma dos Quadrados Internos). Está intrinsecamente ligado à diferença de variância causada pela forma como os grupos interagem entre si. Isso ocorre porque o objetivo da ANOVA é comparar a proporção entre a variação do grupo e entre a variação do grupo. Se a variação causada por interações entre amostras diferentes for muito maior do que a variação encontrada dentro de valores em um único grupo, isso indica que as médias não são iguais. Com o cálculo do WSS, obtém-se o Scree Plot (Figura 11), o qual nos mostra o número de clusters possíveis nesse conjunto de dados.

Figura 11: Scree Plot: número de clusters possíveis versus WSS

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.11.PNG)

Neste caso, o número de clusters é escolhido com base a minimizar a variabilidade de dados para manter uma maior similaridade entre eles. A partir disso, escolhe-se um número de clusters onde a WSS não possui grande variabilidade. No gráfico pode ser observado que a partir do número de cluster 5 WSS já não tem tanta variação em relação ao WSS seguinte. A Figura 12 fornece o número de dados alocados em cada cluster.

Figura 12: Scree Plot: Número de clusters possíveis versus WSS

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.12.PNG)

Além dos dados alocados em cada cluster, é possível ainda observar a média dos valores de cada variável em cada cluster na Figura 13. Através dos dados expostos, percebe-se que não há discrepâncias nos valores das médias, indicando uma distribuição similar nos valores entre os clusters.

Figura 13: Tabela de médias das variáveis em cada cluster para o método K-Means.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.13.PNG)

Na Figura 14 é possível observar as características das variáveis x4 e x5 em cada um dos clusters obtidos anteriomentes. Os grupos 1 e 5 são os dados mais extremos, sendo assim, os que estão menos interligados aos outros dados. São representações de pressões maiores e menores nos respectivos estágios. Os grupos 2, 3 e 4 representam os dados de valores intermediários das pressões do sistema com ranges de valores diferentes.

Figura 14: Alocação de dados das variáveis X4 e X5 a partir do método K-Means.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.14.PNG)

##### 3.2.2. Clustering de Variáveis

Além de classificar os dados em grupos, é possível ainda fazer agrupamento de variáveis. Ou seja, são grupos de variáveis que estão intimamente relacionadas entre si e, portanto, trazem o mesmo em formação. Esta abordagem pode ser útil para redução de dimensão e seleção de variável. No software R possui o pacote ClustOfVar especificamente desenvolvido para este fim. O software disponibiliza um dendrograma das variáveis e, para uma altura de 0.8, encontra-se um número de grupos igual a 5. As variáveis ficam distribuídas daseguintemaneira observados na Figura 15:

Figura 15: Dendrograma de Váriaveis.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.15.PNG)

A Tabela 16 abaixo lista a distribuição de variáveis em grupos.

Figura 16: Tabela com a distribuição de Variáveis por grupo.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/4.fig.16.PNG)


### 4. Conclusão

De acordo com todos os dados apresentados, pode-se perceber que as técnicas hierárquicas, em geral, não representou bem o grupo de dados. O método single não caracterizou bem os grupos, enquanto que o average e o complete foram bem semelhantes no tratamento. Ainda assim, não apresentaram resultados satisfatórios. Já a técnica não-hierárquica (K-Means) conseguiu representar o grupo de dados de forma satisfatória, mostrando um número razoável de grupos para a análise de dados. Dessa forma, todas as análises a partir de agora, serão tratadas pela técnica não-hierárquica k-means.


### Projeto 5: Estatística Multivariável - Discriminantes

### 1. Introdução 

O projeto consiste na aplicação de técnicas de análise de discriminantes em dados de uma unidade de evaporação de licor (N aCl(aq) e N aOHaq), constituída por três evaporadores em série. O licor e o vapor para aquecimento fluem em contracorrente. A nomeação das variáveis é dada pela Tabela 1. A tarefa tem por objetivo estudar as técnicas estatísticas e analisar a separação dos dados em questão em diferentes grupos. A técnica baseia-se na criação de um "discriminante", ou seja, um critério quatitativo para separar observações em grupos, com máxima distância entre si. A Tabela 1 lista as variáves do estudo de caso.

Tabela 1: Referência das variáveis
      
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5tab1.PNG)

### 2. Método

#### 2.1. Técnica de Análise de Discriminantes

Discriminação e classificação são técnicas multivaridas relacionadas com separação de objetos (ou observações) em conjuntos distintos e alocação de novos objetos (observações) em grupos previamente definidos. A análise de discriminante é de natureza exploratória. Como é um procedimento separativo, é frequentemente empregado numa base de dados uma única vez para investigar as diferenças observadas quando as relações causais não são bem entendidas. Os procedimentos de classificação são menos exploratórios, no sentido de que eles possuem regras bem definidas, as quais podem ser usadas para atribuir novos objetos. A classificação normalmente requer mais estrutura de problemas do que a discriminação.

Assim, os objetivos imediatos de discriminação e classificação são, respectivamente:
Objetivo 1: Descrever, graficamente (em três ou menos dimensões) ou algebricamente, as
características diferenciais dos objetos (observações) de vários agrupamentos conhecidos (populações). Tenta-se encontrar "discriminantes"cujos valores numéricos são tais que os agrupamentos são separados no máximo possível. Objetivo 2: Classificar objetos (observações) em duas ou mais classes rotuladas. A ênfase está ma derivação de uma regra que pode ser usada para otimizar a atribuição de novos objetos às classes rotuladas.

Usa-se o termo discriminação para referir-se ao objetivo 1. Esta terminologia foi introduzida pelo Ronald Aylmer Fisher no primeiro tratamento moderno de problemas separativos; Um termo mais descritivo para esse objetivo, no entanto, é a separação. Refere-se ao segundo objetivo como classificação.
Uma função que separa objetos, ás vezes, pode servir como um alocador e , por outro lado, uma regra que aloca objetos pode sugerir um procedimento discriminatório. Na prática, os objetivos 1 e 2 frequentemente se sobrepõem e a distinção entre discriminação e classificação torna-se vaga.
Foi utilizado o software R studio para realizar a aplicação da análise de discriminantes.]

### 3. Resultados e Discussão

A análise de discriminantes requer que as observações estejam previamente separadas em
populações diferentes. De acordo com a Tarefa anterior de clusters e os resultados obtidos com a comparação das técnicas hierárquicas e não-hierárquicas, optou-se pelo método K-Means, com número de 3 clusters, uma vez que, o aumento desse valor nos leva a valores de distâncias pouco variados, o que nos levaria a uma análise não muito interessante, visto que a técnica de discriminante requer valores bem distintos de distância. No software R, os dados foram particionados randomicamente, e 80% deles dados foram utilizados na discriminação para obter a função discriminante e os 20% restantes foram utilizados na classificação de novos indivíduos nos grupos. A Figura 1 expõe a partição dos dados referentes as variáveis X4 e X5 em training (80%) e testing (20%), para exemplificar. 

Figura 1: Partição randômica dos dados das variáveis X4 e X5 em training e testing.
             
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5fig1.PNG)

Como dito, os dadosforamagrupados, anteriormente, em 3 clusters pelométodoK-Means,
apresentando umamatriz dasmédias para cada uma das variáveis observada na Tabela 2 abaixo.

Tabela 2: Matriz das médias em cada cluster para cada variável.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5tab2.PNG)

#### 3.1. Discriminante Linear

A partir dos dados particionados e das médias de cada variável em cada cluster, calcula-se os coeficientes dos discriminantes lineares, a partir da função lda() observados na Tabela 3 abaixo:

Tabela 3: Coeficientes das variáveis nos discriminantes LD1 e LD2.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5tab3.PNG)

Tais coeficientesrepresentam os pesos de cada variável em cada discriminante. Dessaforma, como este descriminante é linear, obtemos uma expressão para cada discriminante em função de cada variável, como observado nas equações abaixo:

Eq. 1
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5eq1.PNG)

Eq. 2
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5eq2.PNG)


Nesta análise, pode-se observar quais são as variáveis que mais se destacam nos discriminantes gerados, a partir do seu peso. Neste caso, a variável X13 possui maior peso em módudo no discriminante LD1 e a variável X10 no discriminante LD2.
A função lda()fornece ainda a porcentagem deseparação alcançada por cada discriminante.
O discriminante LD1 alcançou uma proporção de separação de 92.54% e o discriminante LD2
7.46%. Neste caso, observa-se que houve sucesso na discriminação dos dados por parte da
primeira função de discriminante aplicada.
A partir da determinação de discriminantes, observa-se a inteferência de cada um destes
nos grupos, previamente separados. A Figura 2 ilustra essa interferência.

Figura 2: LD1 versus LD2
               
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5fig2.PNG)

Neste caso, percebe-se que o grupo 3 não possui grande interferência do discriminante
LD2, uma vez que pela matriz das médias, observamos que este grupo foi agrupado com os
menores valores demédia, dentre os 3 grupos.Dessa forma, concentrou osmenores valores dos dados particionados.
As Figuras 3 e 4 ilustradas a seguir, representam os alcances de separação das funções discriminantes LD1 e LD2.

Figura 3: Separação alcançada por LD1

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5fig3.PNG)

Figura 4: Separação alcançada por LD2.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5fig4.PNG)

Percebe-se que para o discriminante LD1 houve um alcance de separação satisfatório frente a realizada pelo LD2, uma vez que os grupos 2 e 3 deste discriminante se sobrepõem nos outros grupos. O que não é observado no LD1, pois percebe-se claramente a separação entre os grupos.
O teste de validação do modelo foi feito com o 20% dos dados restantes através da matriz
de confusão. Esta matriz fornece o número de dados alocados em cada grupo pela predição do modelo e a real alocação. A matriz pode ser observada na Tabela 4 a seguir.

Tabela 4: Matriz de confusão

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5tab4.PNG)

Um modelo ideal teria uma matriz de confusão com todos os elementos, além da diagonal
nulos. A matriz do modelo, em questão afirma que 7 dados do grupo 1 foram realocados no
grupo 2 na predição do modelo. Mostrou ainda, que 42 dados do grupo 2 foram alocados
para o grupo 1 e 12 dados do grupo 3 foram alocados no grupo 2 na predição. A partir dessa matriz, pode-se calcular o erro de predição do modelo.

Eq.3

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5eq3.PNG)


Onde, sd significa a soma da diagonal e st a soma de todos os elementos da matriz. Neste
caso, o erro de predição foi igual a 6.623%.
A análise para um discriminante quadrático revela a seguinte matriz de confusão mostrada
na Tabela 5 a seguir. Com um erro de 6.071% de erro de predição.

Tabela 5: Matriz de confusão

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/5tab5.PNG)

### 4. Conclusão

Os resultados obtidos com a análise de discriminantes e separação foram interessantes para grupo de dados. Ambos os erros de predição para os discriminantes linear e quadráticos foram praticamente iguais. O discriminante quadrático se mostrou um pouco melhor, com diferença de 0,552% no valor do erro, mostrando-se melhor na separação dos grupos. De acordo com a literatura, até 20% para o valor do erro de predição é aceito para o grupo de dados.


### Projeto 5: Redes Neurais

### 1. Introdução 

O projeto consiste na aplicação de redes neurais nos dados de uma unidade de evaporação de licor (N aCl(aq) e N aOHaq), constituída por três evaporadores em série. O licor e o vapor para aquecimento fluem em contracorrente. A nomeação das variáveis é dada pela Tabela 1.

Tabela 1: Referência das Variáveis
      
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6tab1.PNG)

A aplicação de redes neurais foi realizada em dois casos: 1) A todas as variáveis disponíveis do proceso; e para as 2) variáveis que foram selecionadas na técnica de Componentes Principais na Tarefa 03. Neste caso, as variáveis foram: X1, X3, X4, X6, X7 e X8. Os dados foram normalizados, e particionados randômicamente para separar os grupos de dados de treinamento da rede e o grupo de teste. Para o grupo de treinamento, foram selecionados 80% dos dados e para o grupo de teste, os 20% dos dados restantes.

### 2. Método

#### 2.1. Redes Neurais Artificiais

O final da década de 80 marcou o ressurgimento da área de Redes Neurais Artificiais (RNAs). Também conhecidas como conexionismo ou sistemas de processamento paralelo e distribuído. Esta forma de computação não-algorítimica é caracterizada por sistemas que, em algum nível, relembram, a estrutura do cérebro humano. Por não ser baseada em regras ou programas, a computação neural se constitui em yna alternativa à computação algorítmica convencional.
A solução de problemas através de RNAs é bastante atrativa, já que a forma como estes
são representados internamente pela rede e o paralelismo natural inerente à arquitetura das RNAs criam a possibilidade de um desempenho superior ao dos modelos convencionais. Em RNAs, o procedimento usual na solução de problemas passa inicialmente por uma fase de
aprendizagem, em que um conjunto de exemplos é apresentado para a rede, a qual extrai automaticamente as características necessárias para representar a informação fornecida.

#### 2.2. Funcionalidade

Em uma rede multicamadas, o processamento realizado por cada nodo é definido pela combinação dos processamentos realizados pelos nodos da camada anterior que estão conectados a ele. Quando se segue da primeira camada intermediária em direção à camada de saída, as funções implementadas se tornam cada vez mais complexas. Estas funções definem como é realizada a divisão do espaço de decisão. Para uma rede com pelo menos duas camadas intermediárias, pode-se dizer que o seguinte processamento ocorre em cada uma das camadas:

Primeira camada intermediária: cada nodo traça retas no espaço de padrões de treinamento.

Segunda camada intermediária: cada nodo combina as retas traçadas pelos neurônios da
camada anterior conectados a ele, formando regiões convexas, onde o número de lados é definido pelo número de unidades a ele conectadas.

Camada de saída: a nodo forma regiões que são combinações das regiões convexas definidas pelos nodos a ele conectados da camada anterior. Os nodos definem, destamaneira, regiões
com formatos abstratos.

Pode ser dito que as unidades intermediárias de uma rede MLP funcionam como detectores de características. Elas geram uma codificação interna dos padrões de entrada, que é então utilizada para a definição da saída da rede. Dado um número suficientemente grande de unidades intermediárias, é possível formar representações internas para qualquer conjunto de padrões de entrada.

Cybenko, além de outros pesquisadores, investigou o número de camadas intermediárias
necessárias para a implementação de classes de funções em uma Rede Neural Artificial. Os
resultados obtidos indicam que: uma camada intermediária é suficiente para aproximar qualquer função contínua e duas camadas intermediárias são suficientes para aproximar qualquer função matemática.

Deve ser observado, contudo, que em alguns casos a utilização de duas ou mais camadas
intermediárias pode facilitar o treinamento da rede. A utilização de um grande número de
camadas intermediárias não é recomendada, no entanto, pois, cada vez que o erro medido
durante o treinamento é propagado para a camada anterior, ele se torna menos útil ou preciso. A única camadaque tem uma noção precisa do erro cometido pela rede é a camada de saída. A última camada intermediária recebe apenas um estimativa sobre o erro. A penúltima camada intermediária, uma estimativa da estimativa, e assim por diante.

O software utilizado para a aplicação das redes neurais neste trabalho foi o Rstudio, o qual dispõe de um pacote para essa finalidade (neuralnet). O algoritmo utilizado para o cálculo da rede neural foi o Rprop+ (default), de retropropagação resiliente com retrocesso de peso.

#### 2.3. Algoritmo Rprop

O algoritmo Rprop, de resilient back-propagation, é um algoritmo de adaptação global que
realiza treinamento supervisionado batch em redes do tipo MLP. Este algoritmo procura eliminar a influência negativa do valor da derivada parcial na definição do ajuste dos pesos. Esta influência negativa ocorre porque, quando a saída de um nodo for próxima de 0 (ou 1) e a saída desejada for 1 (ou 0), a derivada será próxima de 0, fazendo com que os pesos deste nodo recebam um ajuste mínimo. quase igual a O.

O algoritmo Rprop elimina este problema utilizando apenas o sinal da derivada, e não o
seu valor. O sinal indica a direção do ajuste dos pesos (aumentar ou diminuir o peso anterior).

### 3. Resultados e Discussão

Foram testatos dois algoritmos na implementação das redes neurais para os dois conjuntos de dados: Rprop+ e Rprop-. Além disso, foram aplicados o mesmo número de neurônios na
camada oculta para cada situação, visando observar o comportamento deles, através do coeficiente de correlação (R²). A Tabela 2 abaixo mostra os testes aplicados para os casos envolvidos:

Tabela 2: Tabela de Testes para Redes Neurais.
             
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6tab2.PNG)

#### 3.1. Redes Neurais Artificiais- Todas as Variáveis

Os resultados obtidos na partição randômica dos dados para este conjunto de variáveis é observado na Figura 1 a seguir:

Figura 1: Conjunto de dados para treinamento e teste da rede neural
             
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6fig1.PNG)

Nesta Figura 1, é observada a partição randômica dos dados que serão destinados ao treinamento da rede e os dados destinados ao teste da rede. Os algoritmos aplicados na redes neurais para todas as variáveis foram satisfatórios, porém com ressalvas. A Tabela 3 mostram os resultados obtidos em cada caso.

Tabela 3:  Coeficientes de correlação R² para todas as variáveis.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6tab3.PNG)

Os resultados apresentados serão para o melhor valor de R² obtido nas simulações. Neste
caso, A Figura 4 a seguir mostra a arquitetura da rede neural artificial, obtida através do algoritmo Rprop+, com 4 neurônios na camada oculta e um coeficiente de correlação de 0,9323.

Figura 2: Arquitetura da Rede Neural Artificial para todas as variáveis.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6fig2.PNG)

A Figura 3 mostra os dados do conjunto de treinamento previstos em função do observado
pela rede neural e seu coeficiente de correlação R².

Figura 3: Dados observados versus previstos.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6fig3.PNG)

Pode-se observar que os dados estão bem correlacionados tanto no conjunto de treinamento da rede, bem como para os dados de teste. Nesse caso, a rede neural foi satisfatória.

#### 3.2. Redes Neurais Artificiais - Variáveis do PCA

Os resultados obtidos na partição randômica dos dados para este conjunto de variáveis é observado na Figura 4 a seguir:

Figura 4: Conjunto de dados para treinamento e teste da rede neural.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6fig4.PNG)

Nesta Figura 2, é observada a partição randômica dos dados que serão destinados ao treinamento da rede e os dados destinados ao teste da rede. Os algoritmos aplicados na redes neurais para todas as variáveis foram satisfatórios, porém com ressalvas. A Tabela 4 mostram os resultados obtidos em cada caso.

Tabela 4: Coeficientes de correlação R² para as variáveis do PCA.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6tab4.PNG)

Os resultados apresentados serão para o melhor valor de R² obtido nas simulações. Neste
caso, A Figura 5 a seguir mostra a arquitetura da rede neural artificial, obtida através do algoritmo Rprop-, com 3 neurônios na camada oculta e um coeficiente de correlação de 0,7692.

Figura 5: Arquitetura da Rede Neural Artificial para as variáveis do PCA.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6fig5.PNG)

A Figura 6 mostra os dados do conjunto de treinamento previstos em função do observado
pela rede neural e seu coeficiente de correlação R².

Figura 6: Dados observados versus previstos.

![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/6fig6.PNG)

Já para o conjunto de variáveis escolhidos através da PCA, a correlação dos dados não foi satisfatória, observando dispersão dos dados na rede neural.


### 4. Conclusão

A aplicação da redes neurais artificiais foi bem mais satisfatória para o conjunto que engloba todas as variáveis do que para o conjunto de dados com as variáveis mais interferentes para o processo. Além disso, o melhor algoritmo para cada caso foi diferente em cada caso, bem como o número de neurônios na camada oculta, o que mostra que a quantidade de dados e varáveis interfere no método de obtenção da rede neural.
