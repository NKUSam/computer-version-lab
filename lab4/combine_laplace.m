function LS = combine_laplace(orange, apple, mix)
    
    depth = numel(orange);

    LS = cell(1,depth);

    % LS(d,i,j) = mix(d,i,j)*orange(d,i,j) + (1-mix(d,i,j))*apple(d,i,j)

    for d = 1:depth
        LS{d} = mix{d}.*orange{d} + (1-mix{d}).*apple{d};
    end
end