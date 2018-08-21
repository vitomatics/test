## A version of the jenkins server with the default package installed

include:
  - profile.jenkins-server

jenkins:
  lookup:
    pkgs:
    - jenkins

