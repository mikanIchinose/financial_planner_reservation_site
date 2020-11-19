rails-new:
	docker-compose run web rails new . --force --no-deps --database=mysql --webpacker
db-create:
	docker-compose run web rails db:create
