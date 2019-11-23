#!/bin/bash

echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
jenv enable-plugin export
source ~/.bash_profile