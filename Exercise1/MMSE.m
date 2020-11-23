function MMSE = MMSE(z)
    global xrange
    dx = xrange(2)-xrange(1); % dx is sample period    
    MMSE = sum(xrange.*px_z(xrange,z).*dx);   
end

