clc; 
clear all;

c=1;
Gamma=input('Enter the Gamma values = ');       % Must be vector, Ex:[3 4 5]
x=imread('Im_4.PNG');  % Read in image
x1=double(x);      
y=c*(x1.^Gamma(1));                             % s=c*(r^ γ)
y1=c*(x1.^Gamma(2));
y2=c*(x1.^Gamma(3));

subplot(141),imshow(x), title('Aerial image')  % Display result images
subplot(142),imshow((y),[]), title('Corrected image(Gamma=3)')
subplot(143),imshow((y1),[]), title('Corrected image(Gamma=4)')
subplot(144),imshow((y2),[]), title('Corrected image(Gamma=5)')