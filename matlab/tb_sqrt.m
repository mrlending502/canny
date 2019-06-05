close all
clear all
clc
AW=12;
nfft=2^AW;
aa=round(sqrt(0:nfft-1));
figure(1);
plot(aa,'r-');grid on;
disp(['the length of sqrt vector is == ',num2str(length(aa))]);
legend('the theory value with look-up table style');
dec2hex(aa,2)
% bb=max(aa);
% bb=round((2^AW-1)*aa/bb);
% figure(2);
% plot(bb,'b-');grid on;
% legend('the quantification value');

% cc=aa-bb;
% figure(3);
% plot(cc,'g-');grid on;
% legend('the error value');
