close all
clear all
clc
lthreshold=20;
hthreshold=80;

gray_image = imread('D:\Xilinx\Vivado\myprj\vision_top\matlab\in_image.png');
%figure(1);
%imshow(gray_image);
%gray_image=gray_image;
[R C]=size(gray_image);%
dx=zeros(R,C);
dy=zeros(R,C);
grad=zeros(R,C);

g1=zeros(R,C);
g2=zeros(R,C);
g3=zeros(R,C);
g4=zeros(R,C);
dtemp1=zeros(R,C);
dtemp2=zeros(R,C);

%image(1,1:10)
%image(2,1:10)
%image(3,1:10)
%image(4,1:10)
%image(5,1:10)
%image(6,1:10)

%  * X-Gradient Computation
%  ***************
%  * -------------
%  * |-1  0 1|
%  * |-2  0 2|
%  * |-1  0 1|
%  * -------------
%  *
%  * Y-Gradient Computation
%  * -------------
%  * | 1   2   1|
%  * | 0   0   0|
%  * |-1  -2  -1|
%  * -------------
%  ***************

% sobel algorithm...(3x3 style)
dx(1,:)=zeros(1,C);
dx(R,:)=zeros(1,C);
dx(:,1)=zeros(R,1);
dx(:,C)=zeros(R,1);

dy(1,:)=zeros(1,C);
dy(R,:)=zeros(1,C);
dy(:,1)=zeros(R,1);
dy(:,C)=zeros(R,1);

for i = 2:R-1
    for j = 2:C-1
        dx(i,j) = (gray_image(i-1,j+1)-gray_image(i-1,j-1)+gray_image(i+1,j+1)-gray_image(i+1,j-1)+2*gray_image(i,j+1)-2*gray_image(i,j-1))/2^1;
        dy(i,j) = (gray_image(i-1,j-1)-gray_image(i+1,j-1)+gray_image(i-1,j+1)-gray_image(i+1,j+1)+2*gray_image(i-1,j)-2*gray_image(i+1,j+1))/2^1;
    end
end

% Gradient calculation
for i=1:R
    for j=1:C
        grad(i,j)=dx(i,j)*dx(i,j)+dy(i,j)*dy(i,j);
        
        grad(i,j)=uint16(sqrt(grad(i,j)));
        
    end
end

%grad=uint16(grad);
%class(grad);

figure(1);
imshow(dx);
title('dx image');
figure(2);
imshow(dy);
title('dy image');
figure(3);
imshow(grad);
title('grad image');

dx_fid=fopen('D:\xilinx\Vivado\myprj\vision_top\tb\dxx.dat','w+');
dy_fid=fopen('D:\xilinx\Vivado\myprj\vision_top\tb\dyy.dat','w+');
grad_fid=fopen('D:\xilinx\Vivado\myprj\vision_top\tb\gradd.dat','w+');

fprintf(dx_fid,'%2x\n',dx);
fprintf(dy_fid,'%2x\n',dy);
fprintf(grad_fid,'%2x\n',grad);
fclose ('all');


