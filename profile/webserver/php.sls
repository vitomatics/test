## Adding php functionality to a webserver
## Uses the standard salt php formula.

include:
  - profile.webserver

states:
  php: true
