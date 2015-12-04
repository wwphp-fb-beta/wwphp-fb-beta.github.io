#!/usr/bin/env bash

echo "Installing Ruby $1"

source $HOME/.rvm/scripts/rvm

/bin/bash --login -c "rvm use --default --install $1"

shift

if (( $# ))
then echo "Installing gems: $@, this may take some minutes ..." && /bin/bash --login -c "gem install $@"
fi

rvm cleanup all
