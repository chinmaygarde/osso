
# Build the project. Needs the gen step to be run first.
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
