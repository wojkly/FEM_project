function e = element_derivative(i, n)
    e = @(x) (n./2 .* (2.*(i-1)/n <= x).*(x < 2.*i/n) .*(0 <= x) + ...
        (-n)./2 .*(2.*i / n <= x) .* (x < 2.*(i+1) / n) .*(x <= 2));
end

