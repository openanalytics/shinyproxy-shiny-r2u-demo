FROM rocker/r2u:jammy

RUN apt-get update 

RUN R -q -e 'install.packages(c("BiocManager", "shiny"))'
RUN R -q -e 'BiocManager::install(c("GenomicRanges", "Gviz"))'

# copy necessary files
COPY Rprofile.site /usr/lib/R/etc/
## app folder
COPY /shinyApp ./app

# expose port
EXPOSE 3838

# run app on container start
CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 3838)"]
