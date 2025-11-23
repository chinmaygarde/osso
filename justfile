# Build the project.
build: ninja

# Invoke ninja.
ninja *flags: gen
  ninja -C out {{flags}}

# Generate the build directory.
gen:
  ./third_party/gn/gn gen --check --export-compile-commands=default out

# Sync all dependencies fetched over the network.
sync:
  gclient sync -D -j{{ num_cpus() }}

# Clean the build directories.
clean:
  rm -rf out/

gn *flags:
  ./third_party/gn/gn {{flags}}

run: build
  qemu-system-aarch64       \
    -M virt                 \
    -cpu cortex-a53         \
    -m 512M                 \
    -nographic              \
    -serial stdio           \
    -drive if=pflash,format=raw,readonly=on,file=`brew --prefix qemu`/share/qemu/edk2-aarch64-code.fd \
    -drive file=fat:rw:out,format=raw,if=virtio                                                       \
    -monitor telnet:127.0.0.1:45454,server,nowait
