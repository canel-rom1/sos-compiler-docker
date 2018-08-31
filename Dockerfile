FROM canelrom1/debian-canel:sarge


LABEL maintainer="Rom1 <rom1@canel.ch> - CANEL - https://www.canel.ch"
LABEL date="18/08/31"
LABEL description="Outils pour compiler SimpleOS. Basé sur Debian sarge"

RUN apt-get update \
 && apt-get upgrade -y -q \
 && apt-get -y -q \
    install build-essential \
            dlocate \
	    grub \
	    grub-disk \
	    make \
            mtools

RUN updatedb

RUN mkdir /src

WORKDIR /src
