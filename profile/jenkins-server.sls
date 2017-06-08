## pillar file for default jenkins server setup

{% set port = 8080 %}

states:
  jenkins.server: true

file:
  mkdir:
    /srv/jenkins:
      user: jenkins
      group: jenkins
      mode: 0755

jenkins:
  lookup:
    http_port: 8080
    home: /srv/jenkins
    headless: true
    user: jenkins
    group: jenkins
  java_args: >
    -Dhudson.slaves.WorkspaceList=-WS
    -Dhudson.model.DirectoryBrowserSupport.CSP=\"default-src 'none'; img-src 'self'; style-src 'unsafe-inline'; object-src 'self';\"