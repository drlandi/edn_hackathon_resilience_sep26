#!/bin/bash
echo "=== Step 1: Corrupting/Renaming index.html on Primary sa-east-1 Origin ==="
aws s3 mv s3://wizard-g5-primary-sa-east-1-drlandi/index.html s3://wizard-g5-primary-sa-east-1-drlandi/index_corrupted.html --region sa-east-1 --no-cli-pager

echo "=== Step 2: Triggering CloudFront Origin Group Failover ==="
echo "Primary S3 in sa-east-1 returns 403/404."
echo "CloudFront automatically fetches fallback.html from us-east-1 failover origin."
echo "Refresh your browser at https://d2k2246xlhcumq.cloudfront.net to see the Amber Contingency UI."
