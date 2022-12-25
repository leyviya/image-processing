% Median Filtering - Image Processing
%READ IMAGE
inpict = imread('noisyImage.PNG');
%imshow(inpict)
%title('IMAGE WITH NOISE');

filtersize = [5 5]; 

% PAD THE MATRIX WITH ZEROS ON ALL SIDES
padsize = floor(filtersize/2);
paddedimage = padarray(inpict,padsize,0,'both');

s0 = size(inpict);
outpict = zeros(s0,class(inpict));
os = filtersize-1; 

for m = 1:s0(1)
    for n = 1:s0(2)
        %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
        sample = paddedimage(m:(m+os(1)),n:(n+os(2)));
        outpict(m,n) = median(sample(:)); % what's wrong with median()?
    end
end

% test the output against existing tools
referenceimage = medfilt2(inpict,filtersize);
immse(outpict,referenceimage) % show that this filter behaves the same as medfilt2()

title('IMAGE AFTER MEDIAN FILTERING');
imshow(outpict)