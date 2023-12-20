%%%% - - - - TEL411 - Lab 4 - - - - %%%%

close all;
clear all;
clc;

% reading the 1st image
input_im1 = imread('axones1.png');

% reading the 2nd image
input_im2 = imread('axones2.png');

input_im1 = rgb2gray(input_im1);
input_im2 = rgb2gray(input_im2);

% - - 1st Image - - %

figure(1)
imshow(input_im1)
title('Axones 1')
set(gcf,'color', 'w');

% - - Image Denoising - -  %

se = strel('square', 3);
im1 = imerode(input_im1,se);

se = strel('square', 5);
im1 = imerode(input_im1,se);

se = strel('disk', 2);
im1 = imdilate(im1,se);

se = strel('disk', 2);
im1 = imdilate(im1,se);

se = strel('diamond', 2);
im1 = imerode(im1,se);

figure(2)
imshow(im1);
title('Image after Denoising')
set(gcf,'color', 'w');

% - - Enhancement of linear structures - - %%

se = strel(ones(3,3));
enhanced_im1 = imdilate(im1, se) - imerode(im1, se);

figure(3)
imshow(enhanced_im1);
title('Image after Enhancement')
set(gcf,'color', 'w');

enhanced_im1 = imfill(enhanced_im1, 'holes'); 

figure(4)
imshow(enhanced_im1);
title('Image after Enhancement and hole filling')
set(gcf,'color', 'w');

% - - Image Binarization - - %%

level = graythresh(enhanced_im1);
 
bin_im1 = imbinarize(enhanced_im1, level);

figure(5)
imshow(bin_im1);
title('Image after Binarization')
set(gcf,'color', 'w');

% - - Image Binarization and hole filling- - %%

bin_im1 = imfill(bin_im1, 'holes'); 

bw1 = bwmorph(bin_im1,'skel', inf);

% - - Image Skeletization - - %%
figure(6)
imshow(bw1)
title('Image after Skeletisation')
set(gcf,'color', 'w');

% - - Connecting the skeleton - - %%

bw1 = imfill(bw1, 'holes');

figure(7)
imshow(bw1)
title('Image after connecting the Skeleton')
set(gcf,'color', 'w');

 
 %% 
 % reading the 2nd image
input_im2 = imread('axones2.png');

input_im2 = rgb2gray(input_im2);

 figure(8)
 imshow(input_im2)
 title('Axones 2')
 set(gcf,'color', 'w');
 
 % - - Image Denoising - -  %
 
se = strel('square', 2);
im2 = imerode(input_im2,se);

se = strel('square', 5);
im2 = imerode(input_im2,se);

se = strel('disk', 2);
im2 = imdilate(im2,se);

se = strel('disk', 2);
im2 = imdilate(im2,se);

se = strel('square', 2);
im2 = imerode(im2,se);

figure(9)
imshow(im2)
title('Image after Denoising')
set(gcf,'color', 'w');

% - - Image Enhancement - -  %

se = strel(ones(9,9));
enhanced_im2 = imdilate(im2, se) - imerode(im2, se);

figure(10)
imshow(enhanced_im2);
title('Image after Enhancement')
set(gcf,'color', 'w');
 
enhanced_im2 = imfill(enhanced_im2, 'holes');

figure(11)
imshow(enhanced_im2);
title('Image after Enhancement and hole filling')
set(gcf,'color', 'w');

% - - Image Binarization - -  %
 
level_2 = graythresh(enhanced_im2);
 
bin_im2 = imbinarize(enhanced_im2, level_2);

figure(12)
imshow(bin_im2);
title('Image after Binarization')
set(gcf,'color', 'w');

% - - Image Skeletization - -  %

bw2 = bwmorph(bin_im2,'skel', inf);

figure(13)
imshow(bw2)
title('Image after Skeletization')
set(gcf,'color', 'w');

bw2 = imfill(bw2, 'holes');
figure(14)
imshow(bw2)
title('Image after connecting the Skeleton')
set(gcf,'color', 'w');
 
 
 
 
 