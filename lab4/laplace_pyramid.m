function L = laplace_pyramid(I,depth)

    L = cell(1,depth);

    G = gauss_pyramid(I,depth);

    for i = 1:(depth-1)
        tmp = expand(G{i+1});
        rows = size(G{i},1);
        cols = size(G{i},2);
        tmp = tmp(1:rows,1:cols,:);
        L{i} = G{i}-tmp;
    end
    L{end} = G{end};
end