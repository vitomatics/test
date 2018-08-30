# regresslog-webhook-server
#
# Set up a simple http endpoint for logging regression results
{% set regresslog_server_port = 8085 %}

# As of 2018-08-30, actual server is set up by hand
firewall:
  ports:
    tcp:
      {{ regresslog_server_port }}:  10.14.0.0/16
