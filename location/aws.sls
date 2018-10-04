# pillar file for AWS based machines

location:
  short: AWS

sfmotd:
  lookup:
    motd_text_location: |
      This machine is located in the SiFive cluster VPC in AWS.
    motd_text_help: |
      * Documentation:   https://sifive.atlassian.net/wiki/spaces/SysDocs/
      * Help tickets:    mailto:help@sifive.com