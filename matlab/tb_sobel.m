close all
clear all
clc
R=1080;
L=1920;
gau_image=zeros(R,L);

dx_fid=fopen('D:\Xilinx\Vivado\myprj\vision_top\tb\dx.dat','r+');
dy_fid=fopen('D:\Xilinx\Vivado\myprj\vision_top\tb\dy.dat','r+');
grad_fid=fopen('D:\Xilinx\Vivado\myprj\vision_top\tb\grad.dat','r+');
canny_fid=fopen('D:\Xilinx\Vivado\myprj\vision_top\tb\dest.dat','r+');


dx=fscanf(dx_fid,'%2x');
dy=fscanf(dy_fid,'%2x');
grad=fscanf(grad_fid,'%6x');
canny=fscanf(canny_fid,'%2x');


fclose('all');


for i=1:R-1
    dx_reg(i,:)=dx((i-1)*L+1:i*L);
    dy_reg(i,:)=dy((i-1)*L+1:i*L);
    grad_reg(i,:)=grad((i-1)*L+1:i*L);
    canny_reg(i,:)=canny((i-1)*L+1:i*L);
end

dx_mat=mat2gray(dx_reg);
dy_mat=mat2gray(dy_reg);
grad_mat=mat2gray(grad_reg);
canny_mat=mat2gray(canny_reg);

figure(1);
imshow(dx_mat);
title('dx gradient direction');


figure(2);
imshow(dy_mat);
title('dy gradient direction');

figure(3);
imshow(grad_mat);
title('grad totel direction');


figure(4);
imshow(canny_mat);
title('canny result');


