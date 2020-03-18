FROM scratch

COPY travis-docker /bin/
ONBUILD COPY application.toml /etc/travis/
EXPOSE 3000
ENTRYPOINT ["travis-docker"]