function [ cdf ] = cdf( cdf, his )
    cdf(1) = his(1);
    for i=2:256
        cdf(i) = cdf(i-1) + his(i);
    end
end

