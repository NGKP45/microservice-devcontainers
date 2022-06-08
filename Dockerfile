FROM ubuntu:20.04

USER root

COPY sources.list /etc/apt/sources.list

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install openjdk-17-jdk mysql-client-core-8.0 wget net-tools zip unzip git
# Install Maven
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz \
    && tar -xzf apache-maven-3.8.5-bin.tar.gz \
    && export PATH=$PATH:$PWD/apache-maven-3.8.5/bin \
    && rm -rf apache-maven-3.8.5-bin.tar.gz
# Install Gradle 
RUN wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip \
    && unzip gradle-7.4.2-bin.zip \
    && export PATH=$PATH:$PWD/gradle-7.4.2/bin \
    && rm -rf gradle-7.4.2-bin.zip