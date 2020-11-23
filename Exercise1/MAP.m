function MAP = MAP(z)
    global xrange;
    [maxValue,index] = max(px_z(xrange,z));
    
    MAP = xrange(index);
end

