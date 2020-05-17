%ͼ����׼
img_fixed=imread('images/Image A.jpg');
img_moving=imread('images/Image B.jpg');
cpselect(img_moving,img_fixed); %ѡ����Ƶ�

O=ones(1,7);
Q=[fixedPoints';O];
P=[movingPoints';O];
H=Q*P'/(P*P'); %���ת������
H(3,1)=0;
H(3,2)=0;
H(3,3)=1;
Ht=H';

%tform=fitgeotrans(movingPoints, fixedPoints, 'affine');
tform=affine2d(Ht);
img_moved=imwarp(img_moving,tform); %���з���任

figure
subplot(1,2,1),imshow(img_moved);
title('��׼ͼ��');
subplot(1,2,2),imshow(img_fixed);
title('ԭͼ');
