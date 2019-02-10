echo "Launching $BUILD_NAME IN AMAZON ECS"
ecs-cli configure profile --profile-name  default --access-key $AWS_ACCESS_KEY --secret-key $AWS_SECRET_KEY
ecs-cli configure --cluster spmia-tmx-dev --default-launch-type EC2 --region ap-northeast-1 --config-name default
sudo cat << EOF >/etc/ecs/ecs.config
ECS_CLUSTER=spmia-tmx-dev
ECS_ENGINE_AUTH_TYPE=docker
ECS_ENGINE_AUTH_DATA={"https://index.docker.io/v1/":{"username":"linuxjava","password":"txy123abc","email":"xy_tian@126.com"}}
ECS_LOGLEVEL=debug
EOF
ecs-cli compose --file docker/common/docker-compose.yml up
rm -rf ~/.ecs
