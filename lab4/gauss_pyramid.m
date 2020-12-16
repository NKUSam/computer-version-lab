function G = gauss_pyramid(I,depth)

    G = cell(1,depth);%G为金字塔图片之集合

    for i = 1:depth
        if i == 1
            G{i} = I;
            sub = I;
        else
            sub = reduce(sub);
            G{i} = sub;
        end
    end
end
