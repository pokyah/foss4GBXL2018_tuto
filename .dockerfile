FROM rocker/r-ver:3.4.4
LABEL maintainer="rstudio"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y gdal-bin \
	git-core \
	libgeos-dev \
	libproj-dev \
	libudunits2-dev \
	pandoc \
	pandoc-citeproc
RUN ["install2.r", "backports", "class", "classInt", "DBI", "digest", "e1071", "evaluate", "htmltools", "knitr", "magrittr", "Rcpp", "remotes", "rmarkdown", "rprojroot", "sf", "spData", "stringi", "stringr", "udunits2", "units", "yaml"]
RUN ["installGithub.r", "Nowosad/spDataLarge@b0cceccd1549b0944740edc4031ba42d00024ea1"]
WORKDIR /payload/
CMD ["R", "--vanilla", "-e", "rmarkdown::render(input = \"sf6.Rmd\", output_format = rmarkdown::html_document())"]
