## A version of the jenkins server with the default package installed

include:
  - secret.jenkins-federation-user-private
  - profile.jenkins-server

jenkins:
  lookup:
    pkgs:
    - jenkins: 2.183.2

