states:
  autofs: true

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

pkgs:
  apt:
    repos:
      sbt:
        uri: https://dl.bintray.com/sbt/debian
        suite: /
        comps:
        keyid: 642AC823
        keyserver: keyserver.ubuntu.com

  list:
    lsb-core: true
    libgcc1:i386: true

    openjdk-8-jdk: true
    environment-modules: true
    tcl-tclreadline: true

    # Miscellaneous
    tcsh: true
    finger: true
    unzip: true

    libtool: true
    libusb-1.0-0-dev: true

    # Interactive
    texlive-full: true

    xterm: true
    {% if grains.os == 'Debian' %}
    chromium: true
    {% elif grains.os == 'Ubuntu' %}
    chromium-browser: true
    {% endif %}

    emacs-nox: false
    emacs: true
    git-el: true
    nedit: true
    vim-gtk: true
    joe: true
    gedit: true
    evince: true
    dbus-x11: true
    gitk: true
    rcs: true
    # Used by emacs
    gnome-icon-theme: true

    # riscv-tools
    build-essential: true
    autoconf: true
    automake: true
    autotools-dev: true
    gawk: true
    texinfo: true
    flex: true
    bison: true
    libmpc-dev: true
    libmpfr-dev: true
    libgmp-dev: true
    dejagnu: true

    sbt: true
    # Modules
    tcl8.5-dev: true
    tk8.5-dev: true
    # Ruby
    libyaml-dev: true
    # Prometheus
    graphviz: true
    ghostscript: true
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

    # general development
    libncurses5-dev: true
    libglib2.0-dev: true

    # IVy
    libgraphviz-dev: true
    python-dev: true
    python-tk: true
    tix: true

    # Synopsys Hector
    libncurses5:i386: true

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

sshd:
  options:
    X11Forwarding: yes

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
