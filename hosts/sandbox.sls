## pillar file for sandbox

# network - dhcp

states:
  firewall.iptables: true
  sshguard: true
  autofs: true
  nfs4: true


# Login server testing

sshd:
  options:
    X11Forwarding: yes

pkgs:
  apt:
    repos:
      sbt:
        uri: https://dl.bintray.com/sbt/debian
        suite: /
        comps:
        keyid: 642AC823
        keyserver: keyserver.ubuntu.com
      x2go:
        types: [ deb ]
        uri: http://ppa.launchpad.net/x2go/stable/ubuntu
        suite: xenial
        keyid: 7CDE3A860A53F9FD
        keyserver: keyserver.ubuntu.com

  list:
    x2goserver: true
    x2goserver-xsession: true

    xubuntu-desktop: true
    xfce4-terminal: true
    xfce4-screenshooter: true
    xfce4-taskmanager: true
    ristretto: true
    pastebinit: true
    mousepad: true
    ubuntu-desktop: true
    lxde: true
    lxsession: true
    lxterminal: true
    mate-core: true
    mate-applets: true
    mate-system-monitor: true
    mate-themes: true
    mate-tweak: true
    mate-utils: true
    mate-dock-applet: true
    mate-indicator-applet: true
    mate-gnome-main-menu-applet: true
    gnome-shell: true
    gnome-terminal: true
    gnome-calculator: true
    # These next two needed by nedit
    xfonts-100dpi: true
    xfonts-75dpi: true

#### From compute

    lsb-core: true
    libgcc1:i386: true

    # Miscellaneous
    unzip: true
    libtool: true

    xterm: true
    firefox: true

    emacs-nox: false
    emacs: true
    git-el: true
    vim-gtk: true
    dbus-x11: true
    gitk: true
    # Used by emacs
    gnome-icon-theme: true

    gawk: true
    texinfo: true
    libmpc-dev: true
    libmpfr-dev: true
    libgmp-dev: true

    sbt: true
    # Modules
    tcl8.5-dev: true
    tk8.5-dev: true
    # Ruby
    libyaml-dev: true
    # galaxy_icc_exec
    libjpeg62: true
    {% if grains.os == 'Debian' %}
    libmng1: true
    {% elif grains.os == 'Ubuntu' %}
    libmng2: true
    {% endif %}
    
    # Python
    virtualenv: true
    python-pip: true
    python-pexpect: true


firewall:
  usesshguard: true








nfs4:
  domain: internal.sifive.com

autofs:
  lookup:
    browse_mode: yes
  direct:
    /sifive: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work
  home:
    '*': -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid,nobrowse netapp1-nfs1.internal.sifive.com:/homes/&
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/nettmp


pam:
  access:
    compute: ALL
    consult: ALL EXCEPT LOCAL
    jenkins: 10.14.0.10 # jenkins.internal.sifive.com
  limits:
    domains:
      '@compute':
        - type: soft
          item: stack
          value: 16384
        - type: hard
          item: stack
          value: unlimited




file:
  mkdir:
    /scratch:
      user: root
      group: compute
      mode: 1770
  ln:
    # Needed by Synopsis core consultant
    /bin/awk: /usr/bin/awk
    # Copied from i0 - history unknown
    /bin/arch: /usr/bin/arch
    # galaxy_icc_exec
    /usr/lib/x86_64-linux-gnu/libtiff.so.3: libtiff.so.5
    {% if grains.os == 'Ubuntu' %}
    /usr/lib/x86_64-linux-gnu/libmng.so.1: libmng.so.2
    {% endif %}

sysctl:
  params:
    net.core.rmem_max: 67108864
    net.core.wmem_max: 67108864
    net.core.netdev_max_backlog: 300000
    net.ipv4.tcp_rmem: 4096 87380 33554432
    net.ipv4.tcp_wmem: 4096 65536 33554432
    net.ipv4.tcp_congestion_control: htcp

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
    - '%eda':
      - ALL: '(eda:eda) ALL'
