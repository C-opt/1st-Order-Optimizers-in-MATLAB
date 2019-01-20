function data_passes = DASVRDA_dataPass(data_size, m, b, S, T, innerPt_no)
    innerPt_no = min(floor(sqrt(m)), innerPt_no);
    data_passes = zeros(T*S*(1 + innerPt_no) + 1, 1);
   
    count = 1;
    for t = 1: T
        for s = 1: S
            count = count + 1;
            data_passes(count) = (s-1)*(1 + m*b/data_size) + (t-1)*S*(1 + m*b/data_size);
            for k = 1: m
                 if rem(k, ceil(m/(innerPt_no + 1)) ) == 0 && k ~= m
                     count = count + 1;
                     data_passes(count) = data_passes(count-1) + ceil(m/(innerPt_no + 1))*b/data_size;
                 end
            end
        end
    end
end
    