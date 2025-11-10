
# Build the project. Needs the gen step to be run first.
ninja *flags:
  ninja -C out {{flags}}

# Generate the build directory.
gen:
  ./third_party/gn/gn gen out

# Sync all dependencies fetched over the network.
sync:
  gclient sync -D -j{{ num_cpus() }}

# Clean the build directories.
clean:
  rm -rf out/
