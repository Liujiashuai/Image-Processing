% Unsharp Masking
[img,map]=imread('images/test4 copy.bmp');

w=fspecial('unsharp');%Unsharp Maskingģ��
img1=imfilter(img,w);

subplot(1,2,1),imshow(img,map);
title('test4ԭʼͼ��','Fontsize',36);

subplot(1,2,2),imshow(img1,map);
title('test4 unsharp masking','Fontsize',36);