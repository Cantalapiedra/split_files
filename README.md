# split_files
Bash scripts for common way of splitting fasta or tsv files

split_file.sh IN_TSV_FILE NUMFILES OUTDIR PREFIX

split_fasta.sh IN_FASTA_FILE NUMFILES OUTDIR PREFIX

fasta_to_tsv.sh and tsv_to_fasta.tsv are used by split_fasta:

fasta_to_tsv.sh --> split_file.sh --> tsv_to_fasta.sh
