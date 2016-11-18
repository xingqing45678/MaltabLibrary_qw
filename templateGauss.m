%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ߣ�����
%E-mail��285980893@qq.com
%�ӳ������ǲ�����˹������Ӧģ��
%��szģ������ش�С,imԭͼ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STC�㷨��ģ������
% alapha = 2.25;                    %parmeter \alpha in Eq.(6)
% [rs, cs] = ndgrid((1:sz(1)) - floor(sz(1)/2), (1:sz(2)) - floor(sz(2)/2));
% dist = rs.^2 + cs.^2;
% conf = exp(-0.5 / (alapha) * sqrt(dist));%confidence map function Eq.(6)
% conf = conf/sum(sum(conf));% normalization
% conff = fft2(conf); %transform conf to frequencey domain
%% KFC�㷨��ģ������
% %window size, taking padding into account
% sz = floor(target_sz * (1 + padding));
% %desired output (gaussian shaped), bandwidth proportional to target size
% output_sigma = sqrt(prod(target_sz)) * output_sigma_factor;
% [rs, cs] = ndgrid((1:sz(1)) - floor(sz(1)/2), (1:sz(2)) - floor(sz(2)/2));
% y = exp(-0.5 / output_sigma^2 * (rs.^2 + cs.^2));
% yf = fft2(y);
%% CF�㷨������˹ģ��
function F_response=templateGauss(sz,im)
    [rs, cs] = ndgrid((1:sz(1)) - floor(sz(1)/2), (1:sz(2)) - floor(sz(2)/2));
    dist = rs.^2 + cs.^2;
    conf = exp(-0.5 / (2.25) * sqrt(dist));%���ɶ�ά��˹�ֲ�
    conf = conf/sum(sum(conf));% normalization
    if(size(im,3)==1)%�Ҷ�ͼ��
        response=conf;
    else            %��ɫͼ��
        response(:,:,1)=conf;response(:,:,2)=conf;response(:,:,3)=conf;    
    end       
%         figure
%         imshow(256.*response);
%         mesh(response);
        F_response=fft2(response);%����Ҷ�任
end