%% 图片读入
clear;
clc;
I_B = imread('1.jpg'); %B:before
I_A = I_B; %A:after
I_TEMP = I_A;


%% RGB转Gray(灰度图)
[height,width, number]=size(I_B);
if number > 1
  I_A = I_B(:,:,1)*0.3+I_B(:,:,2)*0.59+I_B(:,:,3)*0.11;
end
subplot(331)
imshow(I_B) %显示原图
title('original figure');
subplot(332)
imshow(I_A) %显示灰图
title('gray figure')


%% 直方图处理
NumPixel = histogram(I_A,'Histogram of Original Image',3);


%% 补偿函数处理
T = round(height*width/256)*5;
NumPixel = clipping_histogram(NumPixel,T,4);


%% 处理灰度概率pdf
ProbPixel = normalized_histogram(NumPixel,I_A,'After Probability distribution function',5);


%% 积累函数处理cdf
CumuPixel = cumulative_histogram(ProbPixel,'Cumulative Histogram of Original Image',6);


%% 累积像素转换为新的灰度级
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * CumuPixel(i));
end
% subplot(338)
% bar(Map)
% title('New Image');
for i = 1:height
    for j = 1:width
        I_A(i,j)=Map(I_A(i,j) + 1);
    end
end
subplot(338)
bar(I_A)
title('New Image');

% %% 查看新图的直方图
% NewNumPixel = histogram(I_A,'Histogram of New Image',7);
% 
% 
% %% 显示新图
% subplot(338)
% imshow(I_A)
% title('New Image');
% 
% 
% %% 将新图转化为彩色图
% I_R = uint8(zeros(size(I_B)));
% for i =1:height
%     for j =1:width
%         cg = double(I_A(i,j))/double(I_TEMP(i,j));
%         I_R(i,j,:) = round(cg * I_B(i,j,:));
%     end
% end
% 
% % I_R = zeros(height,width,3); %R:result
% % R = (I_A/100)*(10/3);
% % G = (I_A/100)*(100/59);
% % B = (I_A/100)*(100/11);
% % I_R(:,:,1) = R;
% % I_R(:,:,2) = G;
% % I_R(:,:,3) = B;
% subplot(3,3,9);
% imshow(I_R);
% title('final figure')
