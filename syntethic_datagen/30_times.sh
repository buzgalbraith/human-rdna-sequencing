#!/bin/bash
#SBATCH --job-name=synthetic-data-generation
#SBATCH --output=synethic_data.out
#SBATCH --error=synthetic_data.err
#SBATCH --verbose
#SBATCH --array=1
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=12GB
#SBATCH --mail-type=END

July 31 2023
#Synthetic data generation
module purge
module load neat/3.0
module load python/intel/3.8.6
module load biopython/1.78
########################################
#variant frequency 0.005
#R 150
#parameter c:30X(genome coverage)*175(# of rDNA copies)*0.005(variant frequency)
python gen_reads.py \

