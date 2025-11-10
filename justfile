build *flags:
  ninja -C out {{flags}}

gen:
  ./third_party/gn/gn gen out

sync:
  gclient sync -D -j{{ num_cpus() }}

deps:
  brew install llvm qemu

clean:
  rm -rf out/
