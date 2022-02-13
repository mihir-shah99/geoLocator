# build stage
FROM python:3.9.10-slim-buster

LABEL MAINTAINER="Mihir Shah"
LABEL GitHub="https://github.com/mihir-shah99/geoLocator"
LABEL version="1.0"
LABEL description="A Flask API that serves latitude and longitude of a given IP address"

WORKDIR /home/geoLocator

COPY . .
RUN pip3 install -r requirements.txt

# download current maxmind databases
RUN apt-get update && apt-get -y install curl && \
    curl -sfSL "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&suffix=tar.gz&license_key=bJ9DomMe69oqvRBo" | tar -xz && \
    ln -s GeoLite2-City_*/GeoLite2-City.mmdb .

EXPOSE 5000
CMD [ "python3", "app.py" ]