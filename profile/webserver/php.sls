## Adding php functionality to a webserver
## Uses the standard salt php formula.

include:
  - profile.webserver

states:
  php: true
  apache.modules: true

apache:
  modules:
    enabled:
      - php
