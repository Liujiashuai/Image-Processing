img=imread('images/lena.bmp');
H=fspecial('motion',50,45);
img1=imfilter(img,H,'circular','conv');
figure(1);
imshow(img1);
title('�˶�ģ�����lena.bmp(�Ƕ�Ϊ45��)');
img2=imnoise(img1,'gaussian',0,0.01);
figure(2)
imshow(img2);
title('���벢ģ����');
% figure(3);
% noise=imnoise(zeros(size(img)),'gaussian',0,0.01);
% NSR=sum(noise(:).^2)/sum(im2double(img(:)).^2);
% img3=deconvwnr(img2,H,NSR);
% imshow(img3);
% title('ά���˲��Ľ��');

