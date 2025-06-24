# Contrastive Learning on 3D Point Clouds

> This is a repo for the codebook provided in this video : https://www.youtube.com/watch?v=XpUKZEGWqbU
> 
---

## 📚 Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Dataset](#dataset)
- [Fix Folder Structure](#fix-folder-structure)
- [Run the Notebook](#run-the-notebook)


---

## 🚀 Overview

> This project implements a contrastive learning model on 3D point cloud data using the ShapeNet dataset and EdgeConv encoder.


---

## ⚙️ Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/your-repo.git
cd ContrastiveModel_test
```

2. Create a virtual environment with all requirements:

```bash
conda env create -f environment.yaml
conda activate contrastive
```

## 💿 Dataset
1. Download Kaggle Dataset

```bash
kaggle datasets download mitkir/shapenet
unzip shapenet.zip
```

## 🛠️ Fix Folder Structure 

ShapeNet requires a very specific folder structure

1. Create Dataset Folder
```bash
mkdir -p ShapeNet/raw

```
2. Move dataset to the new Folder
```bash
mv shapenetcore_partanno_segmentation_benchmark_v0_normal/* ShapeNet/raw
```

3. Remove unecessary files
```bash
rm -rf shapenetcore_partanno_segmentation_benchmark_v0_normal shapenet.zip
```

4. Check your folder structure
```bash
tree ./ShapeNet -L 2
```
Should look like this:
```bash
./ShapeNet
└── raw
    ├── 02691156
    ├── 02773838
    ├── 02954340
    ├── 02958343
    ├── 03001627
    ├── 03261776
    ├── 03467517
    ├── 03624134
    ├── 03636649
    ├── 03642806
    ├── 03790512
    ├── 03797390
    ├── 03948459
    ├── 04099429
    ├── 04225987
    ├── 04379243
    ├── synsetoffset2category.txt
    ├── train_test_split
    └── util
```

##  🏃 Run the Notebook

```bash
contrastive_learning.ipynb
```

