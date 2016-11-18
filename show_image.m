%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ߣ�����
%E-mail��285980893@qq.com
%�ӳ������Ǹ��ٽ���Ļ�ͼ
%��rect_positionĿ������Ͻ�����,imgԭʼͼ��,frame��ǰ֡��,target_szĿ����С��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% rect_position = [pos([2,1]) - target_sz([2,1])/2, target_sz([2,1])];
%%
function show_image(rect_position,img,frame)
    if frame == 1  %first frame, create GUI
		figure
		im_handle = imshow(img);
		rect_handle = rectangle('Position',rect_position, 'LineWidth',2,'EdgeColor','r');
        tex_handle = text(5, 18, strcat('#',num2str(frame)), 'Color','y', 'FontWeight','bold', 'FontSize',20);
        drawnow;
    else
        try  %subsequent frames, update GUI
			set(im_handle, 'CData', img)
			set(rect_handle, 'Position', rect_position)
            set(tex_handle, 'string', strcat('#',num2str(frame)))
            pause(0.001);%��ͣ
            drawnow;
		catch  % #ok, user has closed the window
			return
        end
    end
end