% ��Ե���
[img,map]=imread('images/test3_corrupt.pgm','pgm');

img1=edge(img,'sobel'); %Sobel���ӱ�Ե���
img2=edge(img,'log');   %������˹���ӱ�Ե���
img3=edge(img,'canny'); %Canny�㷨��Ե���

figure(1);
subplot(1,2,1),imshow(img,map);
title('test3ԭʼͼ��','Fontsize',36);
subplot(1,2,2),imshow(img1);
title('test3 Sobel','Fontsize',36);

figure(2);
subplot(1,2,1),imshow(img,map);
title('test3ԭʼͼ��','Fontsize',36);
subplot(1,2,2),imshow(img2);
title('test3 Laplace','Fontsize',36);

figure(3);
subplot(1,2,1),imshow(img,map);
title('test3ԭʼͼ��','Fontsize',36);
subplot(1,2,2),imshow(img3);
title('test3 Canny','Fontsize',36);

