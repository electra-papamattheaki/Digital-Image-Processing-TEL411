function [output_im] = Compute_Mean(input_im,K)

% get the size of the kernel
[n1, n2] = size(K);

% get the size of the rows and the columns of the image
[rows, cols]  = size(input_im);

% Padding the input image with zeros
padded_im = padarray(input_im,[floor(n1/2), floor(n2/2)], 0);

% Create the new image and set it as the padded image to get the size
% new_im = padded_im; 

s1 = floor(n1/2);
s2 = floor(n2/2);

% loop for mean filter
for i = 1:rows
    for j = 1:cols
        % Patch P , get the neighborhood
        P = padded_im(i:i+2*s1,j:j+2*s2); 
        % find the mean value of this patch
        mean_value = (sum(P(:)))/(n1*n2);
        % construct the new image
        new_im(i,j) = uint8(ceil(mean_value)); 
    end
end
        
output_im = new_im;










