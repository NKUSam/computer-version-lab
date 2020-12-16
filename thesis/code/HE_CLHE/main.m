%% ����ͼ�����ʾԭͼ��
clear;clc;
img = imread('baby.jpg');
[height,width] = size(img);
figure;
subplot(221);
imshow(img)
title('ԭͼ');

%% ��ʾͼƬ�ľ��⻯ǰ��ֱ��ͼ
hist_b = getpdf(img);
subplot(222);
bar(hist_b);
title('���⻯ǰ��ֱ��ͼ');

%% �趨ե֭���Ҽ���
% time = 5;
% cut_num = round((height*width)/256)*time;
% hist_b = clipping(hist_b,cut_num);

%% ��һ���ͼ����ۻ��ֲ�
hist_p = hist_b/(height*width);%��һ��
hist_c = getcdf(hist_p,hist_p);%�ۻ�����


%% ������⻯���ֱ��ͼ
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * hist_c(i));
end
for i = 1:height
    for j = 1:width
        img(i,j)=Map(img(i,j) + 1);
    end
end

%% ��ʾ���⻯���ͼ��
subplot(223);
imshow(img);
title('���⻯���ͼƬ');

%% ��ʾ���⻯���ֱ��ͼ
hist_a = getpdf(img);
subplot(224);
bar(hist_a);
title('���⻯���ͼƬ');
