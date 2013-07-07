clear all; close all;

load ~/work/petsc_solver/data/2d/channel/unstructured/voronoi/lambda0/pml/eigvals.mat;
tmp1 = eigMv;
clear eig*;

load ~/work/petsc_solver/data/2d/channel/unstructured/voronoi/2lambda0/pml/eigvals.mat;
tmp2 = eig;
clear eig*;

load ~/work/petsc_solver/data/2d/channel/structured/voronoi/2lambda0/pml/eigvals.mat;
tmp3 = eig;
clear eig*;

load ~/work/petsc_solver/data/2d/channel/structured/voronoi/2lambda0/nopml/eigvals.mat;
tmp4 = eig;
if isreal(tmp4)
  tmp4 = tmp4 + j*1e-8*ones(size(tmp4));
end
clear eig*;

load ~/work/petsc_solver/data/2d/channel/unstructured/baricentric/lambda0/pml/eigvals.mat;
tmp5 = eig;
clear eig*;

load ~/work/petsc_solver/data/2d/channel/structured/baricentric/lambda0/eigvals.mat;
tmp6 = eigMb;
clear eig*;

load ~/work/petsc_solver/data/2d/channel/unstructured/voronoi/lambda0/nopml/eigvals.mat;
tmp7 = [eigSM;eigLM];
if isreal(tmp7)
  tmp7 = tmp7 + j*1e-8*ones(size(tmp7));
end
clear eig*;

% bella!
% eigval lambda piu' lontani, perche' per lambda piccole il problema e'
% piu' indefinito -> piu' difficile
figure(1);
plot(tmp1,'ro');
hold on;
plot(tmp2,'b*');
hold off;
title('unstructured Voronoï dual grid');
xlabel('Real'); ylabel('Imag');
legend('\lambda','2\lambda','Location','Best');
print -depsc2 eigvals_lambda.eps
system('epstopdf eigvals_lambda.eps');

% bella!
% eigval unstructured piu' vicini tra loro
figure(2);
plot(tmp2,'ro');
hold on;
plot(tmp3,'b*');
hold off;
title('Voronoï dual grid');
xlabel('Real'); ylabel('Imag');
legend('unstructured','structured','Location','Best');
print -depsc2 eigvals_unstructured.eps
system('epstopdf eigvals_unstructured.eps');

% figure(3);
% plot(tmp3,'ro');
% hold on;
% plot(tmp4,'b*');
% hold off;
% title('structured');
% xlabel('Real'); ylabel('Imag');
% legend('pml','nopml','Location','Best');

% figure(4);
% plot(tmp1,'ro');
% hold on;
% plot(tmp5,'b*');
% hold off;
% title('unstructured');
% xlabel('Real'); ylabel('Imag');
% legend('Voronoi','Poincare','Location','Best');

% figure(5);
% plot(tmp5,'ro');
% hold on;
% plot(tmp6,'b*');
% hold off;
% title('Poincare');
% xlabel('Real'); ylabel('Imag');
% legend('unstructured','structured','Location','Best');

% bella!
% senza pml eigvals tutti reali
figure(6);
plot(tmp1,'ro');
hold on;
plot(tmp7,'b*');
hold off;
title('unstructured Voronoï dual grid');
xlabel('Real'); ylabel('Imag');
legend('pml','nopml','Location','Best');
print -depsc2 eigvals_pml.eps
system('epstopdf eigvals_pml.eps');
