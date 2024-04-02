FROM rocker/r2u:jammy

# important: path does not contain "local" (/usr/local/lib/R/etc/) in contrast to the other demos
RUN echo "\noptions(shiny.port=3838, shiny.host='0.0.0.0')" >> /usr/lib/R/etc/Rprofile.site

# no need to install system libraries
RUN R -q -e 'install.packages(c("shiny", "Rmpfr"))'

# install R code
COPY euler /build/euler
RUN R CMD INSTALL /build/euler

EXPOSE 3838

CMD ["R", "-q", "-e", "euler::runShiny()"]
