#!/bin/bash
echo "=== Restoring Primary sa-east-1 Origin ==="
aws s3 mv s3://wizard-g5-primary-sa-east-1-drlandi/index_corrupted.html s3://wizard-g5-primary-sa-east-1-drlandi/index.html --region sa-east-1 --no-cli-pager
echo "Primary origin restored."
