load digits.mat

num_train_dims = size(size(trainImages)); num_train_dims = num_train_dims(2);
num_train = size(trainImages); num_train = num_train(num_train_dims);

num_test_dims = size(size(testImages)); num_test_dims = num_test_dims(2);
num_test = size(testImages); num_test = num_test(num_test_dims);

train_set = reshape(trainImages,[],num_train);
test_set = reshape(testImages,[],num_test);

k = 1000;
tr_set = train_set(:,1:k);
if k >= 784
    [mean_col, V] = hw1FindEigendigitsnotrick(tr_set);
else
    [mean_col, V] = hw1FindEigendigits(tr_set);
end

%%% Finding projections of training images %%%
num_imgs = 5;
hw1FindProjections(num_imgs, tr_set, mean_col, k, V);

%%% Finding projections of test images %%%
num_imgs = 5;
hw1FindProjections(num_imgs, test_set, mean_col, num_test, V);

%%% Finding projections of test images with top n eigenvectors%%%
num_imgs = 5;
n = 5;
hw1FindProjections(num_imgs, test_set, mean_col, num_test, V(:,1:n));

%%% Displaying eigenvectors: %%%
V = reshape(V,28,28,1,[]);
figure;
subplot(4, 1, 1);
imshow(255*V(:,:,:,1))
subplot(4, 1, 2);
imshow(255*V(:,:,:,2));
subplot(4, 1, 3);
imshow(255*V(:,:,:,3))
subplot(4, 1, 4);
imshow(255*V(:,:,:,4));

figure;
subplot(1, 4, 1);
imshow(255*V(:,:,:,300))
subplot(1, 4, 2);
imshow(255*V(:,:,:,400));
subplot(1, 4, 3);
imshow(255*V(:,:,:,500))
subplot(1, 4, 4);
imshow(255*V(:,:,:,600));

image_to_show = 60; figure(1); imshow(255*V(:,:,:,image_to_show));
image_to_show = 50; figure(2); imshow(255*V(:,:,:,image_to_show));
image_to_show = 40; figure(3); imshow(255*V(:,:,:,image_to_show));
image_to_show = 30; figure(4); imshow(255*V(:,:,:,image_to_show));

%%% Finding projections of test images and using knn to classify %%%
training_sizes = [10 50 100 500 1000 2000 5000 6000 7000 8000 10000 12000 15000 20000 30000 40000 50000 60000];
num_test_imgs = 10000;
K = 10;
accs = [];
for k = training_sizes(1:18)
    tr_set = train_set(:,1:k);
    if k >= 784
        [mean_col, V] = hw1FindEigendigitsnotrick(tr_set);
    else
        [mean_col, V] = hw1FindEigendigits(tr_set);
    end
    if k >=50
        V = V(:,1:50);
    end
    A_train = double(tr_set) - repmat(mean_col, 1, k); 
    A_test = double(test_set) - repmat(mean_col, 1, num_test); 
    eigen_weights_train = (A_train' * V);
    eigen_weights_test = (A_test' * V);
    eigen_weights_test = eigen_weights_test(1:num_test_imgs,:);
    
    Idx = knnsearch(eigen_weights_train, eigen_weights_test, 'K', K);
    predicted_labels = mode(trainLabels(Idx), 2);
    num_correct = sum(testLabels(1:num_test_imgs)' == predicted_labels);
    accuracy = (num_correct/num_test_imgs)*100;
    accs = [accs;accuracy];
end
accs

