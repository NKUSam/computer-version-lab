function res = gauss_filter(img, Sigma)
    %��Ϊ��˹ģ���뾶���뾶Խ��ģ���̶�Խ��
    for x = 1: 3  % ��ֱ����
        for y = 1:3  % ˮƽ����
            WeightMatrix(x, y) = exp(-(x^2+y^2)/(2*Sigma^2))/(2*pi*Sigma^2);
        end
    end
    WeightMatrix = WeightMatrix./sum(sum(WeightMatrix)); %ʹ��3*3����֮�͵���1
    [row, col] = size( img );
    for i = 1: row  % ��ֱ����
        for j = 1:col  % ˮƽ����
            if i==1 || j==1 || i==row || j==col
                img_undist(i, j) = img(i, j);%��Եδ����
            else
                miniMatrix=single(img(i-1:i+1, j-1:j+1));
                img_undist(i, j)=sum(sum( miniMatrix.*WeightMatrix ));%��˹ģ��
            end
        end
    end
    res = img_undist;
end