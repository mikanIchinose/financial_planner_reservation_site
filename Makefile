rails-new:
	docker-compose run --rm web rails new . --force --no-deps --database=mysql --webpacker
db-create:
	docker-compose run --rm web rails db:create
migrate:
	docker-compose run --rm web rails db:migrate