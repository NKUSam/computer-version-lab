%% 导入图像和显示原图像
clear;clc;
img = imread('baby.jpg');
[height,width] = size(img);
figure;
subplot(221);
imshow(img)
title('原图');

%% 显示图片的均衡化前的直方图
hist_b = getpdf(img);
subplot(222);
bar(hist_b);
title('均衡化前的直方图');

%% 设定榨汁并且剪裁
% time = 5;
% cut_num = round((height*width)/256)*time;
% hist_b = clipping(hist_b,cut_num);

%% 规一化和计算累积分布
hist_p = hist_b/(height*width);%归一化
hist_c = getcdf(hist_p,hist_p);%累积函数


%% 计算均衡化后的直方图
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * hist_c(i));
end
for i = 1:height
    for j = 1:width
        img(i,j)=Map(img(i,j) + 1);
    end
end

%% 显示均衡化后的图像
subplot(223);
imshow(img);
title('均衡化后的图片');

%% 显示均衡化后的直方图
hist_a = getpdf(img);
subplot(224);
bar(hist_a);
title('均衡化后的图片');
