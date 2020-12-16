function [ his ] = getpdf( his, image )
    m = size(image, 1);
    n = size(image, 2);
    for i=1:m
        for j=1:n
            his(image(i,j)+1) = his(image(i,j)+1) + 1;
        end
    end
end

