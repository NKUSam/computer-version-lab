function g = reduce(I)
    %����Ԥ������˲�����,typeΪ��˹��ͨ�˲�����5��ʾ����5*5��gaussian����1Ϊ�˲����ı�׼ֵ
    ker = fspecial('gaussian',5,1);

    % conv�Ǿ������
    convIm = imfilter(I, ker, 'conv');
    rows = size(I,1);cols = size(I,2);
    
    %��ȥż�����У�ģ����
    blur_rows = convIm(1:2:rows,:,:);
    g = blur_rows(:,1:2:cols,:);
%     imshow(g);
end
