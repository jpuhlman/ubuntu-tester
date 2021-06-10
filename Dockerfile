FROM ubuntu:18.04
COPY init.sh /
RUN chmod 755 /init.sh
CMD /init.sh

