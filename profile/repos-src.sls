# A profile to install various source repos

{% if grains.os == "Ubuntu" %}

pkgs:
  apt:
    repos:
{% set repo_names = [ 'xenial' ]  %}
{% set repo_uri = 'http://us.archive.ubuntu.com/ubuntu/' %}
{% set repo_suffices = ['', '-updates', '-security' ] %}
{% set repo_comps = ['main', 'restricted', 'universe', 'multiverse'] %}
{% set repo_type = 'deb-src' %}
{% set repo_abbrtype = 'src' %}

{% for name in repo_names %}
{% for suffix in repo_suffices %}
{% set suite = name + suffix %}
{% set id = suite + '-' + repo_abbrtype %}
      {{ id }}:
        types:
          - {{ repo_type }}
        uri: {{ repo_uri }}
        suite: {{ name }}{{suffix}}
        comps: {{ repo_comps }}
{% endfor %}    {# iterating over repo suffices #}
{% endfor %}    {# iterating over repo names #}

{% endif %}     {# Ubuntu #}

