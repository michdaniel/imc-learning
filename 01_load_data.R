# 01_load_data.R
# Load Hoch et al. 2022 melanoma IMC dataset
# and perform initial exploration

library(SingleCellExperiment)
library(scater)
library(scran)
library(imcdatasets)

# Load dataset
spe <- HochSchulz_2022_Melanoma(data_type = "sce")

# Basic structure
dim(spe)
rownames(spe)
colnames(colData(spe))

# Response annotation
table(spe$patient_status_at_3months)
table(spe$patient_id, spe$patient_status_at_3months)