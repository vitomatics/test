## Profile for telegraf ping tests in HE datacenter rack1

include:
  - profile.telegraf-host-base
  - secret.influxdb-influxdb1

{% set default_interval = 60 %}
{% set ping_interval = '1.0' %}
{% set ping_timeout = '2.0' %}
{% set ping_count = '5' %}
{% set location = 'sm-1875' %}

telegraf:
  agent:
    input:
      ping:
        sm-border-router03:
          urls: [ '12.246.184.250' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: sm-border-router03
            location: {{ location }}
        sm-border-attgw:
          urls: [ '12.246.184.249' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: sm-border-attgw
            location: {{ location }}
        he-border-router11:
          urls: [ '216.218.158.86' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: he-border-router11
            location: {{ location }}
        sm-vpn-endpoint:
          urls: [ '10.100.100.5' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: sm-vpn-endpoint
            location: {{ location }}
        he-vpn-endpoint:
          urls: [ '10.100.100.6' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: he-vpn-endpoint
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
        ucb:
          urls: [ '128.32.206.9' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: ucb
            location: {{ location }}
