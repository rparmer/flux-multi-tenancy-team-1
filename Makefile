.PHONY: all
all: source kustomization

.PHONY: source
source:
	flux create source git team-1 \
		--namespace=team-1 \
		--url=https://github.com/rparmer/flux-multi-tenancy-team-1 \
		--branch=main \
		--interval=1m

.PHONY: kustomization
kustomization:
	flux create kustomization team-1 \
		--namespace=team-1 \
		--source=team-1 \
		--service-account=team-1 \
		--path=kustomize \
		--prune=true \
		--interval=5m

.PHONY: cleanup
cleanup:
	flux delete kustomization team-1 --namespace team-1 --silent
	flux delete source git team-1 --namespace team-1 --silent
