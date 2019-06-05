close all
clear all
clc
N=5;
sigma=0.8;
coeff=coeff_gen(sigma,N);
weight=coeff(1:(N-1)/2+1);
disp('---------coefficient is as follows-----');
disp(['coeff == ',num2str(coeff)]);
disp('---------coefficient is end------------');

gray_image = imread('D:\xilinx\Vivado\myprj\canny_tb\matlab\in_image.png');
%figure(1);
%imshow(gray_image);
[R C]=size(gray_image); %

gaussian_image=zeros(R,C);


%Initial the image matrix memory for 1st row,2nd row,(R-1)th row,Rth row...

gaussian_image(1,:)=gray_image(1,:);
gaussian_image(2,:)=gray_image(2,:);
gaussian_image(R-1,:)=gray_image(R-1,:);
gaussian_image(R,:)=gray_image(R,:);
gaussian_image(2:R-2,1:2)=gray_image(2:R-2,1:2);
gaussian_image(2:R-2,C-1:C)=gray_image(2:R-2,C-1:C);

%algorhm running...
  for i=3:R-3
    for j=3:C-3
      temp_sum = zeros(1,3,'uint32');
      temp_add = zeros(1,10,'uint32');
      temp_add(1) = gray_image(i - 2, j - 2) + gray_image(i - 2, j + 2);
      temp_add(2) = gray_image(i - 1, j - 2) + gray_image(i - 1, j + 2);
      temp_add(3) = gray_image(i - 0, j - 2) + gray_image(i - 0, j + 2);
      temp_add(4) = gray_image(i + 1, j - 2) + gray_image(i + 1, j + 2);
      temp_add(5) = gray_image(i + 2, j - 2) + gray_image(i + 2, j + 2);

      temp_add(6) = gray_image(i - 2, j - 1) + gray_image(i - 2, j + 1);
      temp_add(7) = gray_image(i - 1, j - 1) + gray_image(i - 1, j + 1);
      temp_add(8) = gray_image(i - 0, j - 1) + gray_image(i - 0, j + 1);
      temp_add(9) = gray_image(i + 1, j - 1) + gray_image(i + 1, j + 1);
      temp_add(10)= gray_image(i + 2, j - 1) + gray_image(i + 2, j + 1);

      temp_sum(1) = (temp_add(1) + temp_add(5))*coeff(1) + (temp_add(6) + temp_add(10))*coeff(2) + uint32(gray_image(i - 2, j) + gray_image(i + 2, j))*coeff(3);
      temp_sum(2) = (temp_add(2) + temp_add(4))*coeff(1) + (temp_add(7) + temp_add(9))*coeff(2) + uint32(gray_image(i - 1, j) + gray_image(i + 1, j))*coeff(3);
      temp_sum(3) = (temp_add(3))*coeff(1) + temp_add(8)*coeff(2) + uint32(gray_image(i,j))*coeff(3);

      temp_sum(1)=floor(temp_sum(1)/2^14);
      temp_sum(2)=floor(temp_sum(2)/2^14);
      temp_sum(3)=floor(temp_sum(3)/2^14);
      
           
      sumval = temp_sum(1) * coeff(1) + temp_sum(2) * coeff(2) + temp_sum(3) * coeff(3);
      sumval=round(sumval/2^10);
%        if (sumval > 180)   %saturature processing...
%          val = 255;
%        else
%          val = sumval;
%        end
      gaussian_image(i, j) = sumval;
       
    end
  end

 
% figure(1);
% imshow(gray_image);
% 
% figure(2);
%imwrite(extend_image,'extend.png');
%
%gau_image=mat2gray(gaussian_image);
 
figure(2);
imshow(gaussian_image);

