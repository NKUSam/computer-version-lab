function [ his ] = clipping( his, image )
    m = size(image, 1);
    n = size(image, 2);
    p = (m*n)*5/256;
    sum = 0;
    for i=1:256
        if(his(i)>p)
            sum = sum + his(i) - p;
            his(i) = p;
        end
    end
    his = his + sum/255; 
end

