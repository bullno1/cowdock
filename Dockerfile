FROM scratch
MAINTAINER Bach Le
ADD arch/ /
EXPOSE 8080
CMD ["/opt/cowdock/bin/cowdock", "console"]
ADD _rel/ /opt/
