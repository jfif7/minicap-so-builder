AOSP_ROOT="D:/aosp"
BRANCH="android-security-12.1.0_r4"

docker run -ti --rm \
    -v "${AOSP_ROOT}/${BRANCH}/:/aosp" \
    -v "${AOSP_ROOT}/.gitcookies:/root/.gitcookies:ro" \
    jdk21 \
    /aosp.sh checkout-branch --no-mirror $BRANCH -c -j8