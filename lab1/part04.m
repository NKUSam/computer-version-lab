%%Q3.1
% I = double(imread('gigi.jpg'));
% I = I - 20;
% imshow(I);


%ANS
I = im2double(imread('gigi.jpg')-20);
imshow(I);
