Plumed-related portfiles
========================

This repository contains port files that are not (yet) included in the official port
release.

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

For instance, you can install plumed with openmpi using

    > sudo port install plumed +openmpi


Installing gromacs patched with plumed
--------------------------------------

There is also a tentative replacement for the gromacs port, which
includes a plumed variant.

    > sudo port install gromacs +openmpi +plumed

Notice that for technical reasons gromacs is patched with plumed
in runtime mode. Thus, before running gromacs you should set
explicitly

    > export PLUMED_KERNEL=/opt/local/lib/libplumed.dylib

This should be fixed (TODO).


