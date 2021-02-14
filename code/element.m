function e = element(i, n)
    e = @(x)(max( 1 - abs( (x - i.*2/n) ./2.*n) , 0));
end