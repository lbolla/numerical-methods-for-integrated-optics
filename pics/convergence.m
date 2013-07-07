function convergence

  if (0)
  
  where = '~/work/petsc_solver/data/2d/channel/unstructured/voronoi/lambda0/pml/';

  % GMRES
  
  what = 'gmres_none';
  output1 = load_data([where what]);
  what = 'gmres_jacobi';
  output2 = load_data([where what]);
  what = 'gmres_sor';
  output3 = load_data([where what]);
  what = 'gmres_eisenstat';
  output4 = load_data([where what]);
  what = 'gmres_asm';
  output5 = load_data([where what]);
  what = 'gmres_ilu';
  output6 = load_data([where what]);

  figure;
  semilogy(output1,'k','LineWidth',2);
  hold on;
  semilogy(output2,'r','LineWidth',2);
  semilogy(output3,'b','LineWidth',2);
  semilogy(output4,'g','LineWidth',2);
  semilogy(output5,'c','LineWidth',2);
  semilogy(output6,'y','LineWidth',2);
  hold off;
  title('GMRES'); xlabel('# iteration'); ylabel('residual'); xlim([0 10000]); ylim([1e-7 1]);
  legend('none','Jacobi','SOR','Eisenstat','ASM','ILU','Location', 'Best');
  print_eps_pdf('channel_convergence_gmres');

  % BCGS
  
  what = 'bcgs_none';
  output1 = load_data([where what]);
  what = 'bcgs_jacobi';
  output2 = load_data([where what]);
  what = 'bcgs_sor';
  output3 = load_data([where what]);
  what = 'bcgs_eisenstat';
  output4 = load_data([where what]);
  what = 'bcgs_asm';
  output5 = load_data([where what]);
  what = 'bcgs_ilu';
  output6 = load_data([where what]);

  figure;
  semilogy(output1,'k','LineWidth',2);
  hold on;
  semilogy(output2,'r','LineWidth',2);
  semilogy(output3,'b','LineWidth',2);
  semilogy(output4,'g','LineWidth',2);
  semilogy(output5,'c','LineWidth',2);
  semilogy(output6,'y','LineWidth',2);
  hold off;
  title('BiCGStab'); xlabel('# iteration'); ylabel('residual'); xlim([0 10000]); ylim([1e-7 1]);
  legend('none','Jacobi','SOR','Eisenstat','ASM','ILU','Location', 'Best');
  print_eps_pdf('channel_convergence_bicgstab');

  end
  
  if (1)
  
  where = '~/work/petsc_solver/data/3d/simple_waveguide/coarse/';

  % GMRES
  
  what = 'gmres_jacobi';
  output1 = load_data([where what]);
  what = 'gmres_ilu_1_damping_shift';
  output2 = load_data([where what]);

  figure;
  semilogy(output1,'k','LineWidth',2);
  hold on;
  semilogy(output2,'r','LineWidth',2);
  hold off;
  title('GMRES'); xlabel('# iteration'); ylabel('residual'); xlim([0 10000]); ylim([1e-5 1]);
  legend('Jacobi','ILU','Location','Best');
  print_eps_pdf('simple_waveguide_convergence_gmres');
  
  % QMR
  
  clear all;
  load ~/doc/my_doc/uniud/simple_waveguide/data/simple_waveguide.mat;
  semilogy(resvec,'k','LineWidth',2);
  title('QMR'); xlabel('# iteration'); ylabel('residual'); xlim([0 1000]); %ylim([1e-5 10]);
  print_eps_pdf('simple_waveguide_convergence_qmr');
  
  end
  
  
function output = load_data(str)
  
  cmd = ['zcat ' str '.out.gz | grep "KSP Residual norm" | cut -d "m" -f 2 > output'];
  system(cmd);
  load output;
  delete output;
