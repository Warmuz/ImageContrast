photo=imread('test4.jpg');
grey=rgb2gray(photo);
grey2=rgb2gray(photo);
grey3=rgb2gray(photo);
grey4=rgb2gray(photo);

y=1;
b=0.2;
a=0.5;

figure;
imhist(grey);
title('histogram of orginal image');

%task2 Ponit processing
for i = 1:size(grey,1)
    for j = 1:size(grey,2)
         grey(i,j) = a*grey(i,j)^y+b;
    end
end

figure; 
imhist(grey);
title('histogram of point processing');
figure;
imshow(grey);
title('point processing image');

minimum = min(grey,[],'all');
maximum = max(grey,[],'all');

%task3 histogram stretching method
for i = 1:size(grey2,1)
    for j = 1:size(grey2,2)
         grey2(i,j) = 255*double(grey2(i,j)-minimum)/(maximum-minimum);
    end
end

figure;
imshow(grey2);
title('Shrinking image');

figure;
imhist(grey2);
title('Shrinking histogram');

%task 7 histeq

histeq_method = histeq(grey3);
figure
imshow(histeq_method);
figure
imhist(histeq_method);



%task 9

n=size(grey,1)/2
A = grey2(1:n,:,:);
B = histeq_method(n+1:end,:,:)
newImg = cat(1,A,B);
figure
imshow(newImg);
figure
imhist(newImg);

%task 10
sum = 0;
for i = 1:size(grey4,1)
    for j = 1:size(grey4,2)
        sum = sum + double(grey(i,j));
    end
end
l = sum*(1/(size(grey4,1)*size(grey4,2)));

contrast1 = 1/255*(maximum-minimum);
contrast2 = (maximum-minimum)*l;
contrast3 = (maximum-minimum)/(maximum-minimum);

sum2 = 0;

for i = 1:size(grey4,1)
    for j = 1:size(grey4,2)
       sum2 = sum2 + double(grey4(i,j)-l)^2;
    end
end

contrast4 = (4/(255^2*(size(grey4,1)*size(grey4,2))))*sum2;
subplot(2,1,1);
imshow(contrast4*grey4);
subplot(2,1,2);
imhist(contrast4*grey4);

