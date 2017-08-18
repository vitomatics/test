## Jenkins execution machine

{% set jenkinsdir = '/var/lib/jenkins' %}

states:
  jenkins.slave: true

jenkins:
  slave:
    home: /var/lib/jenkins
    user: 9999
    group: 65534
    authorized_key: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChoY45c0hDGsnBj6sHGVUcLZMPlPObftn+YtgBWiw0NBID5uGPHlXun/v2YMXcA9Zee0NUaUS8BAkUvBdUNaOtdIqXBMplUBpQ9Q1YskpIVG1kSPG8IxCyuUThNeYeMu1D2HMnZBBpkeE+0EdEd2weJdLjRoyblOfJq8LqZoIpkfTJUyQymIqymNaFNGMnGt5mrngOsk9qwGTJhhLr7AdW8+N1CySZQvzCqnqIUPAxKsY0j774PlivboO01Ki3iRdP45zHmXUhxEOoZ8mcTNoJjhDPB1re/dwfoyLRdvkg3G0zPWEGdofcR3SpIfAvnMahejw5xm2qloxveU2wWFdX jenkins@jenkins.internal.sifive.com
