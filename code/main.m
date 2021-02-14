function main
%input section
    %number:
    n = 10;
%end of input
 
%plotting elements or their derivatives (optional)
%     N = (0:n);
%     D = (0:0.01:2);
%     elements = arrayfun(@(t){element(t, n)}, N);
%     elements_der = arrayfun(@(t){element_derivative(t, n)}, N);
%     tmp_der = elements_der{11};
%     disp(f);
%     plot(D,tmp_der(D));
%     plot_elements(D, elements);

%initialize the equations matrix and iterate
    equations = zeros(n+1,n+1);
    for i=0:n-1
        for j=0:n
            if (abs(i - j) > 1)
                continue;
            end
            if (abs(i - j) == 1)
                s = 2.* max(0, min(i, j) / n);
                e = 2.* min(1, max(i, j) / n);
            else
                s = 2.* max(0, (i - 1) / n);
                e = 2.* min(1, (i + 1) / n);
            end
%count B (u , v)
            equations(i+1,j+1) = b_u_v(element_derivative(j, n), ... 
            element_derivative(i, n), element(j, n), element(i, n), s, e);

        end
    end

%set Dirichlet’s boundary condition 
    equations(n+1,n+1) = 1;

%initiate right side of equation array 
    eq_right = zeros(n+1,1);

%count l(v) for each element besides last one
    for i=0:n-1
        eq_right(i+1) = l_v(element(i, n));
    end

%set Dirichlet’s boundary value
    eq_right(n+1) = 0;

%display equation system (optional)
    disp([equations eq_right]);
 

%solve equations
    Results = linsolve(equations,eq_right);
    disp(Results);
%     disp(length(Results));


%initiate arrays for printing the results
    X = (0:0.001:2);
    Y = zeros(1, length(X));

%for each x in X increment coresponding Y by each element e(x) * result 
    for i=0:length(X)-1
        for j=0:length(Results)-1
            e = element(j, n);
            tmp = Y(i+1);
            Y(i+1) = tmp + Results(j+1) .* ( e( X(i+1) ) );
        end
    end

%plot the results 
    plot(X,Y);
end
