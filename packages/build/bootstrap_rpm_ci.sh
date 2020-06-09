#!/usr/bin/env bash

set -x -o pipefail -o errexit

yum install wget curl sudo which -y
yum install rubygems ruby-devel gcc redhat-rpm-config make rpm-build -y

echo 'export PATH="$PATH:${HOME}/bin"' >> "${HOME}/.bashrc"
source "${HOME}/.bashrc"

# Pinning this as CentOS 7 doesn't have Ruby 2.3 and ffi > 1.12.2
# requires that.
gem install ffi --version "1.12.2"
gem install --no-document fpm
fpm --version
