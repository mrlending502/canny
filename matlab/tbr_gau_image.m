close all
clear all
clc;
row=1080;
col=1920;
error=zeros(row*col,1);
in_temp=zeros(row*col,1);
gau_temp=zeros(row*col,1);

fic=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\image.dat','r+');
fid=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\gau_image.dat','r+');

in_temp=fscanf(fic,'%2x');
gau_temp=fscanf(fid,'%2x');
fclose('all');

disp('-------------------------------------------------');
disp(['the inputing length=',num2str(length(in_temp))]);
disp(['the outputing length=',num2str(length(gau_temp))]);
disp('--------------------------------------------------');

error=gau_temp-in_temp;

figure(1);
plot(in_temp,'b-');grid on;
legend('the inputing data');

figure(2);
plot(gau_temp,'g-');grid on;
legend('the gaussian data');

figure(3);
plot(error,'c-');grid on;
title('error curve');
legend('error matching');









