%% Parte 1: Digitalizando uma imagem
% Para ler uma imagem no matlab é extremamente fácil. 
% O comando usado é o imread. As imagens coloridas são
% arrays de 3 dimensões, sendo as duas primeiras as coordenadas
% x e z e a terceira depende do sistema de cor (No caso default, 
% cada uma corresponde às cores Vermelho, Verde e Azul (RGB))

% Leia uma imagem e faça um display da mesma
I = imread('butterfly.jpg');
fprintf('As dimensões da imagem são: '),size(I)

% Mostre a imagem
imshow(I)
impixelinfo

%% Exercício 1
% Corte a imagem para que apenas um quadrado contendo a borboleta
% seja mostrado

x_inicial = 34;
x_final = 2301;
y_inicial = 130;
y_final = 1700;

I_borboleta = I(y_inicial:y_final,x_inicial:x_final,:);

imshow(I_borboleta)

%% Parte 2: filtro de cor

I_hsv = rgb2hsv(I);
Mask = ( (I_hsv(:,:,1) > 0) + (0.16 > I_hsv(:,:,1)) ) == 2 ;
Mask = uint8(Mask);

I_masked(:,:,1) = I(:,:,1) .*Mask;
I_masked(:,:,2) = I(:,:,2) .*Mask;
I_masked(:,:,3) = I(:,:,3) .*Mask;

imshow(I_masked)

%% Exercício 2: Filtrar placa de pare

I_placa = imread('Stop_sign.jpg');
I_placa_hsv = rgb2hsv(I_placa);


Mask = ( (I_placa_hsv(:,:,1) > 0.95) + ( 0.02 > I_placa_hsv(:,:,1)) ) > 0 ;
Mask = uint8(Mask);

I_placa_masked(:,:,1) = I_placa(:,:,1) .*Mask;
I_placa_masked(:,:,2) = I_placa(:,:,2) .*Mask;
I_placa_masked(:,:,3) = I_placa(:,:,3) .*Mask;

imshow(I_placa_masked)


%% Parte 3: Modificando a imagem

% Modificando o brilho
I_brilho = I_hsv;
I_brilho(:,:,3) = I_hsv(:,:,3)*2;
I_brilho = hsv2rgb(I_brilho);
figure, imshow(I_brilho)

% Modificando o contraste
I_contraste = I_hsv;
I_contraste(:,:,2) = I_hsv(:,:,2)*0.5;
I_contraste = hsv2rgb(I_contraste);
figure, imshow(I_contraste)
%% Exercicio 3: Crie seu filtro!

I_filtro = I_hsv;

cor = 1.05;
contraste = 1.4;
brilho = 0.8;

I_filtro(:,:,1) = I_hsv(:,:,1)*cor;
I_filtro(:,:,2) = I_hsv(:,:,2)*contraste;
I_filtro(:,:,3) = I_hsv(:,:,3)*brilho;

I_filtro = hsv2rgb(I_filtro);
figure, imshow(I_filtro)

%% Parte 4: Grayscale

I_gray = rgb2gray(I);
figure,imshow(I_gray);

%% Parte 4.5: Features
% Features podem ser usadas tanto para classificar uma imagem,
% dar match entre um objeto e uma outra imagem

% Leia as imagens
I1 = rgb2gray(imread('viprectification_deskLeft.png'));
I2 = rgb2gray(imread('viprectification_deskRight.png'));

% Detecte as features em cada imagem
points1 = detectHarrisFeatures(I1);
points2 = detectHarrisFeatures(I2);

% Visualize as features na imagem
figure,imshow(I1),hold on,plot(points1)

% Extraia os valores de cada feature
[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

% Veja quais dão matching
indexPairs = matchFeatures(features1,features2);

% Consiga os pontos e plote as features
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2, 'montage');

%% Exercício 4
% Detecte features e as use para localizar o objeto na imagem
% Principal

boxImage = imread('stapleRemover.jpg');
sceneImage = imread('clutteredDesk.jpg');

