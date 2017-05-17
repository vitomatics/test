# Users on the smartdv (sdv) isolated machine
# This filters the main account database and extracts just the information
# that is needed.

{% import_yaml "accounts/allusers.yml" as allusers %}

sfaccount:
  users:
{%- for user, attrs in allusers.users|dictsort %}
    {{ user }}:
      {{ attrs|yaml }}
{% endfor %}
