function MMAE = MMAE(z)
    global xrange;
    
    index = find((cumsum(px_z(xrange,z))./sum(px_z(xrange,z)))>0.5);
    MMAE = xrange(index(1));
end

