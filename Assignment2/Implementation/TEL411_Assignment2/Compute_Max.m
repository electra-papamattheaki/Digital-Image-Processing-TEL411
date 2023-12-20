function [output_im] = Compute_Max(input_im,K)

% get the size of the kernel
[n1, n2] = size(K);

% get the size of the rows and the columns of the image
[rows, cols]  = size(input_im);

% Padding the input image with zeros
padded_im = padarray(input_im,[floor(n1/2), floor(n2/2)], 0, 'both');

s1 = floor(n1/2);
s2 = floor(n2/2); 

% loop for min filter
for i = 1:rows
    for j = 1:cols
        % Patch P , get the neighborhood
        P = padded_im(i:i+2*s1,j:j+2*s2); 
        % find the median value of this patch
        max_value = max(P(:));
        % construct the new image
        new_im(i,j) = uint8(ceil(max_value));
    end
end

output_im = new_im;