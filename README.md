# nextRadPMAnalysis

## nextRadPMAnalysis - by Lakitha

* to be updated.

## MLAnalysis - by Xun

### Result Conclusion

* Based on current result, TreeBagger is the recommended algorithm.
* Table listed all algorithms' performance:

| Algorithm | RMSE | R |
| :-:     | :-: | :-: |
| FitREnsemble | 17.1144 | 0.8967 |
| SVM | 758.27 | -0.0634 |
| TreeBagger | 4.0932 | 0.9909 |

* MSRE convergence during training:

1. FitREnsemble: MSE value converge according to the increase of learning cycles. Fig below. ![Image of FitREnsemble](https://github.com/mi3nts/nextRadPMAnalysis/blob/master/fitrensemble.jpg)

2. TreeBagger: MSE value converge according to the increase of tree number. ![Image of TreeBagger](https://github.com/mi3nts/nextRadPMAnalysis/blob/master/treebagger.jpg)

### How to: Download the code and Run locally

### Folder Description

### TODO

* Finish shallow Neural Network time series analysis on data.
* Work on place the data on NAS Volume and modify the data link in script.
