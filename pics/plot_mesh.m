clear all;
close all;

if (0)

filename = '~/work/photond/work/meshes/channel/unstructured/mesh.txt';
fid = fopen(filename);

N = fscanf(fid,'%d',3);
str = fgetl(fid);

disp 'loading nodes...';
P = zeros(2,N(1));
for ii = 1:N(1)
  str = fgetl(fid);
  P(:,ii) = sscanf(str,'%f',2);
end

disp 'loading edges...';
E = zeros(2,N(2));
for ii = 1:N(2)
  str = fgetl(fid);
  E(:,ii) = sscanf(str,'%d',2);
end
E = E + 1;

disp 'loading triangles...';
T = zeros(3,N(3));
for ii = 1:N(3)
  str = fgetl(fid);
  T(:,ii) = sscanf(str,'%d',3);
end
T = T + 1;

fclose(fid);

disp 'done.';

figure;
pdemesh(P,E,T);
axis equal;
axis tight;

for ii = -2:6
  for jj = -9:3
    if jj == -3
      continue;
    end
    rectangle('Position',[(ii+mod(jj,2)/2)/2+1.575 jj/2*sqrt(3)/2+4.125 0.35 0.35],'Curvature',[1 1],'LineWidth',3);
  end
end
line([0.075 0.075],[0 6],'LineWidth',3,'Color','b');
line([5.750 5.750],[0 6],'LineWidth',3,'Color','g');
print_eps_pdf('mesh_channel');

end

if (1)

filename = '~/work/photond/work/meshes/uniud/coarse/mesh.txt';
fid = fopen(filename);

N = fscanf(fid,'%d',3);
str = fgetl(fid);

disp 'loading nodes...';
P = zeros(2,N(1));
for ii = 1:N(1)
  str = fgetl(fid);
  P(:,ii) = sscanf(str,'%f',2);
end

disp 'loading edges...';
E = zeros(2,N(2));
for ii = 1:N(2)
  str = fgetl(fid);
  E(:,ii) = sscanf(str,'%d',2);
end
E = E + 1;

disp 'loading triangles...';
T = zeros(3,N(3));
for ii = 1:N(3)
  str = fgetl(fid);
  T(:,ii) = sscanf(str,'%d',3);
end
T = T + 1;

fclose(fid);

disp 'done.';

figure;
pdemesh(P,E,T);
axis equal;
axis tight;
zlim([-0.5 0.5]);
view(3);
print_eps_pdf('simple_waveguide_mesh');

end