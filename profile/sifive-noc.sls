## A pillar file for the sifive noc - currently just holds router and
## switch config files in a known directory.

{% set nocdir = '/srv/sifive-noc' %}

file:
  mkdir:
    {{ nocddir }}:
      user: root
      group: root
      mode: '0755'

