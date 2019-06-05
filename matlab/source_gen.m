close all
clear all
clc

in_image = imread('D:\Xilinx\Vivado\myprj\vision_top\matlab\in_image.png');

% figure(1);
% plot(in_image(1,:),'c-');grid on;hold on;
% plot(gau_image(1,:),'b-');hold off;
% dec2hex(in_image(2,end-30:end))
  dec2hex(in_image(1,1:45))
% dec2hex(in_image(end-1,1:30))

% dec2hex(in_image(end,end-45:end))

% aa=round(1134334/2^14)
% bb=[32727,4095,3839,3391,3087,2847,2607,2367,2063,2111,-32497,-32225,-31681];
% cc=round(bb/2^6)






% R=1080;
% C=1920;
% aa=zeros(R*C,1);
% 
% for i=1:64
%    % aa((i-1)*1920+1)=i;
%    aa(((i-1)*1920+1):((i-1)*1920+4))=(i:i+3);
%     
%    aa(i*1920)=i+64;
%     
% end
% 
% fid=fopen('D:\xilinx\Vivado\myprj\canny_tb\tb\test0.dat','w+');
% fprintf(fid,'%2x\n',aa);
% fclose ('all');


% bb=[1,2,3;4,5,6;6,7,9;2,4,1];
% cc=bb.';
% cc(:)


