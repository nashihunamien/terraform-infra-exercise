.PHONY: all

SHELL = /bin/bash
ENV ?= development

terrafom-init:
feq ($(ENV), development)
	terraform init -backend-config=terraform/backends/development.tfvars 
else ifeq ($(ENV), staging)
	terraform init -backend-config=terraform/backends/staging.tfvars
else ifeq ($(ENV), production)
	terraform init -backend-config=terraform/backends/production.tfvars
else 
	@echo Pick your ENV=development, ENV=staging or ENV=production
endif

terrafom-plan:
feq ($(ENV), development)
	terraform plan -var-file=terraform/tfvars/development.tfvars 
else ifeq ($(ENV), staging)
	terraform plan -var-file=terraform/tfvars/staging.tfvars
else ifeq ($(ENV), production)
	terraform plan -var-file=terraform/tfvars/production.tfvars
else 
	@echo Pick your ENV=development, ENV=staging or ENV=production
endif

terrafom-apply:
feq ($(ENV), development)
	terraform plan -var-file=terraform/tfvars/development.tfvars 
else ifeq ($(ENV), staging)
	terraform plan -var-file=terraform/tfvars/staging.tfvars
else ifeq ($(ENV), production)
	terraform plan -var-file=terraform/tfvars/production.tfvars
else 
	@echo Pick your ENV=development, ENV=staging or ENV=production
endif