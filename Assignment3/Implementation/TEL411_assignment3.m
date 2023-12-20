clear all;
close all;
clc;

% Exercise 1.

sigma  = 20;
kernel_size = [15, 15];

gaussian_filter = fspecial('gaussian', kernel_size, sigma);
[m, n] = size(gaussian_filter); 

% reading the image
input_im = imread('lena_gray_512.tif');
[rows, cols] = size(input_im);

% Zero padding around the Image
padded_im = padarray(input_im,[floor(m/2), floor(n/2)], 0, 'both');

tic
convImage1 = convolution(padded_im, gaussian_filter);
toc

figure()
subplot(1,2,1)
imshow(input_im)
title('Original Image')

subplot(1,2,2)
imshow(convImage1)
title('After 2D Convolution, using my function "convolution"')

% Exercise 2. 

tic
convImage2 = uint8(conv2(double(padded_im), gaussian_filter, 'same'));
toc
convImage2 = imresize(convImage2, [rows, cols]);

figure()
subplot(1,2,1)
imshow(input_im)
title('Original Image')

subplot(1,2,2)
imshow(convImage2)
title('After 2D Convolution, using conv2()')

% Exercise 3. 

tic
convImage3 = imfilter(padded_im, gaussian_filter, 'replicate', 'conv');
toc
convImage3 = imresize(convImage3, [rows, cols]);

mse1 = immse(input_im,convImage1)
mse2 = immse(input_im,convImage2)
mse3 = immse(input_im,convImage3)

psnr1 = psnr(input_im,convImage1)
psnr2 = psnr(input_im,convImage2)
psnr3 = psnr(input_im,convImage3)

figure()
subplot(1,2,1)
imshow(input_im)
title('Original Image')

subplot(1,2,2)
imshow(convImage3)
title('After 2D Convolution, using imfilter()')

% Exercise 4.                                       

X = fftshift(fft2(double(input_im)));
Y = fftshift(fft2(double(gaussian_filter), rows, cols)); 
F = (X .* Y); 

T = ifft2(F);

figure()
subplot(1,2,1)
imshow(uint8(abs(F))); 
title('Frequency Domain')

subplot(1,2,2)
imshow(uint8(abs(T)))
title('Result after Inverse Fourier Transform')

mse4  = immse(input_im,uint8(T))
psnr4 = psnr(input_im,uint8(T))




