%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ߣ�����
%E-mail��285980893@qq.com
%�ӳ������Ƕ�ȡ��Ƶ����ȡgroundtruth����
%��videoData�洢��Ƶ�Ľṹ��,ground_truthĿ����ʵλ��,videoDir��Ƶ�ļ�·��,��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function [videoData,ground_truth] = Load_video(videoDir)
    sequence_path = [videoDir,'\'];%�ļ�·��
    videoFile = [sequence_path 'david.mpg']; %�ļ�·��
    videoData = VideoReader(videoFile);%��ȡ��Ƶ
% % for i = 1 : 50
% %         videoframe = read(videoData,i);% ��ȡÿһ֡
% %         videoframe= rgb2gray(videoframe);%ת��Ϊ�Ҷ�ͼ
% %         imshow(videoframe);%��ʾÿһ֡
% %         % imwrite(frame,strcat(num2str(i),'.jpg'),'jpg');% ����ÿһ֡
% % end
    %% Read files 
    ground_rect = csvread([sequence_path 'groundtruth_rect.txt']);%��������ʵĿ��λ��
    %% get position and boxsize ��ȡgroundtruth���� 
    if(size(ground_rect,2)==1)%һ��
        error('please add "," in groundtruth');%x,y,w,hĿ����С
    else if(size(ground_rect,2)==4)%4��
        ground_truth=ground_rect;%x,y,w,hĿ����С
    else
        error('something wrong in groundtruth');
        end
    end
end