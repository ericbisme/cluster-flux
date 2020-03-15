.PHONY: all
all: helm-operator

.PHONY: clean
clean:
	rm -rf *.yaml

.PHONY: helm-operator
helm-operator:
	helm fetch fluxcd/helm-operator -d /tmp --untar && \
	helm3 template --name-template helm-operator /tmp/helm-operator \
	--namespace flux \
	--set git.ssh.secretName=flux-git-deploy \
	--set helm.versions=v3 \
	--set configureRepositories.enable=true \
	--set configureRepositories.repositories[0].name=stable \
	--set configureRepositories.repositories[0].url=https://kubernetes-charts.storage.googleapis.com \
	--set configureRepositories.repositories[1].name=fluxcd \
	--set configureRepositories.repositories[1].url=https://charts.fluxcd.io \
	--set configureRepositories.repositories[2].name=podinfo \
	--set configureRepositories.repositories[2].url=https://stefanprodan.github.io/podinfo \
	--set annotations."fluxcd\.io/automated"=\"true\" \
	--set annotations."fluxcd\.io/tag\.flux-helm-operator"="1.0.*" \
	--set annotations."linkerd\.io/inject"="enabled" \
	> helm-operator.yaml
	yq w -i -d'*' helm-operator.yaml metadata.namespace "flux"
