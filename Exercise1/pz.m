function res = pz(z)
global xrange
dx = xrange(2)-xrange(1); % dx is sample period
res = sum(px(xrange).*pz_x(z,xrange))*dx;
end

