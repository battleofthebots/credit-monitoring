FROM ghcr.io/battleofthebots/botb-base-image:latest

EXPOSE 8080

# Jar requires older java version versus base image, install openjdk8 and configure it as default jdk
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y openjdk-8-jdk
RUN update-java-alternatives -s java-1.8.0-openjdk-amd64

USER user
COPY service.jar .
CMD java "$@" -jar service.jar

HEALTHCHECK --interval=10s --timeout=5s --start-period=10s --retries=3 \
    CMD [ $(curl -I -s http://0.0.0.0:8080 | head -n 1 | cut -d' ' -f2 | head -n 1) -eq 200 ] || exit 1