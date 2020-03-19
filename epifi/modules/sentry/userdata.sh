#!/bin/bash
sudo su
yum update -y
yum install git -y
git clone https://github.com/getsentry/onpremise.git
yum install docker -y
service docker start
usermod -a -G docker ec2-user
yum update -y aws-cfn-bootstrap
yum update -y aws-cli
curl -L \https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)\ -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
cd /onpremise
docker volume create --name=sentry-data && docker volume create --name=sentry-postgres
cd /onpremise
cp -n .env.example .env
docker-compose build
docker-compose run --rm web config generate-secret-key > generate_key_output.txt
KEY=$(tail -n 1 generate_key_output.txt)
cat /dev/null > .env
comment="#Find the below key generated by docker-compose"
echo $comment > .env
sed -i \1i SENTRY_SECRET_KEY=${KEY}\ .env
yes n |   docker-compose run --rm web upgrade
docker-compose up -d