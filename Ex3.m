% FILE: Ex3.m
% NAME: [Chunguang Xie, Schuyler Horky]
% DESCRIPTION: practicing to verify our pre-lab results. 

% Clear all variables and close all windows
clearvars;
close all;

load Ex3.mat;
z = y.*cos(500*t);
N = 8192;
z_fft = fftshift(fft(z, N));
z_abs = abs(z_fft);
w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

figure;
subplot(2,1,1);
plot(t,z);
title('z vs t');
subplot(2,1,2);
plot(w,z_abs);
title('z abs vs w');
xlim([-1500, 1500]);
ylim([0, 10000]);

b = [2*10^9];
a = [240 3*10^4 2.2*10^6 10^8 2*10^9];
xr = lsim(b, a, z, t);
xr_fft = fftshift(fft(xr, N));
xr_abs = abs(xr_fft);

figure;
subplot(2,1,1);
plot(t,xr);
title('xr vs t');
subplot(2,1,2);
plot(w,xr_abs);
title('xr abs vs w');
xlim([-1000, 1000]);
ylim([0, 10000]);





