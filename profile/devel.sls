# "devel" is a profile that sets up packages needed for hardware
# and software development

states:
  modules: true

modules:
  paths:
    - /sifive/tools/Modules/default/sifive

pkgs:
  apt:
    repos:
      sbt:
        uri: https://dl.bintray.com/sbt/debian
        suite: /
        comps:
        keyid: 642AC823
        keyserver: keyserver.ubuntu.com

# Source repos
{% if grains.os == "Ubuntu" %}

{% set repo_names = [ 'xenial' ]  %}
{% set repo_uri = 'http://us.archive.ubuntu.com/ubuntu/' %}
{% set repo_suffices = ['', '-updates', '-security' ] %}
{% set repo_comps = ['main', 'restricted', 'universe', 'multiverse'] %}
{% set repo_type = 'deb-src' %}
{% set repo_abbrtype = 'src' %}

{% for name in repo_names %}
{% for suffix in repo_suffices %}
{% set suite = name + suffix %}
{% set id = suite + '-' + repo_abbrtype %}
      {{ id }}:
        types:
          - {{ repo_type }}
        uri: {{ repo_uri }}
        suite: {{ name }}{{suffix}}
        comps: {{ repo_comps }}
{% endfor %}    {# iterating over repo suffices #}
{% endfor %}    {# iterating over repo names #}

{% endif %}     {# Ubuntu #}

  list:
    lsb-core: true
    libgcc1:i386: true

    openjdk-8-jdk: true
    tcl-tclreadline: true

    ## For Drew
    maven: true
    ant: true

    ## Miscellaneous
    tcsh: true
    finger: true
    zip: true
    unzip: true
    tree: true
    parallel: true
    # needed by Cadence PVS
    ksh: true
    fakeroot: true
    devscripts: true

    libtool: true
    libusb-1.0-0-dev: true

    ## Interactive
    texlive-full: true

    xterm: true
    {% if grains.os == 'Debian' %}
    chromium: true
    {% elif grains.os == 'Ubuntu' %}
    chromium-browser: true
    firefox: true
    icedtea-8-plugin: true
    {% endif %}

    emacs-nox: false
    emacs: true
    yaml-mode: true
    git-el: true
    nedit: true
    vim-gtk: true
    joe: true
    gedit: true
    evince: true
    filezilla: true
    dbus-x11: true
    gitk: true
    git-merge-changelog: true
    rcs: true
    # Used by emacs but not a dependency
    gnome-icon-theme: true
    xsltproc: true
    gnuplot: true

    ## Building riscv-tools
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
    {% if grains.os == 'Ubuntu' %}
    gnat-5: true
    {% endif %}

    sbt: true
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

    ## gtkwave, both src and pkg
    gtkwave: true
    libjudydebian1: true
    tk8.6-dev: true
    tcl8.6-dev: true
    libbz2-dev: true
    liblzma5: true
    zlib1g-dev: true
    
    ## Python
    virtualenv: true
    python-pip: true
    python-pexpect: true
    python-sympy: true
    python-pygments: true
    {% if grains.os == 'Ubuntu' %}
    python3-sympy: true
    python-sympy-doc: true
    {% endif %}

    ## general development
    libncurses5-dev: true
    libglib2.0-dev: true
    libgtk2.0-dev: true
    libpango1.0-dev: true

    ## General cpu tools
    qemu: true

    # IVy
    libgraphviz-dev: true
    python-dev: true
    python-tk: true
    tix: true

    # Synopsys Hector
    libncurses5:i386: true
    libelf1:i386: true
    libc6-dev:i386: true

    # Synopsys "mw"
    libxext6:i386: true

    # Mentor calibredrv
    libgstreamer0.10-0: true

    # Cadence layout
    libglu1-mesa: true


    # Linux kernel development
    device-tree-compiler: true
    libfdt-dev: true

  listurl:
    libxp6: http://sfimages.internal.sifive.com/Ubuntu/trusty/amd64/libxp6_1.0.2-1ubuntu1_amd64.deb

file:
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
