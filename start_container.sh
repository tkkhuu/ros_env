USER_ID="$(id -u)"
IMAGE_NAME="ros_env"
RUNTIME="--gpus all"

SHARED_DOCKER_DIR=/home/ros/shared_dir
SHARED_HOST_DIR=`pwd`/shared_dir

VOLUMES="--volume=$XSOCK:$XSOCK:rw
         --volume=$XAUTH:$XAUTH:rw
         --volume=$SHARED_HOST_DIR:$SHARED_DOCKER_DIR:rw"

docker run \
    -it --rm \
    $VOLUMES \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
    --env="USER_ID=$USER_ID" \
    --privileged \
    --net=host \
    $RUNTIME \
    $IMAGE_NAME