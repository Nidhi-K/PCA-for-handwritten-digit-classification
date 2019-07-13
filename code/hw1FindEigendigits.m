function [mean_col, V] = hw1FindEigendigits(A)
dims = size(A); x = dims(1); k = dims(2);
mean_col = mean(A, 2); %finds the mean column vector in A
C = double(A) - repmat(mean_col, 1, k); %subtract mean_col from each column in A 
small_cov = C'*C;
[small_V,D] = eig(small_cov); %small_V is the eigen vectors, D is the diagonal matrix with eigen values
[~,ind] = sort(diag(D), 'descend'); %get the sorted indices of the eigen values 
small_V = small_V(:,ind); %sort the columns of small_V according to the eigen values in descending order
V = double(C)*small_V;
V = normc(V);
end