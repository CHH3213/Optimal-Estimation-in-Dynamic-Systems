function ML = ML(z)
    global xrange;
    [maxValue,index] = max(pz_x(z,xrange));
    
    ML = xrange(index);
end

