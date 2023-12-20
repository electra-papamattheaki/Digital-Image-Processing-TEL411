%%%%%    TEL 411   %%%%%
%%%%% Assignment 1 %%%%%

clear all;
close all;
clc;

% reading the image
image = imread('retriever.tiff');

% get the size of the rows and the columns of the image
% N = rows & M = columns
[Nrows, Mcols]  = size(image); 

figure(1)
imshow(image)
title('Original Image: Retriever')
set(gcf,'color', 'w');

% ----- Row samping scale 1/2 & Column sampling scale 1/4 ----- %

% Downsampling with the Anti-aliasing filter
downsampled1 = imresize(image, [Nrows*1/2 Mcols*1/4], 'Antialiasing', true);

% Downsampling without the Anti-aliasing filter 
downsampled2 = imresize(image, [Nrows*1/2 Mcols*1/4], 'Antialiasing', false);

figure(2)
imshow(downsampled1)
title('With Anti-aliasing filter')
set(gcf,'color', 'w');

figure(3)
imshow(downsampled2)
title('Without Anti-aliasing filter')
set(gcf,'color', 'w');

% ----- Upsampling ----- %

% Upsampling the 1st downsampled image (Anti-aliasing filter)
upsampled1_n = imresize(downsampled1, [Nrows Mcols], 'nearest'); 
upsampled1_l = imresize(downsampled1, [Nrows Mcols], 'bilinear');
upsampled1_c = imresize(downsampled1, [Nrows Mcols], 'bicubic');

% Calculating MSE for upsampled1
MSE_1n = immse(upsampled1_n,image);
MSE_1l = immse(upsampled1_l,image);
MSE_1c = immse(upsampled1_c,image);

% Calculationg PSNR for upsampled1
PSNR_1n = psnr(upsampled1_n,image);
PSNR_1l = psnr(upsampled1_l,image);
PSNR_1c = psnr(upsampled1_c,image);

% Upsampling the 2nd downsampled image (Without Anti-aliasing filter)
upsampled2_n = imresize(downsampled2, [Nrows Mcols], 'nearest'); 
upsampled2_l = imresize(downsampled2, [Nrows Mcols], 'bilinear');
upsampled2_c = imresize(downsampled2, [Nrows Mcols], 'bicubic');

% Calculating MSE for upsampled2
MSE_2n = immse(upsampled2_n,image);
MSE_2l = immse(upsampled2_l,image);
MSE_2c = immse(upsampled2_c,image);

% Calculation PSNR for upsampled2

PSNR_2n = psnr(upsampled2_n,image);
PSNR_2l = psnr(upsampled2_l,image);
PSNR_2c = psnr(upsampled2_c,image);

% Results 
% With anti-aliasing
figure(4)
subplot(2,3,2)
imshow(image);
title('Original')

subplot(2,3,4)
imshow(upsampled1_n);
title('Nearest-neighbor Interpolation')

subplot(2,3,5)
imshow(upsampled1_l);
title('Bilinear Interpolation')

subplot(2,3,6)
imshow(upsampled1_c);
title('Bicubic Interpolation')
set(gcf,'color', 'w');

% Without anti-aliasing
figure(5)
subplot(2,3,2)
imshow(image);
title('Original')

subplot(2,3,4)
imshow(upsampled2_n);
title('Nearest-neighbor Interpolation')

subplot(2,3,5)
imshow(upsampled2_l);
title('Bilinear Interpolation')

subplot(2,3,6)
imshow(upsampled2_c);
title('Bicubic Interpolation')
set(gcf,'color', 'w');

%---------------------------------------------------------------------%

% ----- Row samping scale 1/4 & Column sampling scale 1/2 ----- %

% Downsampling with the Anti-aliasing filter
downsampled3 = imresize(image, [Nrows*1/4 Mcols*1/2], 'Antialiasing', true);

% Downsampling without the Anti-aliasing filter 
downsampled4 = imresize(image, [Nrows*1/4 Mcols*1/2], 'Antialiasing', false);

figure(6)
imshow(downsampled3)
title('With Anti-alising filter')
set(gcf,'color', 'w');

figure(7)
imshow(downsampled4)
title('Without Anti-aliasing filter')
set(gcf,'color', 'w');

