FROM postgres:alpine
RUN apk update
EXPOSE 80
CMD ["/bin/sh", "-c", "'PGPASSWORD=$DB_PASSWORD psql --dbname=$DB_NAME --host=$DB_HOST --username=$DB_USER'"]