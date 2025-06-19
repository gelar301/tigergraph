docker rm -f postgres
docker rm -f bri-api-container
docker rm -f bri-web-container

docker rmi postgres:15.2-alpine
docker rmi p-bri-api-release
docker rmi p-bri-web-release

docker network rm tg_aml_toolkit

# docker pull postgres:15.2-alpine
docker load -i ./postgres-15.2-alpine.tar
docker load -i ./bri-stage-api.tar
docker load -i ./bri-stage-web.tar

docker network create tg_aml_toolkit

docker run \
  --network=tg_aml_toolkit \
  --name postgres \
  -v $(pwd)/db-setup.sql:/docker-entrypoint-initdb.d/pg-setup.sql \
  -p 5432:5432 \
  -d \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  postgres:15.2-alpine

docker run \
  --network=tg_aml_toolkit \
  --name bri-api-container \
  -v $(pwd)/api-config.json:/cfg/config.json \
  -v $(pwd)/cert/certificate.crt:/api/cert/ssl-certificate.crt \
  -v $(pwd)/cert/certificate.key:/api/cert/ssl-certificate.key \
  -p 5555:5555 \
  -d \
  p-bri-api-release

docker run \
  --network=tg_aml_toolkit \
  --name bri-web-container \
  -v $(pwd)/web-config.json:/static/config.json \
  -v $(pwd)/cert/certificate.crt:/etc/nginx/ssl-certificate.crt \
  -v $(pwd)/cert/certificate.key:/etc/nginx/ssl-certificate.key \
  -p 2004:2004 \
  -d p-bri-web-release
