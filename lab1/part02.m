%Q2.2
% clear;
% clc;
% A = imread('grizzlypeakg.png');
% [m1,n1] = size(A);
% tic;
% for t=1:1000
%     for i=1:m1
%         for j=1:n1
%             if A(m1,n1) <= 10
%                 A(m1,n1)=0;
%             end
%         end
%     end
%     A = imread('grizzlypeakg.png');
% end
% toc;
% ��MATLAB�У������ܱ���ʹ��forѭ��;����ͨ�����������߼�����������������ܸĽ�
% MATLAB֧�ֶ�̬�������;�ڽ��и�ֵ֮ǰ��û�б�ҪΪ�������ռ�
% ANS
clear;
clc;
tic;
for t2=1:1000
    A = imread('grizzlypeakg.png');
    B = A <= 10;
    A(B) = 0;
end
toc;

