
install:
	pipenv install ansible-core
	pipenv run ansible-galaxy install -r ansible_src/ansible-requirements.yaml

deploy-website:
	cd ansible_src && pipenv run ansible-playbook playbook.yaml -t website
