%ֱ��ͼƥ����ǿ
[i1,map]=imread('images/woman2.bmp');
map(end:255,:)=0;
img=ind2gray(i1,map)
[i2,map_m]=imread('woman.bmp');
map_m(end:255,:)=0;
img_m=ind2gray(i2,map_m);

J=imhist(img_m);
Iout=histeq(img,J);
figure(1);
subplot(1,3,1),imshow(img,map);title('Դͼ��','Fontsize',24);
subplot(1,3,2),imshow(img_m);title('ƥ��ͼ��','Fontsize',24);
subplot(1,3,3),imshow(Iout);title('ƥ��֮��ͼ��','Fontsize',24);
figure(2);
subplot(3,1,1),imhist(img,64);title('Դͼ��ֱ��ͼ','Fontsize',18);
subplot(3,1,2),imhist(img_m,64);title('ƥ��ͼ��ͼ��ֱ��ͼ','Fontsize',18);
subplot(3,1,3),imhist(Iout,64);title('ƥ��֮��ͼ��ֱ��ͼ','Fontsize',18);