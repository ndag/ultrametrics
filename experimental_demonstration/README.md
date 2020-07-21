In this experiment we compute uGH between ultrametric spaces generated from two different strategies


# Subsampling from models
**test_subsample.m** first randomly generate 5 different ultrametric spaces as 5 "models": dendrograms corresponding to these models have different number of blocks and each block contains 100 points.
![output](https://github.com/ndag/ultrametrics/blob/master/experimental_demonstration/5models.eps)

There are three test files: 
- **test_positive.m** Exemplifies cases when one succeeds in finding a correspondence with the required distortion. 
- **test_negative.m** Exemplifies cases when one fails to do so). 
- **test_diff_card.m** This function looks at a scenario where one samples two subsets from a dataset exbiting two clusters; 
this last example also visualizes the correspondence that was found.

## uGH_top_down.m
**uGH_top_down.m** is Matlab implementation of an algoritm for computing a variant of the Gromov-Hausdorff distance between ultrametric spaces called uGH. See the paper for more details. 

There is an associated test file:
- **test_uGH.m** (exemplifies computation of uGH between random dendrograms. Includes visualization. We suggest you run it many times. Here's an example output:
![output](https://github.com/ndag/ultrametrics/blob/master/dendros.png)

# Independent samples
