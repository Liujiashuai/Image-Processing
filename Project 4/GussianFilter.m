% ��˹�˲�
[img,map]=imread('images/test2.tif','tif');

subplot(2,2,1);
imshow(img,map);
title('test2ԭʼͼ��','Fontsize',24);

h1=fspecial('gaussian',[3 3],1);%����һ��3*3ģ��ĸ�˹�˲���
img1=imfilter(img,h1,'conv');
subplot(2,2,2);
imshow(img1,map);
title('test2��˹�˲�ƽ��(ģ��3x3)','Fontsize',24);

h2=fspecial('gaussian',[5 5],1);%����һ��5*5ģ��ĸ�˹�˲���
img2=imfilter(img,h2,'conv');
subplot(2,2,3);
imshow(img2,map);
title('test2��˹�˲�ƽ��(ģ��5x5)','Fontsize',24);

h3=fspecial('gaussian',[7 7],1);%����һ��7*7ģ��ĸ�˹�˲���
img3=imfilter(img,h3,'conv');
subplot(2,2,4);
imshow(img2,map);
title('test1��˹�˲�ƽ��(ģ��7x7)','Fontsize',24);