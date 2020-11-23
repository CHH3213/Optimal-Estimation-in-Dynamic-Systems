close all
clear varialbes

% function estimates
    global N Np a b xrange;
    N=500; % Number of samples
    Np=8; % Number of looks
    a=2; b=5; % Beta distribution parameters
    x=0.005:0.005:1; % Interesting range of x
    z=0.005:0.005:1.5; % Interesting range of z
    %load scatter; % Load set (for plotting only)
    xrange=x;
    for i=1:length(z)
        [dummy,ind]=max(px_z(x,z(i))); 
        x_map(i)=x(ind);
        x_mse(i)=sum(pz_x(z(i),x).*px(x).*x)./sum(pz_x(z(i),x).*px(x));
        ind=find((cumsum(px_z(x,z(i)))./sum(px_z(x,z(i))))>0.5);
        x_mae(i)=x(ind(1));
    end
    figure; clf; plot(zset,xset,'.'); hold on;
    plot(z,x_map,'k-.'); plot(z,x_mse,'k--');
    plot(z,x_mae,'k-');
    legend('realizations','MAP','MSE','MAE');
    return

figure
plot(x,px(x));
figure
plot(z,pz_x(z,1.5));
figure
plot(z,pz(z));
figure
plot(x,px_z(x,2));

function ret=px(x)
    global a b; 
    ret=betapdf(x,a,b);
    return
end
function ret=pz_x(z,x)
    global Np; 
    ret=(z>0).*(Np./x).*gampdf(Np*z./x,Np,1);
    return
end
    
function ret=pz(z)
    global xrange; 
    dx = xrange(2)-xrange(1); % dx is sample period
    ret = sum(px(xrange).*pz_x(z,xrange))*dx;
    return
end
    
function ret=px_z(x,z)
    ret=pz_x(z,x).*px(x)./pz(z);
    return
end
    

    