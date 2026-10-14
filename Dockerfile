FROM tomcat:10.1-jdk21-temurin

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy the Foodie application
COPY Foode_go.war /usr/local/tomcat/webapps/ROOT.war

# Copy and prepare the startup script
COPY startup.sh /startup.sh
RUN sed -i 's/\r$//' /startup.sh && chmod +x /startup.sh

# Render application port
EXPOSE 10000

# Start the application
CMD ["/bin/sh", "/startup.sh"]