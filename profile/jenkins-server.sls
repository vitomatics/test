## pillar file for default jenkins server setup
## note the web server is only accessed on localhost so no need
## to open up firewall
## the jnlp server needs other compute machines to have access so needs
## to be opened

{% set jenkins_port = 8080 %}
{% set jnlp_port = 8085 %}

states:
  jenkins.server: true


pam:
  access:
    jenkins: 'LOCAL'

jenkins:
  lookup:
    http_port: {{ jenkins_port }}
    home: /var/lib/jenkins
    headless: true
    user: jenkins
    group: jenkins
  java_args: >-
    -Dhudson.slaves.WorkspaceList=-WS
    -Dhudson.model.DirectoryBrowserSupport.CSP=\"default-src 'none'; img-src 'self'; style-src 'unsafe-inline'; object-src 'self';\"


firewall:
  ports:
    tcp:
      {{ jenkins_port }}: 127.0.0.1/32
      {{ jnlp_port }}:  10.14.0.0/16
