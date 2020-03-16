FROM scratch

COPY travis-docker /bin/
ONBUILD COPY application.toml /etc/travis/
CMD["travis-docker"]