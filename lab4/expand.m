function g = expand(I)
    rows = size(I, 1);
    cols = size(I, 2);
    expout = zeros([2*rows 2*cols 3]);
    expout(1:2:2*rows,1:2:2*cols,:) = I;
    
    ker = fspecial('gaussian',5,1);

    expout = imfilter(expout, ker, 'conv');

    expout = 4*expout;

    g = expout;

end
