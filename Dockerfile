# Starting off with the Jenkins base Image 2.166
FROM jenkins/jenkins:2.166
 
# Installing the configuation as code plugins
RUN /usr/local/bin/install-plugins.sh configuration-as-code configuration-as-code-support
 
# set the default configuration as code yml
ENV CASC_JENKINS_CONFIG https://github.com/argiebee/jenkins-casc/jenkins-casc-example.yml

# Setting up environment variables for Jenkins admin user - override when running
ENV JENKINS_USER admin
ENV JENKINS_PASS J3nk1n5
 
# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
 
# Start-up scripts to create the admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
