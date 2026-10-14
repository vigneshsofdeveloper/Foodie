FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Foode_go.war /usr/local/tomcat/webapps/ROOT.war

COPY startup.sh /startup.sh

RUN sed -i 's/\r$//' /startup.sh && chmod +x /startup.sh

EXPOSE 10000

CMD ["/bin/sh", "/startup.sh"]