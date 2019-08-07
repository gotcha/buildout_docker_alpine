fly:
	wget -O fly http://localhost:8080/api/v1/cli?arch=amd64&platform=linux

update: fly
	./fly -t buildout-ci set-pipeline -c main.yml -p buildout
	./fly -t buildout-ci unpause-pipeline -p buildout

up:
	docker-compose up -d
