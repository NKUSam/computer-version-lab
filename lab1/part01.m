%%Q2.1
tic;
A = imread('grizzlypeakg.png');
[m1,n1] = size(A);
for i=1:m1
    for j=1:n1
        if A(m1,n1) <= 10
            A(m1,n1)=0;
        end
    end
end
toc;
tic;
%ANS
B = A<=10;
A(B) = 0;
toc;


