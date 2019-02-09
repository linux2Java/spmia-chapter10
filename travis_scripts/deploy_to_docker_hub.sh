echo "Pushing service docker images to docker hub ...."
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push linuxjava/tmx-authentication-service:$BUILD_NAME
docker push linuxjava/tmx-licensing-service:$BUILD_NAME
docker push linuxjava/tmx-organization-service:$BUILD_NAME
docker push linuxjava/tmx-confsvr:$BUILD_NAME
docker push linuxjava/tmx-eurekasvr:$BUILD_NAME
docker push linuxjava/tmx-zuulsvr:$BUILD_NAME
