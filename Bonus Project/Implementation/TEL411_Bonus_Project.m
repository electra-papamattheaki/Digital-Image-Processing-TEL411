%%% - - - TEL411 Bonus Project - - - %%%

clear all;
close all;
clc;

% Part A.

% Input Signal
A = 255;
x = linspace(-A,A); 
sgn = sign(x);

% Creating all levels
for R=0:8
    L = 2.*R;
    Delta = 2.*A./L;
    
    Q = uni_scalar(Delta,sgn,x);
    
    figure();
    plot (x,Q);
    ylim([-255 255]);
    xlim([-255 255]);
    title(sprintf('USQ Level %d', R));
    set(gcf,'color', 'w');

end

Dvalues = [8]; 
% Quantization for every possible value 
for R=1:8 
in_im = imread('cameraman.tif');
% Obtain R thresholds from MULTITHRESH to split the image into 8 levels
thresh = multithresh(in_im,R);
% Reduce the number of levels using the maximum value in each interval to
% replace the values in image
valuesMax = [thresh max(in_im(:))];
[quant8_I, index] = imquantize(in_im, thresh, valuesMax);
% Display the 8-level image
figure()
imshow(quant8_I,[]);
title(sprintf('Quantized Image with R = %d', R));
set(gcf,'color', 'w');

% Measure the distortion
D = mse(quant8_I,in_im);
fprintf('MSE when R = %d is: \n', R);
disp(D);
Dvalues(R) = D;
end

R = [1, 2, 3, 4, 5, 6, 7, 8];
figure()
plot(R,Dvalues)
title('Rate-Distortion Curve D(R)');
set(gcf,'color', 'w');


% Part B. 




