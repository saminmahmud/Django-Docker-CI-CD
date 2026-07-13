# Docker Essential Commands

## Docker Version Check

```bash
docker --version
docker compose version
```

---

# Docker Image Commands

## Build Docker Image

```bash
docker build -t image-name .
```

Example:

```bash
docker build -t django-app .
```

## List Images

```bash
docker images
```

## Remove Image

```bash
docker rmi image-name
```

Example:

```bash
docker rmi django-app
```

---

# Docker Container Commands

## List Running Containers

```bash
docker ps
```

## List All Containers

```bash
docker ps -a
```

## Run Container

```bash
docker run image-name
```

## Run Container in Background

```bash
docker run -d image-name
```

## Stop Container

```bash
docker stop container-name
```

Example:

```bash
docker stop django-app-container
```

## Start Existing Container

```bash
docker start container-name
```

## Restart Container

```bash
docker restart container-name
```

## Remove Container

```bash
docker rm container-name
```

Force remove:

```bash
docker rm -f container-name
```

---

# Docker Logs

View logs:

```bash
docker logs container-name
```

Follow logs:

```bash
docker logs -f container-name
```

Example:

```bash
docker logs -f django-app-container
```

---

# Execute Commands Inside Container

Open bash shell:

```bash
docker exec -it container-name bash
```

Example:

```bash
docker exec -it django-app-container bash
```

Run Django command:

```bash
docker exec -it django-app-container python manage.py migrate
```

Create superuser:

```bash
docker exec -it django-app-container python manage.py createsuperuser
```

---

# Docker Compose Commands

## Start Services

```bash
docker compose up
```

Run background:

```bash
docker compose up -d
```

Build and start:

```bash
docker compose up -d --build
```

---

## Stop Services

```bash
docker compose down
```

Remove containers and volumes:

```bash
docker compose down -v
```

---

## Check Services

```bash
docker compose ps
```

---

## Compose Logs

All services:

```bash
docker compose logs
```

Specific service:

```bash
docker compose logs web
```

Follow logs:

```bash
docker compose logs -f web
```

---

# Django Docker Commands

## Create Migration

```bash
docker compose exec web python manage.py makemigrations
```

## Apply Migration

```bash
docker compose exec web python manage.py migrate
```

## Create Superuser

```bash
docker compose exec web python manage.py createsuperuser
```

## Django Shell

```bash
docker compose exec web python manage.py shell
```

## Collect Static Files

```bash
docker compose exec web python manage.py collectstatic
```

---

# Docker Volume Commands

## List Volumes

```bash
docker volume ls
```

## Inspect Volume

```bash
docker volume inspect volume-name
```

## Remove Volume

```bash
docker volume rm volume-name
```

Remove unused volumes:

```bash
docker volume prune
```

---

# Docker Network Commands

## List Networks

```bash
docker network ls
```

## Inspect Network

```bash
docker network inspect network-name
```

Example:

```bash
docker network inspect demo-project_app-network
```

## Create Network

```bash
docker network create network-name
```

## Remove Network

```bash
docker network rm network-name
```

---

# PostgreSQL Docker Commands

Access PostgreSQL container:

```bash
docker compose exec postgres bash
```

Open PostgreSQL shell:

```bash
psql -U username -d database_name
```

Example:

```bash
psql -U myuser -d mydatabase
```

List databases:

```sql
\l
```

List tables:

```sql
\dt
```

Exit:

```sql
\q
```

---

# Redis Docker Commands

Open Redis CLI:

```bash
docker exec -it redis-container redis-cli
```

Test Redis:

```bash
ping
```

Response:

```text
PONG
```

Show keys:

```bash
keys *
```

---

# Docker Cleanup Commands

Remove stopped containers:

```bash
docker container prune
```

Remove unused images:

```bash
docker image prune
```

Remove unused resources:

```bash
docker system prune
```

Remove everything:

```bash
docker system prune -a --volumes
```

---

# Docker Debugging Commands

Container details:

```bash
docker inspect container-name
```

Resource usage:

```bash
docker stats
```

Docker events:

```bash
docker events
```

---

# Common Problems

## Port Already Used

Check containers:

```bash
docker ps
```

Stop old container:

```bash
docker stop container-name
```

---

## Database Connection Error

Check services:

```bash
docker compose ps
```

PostgreSQL logs:

```bash
docker compose logs postgres
```

Restart PostgreSQL:

```bash
docker compose restart postgres
```

---

## Rebuild Complete Project

Remove containers and volumes:

```bash
docker compose down -v
```

Build again:

```bash
docker compose up -d --build
```

---

# Environment Variables

Check container environment:

```bash
docker exec container-name env
```

---

# Port Mapping

Check container ports:

```bash
docker port container-name
```

---

# Copy Files

Copy file from container:

```bash
docker cp container-name:/path/file .
```

Copy file into container:

```bash
docker cp file container-name:/path/
```

---

# Production Commands

## Gunicorn

```bash
gunicorn config.wsgi.application --bind 0.0.0.0:8000
```

## Gunicorn in Docker

```bash
docker compose exec web gunicorn config.wsgi.application --bind 0.0.0.0:8000
```

---

# Docker Compose Useful Commands

Restart services:

```bash
docker compose restart
```

Build without cache:

```bash
docker compose build --no-cache
```

View logs:

```bash
docker compose logs -f
```

---

# Deployment Workflow

Clone project:

```bash
git clone repository-url
```

Create environment file:

```bash
cp .env.example .env
```

Build containers:

```bash
docker compose up -d --build
```

Run migrations:

```bash
docker compose exec web python manage.py migrate
```

Create admin user:

```bash
docker compose exec web python manage.py createsuperuser
```

Check application logs:

```bash
docker compose logs -f
```