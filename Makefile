.PHONY: source
source:
	flux create source git team-1 \
	    --namespace=team-1
		--url=https://github.com/rparmer/flux-multi-tenancy-team-1
		--branch=main \
		--interval=1m

.PHONY: kustomization
kustomization:
	flux create kustomization team-1 \
		--namespace=team-1 \
		--source=team-1 \
		--path="./kustomize" \
		--interval=5m
