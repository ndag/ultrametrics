In this experiment we compute uGH between ultrametric spaces generated from two different strategies


# Subsampling from models
**test_subsample.m**: We first randomly generate 5 different ultrametric spaces as 5 "models": dendrograms corresponding to these models have different number of blocks and each block contains 100 points.
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/5models.png)

Then, we subsample from each model 9 subspaces containing of 3 10-point subspaces, 3 20-point subspaces and 3 30-point subspaces. Below you can see all the 9 subsamples of the model space with 4 clusters:
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/subsampling.png)

# Independent sampling
**test_independent.m**: For each n=1,2,3,4,5, we generate 9 ultrametric spaces with n blocks independently (they are not subsampling from a same common space). Each of the space contains 10,20, or 30 points. Spaces with the same number of blocks share roughly the same “big structure”.

# Results
We compute uGH between ultrametric spaces generated from each sampling method separately using **computing_ugh.m** and show the results as follows.

## Subsampling from models
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/subsample_with_dend.png)

## Independent sampling
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/independent.png)


The heat maps corresponds to the uGH distance matrices. Both distance matrices are sorted according to the number of blocks in the ultrametric spaces. We also represent the single linkage clustering result based on the first distance matrix. The labels of the dendrogram denote numbers of blocks of the corresponding ultrametric spaces.  Note that spaces sampled from the same model space have the same "big structure" and thus uGH distance between them is small as indicated from the blue areas in the left figure. However, as for independent sampling, spaces with the same number of blocks may have slight difference of "big structures" which result in a large uGH distance. From this experiment we can conclude that uGH is sensitive to changes of "big structures" of dendrograms as implied from the structural theorem in our preprint.
