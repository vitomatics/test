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
        iswitch25-left-trunk:
          urls: [ '10.100.200.38' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: iswitch25-left-trunk
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
        he-border-hegw:
          urls: [ '216.218.158.85' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: he-border-hegw
            location: {{ location }}
        sm-border-router03:
          urls: [ '12.246.184.250' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: sm-border-router03
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
        azure-cadence-mw03:
          urls: [ 'mw03-login' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: azure-cadence-mw03
            location: {{ location }}
        azure-cadence-mi01:
          urls: [ 'mi01-login' ]
          interval: {{ default_interval }}
          count: '{{ ping_count }}'
          ping_interval: '{{ ping_interval }}'
          timeout: '{{ ping_timeout }}'
          tags:
            target: azure-cadence-mi01
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
