## Jenkins execution machine

{% set jenkinsdir = '/var/lib/jenkins' %}

{% import_yaml "accounts/allusers.yml" as allusers %}
{% import_yaml "accounts/allgroups.yml" as allgroups %}


states:
  jenkins.slave: true

jenkins:
  slave:
    home: {{ jenkinsdir }}
    user: {{ allusers.users.jenkins.uid }}
    group: nogroup
    authorized_key: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChoY45c0hDGsnBj6sHGVUcLZMPlPObftn+YtgBWiw0NBID5uGPHlXun/v2YMXcA9Zee0NUaUS8BAkUvBdUNaOtdIqXBMplUBpQ9Q1YskpIVG1kSPG8IxCyuUThNeYeMu1D2HMnZBBpkeE+0EdEd2weJdLjRoyblOfJq8LqZoIpkfTJUyQymIqymNaFNGMnGt5mrngOsk9qwGTJhhLr7AdW8+N1CySZQvzCqnqIUPAxKsY0j774PlivboO01Ki3iRdP45zHmXUhxEOoZ8mcTNoJjhDPB1re/dwfoyLRdvkg3G0zPWEGdofcR3SpIfAvnMahejw5xm2qloxveU2wWFdX jenkins@jenkins.internal.sifive.com

pam:
  access:
    jenkins: 10.14.0.10 # jenkins.internal.sifive.com

sudo:
  included:
    # Some overrides needed for jenkins
    sifive-jenkins:
      aliases:
        hosts:
          JENKINS:
            - b0.internal.sifive.com
            - alpha.internal.sifive.com
            - gamma00.internal.sifive.com
            - gamma01.internal.sifive.com
            - gamma02.internal.sifive.com
            - gamma03.internal.sifive.com
            - gamma04.internal.sifive.com
            - gamma05.internal.sifive.com
            - gamma06.internal.sifive.com
            - gamma07.internal.sifive.com
            - gamma10.internal.sifive.com
            - gamma11.internal.sifive.com
            - gamma12.internal.sifive.com
            - gamma13.internal.sifive.com
            - gamma14.internal.sifive.com
            - gamma15.internal.sifive.com
            - sigma00.internal.sifive.com
            - sigma01.internal.sifive.com
            - sigma02.internal.sifive.com
            - sigma03.internal.sifive.com
            - sigma04.internal.sifive.com
            - sigma05.internal.sifive.com
            - sigma06.internal.sifive.com
            - sigma07.internal.sifive.com
            - sigma08.internal.sifive.com
            - sigma09.internal.sifive.com
            - sigma10.internal.sifive.com
            - sigma11.internal.sifive.com
            - sigma12.internal.sifive.com
            - sigma13.internal.sifive.com
            - sigma14.internal.sifive.com
            - delta00.internal.sifive.com
            - delta01.internal.sifive.com
            - delta02.internal.sifive.com
            - delta03.internal.sifive.com
      userspec:
        - '%jenkins-admin': 
            - JENKINS: /usr/sbin/iotop
            - JENKINS: (jenkins) ALL
