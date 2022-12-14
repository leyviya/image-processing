clear all; 
clc;
% Input image (r) enhanced by log transform simply by
% s=c*log(1+r) 

p=imread('Im_3.PNG');
c=input('Enter the constant value, c ');
[M,N]=size(p);

for x = 1:M
    for y = 1:N
        m=double(p(x,y));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
        z(x,y)=c.*log10(1+m);
    end
end
        
 

% The results are produced by settin c as  0.1 , 0.5, 1 and 1.5, respectively

subplot(1,2,1), imshow(p); % Display image
subplot(1,2,2), imshow(z); % Display image
