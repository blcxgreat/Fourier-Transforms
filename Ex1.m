% FILE: Ex1.m
% NAME: [Chunguang Xie, Schuyler Horky]
% DESCRIPTION: practicing to verify our pre-lab results. 

% Clear all variables and close all windows
clearvars;
close all;

Fs = 10;
t = 0:(1/Fs):500 -(1/Fs); 
x = cos(0.1*t);
N = 8192;
x_fft = fftshift(fft(x, N));
x_abs = abs(x_fft);
w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

figure(1);
subplot(2,2,1);
plot(t, x);
xlim([100,400]);
ylim([-2,2]);
xlabel('t/seconds');
ylabel('amplitude');
title('input signal x(t)');

subplot(2,2,2);
plot(w, x_abs);
xlim([-0.5, 0.5]);
xlabel('rad/seconds');
ylabel('amplitude');
title('x abs vs w');

H_fft = 3./(3+j*w);
H_abs = abs(H_fft);
figure(2);
plot(w, H_abs);
xlim([-25, 25]);
ylim([0,1]);
xlabel('rad/seconds');
ylabel('amplitude');
title('H abs vs w');

y_fft = x_fft.*H_fft;
y_ifft = ifft(fftshift(y_fft), N);
y = real(y_ifft);
t_y = (0:length(y)-1) * (1/Fs); 
figure(1);
subplot(2,2,3);
plot(t_y, y);
xlim([100,400]);
ylim([-2,2]);
xlabel('t/seconds');
ylabel('amplitude');
title('output signal y(t)');

b = [3];
a = [1 3];
y = lsim(b, a, x, t);
figure(1);
subplot(2,2,4);
plot(t, y);
xlim([100,400]);
ylim([-2,2]);
xlabel('t/seconds');
ylabel('amplitude');
title('output signal y(t)');