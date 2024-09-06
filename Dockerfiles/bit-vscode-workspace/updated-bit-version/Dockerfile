# Using the forked bitcli vscode devcontainer/workspace
# BVM is installed in version 1.0.4
FROM iham/bit-vscode-workspace:forked-base

# switching to the none root user
USER user

# bit is installed in version 1.6.173
# bvm upgrade would pick the latest nightly build
# to deactivate nightly builds we remove the config entry
RUN bvm config del RELEASE_TYPE

# and run upgrade to replace the latest nightly with the latest stable release
RUN bvm upgrade --use-system-node true --skip-path-update true
