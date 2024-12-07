export AOSP_DIR="$(pwd)/repo"
BRANCH="android-security-12.1.0_r4"

docker run -ti --rm \
    -v "${AOSP_DIR}/${BRANCH}/:/aosp" \
    -v "${AOSP_DIR}/.gitcookies:/root/.gitcookies:ro" \
    jdk21 \
    /aosp.sh checkout-branch --no-mirror $BRANCH -c -j8