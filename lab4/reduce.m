function g = reduce(I)
    %创建预定义的滤波算子,type为高斯低通滤波器，5表示产生5*5的gaussian矩阵，1为滤波器的标准值
    ker = fspecial('gaussian',5,1);

    % conv是卷积计算
    convIm = imfilter(I, ker, 'conv');
    rows = size(I,1);cols = size(I,2);
    
    %减去偶数行列，模糊化
    blur_rows = convIm(1:2:rows,:,:);
    g = blur_rows(:,1:2:cols,:);
%     imshow(g);
end
