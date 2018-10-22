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

  GresTypes: testboard

# TaskPlugin: affinity
# TaskPluginParam: Threads

  DefMemPerCPU: '4000'

  nodes:
    'sandbox':
      CPUs: 2
      RealMemory: '4096'
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
    'delta[00-03]':
      CPUs: '4'
      RealMemory: '8000'
      Feature: delta
    'epsilon[00-29]':
      CPUs: 4'
      RealMemory: '8000'
      Feature: epsilon
    'alpha':
      CPUs: '32'
      RealMemory: '125000'
      Feature: alpha
  gres:
    'delta[00-03]':
       - Name: testboard
         Count: 1
    'epsilon[00-29]':
       - Name: testboard
         Count: 1
  partitions:
    standard:
      Default: yes
      nodes:
        - 'gamma[10-14]'
        - 'sigma[00-14]'
    boardtest:
      DefMemPerCPU: 4000
      nodes:
        - 'delta[00-03]'
        - 'epsilon[00-29]'
        - 'alpha'
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
    mikeyang:
      nodes:
        - 'sandbox'

