clc;
clear;
%% 加载图片和设置辅助图
apple = im2double(imread('apple.jpg'));
orange = im2double(imread('orange.jpg'));
if size(apple) == size(orange)
    [height, width, num] = size(apple);
end


%% 辅助矩阵
mix = zeros(height,width);
mix(:,257:512) = 1;
% subplot(1,1,1)
% imshow(mix)


%% 获取苹果图和句子图的拉普拉斯金字塔
depth = 6;
apple_laplace = laplace_pyramid(apple,depth);
orange_laplace = laplace_pyramid(orange,depth);


%% 获取辅助图的高斯金字塔
mix_gauss = gauss_pyramid(mix,depth);


%% 将苹果和橘子得拉普拉斯图再辅助图高斯金字塔上合并
LS = combine_laplace(orange_laplace, apple_laplace, mix_gauss);


%% 获取在金字塔最底部的大小跟原图一样的合并图
Ib = collapse(LS);
imshow(Ib);