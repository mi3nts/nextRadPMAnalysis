# nextRadPMAnalysis

## nextRadPMAnalysis - by Lakitha

* to be updated.

## MLAnalysis - by Xun

### RESULT OF ANALYSIS

* Based on current result, TreeBagger is the recommended algorithm.
* Table listed all algorithms' performance:

    | Algorithm | RMSE | R |
    | :-:     | :-: | :-: |
    | FitREnsemble | 17.1144 | 0.8967 |
    | SVM | 758.27 | -0.0634 |
    | TreeBagger | 4.0932 | 0.9909 |

* MSRE convergence during training:

1. FitREnsemble: MSE value converge according to the increase of learning cycles. Figure below. ![Image of FitREnsemble](https://github.com/mi3nts/nextRadPMAnalysis/blob/master/fitrensemble.jpg)

2. TreeBagger: MSE value converge according to the increase of tree number. Figure below. ![Image of TreeBagger](https://github.com/mi3nts/nextRadPMAnalysis/blob/master/treebagger.jpg)

### INSTRUCTION ON CODE RUNNING

1. In terminal, navigate to a folder (which will be used as the parent folder of code repo) and clone the repository. (the '$' sign represents the prompt string)

    ```shell
    $ cd ~/route/to/the/wanted/folder && git clone https://github.com/mi3nts/nextRadPMAnalysis.git
    Cloning into 'nextRadPMAnalysis'...
    remote: Enumerating objects: 130, done.
    remote: Counting objects: 100% (130/130), done.
    remote: Compressing objects: 100% (105/105), done.
    remote: Total 130 (delta 41), reused 96 (delta 22), pack-reused 0
    Receiving objects: 100% (130/130), 65.84 KiB | 898.00 KiB/s, done.
    Resolving deltas: 100% (41/41), done.
    ```

2. Download the data file [mints_NextRadWithGrimmAndFWNode_1_1_data_from_12-Feb-2019_to_11-Apr-2019.mat (click to download)](https://utdallas.box.com/s/edae5jivt5r7m41az5ba3wayjd855nd4) and place it under "`~/route/to/the/wanted/folder/nextRadPMAnalysis/multiMethods`". Note: refers to ***CODE REPO STRUCTURE*** for example.

3. Start matlab and navigate to the code repo. Double click on the `main.m` script. Click on the `run` button. The result will then be stored in `result` object.

### CODE REPO STRUCTURE

* the folder GRIMM is not shown here.

```bash
.
└── nextRadPMAnalysis
    ├── README.md
    ├── fitrensemble.jpg
    ├── multiMethods
    │   ├── FigureParam.m
    │   ├── describeNeuralNet.m
    │   ├── describeRensemble.m
    │   ├── describeSVMlinear.m
    │   ├── describeTreeBagger.m
    │   ├── loadTable.m
    │   ├── main.m
    │   └── mints_NextRadWithGrimmAndFWNode_1_1_data_from_12-Feb-2019_to_11-Apr-2019.mat
    └── treebagger.jpg
```

### TODO

* Finish shallow Neural Network time series analysis on data.
* Modify and generalize the `loadTable.m` to enable the script to load and format all data tables in NAS. And get access to NAS.
