# PCA-for-handwritten-digit-classification

Given grayscale images of handwritten digits, we project them into a lower dimesional 
eigen space using eigen decomposition. We visualize the eigen vectors as well as the 
recontructed images in the lower-dimensional eigen space and observe the difference in 
quality of recontruction with a change in the number of training samples and the number of 
eigen vectors we choose. 

We also classify the digits using K-nearest neighbours on the transformed images and 
get a final accuracy of 97.13%.

#### First 4 eigen vectors from 6000 training images
![a](https://github.com/Nidhi-K/PCA-for-handwritten-digit-classification/blob/master/images/evs1234_k6thou.jpg)

#### Projection of test images into eigen space with all eigen vectors constructed from 60 samples
![b](https://github.com/Nidhi-K/PCA-for-handwritten-digit-classification/blob/master/images/p_ka60.jpg)

#### Projection of test images into eigen space with all eigen vectors constructed from 600 samples
![c](https://github.com/Nidhi-K/PCA-for-handwritten-digit-classification/blob/master/images/p_k600.jpg)

For further details and images, refer to `Report.pdf`.
