build:
ifeq (,$(wildcard frontend/ipv6db))
	git clone https://github.com/MichelBoucey/IPv6DB.git
	@cd IPv6DB && stack install --local-bin-path=../frontend/
endif
	docker-compose build

clean:
	@rm -rf IPv6DB frontend/ipv6db
