#!/bin/bash
#SBATCH --job-name=mapping
#SBATCH --output=human_rDNA_lof.out
#SBATCH --error=human_rDNA_lof.err
#SBATCH --verbose
#SBATCH --array=1
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=12GB
#SBATCH --mail-type=END
#SBATCH --mail-user=xm595@nyu.edu

#June 12 2023
#download fo rDNA ERR3239481


#load modules
module purge
#module load bowtie2/2.4.4
#module load samtools/intel/1.14
module load lofreq/2.1.5
module load bedtools/intel/2.29.2

#align reads to rDNA
#bowtie2 -5 1 -N 1 -p 8 \
#-x /scratch/cgsb/hochwagen/Human_rDNA_project/rDNA_prototype \
#-1 /scratch/cgsb/hochwagen/Human_rDNA_project/expreads/ERR3239481/ERR3239481_1.fastq \
#-2 /scratch/cgsb/hochwagen/Human_rDNA_project/expreads/ERR3239481/ERR3239481_2.fastq \
#-S ERR3239481_output.sam

#sort
#samtools view -Sbh ERR3239481_output.sam > ERR3239481_rDNA.bam
#samtools sort -@ 8 -o ERR3239481_sort.bam -O 'bam' ERR3239481_rDNA.bam
#rm ERR3239481_output.sam
#rm ERR3239481_rDNA.bam

#lofreq
#lofreq indelqual --dindel \
#-f /scratch/cgsb/hochwagen/Human_rDNA_project/rDNA_Prototype_full_repeat_.fa \
#-o ERR3239481_rDNA.bam \
#ERR3239481_sort.bam

#calculate coverage
bedtools genomecov -d \
-ibam ERR3239481_rDNA.bam > ERR3239481_rDNA_coverage.txt

#call variants
#lofreq call --call-indels -f /scratch/cgsb/hochwagen/Human_rDNA_project/rDNA_Prototype_full_repeat_.fa \
#-o ERR3239481_rDNA.vcf \
#ERR3239481_rDNA.bam 