% for i=2:R-1
%     for j=2:C-1
%        if((dx(i,j)*dy(i,j))<=0 & abs(dx(i,j))<abs(dy(i,j)))
%         g1(i,j)=grad(i+1,j-1);
%         g2(i,j)=grad(i+1,j);
%         g3(i,j)=grad(i-1,j);
%         g4(i,j)=grad(i-1,j+1);
%         dtemp1(i,j)=(g1(i,j)+g2(i,j))/2;
%         dtemp2(i,j)=(g3(i,j)+g4(i,j))/2;
%        elseif((dx(i,j)*dy(i,j))<=0 & abs(dx(i,j))>abs(dy(i,j)))
%          g1(i,j)=grad(i+1,j-1);
%          g2(i,j)=grad(i,j-1);
%          g3(i,j)=grad(i,j+1);
%          g4(i,j)=grad(i-1,j+1);
%          dtemp1(i,j)=(g1(i,j)+g2(i,j))/2;
%          dtemp2(i,j)=(g3(i,j)+g4(i,j))/2;
%         elseif((dx(i,j)*dy(i,j))>=0 & abs(dx(i,j))<abs(dy(i,j)))
%           g1(i,j)=grad(i+1,j);
%           g2(i,j)=grad(i+1,j+1);
%           g3(i,j)=grad(i-1,j);
%           g4(i,j)=grad(i-1,j-1);
%           dtemp1(i,j)=(g1(i,j)+g2(i,j))/2;
%           dtemp2(i,j)=(g3(i,j)+g4(i,j))/2;
%        else
%           if((dx(i,j)*dy(i,j))>=0 & abs(dx(i,j))>abs(dy(i,j)))
%           g1(i,j)=grad(i+1,j+1);
%           g2(i,j)=grad(i,j+1);
%           g3(i,j)=grad(i,j-1);
%           g4(i,j)=grad(i-1,j-1);
%           dtemp1(i,j)=(g1(i,j)+g2(i,j))/2;
%           dtemp2(i,j)=(g3(i,j)+g4(i,j))/2;
%        end
%                                   
%     end
% end

%searching strategy...


% for i=2:R-1
%     for j=2:C-1
%          if ( ...
%                     (grad(i,j-1)   > hthreshold) || ...
%                     (grad(i-1,j)   > hthreshold) || ...
%                     (grad(i,j+1)   > hthreshold) || ...
%                     (grad(i+1,j)   > hthreshold) || ...
%                     (grad(i-1,j-1) > hthreshold) || ...
%                     (grad(i-1,j+1) > hthreshold) || ...
%                     (grad(i+1,j+1) > hthreshold) || ...
%                     (grad(i+1,j-1) > hthreshold) ...
%                     )
%                 gray_image(i,j) = 255;
%             %else              
%             %    gray_image(i,j) = 0;
%         end
%             
%    end 
% end

% for i=2:R-1
%     for j=2:C-1
%              if ( (gray_image(i,j)==255) && ((grad(i,j-1) > dtemp1(i,j-1)    || grad(i,j-1)    > dtemp2(i,j-1))))    gray_image(i,j-1)=255;
%          elseif ( (gray_image(i,j)==255) && ((grad(i-1,j) > dtemp1(i-1,j)    || grad(i-1,j)    > dtemp2(i-1,j))))    gray_image(i-1,j)=255;
%          elseif ( (gray_image(i,j)==255) && ((grad(i,j+1) > dtemp1(i,j+1)    || grad(i,j+1)    > dtemp2(i,j+1))))    gray_image(i,j+1)=255;
%          elseif ( (gray_image(i,j)==255) && ((grad(i+1,j) > dtemp1(i+1,j)    || grad(i+1,j)    > dtemp2(i+1,j))))    gray_image(i+1,j)=255;   
%          elseif ( (gray_image(i,j)==255) && ((grad(i-1,j-1)> dtemp1(i-1,j-1) || grad(i-1,j-1)  > dtemp2(i-1,j-1))))  gray_image(i-1,j-1)=255;   
%          elseif ( (gray_image(i,j)==255) && ((grad(i-1,j+1)> dtemp1(i-1,j+1) || grad(i-1,j+1)  > dtemp2(i-1,j+1))))  gray_image(i-1,j+1)=255;   
%          elseif ( (gray_image(i,j)==255) && ((grad(i+1,j+1)> dtemp1(i+1,j+1) || grad(i+1,j+1)  > dtemp2(i+1,j+1))))  gray_image(i+1,j+1)=255;   
%          elseif ( (gray_image(i,j)==255) && ((grad(i+1,j-1)> dtemp1(i+1,j-1) || grad(i+1,j-1)  > dtemp2(i+1,j-1))))  gray_image(i+1,j-1)=255;            
%          end
%     end
% end


