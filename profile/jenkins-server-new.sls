## A version of the jenkins server with the latest package installed

include:
  - profile.jenkins-server

jenkins:
  lookup:
    pkgs:
    - jenkins: 2.121.3

