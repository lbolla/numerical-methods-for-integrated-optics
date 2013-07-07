function plot_matrix
  
  if (0)
    
  where = '~/work/petsc_solver/data/2d/channel/unstructured/voronoi/lambda0/pml/';
  load([where 'M']);
  M = sparse(M(:,3),M(:,4),M(:,1)+i*M(:,2));
  figure;
  spy(M);
  print_eps_pdf('channel_M');

  end
  
  if (1)
  
  where = '~/work/petsc_solver/data/3d/simple_waveguide/coarse/';
  load([where 'M']);
  M = sparse(M(:,3),M(:,4),M(:,1)+i*M(:,2));
  figure;
  spy(M);
  print_eps_pdf('simple_waveguide_M');

  end