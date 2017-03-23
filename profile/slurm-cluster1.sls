## SLURM config for cluster 1

{% from "site/slurm-cluster1-defs.sls" import * with context %}

# slurm:MungeKey64 is in this secret.munge file
include:
  - profile.slurm-common
  - secret.munge

slurm:
  ClusterName: custer1
  ControlMachine: grid
  ControlAddr: grid.internal.sifive.com
  SlurmctldPort: '6817'
  SlurmdPort: '6818'
  SrunPortRange: '6820-6839'

  DefMemPerCPU: '4000'

  nodes:
    sandbox:
      CPUs: 2
      RealMemory: '4096'
      Feature: testhost
    'gamma[00-07]':
      CPUs: '32'
      RealMemory: '125000'
      Feature: gamma
  partitions:
    compute1:
      Default: yes
      nodes:
        - 'gamma[00-07]'
    test:
      nodes:
        - sandbox

