# Security Notes

This deployment is intentionally stricter than a quick demo, but it is not the final word for production.

## Secrets

The sample secret file is only a template. Real environments should use Google Secret Manager and an External Secrets controller. Local Secret manifests are ignored by Git in this repo.

## Network

The Kubernetes NetworkPolicies allow:

- Ingress traffic to TheHive from the GKE ingress controller
- TheHive traffic to Cassandra and Elasticsearch
- DNS egress from application pods

Review policies before adding Cortex, MISP, SMTP, LDAP, SSO, or outbound webhooks.

## Data Protection

Production deployments should enable:

- Cassandra authentication and TLS
- Elasticsearch authentication and TLS
- HTTPS on TheHive
- GCS bucket retention policy
- Backup schedules for persistent disks and GCS

## IAM

TheHive uses Workload Identity for access to the GCS attachment bucket. Avoid node-level broad permissions.

## Image Policy

TheHive is pinned to `strangebee/thehive:5.6.1`. For stricter supply-chain control, pin to the Docker Hub digest after testing in a staging environment.
