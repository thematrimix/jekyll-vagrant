jekyll_vagrant
==============

A simple vagrant box for doing jekyll work.

## Nginx Steps
1) cp /etc/nginx/sites-available/default /etc/nginx/sites-available/[site]

2) ln -s /etc/nginx/sites-available/[site] /etc/nginx/sites-enabled/[site]

3) rm /etc/nginx/sites-available/default

4) service nginx rest

Hummmm I need to figure out how to deal with [site] and to upload a file to /etc/nginx/sites-available as it would be a pain to try to script edit it.

## Getting RVM and Ruby setup
1) \curl -sSL https://get.rvm.io | bash -s stable

2) chown -R vagrant:vagrant .rvm

3) source ~/.rvm/scripts/rvm

4) rvm install ruby_version

This all runs under root so have to fix it to be for the vagrant user
