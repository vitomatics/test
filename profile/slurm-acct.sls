include:
  - profile.slurm-client

slurm:
  acct:
    clusters:
      test1: false
      test2: false
      test3: false
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
        GrpTRES: cpu=128
    
