# docker-pexec

This Docker image contains the compiled binary of the `pexec` utility, a GNU tool for executing commands on remote systems. The image is built in a two-stage process, where the first stage compiles and installs `pexec`, and the second stage creates a minimal runtime image containing only the necessary binary.

## Image Details

* Base Image: alpine
    * The image is built on top of the Alpine Linux distribution, which is lightweight and minimal, ensuring a small final image size.
* Installed Software:
    * The final image includes the pexec binary, which is installed in /opt/pexec/bin/pexec.
* Environment Variables:
    * PATH is extended to include /opt/pexec/bin, allowing the pexec binary to be executed directly from the command line.

## Usage

To run the `pexec` utility inside the container:

```bash
docker run --rm bugoman/docker-pexec pexec --help
```

## Links

* [pexec](https://en.wikipedia.org/wiki/Pexec)
