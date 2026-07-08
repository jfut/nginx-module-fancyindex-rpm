set dotenv-load := true
set export := true
set positional-arguments := true

NAME := "nginx-module-fancyindex-rpm"

# Show available tasks.
default:
    @just --list

#
# clean
#

# Recreate the release artifact directory.
clean:
    rm -rf dist
    mkdir -p dist

#
# lint
#

# Run ShellCheck for the main Bash CLI script.
lint:
    shellcheck build build-rpm

#
# release
#

# Build a local snapshot release without publishing.
snapshot:
    goreleaser release --skip=publish --clean --snapshot

# Build release artifacts locally without publishing.
release-local:
    goreleaser release --skip=publish --clean --auto-snapshot

# Build release artifacts for a tagged release without publishing.
release:
    goreleaser release --skip=publish --clean
