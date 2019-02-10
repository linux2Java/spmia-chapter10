echo "Launching $BUILD_NAME IN AMAZON ECS"
ecs-cli configure --region us-west-1 --access-key $AWS_ACCESS_KEY --secret-key $AWS_SECRET_KEY --cluster spmia-tmx-dev
mkdir -p /etc/ecs
cat << EOF >/etc/ecs/ecs.config
ECS_CLUSTER=spmia-tmx-dev
ECS_ENGINE_AUTH_TYPE=docker
ECS_ENGINE_AUTH_DATA={"https://index.docker.io/v1/":{"username":"linuxjava","password":"txy123abc","email":"xy_tian@126.com"}}
ECS_LOGLEVEL=debug
EOF
ecs-cli compose --file docker/common/docker-compose.yml up
rm -rf ~/.ecs
