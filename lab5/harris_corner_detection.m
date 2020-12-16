function res = harris_corner_detection(img, threshold)
    [Ix, Iy] = get_gradient(img);
    [Iz, It] = imgradientxy(img);
    figure;
    subplot(1,2,1);
    imshow(Ix)
    subplot(1,2,2);
    imshow(Iz)
%     imshow(Iz);
%     [m, n] = size(img);
%     IxIx = Ix.*Ix;
%     IyIy = Iy.*Iy;
%     IxIy = Ix.*Iy;
% 
%     w = 5; %���ڿ��
%     wIxIx = gauss_filter(IxIx, 1);
%     wIxIy = gauss_filter(IxIy, 1);
%     wIyIy = gauss_filter(IyIy, 1);
% 
%     alpha = 0.06; %0.04~0.06
%     detI = wIxIx.*wIyIy - wIxIy.*wIxIy;
%     traceI = wIxIx + wIyIy;
%     R = detI - alpha*traceI.*traceI;
% 
%     %�Ǽ���ֵ����
%     for i=(w-1)/2+1:m-(w-1)/2
%         for j=(w-1)/2+1:n-(w-1)/2
%             if R(i, j)<max(max(R(i-(w-1)/2:i+(w-1)/2,j-(w-1)/2:j+(w-1)/2)))
%                 R(i, j)=0;
%             end
%         end
%     end
% 
%     [row,col] = find(R>threshold);
%     radius = 10*ones(size(row));
%     res = insertShape(img,'circle',[col row radius], 'LineWidth',1);
end