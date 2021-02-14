function b = b_u_v(u_derivative, v_derivative, u, v, s, e)
    b = integral( @(x) (u_derivative(x) .* v_derivative(x)), s, e) - ...
    	u(0) .* v(0);
end

