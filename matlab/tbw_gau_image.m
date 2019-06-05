close all
clear all
clc
   
gau_image = imread('D:\opencv\myproject\tb_canny\gau_image.png');

[row,col]=size(gau_image);
gau_temp=zeros(row*col,1);
in_temp=zeros(row*col,1);
gau_image_reg=zeros(col,row);
disp(['the image total element ',num2str(row*col)]);


gau_image_reg=gau_image';
gau_temp=gau_image_reg(:);

fid=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\gau_image.dat','w+');
fprintf(fid,'%2x\n',gau_temp);
fclose('all');

