function IC(data)
    C=unique(data,1);
    s1=size(C,1);
    s2=size(data,1);
    K = zeros(s2);
    t=1;
    for i=1:s1, j=1:s2
            if (C[i,:]==data[j, :])
                K[t] = i
                t = t+1;
            end
    end
    return K
end
