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
% 在MATLAB中，尽可能避免使用for循环;可以通过向量化和逻辑索引获得显著的性能改进
% MATLAB支持动态数组分配;在进行赋值之前，没有必要为数组分配空间
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

