# Basic profile for an NFS server

{% import_yaml "site/sifive1.yml" as site %}

states:
  nfs4.server: true

nfs4:
  domain: {{ site.nfs4.domain }}
