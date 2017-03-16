##
## Secret mysql data
##
## *** SOME OF THIS IS GPG ENCRYPTED ***

{% set mysql_root_user = 'root' %}
{% set mysql_root_password = 'a788d73P' %}

mysql:
  servers:
    root_user: {{ mysql_root_user }}
    root_password: {{ mysql_root_password }}

