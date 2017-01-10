%% Parte 1: Knn 
% Knn usa as as labels dos objetos mais próximos das propriedades dadas
% para realizar uma predição. 
load fisheriris
X = meas;
Y = species;

Mdl = fitcknn(X,Y,'NumNeighbors',5);

Error = resubLoss(Mdl);

Y_predict = Mdl.predict(X);

Accuracy = sum(strcmp(Y_predict,Y))/length(Y)*100


%% Exercício 1. 
% Use Knn para prever se um paciente terá ou não câncer
% Divida o dataset em 200 samples para treinar e o resto 
% para testar, cada linha é uma sample diferente e as colunas
% são as features
 load cancer_dataset
 
 cancerInputs = cancerInputs';
 cancerTargets = cancerTargets(1,:)';
 
 % Divida os dados em treino e teste
 X_treino = ?;
 Y_treino = ?;
 
 X_teste = ?;
 Y_teste = ?;

 Mdl = ?;
 
 Error_treino = resubLoss(Mdl);

 Y_predict = Mdl.predict(?);

 Accuracy_test = 100-(sum(abs(Y_predict-Y_teste))/length(Y_teste)*100)
 
 
 %%  Parte 2: decision trees
 % Decision trees cria ramos que separam os dados em diferentes labels.
 % Elas tem facilidade para se ajustar a separações não lineares
 
load fisheriris
X = meas;
Y = species;

Mdl = fitctree(X,Y);

Error = resubLoss(Mdl);

Y_predict = Mdl.predict(X);

Accuracy = sum(strcmp(Y_predict,Y))/length(Y)*100

view(Mdl,'Mode','graph')

%% Exercício 2
% Use o mesmo dataset do câncer mas, dessa vez, use o classificador de
% decision tree para conseguir o resultado. 
 load cancer_dataset
 
 cancerInputs = cancerInputs';
 cancerTargets = cancerTargets(1,:)';
 
 % Divida os dados em treino e teste
 X_treino = ?;
 Y_treino = ?;
 
 X_teste = ?;
 Y_teste = ?;

 Mdl = ?;
 
 Error_treino = resubLoss(Mdl);

 Y_predict = Mdl.predict(?);

 Accuracy_test = 100-(sum(abs(Y_predict-Y_teste))/length(Y_teste)*100);



%% Parte 3: Redes neurais
 load cancer_dataset
 
 cancerInputs = cancerInputs;
 cancerTargets = cancerTargets(1,:);

net = patternnet(20);

% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 98/100;
net.divideParam.valRatio = 1/100;
net.divideParam.testRatio = 1/100;

[net,tr] = train(net,cancerInputs,cancerTargets);

% Test the Network
outputs = net(cancerInputs);
errors = gsubtract(cancerTargets,outputs);
performance = perform(net,cancerTargets,outputs)

%% Exercício 3
% Tente prever se um aluno precisa, ou não, de ajuda externa para passar 
% de ano a partir dos parâmetros abaixo:

%'school_GP', 'school_MS', 'sex_F', 'sex_M', 'age', 'address_R', 'address_U', 
% 'famsize_GT3', 'famsize_LE3', 'Pstatus_A', 'Pstatus_T', 'Medu', 'Fedu', 'Mjob_at_home', 
% 'Mjob_health', 'Mjob_other', 'Mjob_services', 'Mjob_teacher', 'Fjob_at_home', 'Fjob_health',
% 'Fjob_other', 'Fjob_services', 'Fjob_teacher', 'reason_course', 'reason_home', 'reason_other',
% 'reason_reputation', 'guardian_father', 'guardian_mother', 'guardian_other', 'traveltime',
% 'studytime', 'failures', 'schoolsup', 'famsup', 'paid', 'activities', 'nursery', 'higher',
% 'internet', 'romantic', 'famrel', 'freetime', 'goout', 'Dalc', 'Walc', 'health', 'absences'

% Esses são dados reais e com muito ruído, então tenha noção de que os resultados não serão
% tão bons quanto os anteriores. Use todos os métodos vistos até agora e
% compara o desempenho de cada um.
X_treino = csvread('X_train.csv');
X_treino = X_treino(2:end,:);

Y_treino = csvread('Y_train.csv');

X_teste = csvread('X_test.csv');
X_teste = X_teste(2:end,:);

Y_teste = csvread('Y_test.csv');





%% Exercício 4

% Leia a imagem e a converta para hsv
he = imread('hestain.png');
hsv_he = rgb2hsv(he);

% Converter cor e contraste em vetores para a separação
Cor_cont = double(hsv_he(:,:,1:2));
nrows = size(Cor_cont,1);
ncols = size(Cor_cont,2);
Cor_cont = reshape(Cor_cont,nrows*ncols,2);

nColors = ?;
% Calcular o cluster
[cluster_idx, cluster_center] = kmeans(Cor_cont,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]); % make a tri dimensional matrix

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
    figure
    imshow(segmented_images{k}), title(['objects in cluster ',num2str(k)]);
end
