FROM clearwater/base2
MAINTAINER maintainers@projectclearwater.org

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes homestead
RUN sed -e 's/\(echo 0 > \/proc\/sys\/kernel\/yama\/ptrace_scope\)/# \1/g' -i /etc/init.d/homestead

COPY homestead.supervisord.conf /etc/supervisor/conf.d/homestead.conf
COPY nginx.supervisord.conf /etc/supervisor/conf.d/nginx.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf

# We need to start the socket factories so that we can write to SAS.
RUN cp /etc/clearwater/socket-factory.supervisord.conf /etc/supervisor/conf.d/

COPY clearwater-auto-config-docker /etc/init.d/clearwater-auto-config-docker
RUN chmod -R 777 /etc/init.d/clearwater-auto-config-docker
RUN /etc/init.d/clearwater-auto-config-docker start

EXPOSE 8888
