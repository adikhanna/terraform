aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 616690186094.dkr.ecr.us-east-2.amazonaws.com
docker build -t test-rds-conn .
docker tag test-rds-conn:latest 616690186094.dkr.ecr.us-east-2.amazonaws.com/app:latest
docker push 616690186094.dkr.ecr.us-east-2.amazonaws.com/app:latest