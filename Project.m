clc;
clear;
close all;

%% Initialize Webcam
cam =imread("photo.jpg");

figure('Name','AI-Powered Real-Time Image Processing Learning System');

while true

    %% Capture Frame
    img = cam;

    %% Grayscale Conversion
    grayImg = rgb2gray(img);

    %% Add Artificial Noise
    noisyImg = imnoise(grayImg,'salt & pepper',0.02);

    %% Median Filtering
    filteredImg = medfilt2(noisyImg,[3 3]);

  
    %% Display Processing Stages

    subplot(2,3,1);
    imshow(img);
    title('Original Image');

    subplot(2,3,2);
    imshow(grayImg);
    title('Grayscale');

    subplot(2,3,3);
    imshow(noisyImg);
    title('Noisy Image');

    subplot(2,3,4);
    imshow(filteredImg);
    title('Filtered Image');

    
    subplot(2,3,5);
    imhist(grayImg);
    title('Histogram');

    drawnow;
    sgtitle('AI-Powered Real-Time Image Processing Learning System');

end


