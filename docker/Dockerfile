FROM scratch
MAINTAINER Bach Le
ADD arch.tar.gz/ /
EXPOSE 8080
CMD ["foreground"]
ENTRYPOINT ["/opt/cowdock/bin/cowdock"]
ADD release.tar.gz/ /opt/cowdock
