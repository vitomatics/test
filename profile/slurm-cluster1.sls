## SLURM config for cluster 1
##
## WARNING - be sure to use single quotes around SLURM-style times

# slurm:MungeKey64 is in this secret.munge file
include:
  - profile.slurm-sifive
  - secret.munge

slurm:
  X: true
  ClusterName: sifive
  ControlMachine: grid
  ControlAddr: grid.internal.sifive.com
  SlurmctldPort: '6817'
  SlurmdPort: '6818'
  SrunPortRange: '6820-9819'

  FastSchedule: 2
  PriorityType: multifactor
  PriorityWeightQOS: 1000
  PriorityWeightAge: 1000
  PriorityMaxAge: '24:00:00'

# TaskPlugin: affinity
# TaskPluginParam: Threads

  DefMemPerCPU: '4000'

  nodes:
    sandbox:
      CPUs: 2
      RealMemory: '4096'
      Feature: testhost
    'gamma[00-07,10-15]':
      CPUs: '32'
      RealMemory: '125000'
      Feature: gamma
  partitions:
    standard:
      Default: yes
      nodes:
        - 'gamma[00-07]'
        - 'gamma[10-14]'
    quick:
      DefMemPerCPU: 4000
      MaxMemPerCPU: 16000
      MaxTime: '4:00:00'
      AllowQos: interactive,m2m,nightly,pr,weekly,tapeout
      nodes:
        - 'gamma[14-15]'
    test:
      nodes:
        - sandbox

