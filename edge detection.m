clc;
clear;
close all;

%% Read Image
I = imread('photo.jpg');

%% Grayscale Conversion
if size(I,3)==3
    grayImg = rgb2gray(I);
else
    grayImg = I;
end

%% Add Noise
noisyImg = imnoise(grayImg,'salt & pepper',0.02);

%% Remove Noise
filteredImg = medfilt2(noisyImg,[3 3]);

%% Automatic Thresholding (Otsu)
level = graythresh(filteredImg);
BW = imbinarize(filteredImg,level);

%% Manual Thresholding
threshold = 0.3;
BW_manual = imbinarize(filteredImg,threshold);

%% Edge Detection
edgeSobel = edge(filteredImg,'sobel');
edgeCanny = edge(filteredImg,'canny');

%% Object Detection
CC = bwconncomp(BW);
numObjects = CC.NumObjects;

%% Display Results
figure('Name','AI-Powered Image Processing Learning System');

subplot(3,3,1);
imshow(I);
title('Original Image');

subplot(3,3,2);
imshow(grayImg);
title('Grayscale');

subplot(3,3,3);
imshow(noisyImg);
title('Noisy Image');

subplot(3,3,4);
imshow(filteredImg);
title('Median Filtered');

subplot(3,3,5);
imshow(BW);
title('Otsu Thresholding');

subplot(3,3,6);
imshow(BW_manual);
title('Manual Thresholding');

subplot(3,3,7);
imshow(edgeSobel);
title('Sobel Edge Detection');

subplot(3,3,8);
imshow(edgeCanny);
title('Canny Edge Detection');

subplot(3,3,9);
imhist(grayImg);
title('Histogram');

sgtitle('AI-Powered Image Processing Learning System');

%% Analysis Results
fprintf('----- Analysis Results -----\n');
fprintf('Image Size: %d x %d\n',size(I,1),size(I,2));
fprintf('Objects Detected: %d\n',numObjects);
fprintf('Otsu Threshold Value: %.4f\n',level);
