#!/bin/bash
DOMAIN="https://d2k2246xlhcumq.cloudfront.net"
echo "=== Simulating Volumetric Traffic Attack against Edge ==="
for i in {1..120}; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$DOMAIN/index.html")
  if [ "$STATUS" -eq 403 ]; then
    echo -e "Request #$i: \033[0;31m[BLOCKED BY WAF - HTTP 403]\033[0m"
  else
    echo -e "Request #$i: [OK - HTTP $STATUS]"
  fi
  sleep 0.05
done
echo "=== Attack simulation finished. Check WAF CloudWatch Metrics. ==="
