# Multi-site Middleman Example

Demonstrates how to create a multi-site middleman project without using symlinks.

Caveats:

* Layouts must be specified as relative to the current source directory
* Partials must be in the same relative directoy for all sites
* Assets shared between sites are in `lib/assets`

Because of those two requirements, it is best to place both the `layouts` and `partials` directories in `/source` along with a directory for each site that is beign built. e.g.

    /source/
        /layouts/
        /partials/
        /support/
        /www/


## Preview & Build

    rake preview[site-name]
    rake build[site-name]

`site-name` is either `www` or `support` in this case.