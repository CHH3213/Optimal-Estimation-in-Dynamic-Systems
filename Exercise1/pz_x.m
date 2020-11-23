function likelyhood = pz_x(z,x)
P0 = 0.95;
P1 = 1 - P0;
sigma = 0.1;

likelyhood = P0/(sigma*sqrt(2*pi)).*exp(-(z-x).^2./(2*sigma^2)) + ...
    P1/(sigma*sqrt(2*pi)).*exp(-(z-2*x).^2./(2*sigma^2));
end

