Plumed-related portfiles
========================

Port files that are not yet included in the official port release are stored here.
You can setup macports to use them as follows

    > git clone git@github.com:plumed/portfiles.git
    > cd portfiles
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


-
