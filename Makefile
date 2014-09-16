include rebar.mk

REBAR_URL=https://github.com/rebar/rebar/releases/download/2.5.1/rebar
RELX_URL=https://github.com/erlware/relx/releases/download/v1.0.4/relx

.PHONY: docker-image

docker-image: docker/arch.tar.gz docker/release.tar.gz
	docker build docker

docker/arch.tar.gz: mk-arch.sh
	rm -rf arch
	./mk-arch.sh
	cd arch && tar -czf ../docker/arch.tar.gz *

docker/release.tar.gz: release
	cd _rel/cowdock && tar -czf ../../docker/release.tar.gz *
