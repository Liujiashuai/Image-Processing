% �ڶ���
clc;clear;
img=imread('images/lena.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('ԭʼͼ��','fontsize',24);
img1=imnoise(img,'salt & pepper',0.1);
subplot(2,2,2);
imshow(img1);
title('���뽷������ͼ��','fontsize',24);

h1=fspecial('average',[3 3]); % ����һ��3*3ģ��ľ�ֵ�˲���
img2=imfilter(img1,h1,'conv');
subplot(2,2,3);
imshow(img2);
title('��ֵ�˲���ͼ��','Fontsize',24);

img3=medfilt2(img1,[5 5]); % 5*5ģ�����ֵ�˲�
subplot(2,2,4),imshow(img3);
title('��ֵ�˲���ͼ��','Fontsize',24);