function [mean_col, V] = hw1FindEigendigitsnotrick(A)
dims = size(A); x = dims(1); k = dims(2);
mean_col = mean(A, 2); %finds the mean column vector in A
C = double(A) - repmat(mean_col, 1, k); %subtract mean_col from each column in A 
cov = C*C';
[V,D] = eig(cov); %V is the eigen vectors, D is the diagonal matrix with eigen values
[~,ind] = sort(diag(D), 'descend'); %get the sorted indices of the eigen values 
V = V(:,ind); %sort the columns of V according to the eigen values in descending order
end