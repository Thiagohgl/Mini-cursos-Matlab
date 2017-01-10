%% Parte 1: itaValue
% Voc� pode usar unidades em seus c�lculos para facilitar a interpreta��o
%f�sica do resultado. No exemplo abaixo � poss�vel ver um exemplo do
%c�lculo da for�a gravitacional e da press�o

m = itaValue(5.2,'kg'); 
g = itaValue(9.81,'m/s^2');

F = m*g

S = itaValue(2,'m^2');
p = F/S

%% Exerc�cio 1:
% Use itaValue para identificar as dimen��es da viscosidade(u) dada pela equa��o:
%
% tau = u * dV/dy
% 
% tau = Pa
% V = m/s
% y = m

dV = itaValue(1,'m/s');
dy = itaValue(1,'m');
tau = itaValue(1,'Pa');

u = tau / (dV/dy);

fprintf('A unidade da viscosidade �: '),u

%% Parte 2: itaCoordinates
% Com a classe itaCoordinates � poss�vel criar coordenadas que podem
% facilmente serem convertidas entre v�rios sistemas como esf�rico e 
% cil�ndrico.

% Criando um objeto com N pontos
N = 20;
coord = itaCoordinates(N);

% Adicionamos Valores aleat�rios para X e Y e um valor constante para Z
coord.x = rand(N,1);
coord.y = rand(N,1);
coord.z = 1;

% Cartesianas
fprintf('As coordenadas no plano cartesiano s�o:'),coord.cart

% Esf�ricas
fprintf('As coordenadas esf�ricas s�o:'),coord.sph

% Cil�ndricas
fprintf('As coordenadas esf�ricas s�o:'),coord.cyl



%% Exerc�cio 2: 
% Use a fun��o 'ita_generateSampling_equiangular(theta,phi)' para gerar uma
% distribui��o esf�rica de pontos/fontes com theta e phi = 30 e depois converta-os para coordenadas
% cartesianas para calcular a dist�ncia dos pontos para um receptor junto com a 
% press�o sonora em tal ponto.

coord = ita_generateSampling_equiangular(30,30); % (theta/phi)

% Visualiza��o em coordenadas esf�ricas
figure 
hold on
scatter(coord);
title('Pontos/fontes em coordenadas esf�ricas')

% Conver��o
coord_cart = coord.cart;

% Receptor
Rec_coord = [2 0 0];

Distancia = sqrt(sum((coord_cart - repmat(Rec_coord,length(coord_cart),1)).^2,2));

% Calculo da press�o sonora
dB_por_Fonte = 60;
I_por_fonte = 10^(dB_por_Fonte/10)*10^-12;
I_in_point = repmat(I_por_fonte,length(Distancia),1)./Distancia;
dB_total = 10*log10(sum(I_in_point)/(10^-12));%/log(10);

% plot as fontes e o receptor
figure
hold on
plot3(coord_cart(:,1),coord_cart(:,2),coord_cart(:,3),'*')
plot3(Rec_coord(:,1),Rec_coord(:,2),Rec_coord(:,3),'r*')
title('Fontes sonoras e receptor')
legend('Fontes sonoras','Receptor')

msgbox(['O n�vel de press�o sonora no receptor �: ',num2str(dB_total)])


%% Parte 3: itaAudio
%itaAudio � a classe central da toolbox, com ela � poss�vel trabalhar
%e analizar sinais de �udios de forma bem simples e pr�tica, grande parte
% das outras fun��es da toolbox est�o ligadas � ela. 

% Crie um itaAudio
sine = itaAudio; 

% Vamos criar um seno de 1000 Hz com dura��o de 2 s e um Sample rate de 44100

% Propriedades do seno.
Fs = 44100;
Frequencia = 1000;

% Data
tmax = 2;
t = 0:1/Fs:tmax-1/Fs;
Seno = sin(2*pi*Frequencia*t)'+sin(2*pi*Frequencia*3*t)';

% itaAudio
sine.time = Seno;%
sine = sine * itaValue(1,'Pa') % Incluir a unidade

%% Parte 3.5: itaAudio

% Leitura de sons
Audio = itaAudio;
Audio.time = audioread('Cello.wav');

% Filtro

% Passa baixa
Audio_low_pass  = ita_filter(Audio,'lowpass','butterworth',1500,'order',50);

% Passa alta
Audio_high_pass  = ita_filter(Audio,'highpass','butterworth',5000,'order',100);

% Curva A ou C 
Audio_curva_A = ita_filter_weighting(Audio,'type', 'A');
Audio_curva_C = ita_filter_weighting(Audio,'type', 'C');


%% Exerc�cio 3:
% Analize os seguintes audios e veja algumas caracter�sticas de cada tipo
% de som. O que pode ser tido como uma caracter�stica de cada som?

Audio1 = itaAudio;
Audio2 = itaAudio;
Audio3 = itaAudio;

Audio1.time = audioread('Language.wav');
Audio2.time = audioread('Handel orchestra_Right.wav');
Audio3.time = audioread('58293__benboncan__steam-train.38-42_faded.wav');

Audio1.pf
Audio2.pf
Audio3.pf

