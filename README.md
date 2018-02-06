Plumed-related portfiles
========================

This repository contains port files that are not (yet) included in the official port
release.

***WARNING: these repository is used for experimental features. Please refer to the PLUMED manual and to the official MacPorts release in order to obtain documentation on the supported PLUMED version.*** 

You can setup macports to use them as follows

    > git clone git@github.com:plumed/ports.git
    > cd ports
    > portindex
    > sudo vi /opt/local/etc/macports/sources.conf

Then add the path to your local copy of macport files *before* the offical macports repository,
so that it will take the precedence:

    file:///Users/bussi/ports
    rsync://rsync.macports.org/release/tarballs/ports.tar [default]

Notice that whenever you update your port files (e.g. using `git pull`) you must
also run `portindex` in the ports directory.

For more information on local port files, see
[here](https://guide.macports.org/chunked/development.local-repositories.html).

Using plumed with macports
--------------------------

Now you will be able to install plumed with ports, e.g. using

    > sudo port install plumed

Have a look at the different available variants using

    > sudo port info plumed

Plumed uses variants to support different compilers.
For instance, you can install plumed with openmpi using

    > sudo port install plumed +openmpi

Using gcc instead of native compilers is recommended so as to
take advantage of openMP

    > sudo port install plumed +openmpi +gcc6


Installing gromacs patched with plumed
--------------------------------------

There is also a tentative replacement for the gromacs port.
The only difference between this port and the one provided by macports
is that this one also implements a plumed variant.
For instance, you can use the following command to install
gromacs patched with plumed with recent clang compiler and openmpi:

    > sudo port install gromacs +openmpi +clang50 +plumed

Notice that gromacs is patched with plumed in runtime mode
but that the path of libplumedKernel.dylib in the macports tree
is hardcoded. As a consequence:

- If gromacs is run with `PLUMED_KERNEL` environment variable unset (or set to empty),
  then the macports plumed is used.

- If gromacs is run with `PLUMED_KERNEL` environment variable pointing to another instance
  of the plumed library, the other instance is used.

Also notice that gromacs should be compiled using the same compiler
variant as plumed (in this example `+openmpi +clang50`). In case this is not
true, compilation will fail.

