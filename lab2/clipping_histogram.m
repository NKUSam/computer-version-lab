function Clipped = clipping_histogram(NumPixel, T,position)

    sum=0;
    for i = 1:256
        if(NumPixel(1,i) > T)
            sum = sum + NumPixel(1,i) - T; %将多出的值加起来
            NumPixel(1,i) = T;
        end
    end

    add1 = round(sum / 256);
    NumPixel = NumPixel + add1;
    Clipped =NumPixel;
    subplot(3,3,position);
    bar(NumPixel);
    title('After clipping');
end
