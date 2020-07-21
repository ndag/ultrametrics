In this experiment we compute uGH between ultrametric spaces generated from two different strategies


# Subsampling from models
**test_subsample.m**: We first randomly generate 5 different ultrametric spaces as 5 "models": dendrograms corresponding to these models have different number of blocks and each block contains 100 points.
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/5models.png)

Then, we subsample from each model 9 subspaces containing of 3 10-point subspaces, 3 20-point subspaces and 3 30-point subspaces. Below you can see all the 9 subsamples of the model space with 4 clusters:
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/subsampling.png)

# Independent sampling
**test_independent.m**: For each n=1,2,3,4,5, we generate 9 ultrametric spaces with n blocks independently (they are not subsampling from a same common space). Each of the space contains 10,20, or 30 points. Spaces with the same number of blocks share roughly the same “big structure”.

# Computing uGH
We compute uGH between ultrametric spaces generated from each sampling method separately and show the heatmaps representing the distance matrices below, where the left heatmap is for the subsampling method and the right heatmap is for the independent sampling method.
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/ugh_result.png)


From this experiment we can conclude that uGH is sensitive to changes of "big structures" of dendrograms as indicated from the structural theorem in our preprint.
