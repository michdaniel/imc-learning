# 02_subset_data.R
# Subset SCE to protein markers and annotated patients only

library(SingleCellExperiment)
library(imcdatasets)

# Load dataset
spe <- HochSchulz_2022_Melanoma(data_type = "sce")

# Subset to protein markers only
protein_markers <- rownames(spe)[rowData(spe)$marker_no_RNA == TRUE]
spe_protein <- spe[protein_markers, ]

# Subset to cells with response annotation (R or NR only)
annotated_cells <- spe$patient_status_at_3months %in% c("R", "NR")
spe_protein <- spe_protein[, annotated_cells]

# Check dimensions
dim(spe_protein)

# Verify
table(spe_protein$patient_status_at_3months)

#Add marker distribution plots per patient
library(dittoSeq)

#test with one marker
dittoRidgePlot(spe_protein, var = "SOX10", group.by = "patient_id", assay = "exprs")

#Plot all markers
dittoRidgePlot(spe_protein, var = protein_markers, group.by = "patient_id", assay = "exprs")

