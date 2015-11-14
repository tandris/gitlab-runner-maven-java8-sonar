FROM gitlab/gitlab-runner:latest
MAINTAINER andras.toth@chilisoft.org

ENV GITLAB_CI_URL=http://yourgitlabci.com/ci
ENV GITLAB_CI_TOKEN={/ci/admin/runners}
ENV GITLAB_CI_NAME=java-maven-sonar-1
ENV GITLAB_CI_EXECUTOR=shell
ENV SONAR_HOST_URL=http://myserver:9000

# Install Java, maven, sonar.
RUN \
  apt-get install -q -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  apt-get install -q -y oracle-java8-installer
  
#RUN \
#  wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip && \
#  unzip sonar-runner-dist-2.4.zip && \
#  mv sonar-runner-2.4 /opt/sonar-runner
  
COPY config.toml /etc/gitlab-runner/config.toml
COPY settings.xml /home/gitlab-runner/.m2/settings.xml

# GitLab runner properties
#RUN \
#  sed 's/GITLAB_CI_URL/${GITLAB_CI_URL}/' /etc/gitlab-runner/config.toml && \
#  sed 's/GITLAB_CI_TOKEN/${GITLAB_CI_TOKEN}/' /etc/gitlab-runner/config.toml && \
#  sed 's/GITLAB_CI_NAME/${GITLAB_CI_NAME}/' /etc/gitlab-runner/config.toml && \
#  sed 's/GITLAB_CI_EXECUTOR/${GITLAB_CI_EXECUTOR}/' /etc/gitlab-runner/config.toml
  
# Sonar maven profile
#RUN \
#  sed s/SONAR_HOST_URL/${SONAR_HOST_URL}/ /etc/gitlab-runner/config.toml
  
# Install openssh-server, maven and git.
RUN apt-get install -q -y maven git
RUN apt-get clean

#COPY entrypoint.sh /
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]