FROM rocker/r2u:jammy

# important: path does not contain "local" (/usr/local/lib/R/etc/) in contrast to the other demos
COPY Rprofile.site /usr/lib/R/etc/Rprofile.site

# no need to install system libraries
RUN R -q -e 'install.packages(c("shiny", "Rmpfr"))'

# install R code
COPY euler /build/euler
RUN R CMD INSTALL /build/euler

EXPOSE 3838

RUN groupadd -g 1001 shiny && useradd -c 'shiny' -u 1001 -g 1001 -m -d /home/shiny -s /sbin/nologin shiny
USER shiny

CMD ["R", "-q", "-e", "euler::runShiny()"]
