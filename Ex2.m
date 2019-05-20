% FILE: Ex2.m
% NAME: [Chunguang Xie, Schuyler Horky]
% DESCRIPTION: practicing to verify our pre-lab results. 

% Clear all variables and close all windows
clearvars;
close all;

load MorseCode.mat;
t_morse = (0:length(dash)-1) * (1/Fs);
figure;
subplot(2,1,1);
plot(t_morse, dash);
ylim([-40,40]);
title('dash vs t morse');
subplot(2,1,2);
plot(t_morse, dot);
ylim([-40,40]);
title('dot vs t morse');

x = [dash dot dot dash];
t = (0:length(x)-1) * (1/Fs);
N = 8192;
x_fft = fftshift(fft(x, N));
x_abs = abs(x_fft);
w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

figure;
subplot(2,1,1);
plot(t, x);
xlabel('t/seconds');
ylabel('amplitude');
title('x(t) vs t');
subplot(2,1,2);
plot(w, x_abs);
xlim([-1000,1000]);
xlabel('rad/seconds');
ylabel('amplitude');
title('x abs vs w');

y = x.*cos(500*t);
y_fft = fftshift(fft(y, N));
y_abs = abs(y_fft);
figure;
subplot(2,1,1);
plot(t, y);
xlabel('t/seconds');
ylabel('amplitude');
title('y(t) vs t');
subplot(2,1,2);
plot(w, y_abs);
xlim([-1000,1000]);
ylim([0,10000]);
xlabel('rad/seconds');
ylabel('amplitude');
title('y abs vs w');
