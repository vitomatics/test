# Set up a double proxy server to pass github webhooks to jenkins
#  - the border router uses NAT to send requests to the apache proxy on
#    port 8081
#  - the apache proxy sends requests to the locally-written python proxy
#    on port 8082
#  - the python proxy sends requests to the jenkins server
#    on port 8080

{% set github_ips = "192.30.252.0/22 185.199.108.0/22 192.150.186.0/23" %}
{% set site = 'gitkick2' %}
{% set domain = 'sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}


states:
  jenkins-webhook.server: true
  apache.vhosts.standard: true
  apache.no_default_vhost: true
  apache.mod_proxy: true
  apache.mod_proxy_http: true
  apache.mod_headers: true


jenkins-webhook:
  # The server that interprets the webhook requests
  server:
    port: 8082
    # A key for a hash that is also configured in github
    key: a8531edac58147d5a5fe1eb40ecbcc0d
  # Details on the actual jenkins server
  jenkins:
    host: localhost
    port: 8080
    user: rxia
    api_token: 7cbc80a103303232e998882ebb9100ad
    job_token: MyI3d9kLT0SaL1Ay3i96Kg


# An apache proxy sitting in front of the locally-written server for security
apache:
  sites:
    {{ site }}:
      ServerName: {{ servername }}
      DocumentRoot: false
      interface: '*'
      port: '8081'
      ServerAdmin: help@sifive.com
      template_file: salt://apache/vhosts/proxy.tmpl
      ProxyRequests: 'Off'
      Proxy_control:
        '*':
          AllowAll: True
      Location:
        /github-hook/:
          Formula_Append: |
            RequestHeader set X-Forwarded-Proto "http"
            RequestHeader set X-Forwarded-Port "80"
            ProxyPass http://localhost:8082/github-hook/

firewall:
  ports:
    tcp:
      8081:  10.0.0.0/9 {{ github_ips }}
