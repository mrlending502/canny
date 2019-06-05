close all
clear all
clc
R=1080;
L=1920;
dt_image=zeros(R,L);
dx_image=zeros(R,L);
dy_image=zeros(R,L);
grad_image=zeros(R,L);

fia=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\dest.dat','r+');
fib=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\dx.dat','r+');
fic=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\dy.dat','r+');
fid=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\grad.dat','r+');
  
%fid=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\image.dat','r+');
dt_temp=fscanf(fia,'%2x');
dx_temp=fscanf(fib,'%2x');
dy_temp=fscanf(fic,'%2x');
grad_temp=fscanf(fid,'%6x');
fclose('all');

for i=1:R
    dt_image(i,:)=dt_temp((i-1)*L+1:i*L);
    dx_image(i,:)=dx_temp((i-1)*L+1:i*L);
    dy_image(i,:)=dy_temp((i-1)*L+1:i*L);
    grad_image(i,:)=grad_temp((i-1)*L+1:i*L);
    
end
aa=mat2gray(dx_image);
bb=mat2gray(dy_image);
cc=mat2gray(grad_image);
dd=mat2gray(dt_image);

figure(1);
imshow(aa);
title('dx direction');
figure(2);
imshow(bb);
title('dy direction');
figure(3);
imshow(cc);
title('gradient after sqrt ipcore');

figure(4);
imshow(dd);
title('the image edge plot');
