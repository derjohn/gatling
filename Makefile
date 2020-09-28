VERSION?=3.3.1
DKRIMG?=denvazh/gatling
GATLINGDIR=~/gatling

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

docker-run:
	docker run -it --rm -v $(GATLING)/conf:/opt/gatling/conf \
	-v $(GATLING)/user-files:/opt/gatling/user-files \
	-v $(GATLING)/results:/opt/gatling/results \
	$(DKRIMG):$(VERSION)

shellalias:
	@echo 'Add this to e.g. your .bashrc in your homedir'
	@echo 'Then you can run the gatling docker container from yout shell with gatling <youroptions>'
	@echo
	@echo "alias gatling=\"docker run -it -v $(GATLING)/conf:/opt/gatling/conf \
	-v $(GATLING)/user-files:/opt/gatling/user-files \
	-v $(GATLING)/results:/opt/gatling/results \
	$(DKRIMG):$(VERSION)\""

