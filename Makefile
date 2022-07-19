GOLANG_CONTAINER=golang:1.18


define PRINT_HELP_PYSCRIPT
import re, sys
for line in sys.stdin:
        match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
        if match:
            target, help = match.groups()
            print("%-20s %s" % (target, help))
endef

export PRINT_HELP_PYSCRIPT

default: help

help: ## Show available make targets
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

test: ## Run tests
	docker run --rm \
	-v $(shell pwd):/go/src/github.com/nginxinc/glog \
	-w /go/src/github.com/nginxinc/glog \
	$(GOLANG_CONTAINER) /bin/sh -c "go test -count=1"

lint: ## Run linter
	docker run --pull always --rm -v $(shell pwd):/glog -w /glog -v $(shell go env GOCACHE):/cache/go -e GOCACHE=/cache/go -e GOLANGCI_LINT_CACHE=/cache/go -v $(shell go env GOPATH)/pkg:/go/pkg golangci/golangci-lint:latest golangci-lint --color always run

