# broker
~~1. Hardcode responses from all endpoints~~

~~2. Dockerize~~~
the aim of the dockerization is to use intermediate container to build something that can run on a plain alpine image.
- build base image that has ghc and stack. The reasoning is if we build on alpine it is less moving parts when we want to run the program on alpine.
- Since the packages scotty depends on are around 2 Gb we have an image that has downloaded all these dependencies. This takes many minutes of builds.
- last we use an intermediate container to build and install the binary to a fresh alpine.

Further investigations:
- [build a statically linked binary](https://github.com/commercialhaskell/stack/issues/3420)
- pass flags to ghc through docker run (or compose)
- set stack configs in the base image to clean up the Dockerfile paths
- push images to dockerhub

3. Implement frontend
