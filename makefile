define RUN_LOCAL_TXT
Which service do you want to start run?
  1) _build-nginx-image
  2) _docker-build-tar

endef
export RUN_LOCAL_TXT

.PHONY: run
run:
	@echo "$$RUN_LOCAL_TXT";
	@read -p "ENTER THE NUMBER: " SERVICE ;\
 	if [ "$$SERVICE" = "1" ]; then make _build-nginx-image; fi ;\
 	if [ "$$SERVICE" = "2" ]; then make _docker-build-tar; fi ;\
 


.PHONY: _build-nginx-image
_build-nginx-image:
	docker build -f Dockerfile.nginx -t my-nginx:latest .


.PHONY: _docker-build-tar
_docker-build-tar:
	docker save -o ./my-nginx.tar my-nginx:latest