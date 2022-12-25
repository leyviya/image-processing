%% Median Filter
%READ IMAGE
sad1=imread('noisyImage.PNG');
figure,imshow(sad1)
title('IMAGE WITH NOISE');

%PAD THE MATRIX WITH ZEROS ON ALL SIDES
median_filt=zeros(size(sad1)+2);
re_sad1=zeros(size(sad1));

%COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
        for x=1:size(sad1,1)
            for y=1:size(sad1,2)
                median_filt(x+1,y+1)=sad1(x,y);
            end
        end
        
%LET THE WINDOW BE AN ARRAY
%STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY
%SORT AND FIND THE MIDDLE ELEMENT       
for i= 1:size(median_filt,1)-2
    for j=1:size(median_filt,2)-2
        window=zeros(9,1);
        inc=1;
        for x=1:3
            for y=1:3
                window(inc)=median_filt(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
       
        med=sort(window);
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
        re_sad1(i,j)=med(5);
       
    end
end
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
re_sad1=uint8(re_sad1);
title('IMAGE AFTER MEDIAN FILTERING');
figure,imshow(re_sad1)