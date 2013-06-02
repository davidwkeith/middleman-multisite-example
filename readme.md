# Multi-site Middleman Example

Demonstrates how to create a multi-site middleman project.

Features:

* Layouts are in `lib/layouts` for all sites
* Partials are in `lib/partials` for all sites
* Assets shared between sites are in `lib/assets`, local assets are in local source dir

e.g.

   /lib/assets/javascripts/shared.js
   /source/www/javascripts/www.js

## Preview & Build

    middlman preview SITE_NAME
    middlman make SITE_NAME

`SITE_NAME` is either `www` or `support` in this case.

## Known Issues

* Can't in line images from Compass (Seems to be a Compass issue, investigating)
* Partials and Layouts all load from a single directory
  Workaround: create a subdirectory for each project and reference as www/layout in frontmatter.