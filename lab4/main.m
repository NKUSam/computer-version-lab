clc;
clear;
%% ����ͼƬ�����ø���ͼ
apple = im2double(imread('apple.jpg'));
orange = im2double(imread('orange.jpg'));
if size(apple) == size(orange)
    [height, width, num] = size(apple);
end


%% ��������
mix = zeros(height,width);
mix(:,257:512) = 1;
% subplot(1,1,1)
% imshow(mix)


%% ��ȡƻ��ͼ�;���ͼ��������˹������
depth = 6;
apple_laplace = laplace_pyramid(apple,depth);
orange_laplace = laplace_pyramid(orange,depth);


%% ��ȡ����ͼ�ĸ�˹������
mix_gauss = gauss_pyramid(mix,depth);


%% ��ƻ�������ӵ�������˹ͼ�ٸ���ͼ��˹�������Ϻϲ�
LS = combine_laplace(orange_laplace, apple_laplace, mix_gauss);


%% ��ȡ�ڽ�������ײ��Ĵ�С��ԭͼһ���ĺϲ�ͼ
Ib = collapse(LS);
imshow(Ib);