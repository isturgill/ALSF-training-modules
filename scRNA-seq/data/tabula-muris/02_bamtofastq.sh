#!/bin/bash
# Converts the original 10X BAM file to FASTQ format.
# Uses the Biocontainers 10x_bamtofastq:1.4.1 Docker image.

BAM="10X_P4_3.bam.1"
BAM_PREFIX=$(basename ${BAM} .bam.1)
DOCKER="quay.io/biocontainers/10x_bamtofastq:1.4.1"

cd "$(dirname "${BASH_SOURCE[0]}")"
set -euo pipefail

# This starts the Docker image and runs the bamtofastq program, outputting to the fastq directory
docker run --rm -u $(id -u):$(id -g) -v .:/data -w /data ${DOCKER} bamtofastq ${BAM} fastq 

# The result directory name that the program outputs is a little messy, so let's clean it up
cd fastq
result_dir=$(ls -d */)
mv ${result_dir} ${BAM_PREFIX}

# And lastly, let's rename the FASTQ file prefixes to match the BAM prefix and 
# the names that the rest of the tutorial uses for the FASTQ files
for i in $(ls ${BAM_PREFIX});
	do new_name=$(echo $i | sed "s/bamtofastq_S1/${BAM_PREFIX}/g");
	mv ${BAM_PREFIX}/$i ${BAM_PREFIX}/${new_name};
done	