% ----- Upsampling ----- %

% Upsampling the 3rd downsampled image (Anti-aliasing filter)
upsampled3_n = imresize(downsampled3, [Nrows Mcols], 'nearest'); 
upsampled3_l = imresize(downsampled3, [Nrows Mcols], 'bilinear');
upsampled3_c = imresize(downsampled3, [Nrows Mcols], 'bicubic');

% Calculating MSE for upsampled3
MSE_3n = immse(upsampled3_n,image);
MSE_3l = immse(upsampled3_l,image);
MSE_3c = immse(upsampled3_c,image);

% Calculating PSNR for upsampled3
PSNR_3n = psnr(upsampled3_n,image);
PSNR_3l = psnr(upsampled3_l,image);
PSNR_3c = psnr(upsampled3_c,image);

% Upsampling the 4th downsampled image (Without Anti-aliasing filter)
upsampled4_n = imresize(downsampled4, [Nrows Mcols], 'nearest'); 
upsampled4_l = imresize(downsampled4, [Nrows Mcols], 'bilinear');
upsampled4_c = imresize(downsampled4, [Nrows Mcols], 'bicubic');

% Calculating MSE for upsampled4
MSE_4n = immse(upsampled4_n,image);
MSE_4l = immse(upsampled4_l,image);
MSE_4c = immse(upsampled4_c,image);

% Calculating PSNR for upsampled4
PSNR_4n = psnr(upsampled4_n,image);
PSNR_4l = psnr(upsampled4_l,image);
PSNR_4c = psnr(upsampled4_c,image);

% Results

% With Anti-Aliasing filter
figure(8)
subplot(2,3,2)
imshow(image);
title('Original')

subplot(2,3,4)
imshow(upsampled3_n);
title('Nearest-neighbor Interpolation')

subplot(2,3,5)
imshow(upsampled3_l);
title('Bilinear Interpolation')

subplot(2,3,6)
imshow(upsampled3_c);
title('Bicubic Interpolation')
set(gcf,'color', 'w');

% With Anti-Aliasing filter
figure(9)
subplot(2,3,2)
imshow(image);
title('Original')

subplot(2,3,4)
imshow(upsampled4_n);
title('Nearest-neighbor Interpolation')

subplot(2,3,5)
imshow(upsampled4_l);
title('Bilinear Interpolation')

subplot(2,3,6)
imshow(upsampled4_c);
title('Bicubic Interpolation')
set(gcf,'color', 'w');

%---------------------------------------------------------------------%

% ----- Row samping scale 1/8 & Column sampling scale 1/8 ----- %

% Downsampling with the Anti-aliasing filter
downsampled5 = imresize(image, [Nrows*1/8 Mcols*1/8], 'Antialiasing', true);

% Downsampling without the Anti-aliasing filter 
downsampled6 = imresize(image, [Nrows*1/8 Mcols*1/8], 'Antialiasing', false);

figure(10)
imshow(downsampled5)
title('With Anti-alising filter')
set(gcf,'color', 'w');

figure(11)
imshow(downsampled6)
title('Without Anti-aliasing filter')
set(gcf,'color', 'w');

% ----- Upsampling ----- %

% Upsampling the 5th downsampled image (Anti-aliasing filter)
upsampled5_n = imresize(downsampled5, [Nrows Mcols], 'nearest'); 
upsampled5_l = imresize(downsampled5, [Nrows Mcols], 'bilinear');
upsampled5_c = imresize(downsampled5, [Nrows Mcols], 'bicubic');

% Calculating MSE for upsampled5
MSE_5n = immse(upsampled5_n,image);
MSE_5l = immse(upsampled5_l,image);
MSE_5c = immse(upsampled5_c,image);

% Calculationg PSNR for upsampled5
PSNR_5n = psnr(upsampled5_n,image);
PSNR_5l = psnr(upsampled5_l,image);
PSNR_5c = psnr(upsampled5_c,image);

% Upsampling the 4th downsampled image (Without Anti-aliasing filter)
[Nrows_ds, Mcols_ds]  = size(downsampled6);
upsampled6_n = imresize(downsampled6, [Nrows Mcols], 'nearest'); 
upsampled6_l = imresize(downsampled6, [Nrows Mcols], 'bilinear');
upsampled6_c = imresize(downsampled6, [Nrows Mcols], 'bicubic');

