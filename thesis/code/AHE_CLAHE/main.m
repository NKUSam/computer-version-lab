%% 导入图像并转化为灰度图
clear;clc;
RGBImage = imread('pic_1.jpg ');
GrayImage = rgb2gray(RGBImage);
[n, m] = size(GrayImage);

%% 将图像分块并计算它们的hist（要归一化）和cdf
w = 5; %分成几块
subm = floor(m/w);
subn = floor(n/w);
nowG = GrayImage;
now = 0;
his = zeros(256,w*w);
cdf = zeros(256,w*w);
for i=1:w
    nown = subn*(i-1);
    for j=1:w
        nowm = subm*(j-1);
        now = now + 1; %此刻的块
        his(:,now) = zeros(256,1);%块的直方图
        nowG = imcrop(GrayImage, [nowm,nown,subm,subn]);
        his(:,now) = getpdf(his(:,now), nowG);
        his(:,now) = clipping(his(:,now), nowG);
        cdf(:,now) = zeros(256,1);
        cdf(:,now) = getcdf(cdf(:,now), his(:,now));
        cdf(:,now) = cdf(:,now) / (subm*subn);
    end
end


%% 利用双曲线插值公式，得到图像的所有像素的映射值
now = 0;
nowm = 0;
nown = 0;
newGray = GrayImage;
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
deltaX = 0;
deltaY = 0;
x = 0;
y = 0;
image = GrayImage;
for i=1:(subm*w-1)
    nowm = floor(i/subm) + 1;%此刻的块
    for j=1:(subn*w-1)
        nown = floor(j/subn) + 1;%此刻的块
        now = nowm + (nown - 1) * w;%块编号
        if (i<=subm/2 || i>=(w-0.5)*subm) && (j<=subn/2 || j>=(w-0.5)*subn)
            newGray(j, i) = cdf(image(j, i) + 1, now) * 255;
        elseif (i>subm/2 && i<(w-0.5)*subm) && (j<=subn/2 || j>=(w-0.5)*subn)
            x1 = floor((i-(0.5*subm))/subm) + 1;
            x2 = x1 + 1;
            deltaX = (i - (x1 - 0.5)*subm)/subm;
            if j>=(w-0.5)*subn
                x1 = x1 + w * (w - 1);
                x2 = x2 + w * (w - 1);
            end
            newGray(j, i) = (cdf(image(j, i) + 1, x1) * 255) * (1 - deltaX) + (cdf(image(j, i) + 1, x2) * 255) * deltaX;
        elseif (i<=subm/2 || i>=(w-0.5)*subm) && (j>subn/2 && j<(w-0.5)*subn)
            x3 = floor((j-(0.5*subn))/subn) + 1;
            x1 = floor((j-(0.5*subn))/subn) * w + 1;
            x2 = x1 + w;
            deltaY = (j - (x3 - 0.5)*subn)/subn;
            if i>=(w-0.5)*subm
                x1 = x1 + (w - 1);
                x2 = x2 + (w - 1);
            end
            newGray(j, i) = (cdf(image(j, i) + 1, x1) * 255) * (1 - deltaY) + (cdf(image(j, i) + 1, x2) * 255) * deltaY;
        else
            x = floor((i-(0.5*subm))/subm) + 1;
            y = floor((j-(0.5*subn))/subn) + 1;
            if rem(i-(0.5*subm), subm) == 0
                x = x - 1;
            end
            if rem(j-(0.5*subn), subn) == 0
                y = y - 1;
            end
            x1 = x + w * (y - 1);
            x2 = x1 + 1;
            x3 = x1 + w;
            x4 = x3 + 1;
            deltaX = (i - (x - 1) * subm - 0.5*subm)/subm;
            deltaY = (j - (y - 1) * subn - 0.5*subn)/subn;
            newGray(j, i) = (cdf(image(j, i) + 1, x1) * 255) * (1 - deltaX) * (1 - deltaY) + (cdf(image(j, i) + 1, x2) * 255) * deltaX * (1 - deltaY) + (cdf(image(j, i) + 1, x3) * 255) * deltaY * (1 - deltaX) + (cdf(image(j, i) + 1, x4) * 255) * deltaX * deltaY;
        end
    end
end

%% 转换为RGB图并显示原图像和局部均衡化后的图像
newRGB = RGBImage;
gray = double(newGray);
newrgb = double(newRGB);
M = zeros(n, m); 
N = zeros(n, m);
rgb = double(RGBImage);

for i = 1:n
    for j = 1:m
        cur = rgb(i, j, 1);
        if(rgb(i, j, 1) == 0)
            cur = 1;
        end
        M(i, j) = rgb(i, j, 2)/cur;
        N(i, j) = rgb(i, j, 3)/cur;
    end
end

for i = 1:n
    for j = 1:m
        curr = 0.2989 + 0.5870*M(i, j) + 0.1140*N(i, j);
        newrgb(i, j, 1) = gray(i,j) / curr;
        newrgb(i, j, 2) = gray(i,j) * M(i, j) / curr;
        newrgb(i, j, 3) = gray(i,j) * N(i, j) / curr;
    end
end

newRGB = uint8(newrgb);
figure;
subplot(121),imshow(RGBImage);
title('原图像');
subplot(122),imshow(newRGB);
title('局部均衡化后的图像');