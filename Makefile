

deploy:
	cd terraform && terraform apply -auto-approve

teardown:
	cd terraform && terraform destroy