FROM diffblue/cbmc-builder:alpine

RUN apk add --update \
    maven \
    openjdk8

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"   

# Cloning and compiling JBMC
RUN git clone https://github.com/diffblue/cbmc cbmc-git \
    && make -C cbmc-git/src DOWNLOADER=wget minisat2-download \
    && make -C cbmc-git/jbmc/src setup-submodules \
    && make -C cbmc-git/jbmc/src \
    && cp cbmc-git/jbmc/src/jbmc/jbmc /usr/bin 