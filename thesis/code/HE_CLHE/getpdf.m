function f = getpdf(I)

    [height,width]=size(I);

    NumPixel = zeros(1,256);

    for i = 1:height
        for j = 1:width
            NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
        end
    end

    f = NumPixel;
end
