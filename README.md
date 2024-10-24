# K-means Clustering Algorithm in R

This project implements the **K-means clustering algorithm** in R as part of the **MATH38161** coursework. K-means is an unsupervised machine learning algorithm that groups data points into clusters based on their similarity, with the goal of minimizing the within-cluster variance.

## Features

- **Custom Implementation**: A step-by-step implementation of the K-means algorithm in R.
- **Euclidean Distance Calculation**: Clustering is performed using the Euclidean distance between points.
- **Comparison with Built-in Functions**: The custom K-means algorithm is compared to R's built-in `kmeans()` function using the Iris dataset.
- **Cluster Performance**: Calculates the total sum of squares (SST), within-group sum of squares (SSW), and between-group sum of squares (SSB) to evaluate clustering performance.

## Algorithm Steps

1. **Specify the number of clusters (k)** and the maximum number of iterations.
2. **Randomly select k data points** as the initial cluster centers.
3. **Assign each data point** to the nearest cluster center based on Euclidean distance.
4. **Update the cluster centers** by calculating the mean of all data points in each cluster.
5. **Iterate** through steps 3 and 4 until the cluster centers no longer change or the maximum number of iterations is reached.
6. **Output the final clusters** and their corresponding centers.

## Example Usage

This project uses the Iris dataset for clustering. The dataset consists of 150 samples, and we assume there are 3 clusters. By running the K-means function, the clustering results are compared with the built-in R function.

## Results and Discussion

After running the algorithm on the Iris dataset, we found that the clustering results (cluster centers, within-cluster sum of squares, etc.) from our custom implementation were very similar to those produced by the built-in kmeans() function in R. The small discrepancies are due to the random initialization of the cluster centers.

A plot comparing within-cluster and between-cluster variation with different values of k shows that 3 clusters seem to be the most appropriate for this dataset.

![Screenshot 2024-10-24 221307](https://github.com/user-attachments/assets/776bb7c0-411f-40e7-870c-a70b09592822)

## Conclusion

This project demonstrates the implementation of the K-means algorithm in R and its application to a real dataset. The results show that the algorithm works as expected, producing results comparable to the built-in function. The code can be further extended by experimenting with different datasets and optimizing the initial selection of cluster centers.
