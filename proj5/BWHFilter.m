function [alpha] = BWHFilter(img,D0,n_b)
%  butterworth��ͨ�˲���
%  n_b��D0��butterworth�˲����Ĳ���
f=double(img); 
F=fft2(f);     % ����Ҷ�任   
F=fftshift(F); % �ƶ�����   
[P,Q]=size(F); % ��С��PxQ

for u=1:P
    for v=1:Q
        D(u,v)=sqrt((u-fix(P/2))^2+(v-fix(Q/2))^2);
        H(u,v)=1/(1+(D0/D(u,v))^(2*n_b)); 
        G(u,v)=H(u,v)*F(u,v);
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
title('butterworth�˲�ͼ��','Fontsize',17); 

%����Ƶ��ͼ
figure;
subplot(1,3,1);
imshow(abs(255.*F./max(max(F))));
title('ԭʼͼ��ĸ���Ҷ��','Fontsize',17);
subplot(1,3,2);
imshow(abs(H));
title(['�˲����ĸ���Ҷ�ף�D0=',num2str(D0),')'],'Fontsize',17);
subplot(1,3,3);
imshow(abs(255.*G./max(max(G))));
title('�˲���ͼ��ĸ���Ҷ��','Fontsize',17);

%���㹦���ױ�
P_F=0;  % ԭʼͼ��
P_G=0;  % �˲���ͼ��
for u=1:P
    for v=1:Q
        P_Gi=(abs(G(u,v)))^2;  
        P_G=P_G+P_Gi;
        P_Fi=(abs(F(u,v)))^2;  
        P_F=P_F+P_Fi;
    end
end
alpha=P_G/P_F;
end

