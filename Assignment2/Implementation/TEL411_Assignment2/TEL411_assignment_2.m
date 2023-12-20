clear all;
close all;
clc;

filters_options = {'1. Mean', '2. Median', '3. Max', '4. Min' }
 prompt = 'Which filter you would like to use from the above? (please enter a number) ';
 filter = input(prompt);
 
 if filter == 1
 
% ---------- Mean Filter ---------- %

% Kernel 3x3
kernel1 = ones(3);
% Kernel 5x5
kernel2 = ones(5);
% Kernel 9x9
kernel3 = ones(9);

% reading the 1st image
input_im1 = imread('Mean_Image1.jpeg');

% reading the 2nd image
input_im2 = imread('Mean_Image2.jpeg');

input_im1 = rgb2gray(input_im1); 

output_im1a = Compute_Mean(input_im1,kernel1); 
output_im1b = Compute_Mean(input_im2,kernel1); 

output_im2a = Compute_Mean(input_im1,kernel2); 
output_im2b = Compute_Mean(input_im2,kernel2);

output_im3a = Compute_Mean(input_im1,kernel3); 
output_im3b = Compute_Mean(input_im2,kernel3);

figure(1)
subplot(2,3,2)
imshow(input_im1)
title('Original Image')

subplot(2,3,4)
imshow(output_im1a)
title('Mean Filter impact, Kernel: 3x3');

subplot(2,3,5)
imshow(output_im2a)
title('Mean Filter impact, Kernel: 5x5');

subplot(2,3,6)
imshow(output_im3a)
title('Mean Filter impact, Kernel: 9x9');
set(gcf,'color', 'w');

figure(2)
subplot(2,3,2)
imshow(input_im2)
title('Original Image')

subplot(2,3,4)
imshow(output_im1b)
title('Mean Filter impact, Kernel: 3x3');

subplot(2,3,5)
imshow(output_im2b)
title('Mean Filter impact, Kernel: 5x5');

subplot(2,3,6)
imshow(output_im3b)
title('Mean Filter impact, Kernel: 9x9');
set(gcf,'color', 'w');

 elseif filter == 2

% ---------- Median Filter ---------- %
% Kernel 5x7
kernel1 = ones(5,7);
% Kernel 3x3
kernel2 = ones(3);
% Kernel 9x11
kernel3 = ones(9,11);

% reading the 1st image
input_im1 = imread('Median_Image1.png');

% reading the 2nd image
input_im2 = imread('Median_Image2.png');

output_im1a_med = Compute_Median(input_im1,kernel1); 
output_im1b_med = Compute_Median(input_im2,kernel1); 

output_im2a_med = Compute_Median(input_im1,kernel2); 
output_im2b_med = Compute_Median(input_im2,kernel2);

output_im3a_med = Compute_Median(input_im1,kernel3); 
output_im3b_med = Compute_Median(input_im2,kernel3);

figure(3)
subplot(2,3,2)
imshow(input_im1)
title('Original Image')

subplot(2,3,4)
imshow(output_im1a_med)
title('Median Filter impact, Kernel: 5x7');

subplot(2,3,5)
imshow(output_im2a_med)
title('Median Filter impact, Kernel: 3x3');

subplot(2,3,6)
imshow(output_im3a_med)
title('Median Filter impact, Kernel: 9x11');
set(gcf,'color', 'w');

figure(4)
subplot(2,3,2)
imshow(input_im2)
title('Original Image')

subplot(2,3,4)
imshow(output_im1b_med)
title('Median Filter impact, Kernel: 5x7');

subplot(2,3,5)
imshow(output_im2b_med)
title('Median Filter impact, Kernel: 3x3');

subplot(2,3,6)
imshow(output_im3b_med)
title('Median Filter impact, Kernel: 9x11');
set(gcf,'color', 'w');

 elseif filter == 3

% ---------- Max Filter ---------- %
% Kernel 3x5
kernel1 = ones(3,5);
% Kernel 5x5
kernel2 = ones(5);
% Kernel 7x7
kernel3 = ones(7);

% reading the 1st image
input_im1 = imread('Min Max_Image1.jpeg');

% reading the 2nd image
input_im2 = imread('Min Max_Image2.jpeg');

input_im1 = rgb2gray(input_im1); 
input_im2 = rgb2gray(input_im2);

output_im1a_max = Compute_Max(input_im1,kernel1); 
output_im1b_max = Compute_Max(input_im2,kernel1); 

output_im2a_max = Compute_Max(input_im1,kernel2); 
output_im2b_max = Compute_Max(input_im2,kernel2);

output_im3a_max = Compute_Max(input_im1,kernel3); 
output_im3b_max = Compute_Max(input_im2,kernel3);

figure(5)
subplot(2,3,2)
imshow(input_im1)
title('Original Image')

subplot(2,3,4)
imshow(output_im1a_max)
title('Max Filter impact, Kernel: 3x5');

subplot(2,3,5)
imshow(output_im2a_max)
title('Max Filter impact, Kernel: 5x5');

subplot(2,3,6)
imshow(output_im3a_max)
title('Max Filter impact, Kernel: 7x7');
set(gcf,'color', 'w');

figure(6)
subplot(2,3,2)
imshow(input_im2)
title('Original Image')

subplot(2,3,4)
imshow(output_im1b_max)
title('Max Filter impact, Kernel: 3x5');

subplot(2,3,5)
imshow(output_im2b_max)
title('Max Filter impact, Kernel: 5x5');

subplot(2,3,6)
imshow(output_im3b_max)
title('Max Filter impact, Kernel: 7x7');
set(gcf,'color', 'w');
 
 elseif filter == 4

% ---------- Min Filter ---------- %
% Kernel 3x5
kernel1 = ones(3,5);
% Kernel 5x5
kernel2 = ones(5);
% Kernel 7x7
kernel3 = ones(7);

% reading the 1st image
input_im1 = imread('Min Max_Image1.jpeg');

% reading the 2nd image
input_im2 = imread('Min Max_Image2.jpeg');

input_im1 = rgb2gray(input_im1); 
input_im2 = rgb2gray(input_im2);
output_im1a_min = Compute_Min(input_im1,kernel1); 
output_im1b_min = Compute_Min(input_im2,kernel1); 

output_im2a_min = Compute_Min(input_im1,kernel2); 
output_im2b_min = Compute_Min(input_im2,kernel2);

output_im3a_min = Compute_Min(input_im1,kernel3); 
output_im3b_min = Compute_Min(input_im2,kernel3);

figure(7)
subplot(2,3,2)
imshow(input_im1)
title('Original Image')

subplot(2,3,4)
imshow(output_im1a_min)
title('Min Filter impact, Kernel: 3x5');

subplot(2,3,5)
imshow(output_im2a_min)
title('Min Filter impact, Kernel: 5x5');

subplot(2,3,6)
imshow(output_im3a_min)
title('Min Filter impact, Kernel: 7x7');
set(gcf,'color', 'w');

figure(8)
subplot(2,3,2)
imshow(input_im2)
title('Original Image')

subplot(2,3,4)
imshow(output_im1b_min)
title('Min Filter impact, Kernel: 3x5');

subplot(2,3,5)
imshow(output_im2b_min)
title('Min Filter impact, Kernel: 5x5');

subplot(2,3,6)
imshow(output_im3b_min)
title('Min Filter impact, Kernel: 7x7');
set(gcf,'color', 'w');

 else 
     
     fprintf ('Please Enter one of the choices: Mean, Median, Max, Min');
     
 end
