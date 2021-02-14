function plot_elements(X,elements)
    f = elements{1};
    Y = f(X);
    plot(X,Y);
    hold on;
    for i=2:length(elements)
        f = elements{i};
        Y = f(X);
        plot(X,Y);
    end
    hold off
end