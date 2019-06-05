close all
clear all
clc
R=1080;
L=1920;
gau_image=zeros(R,L);

fid=fopen('D:\Xilinx\Vivado\myprj\vision_top\tb\dest.dat','r+');
in_temp=fscanf(fid,'%2x');








fclose('all');


for i=1:R
    gau_image(i,:)=in_temp((i-1)*L+1:i*L);
end

aa=mat2gray(gau_image);

figure(1);
imshow(aa);
title('canny total Result');
