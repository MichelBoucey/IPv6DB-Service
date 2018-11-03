help:
	@echo "make [build|start|stop|test]"

.PHONY: build start stop test

build:
	@docker-compose build --force-rm

start:
	@docker-compose run -d -p 4446:4446 --name ipv6db_frontend frontend

stop:
	@docker-compose down

test:
	@echo -e "\nGet a resource which does not exist yet"
	curl http://localhost:4446/ipv6db/v1/list/my_hosts/addresses/12::34
	@echo -e "\n\nAdd this resource"
	curl -X POST -d '{ "source": { "test": "OK" } }' http://localhost:4446/ipv6db/v1/list/my_hosts/addresses/12::34
	@echo -e "\nGet this resource"
	curl http://localhost:4446/ipv6db/v1/list/my_hosts/addresses/12::34
	@echo -e "\n\nUpdate this resource"
	curl -X PUT -d '{ "source": { "test": "OK", "version": 2 } }' http://localhost:4446/ipv6db/v1/list/my_hosts/addresses/12::34
	@echo -e "\nGet this resource updated"
	curl http://localhost:4446/ipv6db/v1/list/my_hosts/addresses/12::34
	@echo -e "\n\nDelete this resource"
	curl -X DELETE http://localhost:4446/ipv6db/v1/list/my_hosts/addresses/12::34
