FROM ubuntu
RUN apt-get update


RUN apt-get install git -y


RUN apt-get install putty -y


RUN apt-get install software-properties-common apt-transport-https wget -y
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt install code -y


RUN apt-get install apache2 -y


RUN apt-get install mysql-server -y


# install java and sonarcube
RUN apt update

RUN apt-get install -y wget \
    && apt-get install -y unzip \
    && apt-get install -y openjdk-11-jre-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the environment variables
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Download and extract SonarQube
RUN wget -O sonarqube.zip https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.4.2.36762.zip
RUN unzip sonarqube.zip
RUN mv sonarqube-8.4.2.36762 /opt/sonarqube
RUN rm sonarqube.zip

# Set the environment variables
ENV SONARQUBE_HOME /opt/sonarqube

# Set the working directory
WORKDIR $SONARQUBE_HOME/data

# Expose port 9000 for the SonarQube web interface
EXPOSE 9000

# Set the working directory
WORKDIR /app
