clc;clear;
[img,map]=imread('images/lena.bmp');
img=double(img); 
F=fftshift(fft2(img)); % ԭͼ�ĸ���Ҷ��F
[M,N]=size(F); 
figure(1);
subplot(1,2,1);imshow(img,map);title('ԭʼͼ��','Fontsize',24) ;
% (b)ģ��lenaͼ��45�ȷ���T=1��
u=1:M;v=1:N; 
[u,v]=meshgrid(u,v); % ��������ռ�
a=0.05;b=0.05;T=1; % ����a,b,T��ֵ
s=(u-M/2-1).*a+(v-N/2-1).*b+eps; 
H=T.*sin(pi.*s).*exp(-1i.*pi.*s)./(pi.*s); % ����˻�����H
G=H'.*F; % ����˻���ͼ��Ĺ�����G
g=abs(ifft2(G)); % ����˻���ͼ��
subplot(1,2,2);imshow(g,map);title('ģ���˻�ͼ��','Fontsize',24);
% (c)��ģ����lenaͼ�������Ӹ�˹��������ֵ=0 ������=10 pixels �Բ���ģ��ͼ��
noise=10*imnoise(zeros(M,N),'gaussian',0,10); % ���ɸ�˹���� 
figure(2);
subplot(1,2,1);imshow(noise,[]);title('��˹������','Fontsize',24) ;
g=g+noise; 
subplot(1,2,2);imshow(g,map);title('ģ���˻�+��˹����ͼ��','Fontsize',24);
% (d)�ֱ����÷��� Eq. (5.8-6)��(5.9-4)���ָ�ͼ��
% ά���˲��ָ�
Sn=fftshift(fft2(noise)); % �����Ĺ�����
K=Sn.*conj(Sn)./(F.*conj(F)); % ����Kֵ=����������/δ�˻�����������  
W=(H.*conj(H))'.*G./(H.*(H.*conj(H)+K'))'; % ���ù�ʽ5.8-6����ά���˲�,������ָ�ͼ������W
wiener=abs(ifft2(W)); 
figure(3);
subplot(1,2,1);imshow(wiener,map);title('ά���˲��ָ�ͼ��','Fontsize',24);
% Լ����С���˷��˲�
p=[0,-1,0;-1,4,-1;0,-1,0]; % p����
P=psf2otf(p,[M,N]); % ����Ҷ�任��MxN��С
gama=0.00001;
Y=conj(H).*G./(H.*conj(H)+gama*P.*conj(P)); 
subplot(1,2,2);imshow(abs(ifft2(Y)),map);title('Լ����С���˷��˲��ָ�ͼ��','Fontsize',24);