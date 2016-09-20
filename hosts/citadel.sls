apt:
  repos:
    x2go:
      types: [ deb, deb-src ]
      uri: http://packages.x2go.org/debian
      suite: jessie
      keyid: E1F958385BFE2B6E
      keyserver: keys.gnupg.net

  pkgs:
    x2go-keyring: ~
    x2goserver: ~

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pam:
  access:
    compute: ALL EXCEPT LOCAL
    consult: ALL EXCEPT LOCAL
