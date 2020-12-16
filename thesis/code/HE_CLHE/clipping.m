function Clipped = clipping(NumPixel,max_num)

    sum=0;
    for i = 1:256
        if(NumPixel(1,i) > max_num)
            sum = sum + NumPixel(1,i) - max_num; %将多出的值加起来
            NumPixel(1,i) = max_num;
        end
    end

    add1 = round(sum / 256);
    NumPixel = NumPixel + add1;
    Clipped =NumPixel;
end
