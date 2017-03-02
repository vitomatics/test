## Adding php functionality to a webserver
## Uses the standard salt php formula.

include:
  - profile.webserver

states:
  mod_php: true

apache:
  modules:
    enabled:
      - php7.0
