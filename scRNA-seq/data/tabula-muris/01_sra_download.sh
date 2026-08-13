#!/bin/bash
# Downloads the specified 10X BAM file from AWS.

S3_BUCKET="sra-pub-src-1"
SRR="SRR6835847"

cd "$(dirname "${BASH_SOURCE[0]}")"
set -euo pipefail

aws s3 cp s3://${S3_BUCKET}/${SRR}/10X_P4_3.bam.1 . --no-sign-request --dryrun
