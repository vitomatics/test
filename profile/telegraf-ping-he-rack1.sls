## Profile for telegraf ping tests in HE datacenter rack1

include:
  - profile.telegraf-host-base
  - secret.influxdb-influxdb1

{% set default_interval = 60 %}
{% set ping_interval = '1.0' %}
{% set ping_timeout = '2.0' %}
{% set ping_count = '5' %}
{% set location = 'he-rack1' %}

telegraf:
  agent:
    input:
      ping:
        iswitch15-left-trunk:
          urls: [ '10.100.200.38' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: iswitch15-left-trunk
            location: {{ location }}
        google:
          urls: [ '8.8.8.8' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: google
            location: {{ location }}
