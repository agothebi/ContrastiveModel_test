#!/bin/bash
#SBATCH --job-name "install-libraries"
#SBATCH --mem 32g
#SBATCH --gpus 1
#SBATCH --constraint cuda11
#SBATCH --output=set_env.out

#Create the environment if it doesn't exist
if [ ! -d "~/.conda/envs/contrastive" ]; then
    conda create -n contrastive python=3.11 -y
else
    echo "Environment contrastive already exists."
fi

#Source and activate conda environment
source /opt/conda/bin/activate contrastive

# Load necessary modules for GPU support
module load CUDA/11.8

#Set number of threads to avoid pesky warning
export OMP_NUM_THREADS=16;

# Upgrade pip first (optional but recommended)
pip install --upgrade pip

# Install PyTorch with CUDA 11.8 support
pip install torch==2.1.0+cu118 torchvision==0.16.0+cu118 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118

# Define PyTorch Geometric wheel index URL matching torch version
PYG_VERSION_URL="https://data.pyg.org/whl/torch-2.1.0.html"

# Install PyG and dependencies from that URL
pip install torch-scatter torch-sparse torch-cluster torch-spline-conv torch-geometric -f $PYG_VERSION_URL

# Install additional libraries
pip install requirements.txt

