# Users on the smartdv (sdv) isolated machine
# This filters the main account database and extracts just the information
# that is needed.

{% import_yaml "accounts/allusers.yml" as allusers %}
{% tag = 'sdv' %}

sfaccount:
  users:
{%- for user, attrs in allusers.users|dictsort %}
{%- tags = attrs.tags|default([]) %}
{%- if tag in tags %}
    {{ user }}:
      {{ attrs|yaml }}
{% endif -%}     {# Test for our tag #}
{% endfor -%}
