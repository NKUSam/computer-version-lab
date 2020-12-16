function f = histogram(I,title0,position)

    [height,width]=size(I);

    % Compute the number of occurrences of each gray level
    NumPixel = zeros(1,256);
    for i = 1:height
        for j = 1:width
            NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
        end
    end

    subplot(3,3,position)
    bar(NumPixel)
    title(title0);
    f = NumPixel;
end
