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

  PriorityType: multifactor
  PriorityWeightQOS: 1000
  PriorityWeightAge: 1000
  PriorityMaxAge: '24:00:00'

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
        - 'gamma[10-13]'
    quick:
      DefMemPerCPU: 4000
      MaxMemPerCPU: 16000
      MaxTime: '4:00:00'
      MaxNodes: 1
      nodes:
        - 'gamma[14-15]'
    test:
      nodes:
        - sandbox

  qos:
    dead:
      absent: true
    normal:
      priority: 500
      GrpTRES: cpu=32
    interactive:
      priority: 1000
      GrpTRES: cpu=64
    pr:
      priority: 1000
      GrpTRES: cpu=64
    m2m:
      priority: 600
      GrpTRES: cpu=32
    nightly:
      priority: 600
      GrpTRES: cpu=32
    weekly:
      priority: 200
      GrpTRES: cpu=32
    tapeout:
      priority: 1000
      GrpTRES: cpu=256
    
