#!/bin/bash
IMAGE_NAME="hello:latest"
CONTAINER_NAME="hello"

# 0. Docker prune: 사용하지 않는 이미지/컨테이너 일괄 삭제
echo -e "\n===== 0. Docker Prune ====="
docker system prune --all --force

# 1. 컨테이너 제거
echo -e "\n===== 2. Remove Container ====="
docker ps | grep "$IMAGE_NAME" | awk '{print $1}' | xargs -r docker rm -f

# 2. 이미지 제거
echo -e "\n===== 3. Remove Image ====="
docker images | grep "${IMAGE_NAME%%:*}" | awk '{print $3}' | xargs -r docker rmi -f

# 3. 이미지 빌드
echo -e "\n===== 4. Rebuild Image ====="
docker build -t $IMAGE_NAME -f Dockerfile .

# 4. 컨테이너 실행
echo -e "\n===== 5. Restart Container ====="
docker run -d --name $CONTAINER_NAME -p 8000:8080 $IMAGE_NAME

# 5. 컨테이너 확인
echo -e "\n===== 6. Check Container State ====="
docker ps