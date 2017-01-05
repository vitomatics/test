## pillar file for x2go server setup

{% if grains.os == 'Ubuntu' %}

pkgs:
  apt:
    repos:
      x2go:
        types: [ deb ]
        uri: http://ppa.launchpad.net/x2go/stable/ubuntu
        suite: xenial
        keyid: 7CDE3A860A53F9FD
        keyserver: keyserver.ubuntu.com

  list:
    x2goserver: true
    x2goserver-xsession: true
    
{% endif %}
