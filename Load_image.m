%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ߣ�����
%E-mail��285980893@qq.com
%�ӳ������Ƕ�ȡͼƬ֡�����Ҷ�ȡgroundtruth����
%��ground_truthĿ����ʵλ��,img_pathͼƬ�ļ���,img_filesͼƬ�ļ����洢,imgDir�ļ�·��,��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function [ground_truth,img_path,img_files]=Load_image(imgDir)
%     %% Read params.txt
%     params = readParams('params.txt');
	%% load video info
    sequence_path = [imgDir,'/'];%�ļ�·��
    img_path = [sequence_path 'img/'];
    %% Read files 
    ground_rect = csvread([sequence_path 'groundtruth_rect.txt']);%��������ʵĿ��λ��
    %%%%%%%%%%%%%%%%%%%%%%%%%
    % read all the frames in the 'imgs' subfolder
    dir_content = dir([sequence_path 'img/']);
    % skip '.' and '..' from the count
    n_imgs = length(dir_content) - 2;
    img_files = cell(n_imgs, 1);
    for ii = 1:n_imgs
        img_files{ii} = dir_content(ii+2).name;
    end
    %% get position and boxsize ��ȡgroundtruth���� 
    if(size(ground_rect,2)==1)%һ��
        error('please add "," in groundtruth');%x,y,w,hĿ����С
    else if(size(ground_rect,2)==4)%4��
        ground_truth=ground_rect;%x,y,w,hĿ����С
    else
        error('something wrong in groundtruth');
        end
    end
%     im = imread([img_path img_files{1}]);%��ȡĿ��֡
%     im= rgb2gray(im);%ת��Ϊ�Ҷ�ͼ
%     imshow(im);
end