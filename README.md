# `cluster-mcdo`

This repository contains the definition of the Kubernetes cluster in a GitOps manner using FluxCD.

The infrastructure deployed is roughly the following:

- Flux system
- Minecraft servers
  - Velocity Proxy
  - Lobby
  - Vanilla server
  - Per promo server (modded for DO25-28)
- Satisfactory server
- Monitoring stack for all the above
  - Prometheus for metrics
  - Loki for logs
  - Grafana for visualisation & alerts
  - RCON Web Admin
