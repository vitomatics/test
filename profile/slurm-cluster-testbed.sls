## SLURM config for cluster 2 - the testbed cluster
##
## WARNING - be sure to use single quotes around SLURM-style times

# slurm:MungeKey64 is in this secret.munge file
include:
  - profile.slurm-sifive
  - secret.munge

slurm:
  X: true
  ClusterName: testbed
  ControlMachine: gaia
  ControlAddr: gaia.internal.sifive.com
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
    'terminus':
      CPUs: 4
      RealMemory: '8000'
      Feature: terminus
    'epsilon[00-29]':
      CPUs: 4
      RealMemory: '8000'
      Feature: epsilon
    'alpha':
      CPUs: '32'
      RealMemory: '125000'
      Feature: alpha
  gres:
    'epsilon[00-29]':
       - Name: testboard
         Count: 0
  partitions:
    boardtest:
      DefMemPerCPU: 4000
      nodes:
        - 'epsilon[00-29]'
    fpgabuild:
      nodes:
        - 'alpha'
    test:
      nodes:
        - 'terminus'
