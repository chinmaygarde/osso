# Build the project. Needs the gen task to be run first.
build: ninja

# Invoke ninja.
ninja *flags:
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
  qemu-system-aarch64 \
    -M virt \
    -cpu cortex-a53 \
    -m 512M \
    -nographic \
    -drive if=pflash,format=raw,readonly=on,file=/Users/buzzy/Downloads/QEMU_EFI.fd \
    -drive if=none,file=out/EFI/Boot/BOOTX64.efi,format=raw,id=hd0 \
    -device virtio-blk-pci,drive=hd0 \
    -serial stdio \
    -monitor telnet:127.0.0.1:45454,server,nowait
