#!/bin/bash

mkdir -p $HOME/.ssh
chmod 400 $HOME/*.pem
chmod 700 $HOME/.ssh
chmod 644 $HOME/.ssh/*.pub
find $HOME/.ssh -type f -not -name "*.pub" -exec chmod 600 \{\} \;
