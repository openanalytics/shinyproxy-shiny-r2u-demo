# Running Shiny apps using r2u inside ShinyProxy

This repository describes how to add a shiny app
using [r2u](https://eddelbuettel.github.io/r2u/) inside ShinyProxy.

Related demos:

- [plain Shiny demo](https://github.com/openanalytics/shinyproxy-shiny-demo)
- [plain Shiny demo (no R package)](https://github.com/openanalytics/shinyproxy-shiny-demo-minimal)
- [Shiny demo using pak](https://github.com/openanalytics/shinyproxy-shiny-pak-demo)
- [Shiny demo using renv](https://github.com/openanalytics/shinyproxy-shiny-renv-demo)

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-shiny-r2u-demo
```

the relevant Docker Hub repository can be found at <https://hub.docker.com/r/openanalytics/shinyproxy-shiny-r2u-demo>.

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```bash
sudo docker build -t openanalytics/shinyproxy-shiny-r2u-demo .
```

# ShinyProxy Configuration

To add the shiny application to ShinyProxy, add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):

```yaml
proxy:
  specs:
    - id: shiny-r2u-demo
      display-name: Shiny with r2u Demo Application
      container-image: openanalytics/shinyproxy-shiny-r2u-demo
```

## References

- [ShinyProxy.io](https://shinyproxy.io/)
- [All demos](https://shinyproxy.io/documentation/demos/)

**(c) Copyright Open Analytics NV, 2024.**
