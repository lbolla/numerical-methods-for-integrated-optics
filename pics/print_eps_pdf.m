function print_eps_pdf(str)
  
  print('-depsc2',[str '.eps']);  
  %print('-depsc',[str '.eps']);
  cmd = ['epstopdf ' str '.eps'];
  system(cmd);
