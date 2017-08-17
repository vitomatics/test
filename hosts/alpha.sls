## Pillar file for alpha

states:
    perccli: true

perccli:
  lookup:
    pkgurl: http://sfimages.internal.sifive.com/Dell/PERC/deb/perccli_1.11.03-2_all.deb


udev:
  rules:
    99-eth0:
      'Intel 82599ES':
        - 'ACTION=="add"'
        - 'SUBSYSTEM=="net"'
        - 'ATTR{address}=="90:e2:ba:c6:b0:a4"'
        - 'NAME="eth0"'

network:
  interfaces:
    eth0:
      ip: 10.14.1.4

# ssh:
#   userconfig:
#     eda:
#       github.com:
#         User: git
#         IdentitiesOnly: yes
#       github-sifive-modules:
#         HostName: github.com
#         IdentityFile: ~/.ssh/id_rsa.sifive-modules
