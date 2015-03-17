FROM rocker/r-base

MAINTAINER kirillseva "https://github.com/kirillseva"

# Install a bunch of stuff
RUN \
  # Update aptitude
  apt-get update && \
  # Install software dependencies
  apt-get install -y \
    git \
    curl\
    libcurl4-openssl-dev \
    libxml2-dev \
    default-jre \
    default-jdk

  # Install R packages
RUN install2.r --error \
    devtools \
    stringr

RUN installGithub.r \
    hadley/testthat \
    kirillseva/coveralls

CMD ["R"]

