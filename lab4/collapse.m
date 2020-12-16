function I = collapse(L)

    
    depth = numel(L);

    for i = depth-1:-1:1
        L{i} = L{i} + expand(L{i+1});
    end

    I = L{1};

end