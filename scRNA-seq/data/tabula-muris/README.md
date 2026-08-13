# Optional data download
If you're following along from home, are an advanced (or ambitious!) learner, and want to download the data used in this tutorial, the mouse bladder sequencing data from the *Tabula Muris* project have been deposited in the Gene Expression Omnibus (GEO) under accession [GSM3040893](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM3040893). They can be downloaded from the Sequence Read Archive (SRA) in multiple ways from [SRR6835847](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR6835847&display=data-access). AWS hosts one version of the data in the original BAM format as uploaded by the authors.

## Prerequisites
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - install and use for large downloads from AWS S3 buckets
* [Docker](https://docs.docker.com/desktop/)

## AWS download
To download the original BAM using the AWS CLI, once installed, you can run the following command:

```bash
bash 01_sra_download.sh
```

This will take some time to complete (the BAM is 13.5GB!). Once finished, you should have the file under the name: 10X_P4_3.bam.1

## BAM to FASTQ format conversion with 10x_bamtofastq
Next, to convert the BAM to FASTQ, we'll use a Docker image from [BioContainers](https://quay.io/repository/biocontainers/10x_bamtofastq) of the 10X `bamtofastq` program:

```bash
bash 02_bamtofastq.sh
```

This will also take some time to run. At the end, we should have all of the R1 and R2 fastq.gz files, plus I1 sample index fastq.gz files, in the fastq/10X_P4_3 directory. The BAM and I1 files aren't needed at this point.
