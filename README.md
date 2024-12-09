# minicap.so Builder

Build minicap.so for MuMu player (which is android-32, x86_64)

I cannot find this file online so I just build one myself lol

Todos:

- [x] Remove all windows related path
- [x] Clean up building process
- [x] Write a better guide
- [ ] Delete everything and start over to make sure this guide works (definetely not doing it with my current computer)

## How to build it yourself

This repo is basically copied from [openstf/minicap/tree/master/jni/minicap-shared](https://github.com/openstf/minicap/tree/master/jni/minicap-shared), with some minor tweaks.
Since this repo is only doing a subset of tasks of what minicap was doing, I felt it more clear to just copy a part of it instead of cloning the whole thing. The original repo has a more detailed guide so you may also check it out if you run into problems.

### Prerequisite

Your machine should have at least 100GB of disk space and 16GB of RAM available for the building process(which means 32GB in total would be fine). HDD is slow as hell, so SSD is much preferred.

The machine should also run on a OS with case-sensitive file system (which basically means linux), it's a requirement of AOSP. So if you're using WSL2 like me, don't place your files under `/mnt/<windows-drive>/`.

This setup uses [docker](https://www.docker.com/) and [make](https://www.gnu.org/software/make/) so you should install it too.

### Pull docker image

Pull the image with:

```bash
docker pull sahadusa/aosp:jdk21
```

You can also modify the Dockerfile in `image/` if you need other jdk versions or have other needs, then build it with:

```bash
docker build -t <tag> .
```

Remember to change all docker commands in Makefile and `.sh` files if you're doing this.

### Checkout aosp branch

I only need one branch so I just hardcoded it in `checkout.sh`. See [Source code tags and builds](https://source.android.com/docs/setup/reference/build-numbers#source-code-tags-and-builds) and [Codenames, tags, and build numbers](https://source.android.com/docs/setup/reference/build-numbers) if you need other API levels.

`checkout.sh` also exports a variable `AOSP_DIR`, which will later be used by `aosp/Makefile`. This is the directory where all branches will be stored.

After choosing your desired branch and path to store aosp, simply run 

```bash
./checkout.sh
```

If any error occurs, you can always peek inside the container and tinker things by 

```bash
# (remember to set the variables before running this)
docker -it --rm -v ${AOSP_DIR}/${BRANCH}/:/aosp sahadusa/aosp:jdk21
```

The original repo also mentioned about [AOSP authentication](https://github.com/openstf/minicap/tree/master/jni/minicap-shared#aosp-authentication), but no trace of `.gitcookies` can be seen in the [AOSP download guide](https://source.android.com/docs/setup/download) as of 2024, so maybe it's safe to just leave it out.

### Building

make sure `AOSP_DIR` is properly set, then

```bash
cd aosp
make -j 1
```

Congratulation! You're done! Now just wait for the compilation to stop on some random error and spent a whole day trying to figure out which version of which third party apps is compatible with your current branch of aosp and repeat this process until you're on the edge of quitting and finally get a successfull compile.