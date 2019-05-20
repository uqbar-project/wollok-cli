#!/bin/bash
#
ORGANIZATION=wollok

curl -s https://api.github.com/orgs/$ORGANIZATION/repos\?per_page\=200 | perl -ne 'print "$1\n" if (/"ssh_url": "([^"]+)/)' | xargs -n 1 git clone