% for i=2:R-1
%     for j=2:C-1
%          if ( (gray_image(i,j)==255) && ((grad(i,j-1) > dtemp1(i,j-1)    || grad(i,j-1)    > dtemp2(i,j-1))))    gray_image(i,j-1)=255;  else gray_image(i,j-1)=0;end
%          if ( (gray_image(i,j)==255) && ((grad(i-1,j) > dtemp1(i-1,j)    || grad(i-1,j)    > dtemp2(i-1,j))))    gray_image(i-1,j)=255;  else gray_image(i-1,j)=0;end
%          if ( (gray_image(i,j)==255) && ((grad(i,j+1) > dtemp1(i,j+1)    || grad(i,j+1)    > dtemp2(i,j+1))))    gray_image(i,j+1)=255;  else gray_image(i,j+1)=0;end
%          if ( (gray_image(i,j)==255) && ((grad(i+1,j) > dtemp1(i+1,j)    || grad(i+1,j)    > dtemp2(i+1,j))))    gray_image(i+1,j)=255;  else gray_image(i+1,j)=0;end   
%          if ( (gray_image(i,j)==255) && ((grad(i-1,j-1)> dtemp1(i-1,j-1) || grad(i-1,j-1)  > dtemp2(i-1,j-1))))  gray_image(i-1,j-1)=255;else gray_image(i-1,j-1)=0;end   
%          if ( (gray_image(i,j)==255) && ((grad(i-1,j+1)> dtemp1(i-1,j+1) || grad(i-1,j+1)  > dtemp2(i-1,j+1))))  gray_image(i-1,j+1)=255;else gray_image(i-1,j+1)=0;end   
%          if ( (gray_image(i,j)==255) && ((grad(i+1,j+1)> dtemp1(i+1,j+1) || grad(i+1,j+1)  > dtemp2(i+1,j+1))))  gray_image(i+1,j+1)=255;else gray_image(i+1,j+1)=0;end   
%          if ( (gray_image(i,j)==255) && ((grad(i+1,j-1)> dtemp1(i+1,j-1) || grad(i+1,j-1)  > dtemp2(i+1,j-1))))  gray_image(i+1,j-1)=255;else gray_image(i+1,j-1)=0;end            
%     end
% end

% for i=2:R-1
%     for j=2:C-1
%          if ( ...
%                (grad(i,j-1)   > dtemp1(i,j-1)  || grad(i,j-1)  > dtemp2(i,j-1))  || ...
%                (grad(i-1,j)   > dtemp1(i-1,j)  || grad(i-1,j)  > dtemp2(i-1,j))  ||...
%                (grad(i,j+1)   > dtemp1(i,j+1)  || grad(i,j+1)  > dtemp2(i,j+1))  || ...
%                (grad(i+1,j)   > dtemp1(i+1,j)  || grad(i+1,j)  > dtemp2(i+1,j))  ||...
%                (grad(i-1,j-1) > dtemp1(i-1,j-1)|| grad(i-1,j-1)> dtemp2(i-1,j-1))|| ...
%                (grad(i-1,j+1) > dtemp1(i-1,j+1)|| grad(i-1,j+1)> dtemp2(i-1,j+1))|| ...
%                (grad(i+1,j+1) > dtemp1(i+1,j+1)|| grad(i+1,j+1) >dtemp2(i+1,j+1))|| ...
%                (grad(i+1,j-1) > dtemp1(i+1,j-1)|| grad(i+1,j-1) >dtemp2(i+1,j-1)) ...
%                )
%                gray_image(i,j) = 180;
%          else
%                gray_image(i,j)=0;
%          end
%     end
% end
% 
% for i=2:R-1
%     for j=2:C-1
%        if(grad(i,j)> hthreshold) && (gray_image(i,j)>=180)
%            gray_image(i,j)=255;
%        else
%            gray_image(i,j)=0;
%        end
%         
%     end
% end
% 
% figure(4);
% imshow(gray_image);
% title('before search gray image');
