a = imread('Im_5.PNG');
ad=im2double(a);
x=ad;y=ad;
[r,c]=size(ad);
factor=6;
for i =1:r
    for j= 1:c
        x(i,j)=factor *log(1+ ad(i,j));
        y(i,j)=factor *ad(i,j) ^20;
    end
end    
subplot(1,2,1);imshow(ad);title('Before');
subplot(1,2,2);imshow(x);title('After');
figure,imshow(y);