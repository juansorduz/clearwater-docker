FROM clearwater/base2
MAINTAINER maintainers@projectclearwater.org

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes chronos

COPY snmpd.supervisord.conf /etc/supervisor/conf.d/snmpd.conf
COPY chronos.supervisord.conf /etc/supervisor/conf.d/chronos.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf

COPY clearwater-auto-config-docker /etc/init.d/clearwater-auto-config-docker
RUN chmod -R 777 /etc/init.d/clearwater-auto-config-docker
RUN /etc/init.d/clearwater-auto-config-docker start

EXPOSE 7253
