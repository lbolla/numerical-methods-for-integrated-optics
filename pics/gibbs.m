n = 100; t = linspace(-1,1,3*n);
x = zeros(size(t));
x(find(abs(t)<1/2)) = 1;
X = fft(x);
X(end/2-n:end/2+n) = 0;
y = ifft(X);

figure;
plot(t,abs(x),'k',t,abs(y),'r');
legend('step function','truncated Fourier series','Location','Best');
set(gca,'FontSize',20);
print_eps_pdf('gibbs');
