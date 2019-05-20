% FILE: Ex4.m
% NAME: [Chunguang Xie, Schuyler Horky]
% DESCRIPTION: practicing to verify our pre-lab results. 

% Clear all variables and close all windows
clearvars;
close all;

load Ex4.mat;
figure;
b = [2*10^9];
a = [240 3*10^4 2.2*10^6 10^8 2*10^9];

for i=1:3
    if i == 1
        c = cos(1000*t);
    elseif i == 2
        c = cos(2000*t);
    elseif i == 3
        c = cos(3000*t);
    end
    z = y.*c;
    xr = lsim(b, a, z, t);
    subplot(3,1,i);
    plot(t,xr);
    xlabel('t/seconds');
    ylabel('amplitude');
    str = ['Message M', num2str(i), '(t)'];
    title(str);
end

        
        