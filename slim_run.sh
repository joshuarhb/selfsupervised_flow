#!/bin/bash
#SBATCH --job-name=slim_training
#SBATCH --output=slim_training_%j.out
#SBATCH --error=slim_training_%j.err
#SBATCH --time=72:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1

module load singularity

source ~/miniconda3/bin/activate
conda activate lidar_project

SLIM_DEF=slim_singularity.def

singularity remote login
singularity build --remote slim.sif $SLIM_DEF

SLIM_SIF=slim.sif

singularity exec --nv $SLIM_SIF