% Calculating MSE for upsampled6
MSE_6n = immse(upsampled6_n,image);
MSE_6l = immse(upsampled6_l,image);
MSE_6c = immse(upsampled6_c,image);

% Calculating PSNR for upsampled6
PSNR_6n = psnr(upsampled6_n,image);
PSNR_6l = psnr(upsampled6_l,image);
PSNR_6c = psnr(upsampled6_c,image);

% Results
figure(12)
subplot(2,3,2)
imshow(image);
title('Original')

subplot(2,3,4)
imshow(upsampled5_n);
title('Nearest-neighbor Interpolation')
ylabel('With Anti-Aliasing filter')

subplot(2,3,5)
imshow(upsampled5_l);
title('Bilinear Interpolation')

subplot(2,3,6)
imshow(upsampled5_c);
title('Bicubic Interpolation')
set(gcf,'color', 'w');

figure(13)
subplot(2,3,2)
imshow(image);
title('Original')

subplot(2,3,4)
imshow(upsampled6_n);
title('Nearest-neighbor Interpolation')
ylabel('Without Anti-Aliasing filter')

subplot(2,3,5)
imshow(upsampled6_l);
title('Bilinear Interpolation')

subplot(2,3,6)
imshow(upsampled6_c);
title('Bicubic Interpolation')
set(gcf,'color', 'w');

% --- Trying Downsampling with interpolation methods --- %

downsampled_n = imresize(image, [Nrows*1/2 Mcols*1/4], 'nearest');
downsampled_l = imresize(image, [Nrows*1/2 Mcols*1/4], 'bilinear');
downsampled_c = imresize(image, [Nrows*1/2 Mcols*1/4], 'bicubic');

figure(13)
subplot(1,3,1)
imshow(downsampled_n)
title('Nearest-neighbor Interpolation')

subplot(1,3,2)
imshow(downsampled_l)
title('Bilinear Interpolation')

subplot(1,3,3)
imshow(downsampled_c)
title('Bicubic Interpolation')
set(gcf,'color', 'w');

downsampled_n = imresize(image, [Nrows*1/4 Mcols*1/2], 'nearest');
downsampled_l = imresize(image, [Nrows*1/4 Mcols*1/2], 'bilinear');
downsampled_c = imresize(image, [Nrows*1/4 Mcols*1/2], 'bicubic');

figure(14)
subplot(1,3,1)
imshow(downsampled_n)
title('Nearest-neighbor Interpolation')

subplot(1,3,2)
imshow(downsampled_l)
title('Bilinear Interpolation')

subplot(1,3,3)
imshow(downsampled_c)
title('Bicubic Interpolation')
set(gcf,'color', 'w');

downsampled_n = imresize(image, [Nrows*1/8 Mcols*1/8], 'nearest');
downsampled_l = imresize(image, [Nrows*1/8 Mcols*1/8], 'bilinear');
downsampled_c = imresize(image, [Nrows*1/8 Mcols*1/8], 'bicubic');

figure(15)
subplot(1,3,1)
imshow(downsampled_n)
title('Nearest-neighbor Interpolation')

subplot(1,3,2)
imshow(downsampled_l)
title('Bilinear Interpolation')

subplot(1,3,3)
imshow(downsampled_c)
title('Bicubic Interpolation')
set(gcf,'color', 'w');

% --- Trying upsampling with the use of Anti-aliasing filter --- %

upsampled1b = imresize(downsampled1, [Nrows Mcols], 'Antialiasing', true);
upsampled3b = imresize(downsampled3, [Nrows Mcols], 'Antialiasing', true);
upsampled5b = imresize(downsampled5, [Nrows Mcols], 'Antialiasing', true);

figure()
subplot(1,3,1)
imshow(upsampled1b);
title('downsampling parameters: row 1/2 column 1/4')

subplot(1,3,2)
imshow(upsampled3b);
title('downsampling parameters: row 1/4 column 1/2')


subplot(1,3,3)
imshow(upsampled5b);
title('downsampling parameters: row 1/8 column 1/8')
set(gcf,'color', 'w');




