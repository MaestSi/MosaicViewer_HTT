#!/bin/bash

#
# Copyright 2023 Simone Maestri. All rights reserved.
# Simone Maestri <simone.maestri@unimi.it>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#FASTQ is the file containing demultiplexed and quality filtered reads
FASTQ=/path/to/sample.fastq
#REFERENCE is the file used for extracting flaking regions
REFERENCE=/path/to/fasta/reference
#FW_PRIMER_COORD and RV_PRIMER_COORD are coordinates of primers for in-silico PCR
FW_PRIMER_COORD="chr4:3074677-3074777"
RV_PRIMER_COORD="chr4:3074739-3074839"
#GENE_NAME
GENE_NAME="HTT"
#GENE_STRAND is used for calculating the reverse-complement of reference region is the gene is in the minus strand
GENE_STRAND="+"
#THR is the alignment identity threshold for in-silico PCR
THR=0.7
#MINLENGTH is the minimum expected length of reads
MINLENGTH=150

#left alignment
#SIDE="left"
#FLANKING_REF_COORD are coordinates of genomic regions used to create a reference for alignment
#FLANKING_REF_COORD="chr4:3074677-3074877"
#FLANKING_COORD_TRIMMED are coordinates of genomic regions used to trim the other flanking region
#FLANKING_COORD_TRIMMED="chr4:3074939-3075139"

#right alignment
SIDE="right"
#FLANKING_REF_COORD are coordinates of genomic regions used to create a reference for alignment
FLANKING_REF_COORD="chr4:3074939-3075139"
#FLANKING_COORD_TRIMMED are coordinates of genomic regions used to trim the other flanking region
FLANKING_COORD_TRIMMED="chr4:3074677-3074877"

########################################################################################################
PIPELINE_DIR="/path/to/MosaicViewer_HTT"
MINICONDA_DIR="/path/to/miniconda3"
########### End of user editable region #################################################################
MSA=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/msa.sh"
CUTPRIMERS=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/cutprimers.sh"
SAMTOOLS=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/samtools"
MINIMAP2=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/minimap2"
SEQTK=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/seqtk"
NANOFILT=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/NanoFilt"
NCRF_DIR=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/"
SIMPLIFY_READS=$MINICONDA_DIR"/envs/MosaicViewer_env/bin/Rscript "$PIPELINE_DIR"/simplify_reads.R"
