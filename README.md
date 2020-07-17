The algorithms implemented ins repo were developed by [Facundo Memoli](https://people.math.osu.edu/memolitechera.1/), [Zane Smith](https://github.com/Zane3G), and [Zhengchao Wan](https://math.osu.edu/people/wan.252-0) in the paper https://arxiv.org/abs/1912.00564.

# Gromov-Hausdorff like distance between ultrametrics
## Find_Corr.m
**Find_Corr.m** is a Matlab implementation of an algorithm for finding a correspondence between two finite ultrametric spaces with distortion bounded by epsilon, if it exists.

**Syntax:**
```
% Find_Corr - finds a correspondence with distortion less than eps between two ultrametrics
%
% R = Find_Corr(uy,ux,eps)
%
%	uy - (nuy x nuy) ultrametric distance matrix
%	ux - (nux x nux) ultrametric distance matrix
%	eps - maximum allowed distortion
%
% Returns:
%	R - (nuy x nux) correspondence or 0 (if none exists)
```
There are three test files: 
- **test_positive.m** Exemplifies cases when one succeeds in finding a correspondence with the required distortion. 
- **test_negative.m** Exemplifies cases when one fails to do so). 
- **test_diff_card.m** This function looks at a scenario where one samples two subsets from a dataset exbiting two clusters; 
this last example also visualizes the correspondence that was found.

## uGH_top_down.m
**uGH_top_down.m** is Matlab implementation of an algoritm for computing a variant of the Gromov-Hausdorff distance between ultrametric spaces called uGH. See the paper for more details. 

**Syntax:**
```
% uGH_top_down - computes uGH between two ultrametrics
%
% u = uGH_top_down(ux,uy)
%
%	uy - (nuy x nuy) ultrametric distance matrix
%	ux - (nux x nux) ultrametric distance matrix
%	
% Returns:
%	u - the value of uGH between the two input spaces
```
There is an associated test file:
- **test_uGH.m** (exemplifies computation of uGH between random dendrograms. Includes visualization. We suggest you run it many times. Here's an example output:
![output](https://github.com/ndag/ultrametrics/blob/master/dendros.png)
