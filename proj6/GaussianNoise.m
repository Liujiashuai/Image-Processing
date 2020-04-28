[img,map]=imread('images/lena.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('ԭʼͼ��','Fontsize',24);
img1=imnoise(img,'gaussian',0,0.01);
subplot(2,2,2);
imshow(img1,map);
title('����Gaussian����ͼ��','Fontsize',24);

h1=fspecial('average',[3 3]); % ����һ��3*3ģ��ĸ�˹�˲���
img2=imfilter(img1,h1,'conv');
subplot(2,2,3);
imshow(img2,map);
title('��ֵ�˲���ͼ��','Fontsize',24);

img3=medfilt2(img1,[3 3]); 
subplot(2,2,4),imshow(img1,map);
title('��ֵ�˲���ͼ��','Fontsize',24);