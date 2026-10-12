# tnseq_analysis_tutorial
Tutorial for tnseq analysis of FACS sorted transposon mutant library, as described in the PhD thesis of Sara Tamminga: Sweet talking
The impact of bacterial glycan diversity on immune sensing (https://dare.uva.nl/id/c6d8793f-aedf-4549-8750-ef4f39dc75db).

In short, genomic DNA was isolated from pellets of different, FACS sorted mutant pools and subjected to Illumina sequencing. The Illumina sequencer's built-in demultiplexing step fails so the tutorials starts here. Processes raw transposon reads into 14 bp genomic reads; align to reference genome; calculate gene insertion counts and visualise in R.
