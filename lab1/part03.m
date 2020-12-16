%Q2.3
% clear;
% clc;
% %%使用逻辑索引
A = imread('grizzlypeak.jpg');
% tic;
%     B = A <= 10;
%     A(B) = 0;
% toc;

%%使用for循环
[m,n,num] = size(A);
C1 = A(:,:,1);
C2 = A(:,:,2);
C3 = A(:,:,3);
tic;
for i = 1:m
    for j = 1:n
        if C1(i,j) <= 10
            C1(i,j) = 0;
        end
        if C2(i,j) <= 10
            C2(i,j) = 0;
        end
        if C3(i,j) <= 10
            C3(i,j) = 0;
        end
    end
end
toc;
