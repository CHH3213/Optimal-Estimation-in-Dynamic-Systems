%% Setting up environment
clear variables
clear global
close all

%global xmin xmax beta p0 p1 stdiv;

%xmin = 1;
%xmax = 3;
%beta = 20

%P0 = 0.95;
%P1 = 1- P0;
%stdiv = 0.1;

global xrange zrange;
xrange = linspace(0.5,3.5);
zrange = linspace(0,4);


%% Question 1
figure(1)
plot(xrange,px(xrange))
title("p(x) 'Prior'")
xlabel("Depth [m]")
ylabel("Probability")
exportgraphics(gcf,'Figures/fig1-1a.png')

figure(2)
plot(zrange,pz_x(zrange, 1.5))
title("p(z|x=1.5) 'Likelihood'")
xlabel("Depth [m]")
ylabel("Probability")
exportgraphics(gcf,'Figures/fig1-1b.png')

figure(3)
plot(zrange,pz_x(zrange, 2.0))
title("P(z|x=2.0) 'Likelihood'")
xlabel("Depth [m]")
ylabel("Probability")
exportgraphics(gcf,'Figures/fig1-1c.png')


%% Question 2
figure(4)
fplot(@(z) pz(z), [0,4])
title("p(z) 'Marginal'")
xlabel("Depth [m]")
ylabel("Probability")
exportgraphics(gcf,'Figures/fig1-2a.png')


figure(5)
fplot(@(x) px_z(x,3.1),[0.5,3.5])
title("p(x|z=3.1) 'Posterior'")
xlabel("Depth [m]")
ylabel("Probability")
exportgraphics(gcf,'Figures/fig1-2b.png')

figure(6)
fplot(@(x) px_z(x,4.0),[0.5,3.5])
title("p(x|z=4.0) 'Posterior'")
xlabel("Depth [m]")
ylabel("Probability")
exportgraphics(gcf,'Figures/fig1-2c.png')

%% Question 3
MMSE1 = MMSE(3.1);
MMSE2 = MMSE(4);

MAP1 = MAP(3.1);
MAP2 = MAP(4);

MMAE1 = MMAE(3.1);
MMAE2 = MMAE(4);

ML1 = ML(3.1);
ML2 = ML(4);

%% Question 4 
quad    = @(xh,x) sum((xh-x).^2);
abss     = @(xh,x) sum(abs(xh-x));
% uni     = @(xh,x,delta) (if (abs(xh-x)>delta)
%         1;
%     end);

RMMSE1quad = @(x) quad(MMSE1,x)*px_z(x,3.1);
RMMSE2quad = @(x) quad(MMSE2,x)*px_z(x,4.0);
RMAP1quad = @(x) quad(MAP1,x)*px_z(x,3.1);
RMAP2quad = @(x) quad(MAP2,x)*px_z(x,4.0);
RMMAE1quad = @(x) quad(MMAE1,x)*px_z(x,3.1);
RMMAE2quad = @(x) quad(MMAE2,x)*px_z(x,4.0);
RML1quad = @(x) quad(ML1,x)*px_z(x,3.1);
RML2quad = @(x) quad(ML2,x)*px_z(x,4.0);

RMMSE1abs = @(x) abss(MMSE1,x)*px_z(x,3.1);
RMMSE2abs = @(x) abss(MMSE2,x)*px_z(x,4.0);
RMAP1abs = @(x) abss(MAP1,x)*px_z(x,3.1);
RMAP2abs = @(x) abss(MAP2,x)*px_z(x,4.0);
RMMAE1abs = @(x) abss(MMAE1,x)*px_z(x,3.1);
RMMAE2abs = @(x) abss(MMAE2,x)*px_z(x,4.0);
RML1abs = @(x) abss(ML1,x)*px_z(x,3.1);
RML2abs = @(x) abss(ML2,x)*px_z(x,4.0);

RMMSE1uni = @(x) uni(MMSE1,x)*px_z(x,3.1);
RMMSE2uni = @(x) uni(MMSE2,x)*px_z(x,4.0);
RMAP1uni = @(x) uni(MAP1,x)*px_z(x,3.1);
RMAP2uni = @(x) uni(MAP2,x)*px_z(x,4.0);
RMMAE1uni = @(x) uni(MMAE1,x)*px_z(x,3.1);
RMMAE2uni = @(x) uni(MMAE2,x)*px_z(x,4.0);
RML1uni = @(x) uni(ML1,x)*px_z(x,3.1);
RML2uni = @(x) uni(ML2,x)*px_z(x,4.0);

risk1(1,1) = integral(RMMSE1quad,0,4,'ArrayValued',true);
risk2(1,1) = integral(RMMSE2quad,0,4,'ArrayValued',true);
risk1(1,2) = integral(RMAP1quad,0,4,'ArrayValued',true);
risk2(1,2) = integral(RMAP2quad,0,4,'ArrayValued',true);
risk1(1,3) = integral(RMMAE1quad,0,4,'ArrayValued',true);
risk2(1,3) = integral(RMMAE2quad,0,4,'ArrayValued',true);
risk1(1,4) = integral(RML1quad,0,4,'ArrayValued',true);
risk2(1,4) = integral(RML2quad,0,4,'ArrayValued',true);
risk1(2,1) = integral(RMMSE1abs,0,4,'ArrayValued',true);
risk2(2,1) = integral(RMMSE2abs,0,4,'ArrayValued',true);
risk1(2,2) = integral(RMAP1abs,0,4,'ArrayValued',true);
risk2(2,2) = integral(RMAP2abs,0,4,'ArrayValued',true);
risk1(2,3) = integral(RMMAE1abs,0,4,'ArrayValued',true);
risk2(2,3) = integral(RMMAE2abs,0,4,'ArrayValued',true);
risk1(2,4) = integral(RML1abs,0,4,'ArrayValued',true);
risk2(2,4) = integral(RML2abs,0,4,'ArrayValued',true);
risk1(3,1) = integral(RMMSE1uni,0,4,'ArrayValued',true);
risk2(3,1) = integral(RMMSE2uni,0,4,'ArrayValued',true);
risk1(3,2) = integral(RMAP1uni,0,4,'ArrayValued',true);
risk2(3,2) = integral(RMAP2uni,0,4,'ArrayValued',true);
risk1(3,3) = integral(RMMAE1uni,0,4,'ArrayValued',true);
risk2(3,3) = integral(RMMAE2uni,0,4,'ArrayValued',true);
risk1(3,4) = integral(RML1uni,0,4,'ArrayValued',true);
risk2(3,4) = integral(RML2uni,0,4,'ArrayValued',true);


function ret = uni(xh,x)
    if (abs(xh-x) > 0.05)
       ret = 1;
    else
       ret = 0;
    end
end