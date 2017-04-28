# "devel" is a profile that sets up packages needed for hardware
# and software development

states:
  modules: true

modules:
  paths:
    - /sifive/tools/Modules/default/sifive

{#
pkgs:
  apt:
    repos:
      sbt:
        uri: https://dl.bintray.com/sbt/debian
        suite: /
        comps:
        keyid: 642AC823
        keyserver: keyserver.ubuntu.com
#}

pkgs:
  apt:
    repos:
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

    tcl-tclreadline: true

    ## Miscellaneous
    tcsh: true
    unzip: true
    parallel: true
    # needed by Cadence PVS
    ksh: true
    fakeroot: true

    libtool: true

    ## Interactive

    xterm: true
    firefox: true

    emacs-nox: false
    yaml-mode: true
    git-el: true
    dbus-x11: true
    # Used by emacs but not a dependency
    gnome-icon-theme: true
    xsltproc: true

    ## Building riscv-tools
    build-essential: true
    autoconf: true
    automake: true
    autotools-dev: true
    gawk: true
    dejagnu: true

    
    ## Python
    virtualenv: true
    python-pip: true

  listurl:
    libxp6: http://sfimages.internal.sifive.com/Ubuntu/trusty/amd64/libxp6_1.0.2-1ubuntu1_amd64.deb

file:
  ln:
    # Needed by Synopsis core consultant
    /bin/awk: /usr/bin/awk
    # Copied from i0 - history unknown
    /bin/arch: /usr/bin/arch
