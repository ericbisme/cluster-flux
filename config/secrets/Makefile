.PHONY: all
all: alertmanager unifi-poller traefik-route53-dnsprovider-config

.PHONY: clean
clean:

.PHONY: alertmanager
alertmanager:
	 sops -d alertmanager.yaml | kubectl create secret generic alertmanager-config -n klippy --from-file=alertmanager.yaml=/dev/stdin --dry-run=client -o yaml | kubectl replace -f -

.PHONY: unifi-poller
unifi-poller:
	 sops -d unifi-poller.yaml | kubectl replace -f -

.PHONY: traefik-route53-dnsprovider-config
traefik-route53-dnsprovider-config:
	 sops -d traefik-route53-dnsprovider-config.yaml | kubectl replace -f -