boxPoints = detectSURFFeatures(boxImage);
scenePoints = detectSURFFeatures(sceneImage);

[boxFeatures, boxPoints] = extractFeatures(boxImage, boxPoints);
[sceneFeatures, scenePoints] = extractFeatures(sceneImage, scenePoints);

boxPairs = matchFeatures(boxFeatures, sceneFeatures);

matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
matchedScenePoints = scenePoints(boxPairs(:, 2), :);

figure, showMatchedFeatures(boxImage, sceneImage, matchedBoxPoints, ...
    matchedScenePoints, 'montage');

%% Parte 5: Correlação
% Localizando o template em uma imagem
I1   = rgb2gray(imread('onion.png'));
I2 = rgb2gray(imread('peppers.png'));

c = normxcorr2(I1,I2); % Calcular a correlação
figure, surf(c), shading flat % Plotar o valor de correlação

[ypeak, xpeak] = find(c==max(c(:))); % Ache o valor máximo

% Considere o offset causado pela correlação
yoffSet = ypeak-size(I1,1);
xoffSet = xpeak-size(I1,2);

% Plot a posição encontrada
hFig = figure;
hAx  = axes;
imshow(I2,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(I1,2), size(I1,1)]);

%% Exercício 5
% Ache o Wally através de correlação
I1   = rgb2gray(imread('Wally_head.jpg'));
I_original = imread('Find_wally.jpg');
I2 = rgb2gray(I_original);
c = normxcorr2(I1,I2); % Calcular a correlação
figure, surf(c), shading flat % Plotar o valor de correlação

[ypeak, xpeak] = find(c==max(c(:))); % Ache o valor máximo

% Considere o offset causado pela correlação
yoffSet = ypeak-size(I1,1);
xoffSet = xpeak-size(I1,2);

% Plot a posição encontrada
hFig = figure;
hAx  = axes;
imshow(I_original,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(I1,2), size(I1,1)]);


%% Parte 6: Binarização
% Para binarizar uma imagem usamos a função im2bw.
% Ela possui dois inputs, sendo o primeiro a imagem 
% e o segundo o treshold utilizado

I_book = imread('bookpage.jpg');
I_binary = im2bw(I_book,0.035);
figure,imshow(I_binary)


%% Parte 6: Contador de carros na rua
%edit videotrafficgmm

% Plano de fundo 
foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, ...
    'NumTrainingFrames', 50);

videoReader = vision.VideoFileReader('visiontraffic.avi');
for i = 1:150
    frame = step(videoReader); % read the next video frame
    foreground = step(foregroundDetector, frame);
end

% Filtrar com funções morfológicas
se = strel('square', 3);
filteredForeground = imopen(foreground, se);
%figure; imshow(filteredForeground); title('Clean Foreground');


% Identificar componentes
blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);
bbox = step(blobAnalysis, filteredForeground);

% Green box
result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');


% Número de boxes = Número de carros
numCars = size(bbox, 1);
result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
    'FontSize', 14);
%figure; imshow(result); title('Detected Cars');

% Display resto do video
videoPlayer = vision.VideoPlayer('Name', 'Detected Cars');
videoPlayer.Position(3:4) = [1000,1000];  % window size: [width, height]
se = strel('square', 3); % morphological filter for noise removal

while ~isDone(videoReader)
    
    frame = step(videoReader); % read the next video frame
    
    % Detect the foreground in the current video frame
    foreground = step(foregroundDetector, frame);
    
    % Use morphological opening to remove noise in the foreground
    filteredForeground = imopen(foreground, se);
    
    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
    bbox = step(blobAnalysis, filteredForeground);

    % Draw bounding boxes around the detected cars
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

    % Display the number of cars found in the video frame
    numCars = size(bbox, 1);
    result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
        'FontSize', 14);

    step(videoPlayer, result);  % display the results
end

release(videoReader); % close the video file







