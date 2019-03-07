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
      Sockets: '1'
      CoresPerSocket: '2'
      ThreadsPerCore: '2'
      RealMemory: '4096'
    'theta00':
      Sockets: '1'
      CoresPerSocket: '16'
      ThreadsPerCore: '1'
      RealMemory: '125000'
    'gamma[00-01]':
      Sockets: '2'
      CoresPerSocket: '8'
      ThreadsPerCore: '2'
      RealMemory: '250000'
      Feature: gamma
    'gamma[02-07,10-14]':
      Sockets: '2'
      CoresPerSocket: '8'
      ThreadsPerCore: '2'
      RealMemory: '125000'
      Feature: gamma
    'sigma[00-09]':
      Sockets: '2'
      CoresPerSocket: '12'
      ThreadsPerCore: '2'
      RealMemory: '188000'
      Feature: sigma
    'sigma[10-14]':
      Sockets: '2'
      CoresPerSocket: '12'
      ThreadsPerCore: '2'
      RealMemory: '376000'
      Feature: sigma
    'sigma[15-16]':
      Sockets: '2'
      CoresPerSocket: '24'
      ThreadsPerCore: '2'
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
    slurmtest:
      nodes:
        - 'sandbox'
        - 'awstest'
    cloud:
      nodes:
        - 'theta00'
