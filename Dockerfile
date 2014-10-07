FROM nicohvi/ruby

# install postgres-devel
RUN yum install -y postgresql-devel && yum clean all

# install nodejs for js runtime (necessary for coffeescript-compilation)
RUN mkdir -p /tmp/nodejs-build && cd /tmp/nodejs-build && \
    curl -O --progress http://nodejs.org/dist/v0.10.32/node-v0.10.32.tar.gz && \
    tar -zxf node-v0.10.32.tar.gz && cd node-v0.10.32 && \
    ./configure && make && make install && \
    cd / && rm -rf /tmp/nodejs-build

# install rails
RUN gem install rails -v 4.1.16 --no-ri --no-rdoc
