FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY Foode_go.war /usr/local/tomcat/webapps/ROOT.war

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 10000

CMD ["/startup.sh"]
