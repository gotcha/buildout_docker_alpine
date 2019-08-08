fly:
	wget -O fly "http://localhost:8080/api/v1/cli?arch=amd64&platform=$(shell uname)"
	chmod +x fly

update: fly
	./fly --target buildout-ci login --concourse-url http://127.0.0.1:8080 -u test -p test
	./fly -t buildout-ci set-pipeline -c main.yml -p buildout
	./fly -t buildout-ci set-pipeline -c zope/zope.yml -p zope
	./fly -t buildout-ci unpause-pipeline -p buildout
	./fly -t buildout-ci unpause-pipeline -p zope

up:
	docker-compose up -d

start: update
	./fly -t buildout-ci trigger-job --job zope/zope-image-bootstrap
