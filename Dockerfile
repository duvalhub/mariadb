FROM mariadb:10.5
COPY init.sh /init.sh
ENTRYPOINT [ "/init.sh" ]
CMD [ "docker-entrypoint.sh", "mysqld" ]