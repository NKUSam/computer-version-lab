function f = cumulative_histogram(ProbPixel,title0,position)

    CumuPixel = zeros(1,256);
    for i = 1:256
        if i == 1
            CumuPixel(i) = ProbPixel(i);
        else
            CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
        end
    end

    subplot(3,3,position);
    bar(CumuPixel)
    title(title0);

    f = CumuPixel;
end