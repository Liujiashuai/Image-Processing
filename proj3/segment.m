% ͼ��ָ�
[I,map]=imread('images/elain.bmp');
map(end:255,:)=0;
img=ind2gray(I,map);

level=graythresh(img); %ȷ���Ҷ���ֵ
imgbi=imbinarize(img,level);

figure(1);
subplot(1,2,1);imshow(img,map);
title('Դͼ��','Fontsize',24);
subplot(1,2,2);imshow(imgbi);
title('�ָ�ͼ��','Fontsize',24);
