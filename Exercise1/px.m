function priorPDF = px(x)
    beta    = 20;
    xmin    = 1;
    xmax    = 3;

    mu      = 0.5*(xmin+xmax);
    alpha   = 0.5*(xmax-xmin);

    priorPDF = beta/(2*alpha*gamma(1/beta)).*exp(-(abs(x-mu)./alpha).^beta);
end