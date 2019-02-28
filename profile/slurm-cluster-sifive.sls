## SLURM config for cluster 1 - the "sifive" cluster
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
    'sandbox':
      CPUs: 2
      RealMemory: '4096'
    'awstest':
      CPUs: 2
      RealMemory: '4096'
    'asigma00':
      CPUs: '32' 
      RealMemory: '125000'
    'gamma[00-01]':
      CPUs: '32'
      RealMemory: '250000'
      Feature: gamma
    'gamma[02-07,10-14]':
      CPUs: '32'
      RealMemory: '125000'
      Feature: gamma
    'sigma[00-09]':
      CPUs: '48'
      RealMemory: '188000'
      Feature: sigma
    'sigma[10-14]':
      CPUs: '48'
      RealMemory: '376000'
      Feature: sigma
    'sigma[15-16]':
      CPUs: '96'
      RealMemory: '752000'
      Feature: sigma
  partitions:
    standard:
      Default: yes
      nodes:
        - 'gamma[10-14]'
        - 'sigma[00-16]'
    quick:
      DefMemPerCPU: 4000
      MaxMemPerCPU: 16000
      MaxTime: '4:00:00'
      AllowQos: interactive,m2m,nightly,pr,weekly,tapeout
      nodes:
        - 'sandbox'
    test:
      nodes:
        - 'sandbox'
    slurmtest:
      nodes:
        - 'sandbox'
        - 'awstest'
        - 'asigma00'
