.PHONY: all
all: helm-operator

.PHONY: clean
clean:
	rm -rf *.yaml

.PHONY: helm-operator
helm-operator:
	helm3 template --name-template helm-operator fluxcd/helm-operator \
	--namespace flux \
	--set image.repository=docker.io/fluxcd/helm-operator-prerelease \
	--set image.tag=helm-v3-dev-53b6a21d \
	--set configureRepositories.enable=true \
	--set configureRepositories.repositories[0].name=stable \
	--set configureRepositories.repositories[0].url=https://kubernetes-charts.storage.googleapis.com \
	--set configureRepositories.repositories[1].name=fluxcd \
	--set configureRepositories.repositories[1].url=https://charts.fluxcd.io \
	--set configureRepositories.repositories[2].name=podinfo \
	--set configureRepositories.repositories[2].url=https://stefanprodan.github.io/podinfo \
	> helm-operator.yaml
	yq w -i -d'*' helm-operator.yaml metadata.namespace "flux"
