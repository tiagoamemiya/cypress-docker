CONTAINER_NAME=cypress-app

dev/local:
	docker-compose up -d && \
	docker exec -it ${CONTAINER_NAME} npm install && \
	docker exec -it ${CONTAINER_NAME} npm audit fix --force

cy/run:
	docker exec -it ${CONTAINER_NAME} cypress run

report:
	docker exec -it ${CONTAINER_NAME} npx mochawesome-merge "cypress/report/*.json" > mochawesome.json && \
	docker exec -it ${CONTAINER_NAME} npx marge mochawesome.json --reportDir cypress/report/ && \
	docker exec -it ${CONTAINER_NAME} rm -rf cypress/report/*.json && \
	docker exec -it ${CONTAINER_NAME} rm -rf mochawesome.json


