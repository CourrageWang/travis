FROM scratch

COPY travis-docker /bin/
ONBUILD COPY application.toml /etc/travis/
ENTRYPOINT ["travis-docker"]