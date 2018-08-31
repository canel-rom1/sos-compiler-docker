prefix  ?= canelrom1
name    ?= sos-compiler
tag     ?= $(shell date +%y.%m.%d)

all: build

install: build
	cp ./bin/makesos $(HOME)/bin

desinst: clean
	rm -f $(HOME)/bin/makesos

build: Dockerfile
	docker build -t $(prefix)/$(name):$(tag) .
	docker tag $(prefix)/$(name):$(tag) $(prefix)/$(name):latest 

stop:
	docker stop $(name)

rm: stop
	docker rm $(name)

clean-docker:
	docker rmi $(prefix)/$(name):$(tag)

clean-docker-latest:
	docker rmi $(prefix)/$(name):latest

clean: clean-docker-latest clean-docker

doc:
	@grip -b --quiet ./README.md 127.0.0.1:8888 &

doc-stop:
	killall grip


# vim: ft=make
