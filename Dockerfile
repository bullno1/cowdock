FROM scratch
MAINTAINER Bach Le
ADD arch/ /
EXPOSE 8080
CMD ["/opt/cowdock/bin/cowdock", "foreground"]
ADD _rel/ /opt/
