function G = gauss_pyramid(I,depth)

    G = cell(1,depth);%GΪ������ͼƬ֮����

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
