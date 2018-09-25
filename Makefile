build:
ifeq (,$(wildcard frontend/ipv6db))
	git clone https://github.com/MichelBoucey/IPv6DB.git
	@cd IPv6DB && stack install --local-bin-path=../frontend/
endif
	docker-compose build

clean:
	@rm -rf IPv6DB frontend/ipv6db

start:
	docker-compose run -p 4446:4446 frontend
	@echo "IPv6DB enabled on http://localhost:4446"

stop:
	docker-compose down
