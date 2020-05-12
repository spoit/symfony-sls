startshell:
	docker run --rm -v "$(PWD)":/var/task -it bref/dev-env bash

localInstall:
	# Prepare PHP
	docker run --rm -v "$(PWD)":/var/task -it bref/dev-env composer install
	# Prepare JS
	npm i

localServer:
	docker run --rm -p 80:80 -v "$(PWD)":/var/task -it bref/dev-env php -S 0.0.0.0:80 -t public

deploy:
	# Prepare PHP
	docker run --rm -v "$(PWD)":/var/task -it bref/dev-env composer install --optimize-autoloader --no-dev --no-scripts
	rm -rf "$(PWD)/var/cache/*"
	docker run --rm -v "$(PWD)":/var/task -it bref/dev-env php bin/console cache:clear --no-debug --no-warmup --env=prod
	docker run --rm -v "$(PWD)":/var/task -it bref/dev-env php bin/console cache:warmup --env=prod
	# Prepare JS
	npm install
	# Deploy dev
	npm run deploy
