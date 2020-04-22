%ͼ��ֲ���ǿ
[I,map]=imread('images/elain.bmp');
map(end:255,:)=0;
img=ind2gray(I,map);

[rows,cols]=size(img);
k0=0.5;k1=0.01;k2=0.3;
E=3;
marksize=7;
ex=floor(marksize/2);
imgex=padarray(img,[ex ex],'replicate','both');
quant=rows*cols; % ͼ���С
me=mean2(img); %ͼ���ֵ
stdd=std2(img); %ͼ���׼��
for i=1:rows
    for j=i:cols
        Loc=imgex(i:i+2*ex, j:j+2*ex); %�ֲ�����
        LocMe(i,j)=mean2(Loc);         %�ֲ���ֵ
        LocStdd(i,j)=std2(Loc);        %�ֲ���׼��
    end
end
en1=(LocMe<=k0*me); %��ֵС�Ĳ���
en2=(LocStdd>=k1*stdd)&(LocStdd<=k2*stdd); %��׼��
en=uint8(en1&en2); %�ϲ�
nen=uint8((int8(en)-1)*(-1));
imgc=img.*(E*en); %ͼ��ı䲿��
imgnc=img.*nen;   %ͼ�񲻱䲿��
imgen=imgc+imgnc;
subplot(1,3,1),imshow(img,map);title('Դͼ��','Fontsize',24);
subplot(1,3,2),imshow(imgc);title('��ǿ����ͼ��','Fontsize',24);
subplot(1,3,3),imshow(imgen);title('��ǿ��ͼ��','Fontsize',24);
