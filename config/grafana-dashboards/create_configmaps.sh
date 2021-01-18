#!/bin/bash

rm -f ./unifi-grafana-dashboards.yaml

for db in *.json; do
  echo '---' >> unifi-grafana-dashboards.yaml
  name="${db%%_rev?.json}"
  kubectl create configmap \
    "${name}" \
    --dry-run=client -o yaml \
    --namespace klippy \
    --from-file="${name}.json=${db}" >> unifi-grafana-dashboards.yaml
done
