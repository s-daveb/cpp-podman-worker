#  cpp-podman-worker

This repository contains a Docker container configuration for a C++ build worker, designed to work with docker/podman and Buildbot. 
The container is configured as a Buildbot worker node that automates the compilation and testing of C++ projects.

## Features

- Runs the latest version of x86_64 ArchLinux at the time of creation
- Automates build process using CMake and alternatively AutoMake tools
- Built-in support for SDL2, Qt, and other development libraries
- CI/CD pipeline setup with Buildbot
- Easy to use script-based building and publishing

## Installation

1. Clone the repository:
```bash
git clone [s-daveb/cpp-podman-worker.git](https://github.com/s-daveb/cpp-podman-worker.git)
cd cpp-podman-worker
```

2. Set up Docker or Podman on your system (if not already installed)

3. Make sure you have build permissions in your user or group

## Usage

### Building the Image

1. Run the following command to build the image:
```bash
make 
```

The image will be built with the tag `cpp-podman-worker:0.1.8` and `cpp-podman-worker:latest`.

### Publishing the Image

1. Edit Makefile in your favorite text editor
2. Run the following command to publish the image:
```bash
make publish
```
The image will be pushed to both local registry, which is assumed to be `localhost:5000` by default.  Run `make` with `docker_registry=<server>:<port>` to override it.

## (Some) Included Tools and Libraries

- C/C++ compilers (gcc, clang)
- Build tools (make, automake, autoconf)
- Development libraries (SDL2, Qt6, boost, nlohmann-json)
- Version control tools (git)
- Testing frameworks (catch2)
- Development utilities (cmake, ccache)

## Configuration

The repository includes a TAC configuration file (`buildbot.tac`) and worker initialization script to set up a Buildbot worker automatically. 
It pulls values from the process environment file.  Use docker-compose or another orchestrator to define the environment for your podman/docker container. 🐳

- `image_name` - Used by build scripts. Change this if you want to fork the repo easily
- `currentversion` - Increment this for each new build you want to track in your registry
- `Makefile` - Convenience Makefile for executing the build scripts
- `scripts/` directory - Holds the build and publish scripts

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your improvements.

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contact

For any questions or suggestions, feel free to reach out at:
- GitHub: [@s-daveb](https://github.com/s-daveb)
- Email: 2100425+s-daveb@users.noreply.github.com
