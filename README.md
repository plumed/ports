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

Notice that there is currently a bug in `libmatheval` (version 1.1.11_1)
on MacPorts. Namely, the library depends on `flex` but does not declare it properly.
In case you get the following error while building plumed:

    Error: org.macports.build for port plumed returned: command execution failed
    Error: Failed to install plumed

you might be able to solve it by installing `flex` before plumed

    > sudo port install flex
    > sudo port install plumed

Variants are used to switch on or off some features.
For instance, `matheval` variant is on by default (implying
that `libmatheval` will be installed by macports) and
can be switched off with `sudo port install plumed -matheval`.
Similarly, other variants can be switch on using `+variant`.

Plumed also uses variants to support different compilers.
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
gromacs patched with plumed with gcc compiler and openmpi:

    > sudo port install gromacs +openmpi +gcc6 +plumed

Notice that gromacs is patched with plumed in runtime mode
but that the path of libplumedKernel.dylib in the macports tree
is hardcoded. As a consequence:

- If gromacs is run with `PLUMED_KERNEL` unset (or set to empty),
  then the macports plumed is used.

- If gromacs is run with `PLUMED_KERNEL` pointing to another instance
  of the plumed library, the other instance is used.

Also notice that gromacs should be compiled using the same compiler
variant as plumed (in this example `+openmpi +gcc6`). In case this is not
true, compilation will fail.

