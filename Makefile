VERSION?=3.3.1
DKRIMG?=denvazh/gatling

docker-build:
	docker build -t $(DKRIMG):$(VERSION) .

docker-tag-latest:
	docker tag $(DKRIMG):$(VERSION) $(DKRIMG):latest

docker-push:
	docker push denvazh/gatling:$(VERSION)

docker-push-latest:
	docker push denvazh/gatling:latest

update-symlink:
	ln -fs ./$(VERSION)/Dockerfile ./Dockerfile

