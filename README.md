# Ultrametric
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
- **test_positive.m** (exemplifies cases when one succeeds in finding a correspondence with the required distortion), 
- **test_negative.m** (exemplifies cases when one fails to do so), and 
- **test_diff_card.m** which looks at a scenario where one samples two subsets from a dataset exbiting two clusters; 
this last example also visualizes the correspondence that was found.
