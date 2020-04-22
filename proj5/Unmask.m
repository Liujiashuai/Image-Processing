function [] = Unmask(img,D0,k1,k2)
%   Unmask�˲���
f=double(img); 
F=fft2(f);     % ����Ҷ�任   
F=fftshift(F); % �ƶ�����   
[P,Q]=size(F); % ��С��PxQ
for u=1:P
    for v=1:Q
        D(u,v)=sqrt((u-fix(P/2))^2+(v-fix(Q/2))^2);
        H(u,v)=1-exp(-D(u,v)^2/(2*D0^2)); 
        G(u,v)=(k1+k2*H(u,v))*F(u,v);
    end
end
g=ifftshift(G);      
g=ifft2(g);       % ����Ҷ��任
g=uint8(real(g)); % ȡʵ����ȡ��

% �˲�ǰ��ͼ��
figure;
subplot(1,2,1);imshow(img);
title('ԭʼͼ��','Fontsize',17);
subplot(1,2,2);imshow(g);
title('Unmask�˲�ͼ��','Fontsize',17); 

%����Ƶ��ͼ
figure;
subplot(1,3,1);
imshow(abs(255.*F./max(max(F))));
title('ԭʼͼ��ĸ���Ҷ��','Fontsize',17);
subplot(1,3,2);
imshow(abs(H));
title(['�õ��ĸ�ͨ�˲����ĸ���Ҷ�ף�D0=',num2str(D0),')'],'Fontsize',17);
subplot(1,3,3);
imshow(abs(255.*G./max(max(G))));
title('�˲���ͼ��ĸ���Ҷ��','Fontsize',17);

end