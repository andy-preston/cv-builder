FROM ruby:2.7-slim
ENV TERM=linux
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /usr/local/src

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y --no-install-recommends install \
        texlive-fonts-recommended \
        texlive-latex-base \
        texlive-latex-extra && \
    apt-get -y --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* && \
    gem install rubocop
