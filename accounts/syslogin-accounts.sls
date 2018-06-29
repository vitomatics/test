# Users and groups on the nfs-less syslogin machines.
# This filters the main account databases and extracts just the information
# that is needed.

{% set tag = 'syslogin' %}

pam:
  access:
    syslogin-users: ALL

{% import_yaml "accounts/allusers.yml" as allusers %}
{% import_yaml "accounts/allgroups.yml" as allgroups %}

sfaccount:
  users:
{%- for user, attrs in allusers.users|dictsort %}
{%- set tags = attrs.tags|default([]) %}
{%- if tag in tags %}
    {{ user }}:
      {{ attrs|yaml }}
{% endif -%}     {# Test for our tag #}
{% endfor %}

  groups:
{%- for group, attrs in allgroups.groups|dictsort %}
{%- set tags = attrs.tags|default([]) %}
{%- if tag in tags %}
    {{ group }}:
      {{ attrs|yaml }}
{% endif -%}     {# Test for our tag #}
{% endfor %}
