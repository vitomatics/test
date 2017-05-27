# Users and groups on the Unix cluster.
# This filters the main account databases and extracts just the information
# that is needed.

# Note we do not define access settings on cluster accounts as the
# home directories are on different hosts than the machines that
# will be accessing the home directories

{% set tag = 'cluster' %}

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
