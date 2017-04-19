include:
  - profile.slurm-client

slurm:
  acct:
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
    
