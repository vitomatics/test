# "devel" is a profile that sets up packages needed for hardware
# and software development

states:
  modules: true

modules:
  paths:
    - /sifive/tools/Modules/default/sifive

pkgs:
  list:
    ## Miscellaneous
    tcsh: true
    # needed by Cadence PVS
    ksh: true
    tree: true
    zip: true
    unzip: true

    ## Interactive
    emacs-nox: false
    emacs: true
    
{% if grains.os_family != 'RedHat' %}
    lsb-core: true
    gcc-multilib: true
    g++-multilib: true
    libgcc1:i386: true

    openjdk-8-jdk: true
    tcl-tclreadline: true

    ## For Drew
    maven: true
    ant: true

    ## For Palmer
    xz-utils: true
    lftp: true

    ## Miscellaneous
    finger: true
    parallel: true
    fakeroot: true
    devscripts: true
    # This is for the "banner" command
    sysvbanner: true

    libtool: true
    libusb-1.0-0-dev: true
    xorriso: true

    ## Interactive
    texlive-full: true
    texstudio: true
    texstudio-doc: true
    texstudio-l10n: true

    xterm: true
    {% if grains.os == 'Debian' %}
    chromium: true
    {% elif grains.os == 'Ubuntu' %}
    chromium-browser: true
    firefox: true
    icedtea-8-plugin: true
    {% endif %}
    thunar: true

    yaml-mode: true
    git-el: true
    nedit: true
    vim-gtk: true
    joe: true
    gedit: true
    evince: true
    baobab: true
    filezilla: true
    dbus-x11: true
    gitk: true
    rcs: true
    git-merge-changelog: true
    # Used by emacs but not a dependency
    gnome-icon-theme: true
    xsltproc: true
    gnuplot: true
    xpdf: true
    mc: true

    # git send-email support for Wes
    git-email: true
    libemail-valid-perl: true
    libauthen-sasl-perl: true

    ## Some wordlists
    wbritish: true
    wamerican: true
    # For Wes
    wngerman: true

    

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
    sparse: true
    {% endif %}
    exuberant-ctags: true

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

    ## text processing
    texlive: true
    markdown: true
    asciidoc: true
    pandoc: true
    xmlto: true
    fop: true
    dblatex: true
    python3-docutils: true
    python-docutils: true
    dita-ot: true
    dita-ot-doc: true
    xalan: true
    libxalan-c-doc: true
    libxalan2-java: true
    libxalan2-java-doc: true
    doxygen: true
    perl-doc: true
    
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
    python3-yaml: true
    python3-dev: true
    python3-venv: true
    python-sympy-doc: true
    {% endif %}
    virtualenvwrapper: true

    # OCaml - some of it needed for vmurali using coq
    oasis: true
    camlp5: true

    # Haskell - requested by gleb
    ghc: true
    cabal-install: true

    ## Perl
    libyaml-perl: true

    ## general development
    libncurses5-dev: true
    libglib2.0-dev: true
    libgtk2.0-dev: true
    libpango1.0-dev: true
    libssl-dev: true
    libssl-doc: true
    libreadline-dev: true
    readline-doc: true
    cmake: true
    diffstat: true
    chrpath: true
    jq: true
    subversion: true
    valgrind: true
    libboost-all-dev: true
    linux-tools-virtual: true
    ninja-build: true
    libseccomp-dev: true
    libsqlite3-dev: true
    terminator: true

    ## windows development
    mingw-w64: true

    ## For LiberoSoC
    libmotif-dev: true
    libxm4:i386: true
    libglib2.0-0:i386: true

    ## General cpu tools
    qemu: true
    openbios-sparc: true

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

    # Synopsys VCS
    dc: true

    # Mentor calibredrv
    libgstreamer0.10-0: true

    # Cadence layout
    libglu1-mesa: true


    # Linux kernel development
    device-tree-compiler: true
    libfdt-dev: true

    # GUI tools
    meld: true
    diffuse: true

    # Needed by ipxe
    liblzma-dev: true

    # FPGA board tests
    sshpass: true

    # AWS
    python-boto: true
    python3-boto: true
    python-boto3: true
    python3-boto3: true
    awscli: true

    # VNC
    vinagre: true
{% endif %}

{% if grains.os_family != 'RedHat' %}
  listurl:
    libxp6: http://sfimages.internal.sifive.com/Ubuntu/trusty/amd64/libxp6_1.0.2-1ubuntu1_amd64.deb
{% endif %}
  
{% if grains.os_family != 'RedHat' %}
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
{% endif %}
