# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
.PHONY: help pre-commit-all test test-env

# Default project name selected by the cookiecutter template
PROJECT_NAME:=my-jupyter-stack
# Shell that make should use
SHELL:=bash

# Cookiecutter configurations to test
ALL_CONFIGS= \
	base.yaml \
	minimal.yaml \
	scipy.yaml \
	r.yaml \
	tensorflow.yaml \
	datascience.yaml \
	pyspark.yaml \
	all-spark.yaml



# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'



pre-commit-all: ## run pre-commit hook on all files
	@pre-commit run --all-files --hook-stage manual



test/%:
	cookiecutter --no-input --config-file configs/$(notdir $@) -f -o /tmp .
	make -C /tmp/$(PROJECT_NAME) build install-dev-env test

test-all: $(foreach I, $(ALL_CONFIGS), test/$(I)) ## Make projects and runs their tests

test-env: ## Make a test environment by installing test dependencies with pip
	pip install -r requirements-test.txt
