# TODO: See https://github.com/rust-lang-nursery/rustup.rs/issues/268#issuecomment-282526696

set -ex

main() {
    curl https://sh.rustup.rs -sSf | \
        sh -s -- -y --default-toolchain $TRAVIS_RUST_VERSION

    if [ $TRAVIS_OS_NAME = linux ]; then
        sort=sort
    else
        sort=gsort  # for `sort --sort-version`, from brew's coreutils.
    fi

    # This fetches latest stable release
    local tag=$(git ls-remote --tags --refs --exit-code https://github.com/japaric/cross \
                       | cut -d/ -f3 \
                       | grep -E '^v[0-9.]+$' \
                       | $sort --version-sort \
                       | tail -n1)
    echo cross version: $tag
    curl -LSfs https://japaric.github.io/trust/install.sh | \
        sh -s -- \
           --force \
           --git japaric/cross \
           --tag $tag \
           --target $TARGET

    # Build a custom container if specified
    local dockerdir="./ci/$TARGET"
    if [ -d "$dockerdir" ]; then
      docker build -t tantivy-cli-$TARGET:latest $dockerdir
    fi
}

main
