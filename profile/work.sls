# "work" is a cut-down version of compute for machines that are not
# running the full set of development tools
# In particular some document-management tools are missing.

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

    openjdk-8-jre: true
    environment-modules: true
    tcl-tclreadline: true

    # Miscellaneous
    tcsh: true
    finger: true
    unzip: true
    tree: true
    parallel: true

    libtool: true

    emacs-nox: false
    emacs: true
    yaml-mode: true
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

    # general development
    libncurses5-dev: true
    libglib2.0-dev: true

    # IVy
    libgraphviz-dev: true
    python-dev: true
    python-tk: true
    tix: true
