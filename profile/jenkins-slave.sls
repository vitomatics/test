## Jenkins execution machine

# Jenkins admins are more powerful on jenkins hosts

sudo:
  alisases:
    commands:
      JENKINSCMD:
        - iotop
  userspec:
    - '%jenkins-admin':
      - ALL: JENKINSCMD
      - ALL: (jenkins) ALL
