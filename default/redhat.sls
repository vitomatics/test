# Default settings specific to RedHat-style OSs

states:
  pkgs.yum: true
  chrony: true


pkgs:
  list:
    htop: true
    iftop: true
    sysstat: true
    dstat: true
    hping3: true
    lsof: true
    iotop: true
    iperf: true
    strace: true

    screen: true
    tmux: true
    pdsh: true
    rsync: true

    zip: true
    unzip: true
    
    tcsh: true
    zsh: true
