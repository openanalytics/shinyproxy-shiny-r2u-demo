# Running Shiny apps with r2u inside ShinyProxy

This repository describes how to add a shiny app with r2u inside ShinyProxy (at least version 2.5.0).

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```
sudo docker pull openanalytics/shinyproxy-shiny-r2u-demo
```

the relevant Docker Hub repository can be found at https://hub.docker.com/r/openanalytics/shinyproxy-shiny-r2u-demo

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```
sudo docker build -t openanalytics/shinyproxy-shiny-r2u-demo .
```

# ShinyProxy Configuration

To add the shiny application to ShinyProxy, add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):
```
specs:
  - id: shiny-r2u-demo
    display-name: Shiny with r2u Demo Application
    container-image: openanalytics/shinyproxy-shiny-r2u-demo
```

# References
* https://eddelbuettel.github.io/r2u/
* https://bioconductor.org/packages/release/bioc/vignettes/Gviz/inst/doc/Gviz.html


**(c) Copyright Open Analytics NV, 2024.**