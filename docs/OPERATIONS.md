# Operations Runbook

## Health Checks

```powershell
kubectl -n thehive get pods
kubectl -n thehive logs deploy/thehive
kubectl -n thehive logs statefulset/cassandra
kubectl -n thehive logs statefulset/elasticsearch
```

## Argo CD

```powershell
kubectl -n argocd get applications
kubectl -n argocd describe application thehive
```

## Scale Notes

The default free-tier overlay uses one replica for Cassandra and Elasticsearch. That is not highly available. For production, use at least:

- Three GKE nodes across zones
- Three Cassandra pods
- Three Elasticsearch pods
- A licensed TheHive mode that supports the desired number of TheHive application nodes

## Backup Notes

Back up:

- Cassandra persistent volume
- Elasticsearch persistent volume
- TheHive GCS attachment bucket
- Kubernetes Secrets or Secret Manager entries

Take backups before every upgrade.

## Common Checks

```powershell
kubectl -n thehive describe ingress thehive
kubectl -n thehive get pvc
kubectl -n thehive get events --sort-by=.lastTimestamp
```
