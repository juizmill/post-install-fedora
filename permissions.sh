#!/bim/bash

mkdir -p ~/.ssh
chmod 400 *.pem ~/
chmod 700 ~/.ssh
chmod 644 ~/.ssh/*.pub
find ~/.ssh -type f -not -name "*.pub" -exec chmod 600 \{\} \;