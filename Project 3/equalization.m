%ֱ��ͼ���⻯
[img,map]=imread('images/lena.bmp');
map(end:255,:)=0;
img_eq=histeq(img,256);
figure(1);
subplot(1,2,1);imshow(img,map);
title('ԭͼ��');
subplot(1,2,2);imshow(img_eq,map);
title('ֱ��ͼ���⻯��ͼ��');

figure(2);
subplot(1,2,1);imhist(img,map);
title('ԭͼ��ֱ��ͼ');
subplot(1,2,2);imhist(img_eq,map);
title('ֱ��ͼ���⻯��ͼ��ֱ��ͼ');
