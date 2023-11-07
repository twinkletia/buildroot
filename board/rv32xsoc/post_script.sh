set -ex

pushd ${TARGET_DIR}/dev
if [ ! -e console ]; then
mknod console c 5 1
fi
if [ ! -e null ]; then
mknod null c 1 3
fi
popd

pushd ${TARGET_DIR}
cp -r /opt/riscv/native-tools/bin/* bin/
cp -r /opt/riscv/native-tools/lib/* lib/
cp -r /opt/riscv/native-tools/libexec/ .
cp -r /opt/riscv/native-tools/riscv32-unknown-linux-gnu/sysroot/* .
popd

pushd ${TARGET_DIR}/bin
for file in riscv32-unknown-linux-gnu-*; do
    new_file=$(echo "$file" | sed 's/riscv32-unknown-linux-gnu-//')
    if [ ! -e $new_file ]; then
        ln -s $file $new_file
    fi
done
popd