clc; 
clear;
img=imread('images/lena.bmp');
img=double(img);  
F=fftshift(fft2(img));
[M,N]=size(F); 
figure(1);
imshow(img,[]);
title('ԭʼ��ͼ��') ;
figure(2);
imshow(abs(F),[0,250000]);
title('ԭʼ��ͼ��Ƶ��');
m=1:M; 
m1=1:N; 
[m,m1]=meshgrid(m,m1);%��������ռ� 
noise=20.*imnoise(zeros(M,N),'gaussian',0,0.008);%��˹���� 
figure(3);  
subplot(1,2,1);
imshow(noise,[]);
title('������') ;
a=double(21/100);%x���������ƶ���Ϊra��0.21��,�ɵ� 
b=double(21/100);%y���������ƶ���Ϊca��0.21��,�ɵ� 
t=double(88/100);%�ƶ�����������ʱ��Ĭ��Ϊ0.88
f=ones(M,N);   
g=(m-M/2-1).*a+(m1-N/2-1).*b+eps;   
f=t.*sin(pi.*g).*exp(-j.*pi.*g)./(pi.*g);
h=f'.*F; 
tu=ifft2(h);  
tu=abs(tu)+noise; 
subplot(1,2,2);
imshow(tu,[]);
title('�˻���ͼ��')%ԭͼ����Ҷ�任����ֵ 
F=h./f'; 
figure(4)
subplot(1,2,1);
imshow(abs(ifft2(F)),[]);
title('���˲��Ľ��');
h=fftshift(fft2(tu));
x=fftshift(fft2(noise));
K=x.*conj(x)./(F.*conj(F));%����Kֵ  
w=(f.*conj(f))'.*h./(f.*(f.*conj(f)+K'))'; 
weina=abs(ifft2(w)); 
subplot(1,2,2);
imshow(weina,[]);
title('ά���˲��Ľ��');