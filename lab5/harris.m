%% สนำร
clear;clc;

img = zeros(480,480,'uint8');

for i = 1:6
    for j = 1:2:5
        if mod(i,2) == 0
            t = j + 1; %2 4 6
        else
            t = j; %1 3 5
        end
        img((i-1)*80+1:i*80,(t-1)*80+1:t*80) = 255;
    end
end

res0 = harris_corner_detection(img,10000000);
figure;
subplot(1,2,1);
imshow(res0);


tform = affine2d([1 0 0;0.5 1 0;0 0 1]);
J = imwarp(img,tform);
res1 = harris_corner_detection(J, 100000000);
subplot(1,2,2);
imshow(res1);
