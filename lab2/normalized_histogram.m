function result = normalized_histogram(NumPixel,I,title0,position)

    [height,width]=size(I);

    ProbPixel = zeros(1,256);
    for i = 1:256
        ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
    end

    subplot(3,3,position)
    bar(ProbPixel)
    title(title0);

    result = ProbPixel;
end