%% Parte 4: Room acoustics
% Com a toolbox do instituto � poss�vel realizar an�lises de fun��es de
% resposta de ambientes de forma bem simples.

% Leia a resposta
IR = itaAudio;
IR.time = audioread('IR spokane_womans_club_ir.wav');
%IR.time = IR.time(1:44100*3,:);
IR = IR * itaValue(1,'Pa');

%ita_roomacoustics
% Fun��o escrita de room acoustics
freqRange       = [250 10000];  
bandsPerOctave  = 1; 

raResult = ita_roomacoustics(IR, 'freqRange', freqRange, 'bandsPerOctave', bandsPerOctave, 'T20');  
raResult.T20.bar

%Par�metros dispon�veis:  EDT, T10, T15, T20, T30, T40, T50, T60
%                         C50, C80, D50, D80, Center_Time , EDC

%% Exerc�cio 4:
% Analize as 3 respostas de salas e tente adivinhar de onde elas s�o! 
% as possibilidades s�o: Carro, Igreja, Teatro


% Declarar os objetos
IR1 = itaAudio;
IR2 = itaAudio;
IR3 = itaAudio;

% Carregar os dados
IR1.time = audioread('IR 1.wav'); % carro
IR2.time = audioread('IR 2.wav'); % teatro
IR3.time = audioread('IR 3.wav'); % Igrea


raResult = ita_roomacoustics(IR1, 'freqRange', freqRange, 'bandsPerOctave', bandsPerOctave, 'T20');  
raResult.T20.bar


%% Exercicio 5:
% Ou�a como um �udio de uma c�mera anec�ica
% soa com as 3 fun��es de resposta para cada caso. use a fun��o
% ita_convolve(Audio,IR)

Audio = itaAudio;
Audio.time = audioread('Cello.wav');

Audio_IR_1 = ita_convolve(Audio,IR1);
Audio_IR_1.play

Audio_IR_2 = ita_convolve(Audio,IR2);
Audio_IR_2.play

Audio_IR_3 = ita_convolve(Audio,IR3);
Audio_IR_3.play


%% Parte 6: Medi��o
% Fazer uma medi��o � extremamente f�cil

% Classe para realiza��o de medi��o da fun��o de transfer�ncia
MS = itaMSTF; 
MS.edit % Abrir a GUI para editar a medi��o

IR = MS.run % Medir

% Medir par�metros da sala
% Fun��o escrita de room acoustics
freqRange       = [250 10000];  
bandsPerOctave  = 1;

raResult = ita_roomacoustics(IR, 'freqRange', freqRange, 'bandsPerOctave', bandsPerOctave, 'T20','C50','EDT');  
raResult.T20.bar
raResult.C50.bar
raResult.EDT.bar

%% Parte 7: Psicoac�stica

% colocando a unidade
Audio = Audio * itaValue(1,'Pa');

% Global loudness
[N NS] = ita_loudness(Audio, 'SoundFieldType' , 'free');
NS.plot_freq

% Loudness x tempo
[TotalLoudness SpecificLoudness N_5] = ita_loudness_timevariant(Audio, 'SoundFieldType','free');

% Plot

% Spectogram
figure
pcolor(SpecificLoudness.timeVector,SpecificLoudness.freqVector,SpecificLoudness.data)
set(gca,'Yscale')
set(gca,'Fontsize',18)
title('Loudness em fun��o do tempo e Bark')
xlabel('Time[s]')
ylabel('Bark')
shading interp
colorbar
% Loudness em fun��o do tempo
TotalLoudness.plot_time
title(['Loudness em fun��o do tempo, N5 = ',num2str(N_5)])

% Sharpness
Sharpness = ita_sharpness(Audio);


%% Exerc�cio Final
% Ou�am os sons abaixos e depois calculem a Loudness N5 e dB em
% cada um deles. A ordem de dB crescente � a mesma de Loudness crescente?

% dB = 20*log10(rms(Audio.time)/(2*10^-5))

Lou_x_dB_1 = itaAudio ;
Lou_x_dB_2 = itaAudio ;
Lou_x_dB_3 = itaAudio ;

Lou_x_dB_1 = Lou_x_dB_1 * itaValue(1,'Pa');
Lou_x_dB_2 = Lou_x_dB_2 * itaValue(1,'Pa');
Lou_x_dB_3 = Lou_x_dB_3 * itaValue(1,'Pa');

Lou_x_dB_1.time = audioread('Lou x dB 1.wav');
Lou_x_dB_2.time = audioread('Lou x dB 2.wav');
Lou_x_dB_3.time = audioread('Lou x dB 3.wav');

% dB
dB_1 = 20*log10(rms(Lou_x_dB_1.time)/(2*10^-5));
dB_2 = 20*log10(rms(Lou_x_dB_2.time)/(2*10^-5));
dB_3 = 20*log10(rms(Lou_x_dB_3.time)/(2*10^-5));

% Loudness
[~, ~, N_5_1] = ita_loudness_timevariant(Lou_x_dB_1, 'SoundFieldType','free');
[~, ~, N_5_2] = ita_loudness_timevariant(Lou_x_dB_2, 'SoundFieldType','free');
[~, ~,N_5_3] = ita_loudness_timevariant(Lou_x_dB_3, 'SoundFieldType','free');



