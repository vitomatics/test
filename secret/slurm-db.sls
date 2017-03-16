##
## Secret slurm database data
##
## *** SOME OF THIS IS GPG ENCRYPTED ***

{% set slurm_db_user = 'slurm' %}
{% set slurm_db_password = 'a788d73P' %}
{% set slurm_db_name = 'slurm_acct_db' %}

slurm:
  db:
    StorageHost: localhost
    StorageLoc: {{ slurm_db_name }}
    StorageUser: {{ slurm_db_user }}
    StoragePass: {{ slurm_db_password }}

mysql:
  user:
    {{slurm_db_user}}:
      hosts:
        - localhost
        - 127.0.0.1
      password: {{ slurm_db_password }}
      databases: {{ [ slurm_db_name ] }}
      grants: ALL

