clc; clear; close all;
format compact

% Defining variables
coeff = 10;
n = 2000000;
Ga = linspace(-6*pi,6*pi,n);
Rs = cos(Ga) + coeff*sinc(Ga/pi); % RHS of the equation

% Plotting Results  - 01
plot(Ga/pi, Rs, Ga/pi, Ga./Ga, '--r', Ga/pi, -Ga./Ga, '--b'),
xlabel('ga/pi'), ylabel('cos(ga) + 10sinc(ga/pi)'),
title('Sinc graph and allowed values of ga'),
legend('cos(ga) + 10sinc(ga/pi)','cos(ka)=1','cos(ka)=-1')
Rs(Rs<-1) = NaN; % values exceeding 1 are excluded 
Rs(Rs>1) = NaN; % values below -1 are excluded 
Gal = [];
for i = 1:length(Rs)
    if Rs(i) > 0.998 || Rs(i) < -0.998 
        temp = Ga(i)/pi;
        Gal = [Gal temp];
    end
end
i=1;
while i<length(Gal)
    if abs(Gal(i)-Gal(i+1))<1e-2 
        Gal(i+1)=[];
    else
        i = i + 1;
    end
end

% Second problem
k = acos(Rs);
idx = find(isnan(k)); % finding the positions 
idx_diff = diff(idx);
y_break = find(idx_diff~=1); % finding the positions of discontinuities
y_break = [y_break length(idx)]; 
t = [];
for i=1:length(y_break)
    t1 = idx(y_break(i)) +1;
    if i == length(y_break)
        t2 = length(k);
    else
        t2 = idx(y_break(i)+1);
    end
    
    
    if rem(i,2)~=0
        k(t1:t2) = (i + 1)*pi - k(t1:t2) - Ga(end);
    else
        k(t1:t2) = i*pi + k(t1:t2) - Ga(end);
    end
end
t = [t t1 t2];
figure(2)
plot(k/pi, Ga.^2/pi^2, Ga/pi, Ga.^2/pi^2, '--'), xlabel('ka/pi'),...
ylabel('E/(h^{2}/8m_{0}a^{2})'), ...
title('Extended-zone plot of energy for the first five allowed energy bands'),...
ylim([0 25]) , legend('Energy plot','E-k relation for a free electron')

% Third Problem
ka_N = acos(Rs);
ka_1 = [-ka_N ka_N]; % creating symmetric y values 
y = Ga.^2/pi^2;
y = [y y]; % creating symmetric x values figure
figure(3)
plot(ka_1/pi, y), xlabel('ka/pi'), ylabel('E/(h^{2}/8m_{0}a^{2})'),...
title('Reduced Zone Plot of energy'), ylim([0 25]), hold on
n = 10; % number of crystal momentum states in each band for 
i = 1:2:length(t);
t1 = t(i); t2 = t(i+1);
x = ka_N(t1:ceil(t2-t1)/(n/2):t2); x = [-x x]/pi;
y = Ga(t1:ceil(t2-t1)/(n/2):t2).^2/pi^2; y = [y y];
scatter(x,y), hold on
