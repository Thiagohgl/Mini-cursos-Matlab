%% Exercício 1
% Ache o mínimo da função 3x^2 + 2*x + 5 calculando a derivada e igualando
% a 0.

x = linspace(-10,10,1000);
y = 3*x.^2+2*x+5;

Minimo_pela_derivada = -1/3;
y_minimo = 3*Minimo_pela_derivada^2+2*Minimo_pela_derivada+5;
plot(x,y)
set(gca,'fontsize',18)
hold on
plot(Minimo_pela_derivada,y_minimo,'r*','Linewidth',5)
title('3x^2+2*x+5')
legend('Função','Ponto mínimo')
xlabel('x')
ylabel('y')
%% Exercício 2
% Optimize a função tanque_cilindrico com gradiente analítico e numérico.
% O algoritmo analítico é 'trust-region' e o numérico 'quasi-newton'

% Gradiente numérico
options_num = ?; % Sem gradiente
% Gradiente dado na função
options_ana = ?;

problem.solver = ?;
problem.options = ?;
problem.x0 = ?;
problem.objective = ?;
[x,A] = fminunc(problem)

A % Area
V = pi*x(1)^2*x(2) % Volume

%% Parte 3: Otimização com limites
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
problem.options = options;
problem.solver = 'fmincon';
problem.objective = @tanque_cilindrico;
problem.x0 = [6,6];
problem.lb = [4 ,4]; % Limite mínimo em cada ponto
problem.ub = [8, 8]; % Limite máximo em cada ponto

[x,A] = fmincon(problem)

V = pi*x(1)^2*x(2) % Volume

%% Exercício 3
% Calcule as dimensões que maximizam o volume de um teatro
% dado pela limitação: Largura+2*Comprimento+4*Altura = 115.  
% Para isso, acrescente Aeq e Beq na estrutura do problema,
% sabendo que o otimizador realizará: Aeq*x <= Beq que é o mesmo que:
% Aeq(1)*x(1)+...+Aeq(end)*x(end) = Beq

% Edite a função Opera para criar a função de custo

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
problem.options = options;
problem.solver = 'fmincon';
problem.objective = @Opera; % Fazer a função
problem.x0 = [20,10,5];
problem.Aeq = [?,?,?];
problem.Beq = ?;

x = fmincon(problem);

x %Dimensoes
V = x(1)*x(2)*x(3) % Volume




%% Parte 4: Nelder-Mead
% Nelder-Mead é um algoritmo de otimização estocástica rápido e que
% funciona muito bem quando 
options = optimset('PlotFcns',@optimplotfval);
x0 = [6,6];
[x,A] = fminsearch(@tanque_cilindrico,x0,options)

%% Avalição
% Rode o código abaixo para ver o mínimo real da função que você estava
% otimizando no limite de 10 no raio e altura, qual dos métodos chegou mais perto?
% Plot
[X,Y] = meshgrid(0:0.1:40,0:0.1:5); % Inicialize os valores como uma mesh
V = pi*X.^2.*Y;
V = V >= 650; % Pontos com volumes menors que 650 são descartados
A = 2*pi.*X.*Y;
A = A.*V;
figure
surf(X,Y,A)
shading interp
title(['Aréa do tanque cilíndrico com volume maior que 650. Valor mínimo real: ',num2str(min(A(A>0)))])


%% Parte 5: Algoritmo genético
% Algoritmo genético é uma otimização estocástica que tem o objetivo de
% simular processos evolutivos.

        problem.solver = 'ga';
        problem.fitnessfcn = @tanque_cilindrico; 
        problem.nvars = 2; % Número de variáveis
       
        % Estrutura do problema
        Generations = 500; % 500 Gerações
        Popu = 50; % 50 samples por geração
        problem.options = gaoptimset('Display','iter','Generations',Generations,...
            'PopulationSize',Popu,'TolFun',10e-20); 
               
        [x,A,exitflag,output] = ga(problem); % Genetic algorithm
        
        A
        V = pi*x(1)^2*x(2) % Volume