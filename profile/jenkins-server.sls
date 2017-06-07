## pillar file for default jenkins server setup

{% set port = 8080 %}

states:
  jenkins.server: true


jenkins:
  lookup:
    http_port: 8080
    home: /var/lib/jenkins
    headless: true
    user: jenkins
    group: jenkins
  java_args:
    - '-Dhudson.model.DirectoryBrowserSupport.CSP=\"default-src \'none\'; img-src \'self\'; style-src \'unsafe-inline\'; object-src \'self\';\"'
    - '-Dhudson.slaves.WorkspaceList=-WS'