img=imread('images/lena.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('ԭʼͼ��','fontsize',15);
img2=imnoise(img,'salt & pepper',0.1);
subplot(2,2,2);
imshow(img2);
title('���뽷������ͼ��','fontsize',15);

h1=fspecial('gaussian',[3 3],1);%����һ��3*3ģ��ĸ�˹�˲���
img2=imfilter(img1,h1,'conv');
subplot(2,2,3);
imshow(img2,map);
title('Gaussian�˲���ͼ��','Fontsize',24);

img3=medfilt2(img1,[5 5]); 
subplot(2,2,4),imshow(img1,map);
title('��ֵ�˲���ͼ��','Fontsize',24);