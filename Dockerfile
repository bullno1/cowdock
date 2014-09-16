FROM scratch
MAINTAINER Bach Le
ADD arch.tar.gz/ /
EXPOSE 8080
CMD ["/opt/cowdock/bin/cowdock", "console"]
ADD _rel/ /opt/
