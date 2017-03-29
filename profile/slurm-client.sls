## SLURM resource manager client machines
## Note the config file is shared and most of the stuff is in slurm-common

include:
  - profile.slurm-cluster1

states:
  slurm.client: true
  slurm.devel: true
  slurm.openlava: true

firewall:
  ports:
    tcp:
      6820: 10.14.0.0/16
      6821: 10.14.0.0/16
      6822: 10.14.0.0/16
      6823: 10.14.0.0/16
      6824: 10.14.0.0/16
      6825: 10.14.0.0/16
      6826: 10.14.0.0/16
      6827: 10.14.0.0/16
      6828: 10.14.0.0/16
      6829: 10.14.0.0/16
      6830: 10.14.0.0/16
      6831: 10.14.0.0/16
      6832: 10.14.0.0/16
      6833: 10.14.0.0/16
      6834: 10.14.0.0/16
      6835: 10.14.0.0/16
      6836: 10.14.0.0/16
      6837: 10.14.0.0/16
      6838: 10.14.0.0/16
      6839: 10.14.0.0/16
