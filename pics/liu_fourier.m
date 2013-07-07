function liu_fourier

theta = linspace(0,2*pi,100);

N = 20;
c_u   = num_vp_u(theta,N);
c_cs  = num_vp_cs(theta,N);
c_us  = num_vp_us(theta,N);
c_hex = num_vp_hex_us(theta,N);

figure(1);
plot(theta,c_u,'r-.',theta,c_cs,'g--',theta,c_us,'k-');
xlim([0 2*pi]);
ylim([0.975 1.0]);
xlabel('\theta [rad]');
ylabel('c*/c');
legend('unstaggered','colocated staggered','uncolocated staggered','Location','SouthEast');
title('Normalized numerical phase speed - N = 20');
print -depsc2 liu_fourier_fig3.eps
system('epstopdf liu_fourier_fig3.eps');

figure(6);
plot(theta,c_us,'k-',theta,c_hex,'b--');
xlim([0 2*pi]);
ylim([0.99 1.0]);
xlabel('\theta [rad]');
ylabel('c*/c');
legend('Cartesian grid','hexagonal grid','Location','SouthEast');
title('Normalized numerical phase speed - N = 20');
print -depsc2 liu_fourier_fig6.eps
system('epstopdf liu_fourier_fig6.eps');

N = 128;
c_u   = num_vp_u(theta,N);
c_cs  = num_vp_cs(theta,N);
c_us  = num_vp_us(theta,N);
c_hex = num_vp_hex_us(theta,N);
figure(2); polar(theta,c_u,'r-.'); hold on;
figure(3); polar(theta,c_cs,'g--'); hold on;
figure(4); polar(theta,c_us,'k-'); hold on;
figure(5); polar(theta,c_hex,'b--'); hold on;

NN = [2,4,8,16];
for N = NN
  c_u   = num_vp_u(theta,N);
  c_cs  = num_vp_cs(theta,N);
  c_us  = num_vp_us(theta,N);
  c_hex = num_vp_hex_us(theta,N);
  figure(2); polar(theta,c_u,'r-.');
  figure(3); polar(theta,c_cs,'g--');
  figure(4); polar(theta,c_us,'k-');
  figure(5); polar(theta,c_hex,'b--');
end
figure(2); hold off; print -depsc2 liu_fourier_fig2a.eps; system('epstopdf liu_fourier_fig2a.eps');
figure(3); hold off; print -depsc2 liu_fourier_fig2b.eps; system('epstopdf liu_fourier_fig2b.eps');
figure(4); hold off; print -depsc2 liu_fourier_fig2c.eps; system('epstopdf liu_fourier_fig2c.eps');
figure(5); hold off; print -depsc2 liu_fourier_fig5b.eps; system('epstopdf liu_fourier_fig5b.eps');





function c = num_vp_u(theta,N)
% unstaggered
  c = N/pi/2*sqrt(sin(2*pi*cos(theta)/N).^2 + sin(2*pi*sin(theta)/N).^2);

function  c = num_vp_cs(theta,N)
% colocated staggered  
  c = N/pi*sqrt(cos(pi*sin(theta)/N).^2.*sin(pi*cos(theta)/N).^2 + cos(pi*cos(theta)/N).^2.*sin(pi*sin(theta)/N).^2);

function c = num_vp_us(theta,N)
% uncolocated staggered  
  c = N/pi*sqrt(sin(pi*cos(theta)/N).^2 + sin(pi*sin(theta)/N).^2);

function c = num_vp_hex_us(theta,N)
% uncolocated staggered hexagonal
  c = 1-(pi^2/(8*N^2) - (7/1152 + 1/720 * cos(6*theta))*pi^4/N^4);
