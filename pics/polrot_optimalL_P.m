sw = [380 480 680 850 1080 1280] - 300;
ol = [1.6 3.2 8 14 32 61];

ssw = (380:1280) - 300;
[P,S] = polyfit(sw,ol,3);
ool = polyval(P,ssw);

exp_sw = [380 1080];
exp_ol = [1.6 30];

plot(300+sw,ol,'ro',300+ssw,ool,'k-',exp_sw,exp_ol,'bx','LineWidth',2,'MarkerSize',10);
legend('3D-FDTD','cubic fit','experimental','Location','Best');
xlabel('Semiconductor width [nm]');
ylabel('Optimal length [\mu m]');

print_eps_pdf('polrot_optimalL_P');