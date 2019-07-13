function [] = hw1FindProjections(num_imgs, t_set, mean_col, num_t, V)
A = double(t_set) - repmat(mean_col, 1, num_t); %subtracting mean_col from each column in A
eigen_weights = A' * V;
c_imgs = (eigen_weights * V')' + repmat(mean_col, 1, num_t); %we have projected back into our original space
c_imgs = reshape(c_imgs,28,28,1,[]);

% %%% Display individual %%%
% for i = 1:num_imgs
%     img = reshape(t_set(:,i),28,28,1);
%     figure(i); imshow([255*img,255*c_imgs(:,:,:,i)]);
% end

%%% Display all at once %%%
figure;
for i = 1:num_imgs
    img = reshape(t_set(:,i),28,28,1);
    subplot(1, num_imgs*2, i);
    imshow([255*img,255*c_imgs(:,:,:,i)]);
end

end
