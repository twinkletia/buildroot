set -ex

pushd ${TARGET_DIR}/dev
if [ ! -e console ]; then
mknod console c 5 1
fi
if [ ! -e null ]; then
mknod null c 1 3
fi
popd