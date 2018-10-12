## A profile to allow folks in the jenkins-root group to login
## and access jenkins-related files

pam:
  access:
    jenkins-root: ALL

sudo:
  included:
    sifive-jenkins-worker:
      userspec:
        - '%jenkins-root':
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmd.log'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmd.log.?.gz'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmd.log.??.gz'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmctld.log'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmctld.log.?.gz'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmctld.log.??.gz'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmdbd.log'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmdbd.log.?.gz'
          - ALL: '(root:root) /bin/cat /var/log/slurm-llnl/slurmdbd.log.??.gz'
