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

equação 1a
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq1.PNG)
equação 1b
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq2.PNG)

Sabe-se que o valor da função objetivo no ponto ótimo corresponde a equação 2

equação 2
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq3.PNG)

onde

equação 3
![](https://github.com/MariaClaraMendes/Portfolio-/blob/main/Images/2.Eq3.PNG)

e

equação 4
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
