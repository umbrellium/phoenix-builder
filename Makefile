NAME := umbrellium/phoenix-builder

TAG := $(shell git describe --tags --always --dirty)

IMG := $(NAME):$(TAG)
LATEST := $(NAME):latest


.PHONY: build
build:
	@docker build -t $(IMG) .
	@docker tag $(IMG) $(LATEST)

.PHONY: push
push:
	@docker push $(IMG)
	@docker push $(LATEST)
