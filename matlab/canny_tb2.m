close all
clear all
clc
coeff=[6 59 128 59 6];
%fixed point algorithm for canny edge dector strategy...

% Read the image
%rgb_image = imread('aa.jpg');
rgb_image = imread('bb.jpg');
%[row column N]=size(rgb_image);

%rgb_rotate=imrotate(rgb_image,90);
%clear rgb_image

figure(1);
imshow(rgb_image);
title('origion:the bayer color image');
size(rgb_image)


%gray=0.2989 * R + 0.5870 * G + 0.1140 * B 
%gray=(1/4+1/32)*R...
OI=rgb2gray(rgb_image);  %please specified
figure(2);
imshow(OI);
%title('the grayed image');
size(OI)

%gray_bb=imwrite(OI,'gray_bb.png','Bitdepth',8);


%%gaussian filter 
h = 5; % size for gaussian filter
sig = 3.5; % sigma for gaussian filter
coeff=zeros(1,5);
%use Gaussian I * G
%G = fspecial('motion');
%G = fspecial('average',3);
 G = fspecial('gaussian',[h h],sig);

% coeff(1)=sum(abs(G(:,1)));
% G(:,1)=round(1024*G(:,1)/coeff(1));
% 
% coeff(2)=sum(abs(G(:,2)));
% G(:,2)=round(1024*G(:,2)/coeff(2));
% 
% coeff(3)=sum(abs(G(:,3)));
% G(:,3)=round(1024*G(:,3)/coeff(3));
% 
% coeff(4)=sum(abs(G(:,4)));
% G(:,4)=round(1024*G(:,4)/coeff(4));
% 
% coeff(5)=sum(abs(G(:,5)));
% G(:,5)=round(1024*G(:,5)/coeff(5));
% 
GI = imfilter(OI,G,'same');
figure(3);
imshow(GI), title('Smoothed Image');

%%canny algorithm
GI = double(GI);%type conversation

%%edge dector process
gx = [-1 0 1; %Sobel mask for xscale direction
      -2 0 2; 
      -1 0 1]; 

gy = [ 1  2  1; %Sobel mask for yscale direction
       0  0  0; 
      -1 -2 -1];
[M N]=size(GI); %#ok<*NCOMMA>

%dx = zeros(size(GI,1)-2, size(GI,2)-2);





DX = zeros(M-2, N-2);
DY = zeros(M-2, N-2);

for i = 1:M-2
    for j = 1:N-2
        DX(i,j) = (GI(i,j+2) + 2*(GI(i+1, j+2)) + GI(i+2,j+2))-(GI(i,j) + 2 * GI(i+1,j) + GI(i+2,j));
        DY(i,j) = ( GI(i+2,j) + 2 * GI(i+2, j+1) + 1 * GI(i+2,j+2)) - (GI(i,j) + 2 * GI(i,j+1) + GI(i,j+2));
    end
end




%line-buffer instance mustbe used...
Grad = zeros(M-2,N-2);
theta = zeros(M-2,N-2);
for i = 1:M-2
    for j = 1:N-2
        Grad(i,j) = sqrt(round((DX(i,j)^2 + DY(i,j)^2)/2^1));
        
        temp = atan2(DY(i,j), DX(i,j));
        
        if (pi/8 <= temp && temp < 3* pi/8)
            theta(i,j) =pi/4;
        elseif (3*pi/8 <= temp && temp < 5*pi/8)
            theta(i,j) = pi/2;
        elseif (5*pi/8 <= temp && temp < 7*pi/8)
            theta(i,j) = 3*pi/4;
        else
            theta(i,j) = 0;
        end
    end
end





%size(Grad)
figure(4);
imshow(Grad), title('Magnitude');

edgemat = zeros(size(Grad));
for i = 2:size(Grad,1) - 1
    for j = 2:size(Grad,2) - 1
        temp = theta(i-1,j-1);
        if (temp == 0)
            if ((Grad(i,j) > Grad(i,j-1)) && Grad(i,j) > Grad(i,j+1))
                edgemat(i,j) = Grad(i,j);
            else
                edgemat(i,j) = 0;
            end
        elseif (temp == pi/4) % 45 degrees
            if (Grad(i,j) > Grad(i-1,j+1) && Grad(i,j) > Grad(i+1,j-1))
                edgemat(i,j) = Grad(i,j);
            else
                edgemat(i,j) = 0;
            end
        elseif (temp == pi/2) % 90 degrees
            if (Grad(i,j) > Grad(i-1,j) && Grad(i,j) > Grad(i+1, j))
                edgemat(i,j) = Grad(i,j);
            else
                edgemat(i,j) = 0;
            end
        else %135 degrees
            if (Grad(i,j) > Grad(i-1,j-1) && Grad(i,j) > Grad(i+1, j+1))
                edgemat(i,j) = Grad(i,j);
            else
                edgemat(i,j) = 0;
            end
        end
    end
end

figure(5);
imshow(edgemat);

%Future:adjust automatically
ht =30;  %high threshold value
lt = 20; %low threshold vaue
%typical ratio is roughly ht/lt = 2;
hyst = zeros(M,N);
for i = 2:M-3
    for j = 2:N- 3
        %if (edgemat(i,j) > ht)
        %    hyst(i,j) = 1;
        %elseif (edgemat(i,j) < lt)
         %   hyst(i,j) = 0;
        %else
            %check neighboring pixels for connectivity
               %4 connected, for left, right, top and bottom
            if ( ...
                    (edgemat(i,j-1)   > ht) || ...
                    (edgemat(i-1,j)   > ht) || ...
                    (edgemat(i,j+1)   > ht) || ...
                    (edgemat(i+1,j)   > ht) || ...
                    (edgemat(i-1,j-1) > ht) || ...
                    (edgemat(i-1,j+1) > ht) || ...
                    (edgemat(i+1,j+1) > ht) || ...
                    (edgemat(i+1,j-1) > ht) ...
                    )
                hyst(i,j) = 1;
            else              
                hyst(i,j) = 0;
            end
    end
end

%str = sprintf('Hysteresis edges, low = %d, high = %d',lt, ht);
disp(['High Threshold=',num2str(ht)]);
disp(['Low  Threshold=',num2str(lt)]);

figure(6);
imshow(hyst);
