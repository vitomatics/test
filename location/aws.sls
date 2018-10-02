# pillar file for AWS based machines

states:
  sfmotd: true

location:
  short: AWS

sfmotd:
  lookup:
    motd_text_location: |
      This machine is located in the SiFive cluster VPC in AWS.
