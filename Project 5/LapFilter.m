function LapFilter(img)
%   Laplacian�����˲���
f=double(img); 
F=fft2(f);     % ����Ҷ�任   
F=fftshift(F); % �ƶ�����   
[P,Q]=size(F); % ��С��PxQ

for u=1:P
    for v=1:Q
        D(u,v)=sqrt((u-fix(P/2))^2+(v-fix(Q/2))^2);
        H(u,v)=-4*pi^2*D(u,v)^2; 
        FF(u,v)=H(u,v)*F(u,v);
    end
end
% ��һ��
ff=ifftshift(FF);
ff=ifft2(ff);
ff=real(ff);
f_max=max(max(real(f)));
for u=1:P
    for v=1:Q
        g(u,v)=f(u,v)/f_max+ff(u,v);
    end
end
k=255/max(max(real(g)));
g=uint8(real(g*k)); % ȡʵ����ȡ��
G=fft2(g);        
G=fftshift(G); 

% �˲�ǰ��ͼ��
figure;
subplot(1,2,1);imshow(img);
title('ԭʼͼ��','Fontsize',17);
subplot(1,2,2);imshow(g);
title('������˹�����˲�ͼ��','Fontsize',17); 

%����Ƶ��ͼ
figure;
subplot(1,2,1);
imshow(abs(255.*F./max(max(F))));
title('ԭʼͼ��ĸ���Ҷ��','Fontsize',17);
subplot(1,2,2);
imshow(abs(255.*G./max(max(G))));
title('�˲���ͼ��ĸ���Ҷ��','Fontsize',17);

end