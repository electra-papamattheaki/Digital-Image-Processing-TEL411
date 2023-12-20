function [convImage] = convolution(I,K)

I = double(I); 

 % Flip Kernel for use on anti-symmetric filters
 % K = 
 
 % Kernel size
 [m,n] = size(K);
 
 % Temp Image filled with Zeros on the original size
 conv_temp = zeros(size(I)-2*floor([m n]/2)); 
 % New Image Size , same as the original one
 [t_rows, t_cols] = size(conv_temp);
 
 for i=1:t_rows
     for j=1:t_cols
        conv_temp(i,j) = sum(sum(K.*I(i:i+m-1,j:j+n-1)));   
     end
 end

convImage = uint8(conv_temp);




