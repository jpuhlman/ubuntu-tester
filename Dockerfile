FROM ubuntu:14.04
COPY init.sh /
RUN chmod 755 /init.sh
CMD /init.sh

