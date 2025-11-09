build:
  ninja -C out

gen:
  ./third_party/gn/gn gen out

sync:
  gclient sync

deps:
  brew install llvm qemu

clean:
  rm -rf out/
