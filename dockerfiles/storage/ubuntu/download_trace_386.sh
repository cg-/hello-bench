#!/bin/bash
echo "Downloading trace MSR Cambridge Traces 1" 1>&2
cookies=/tmp/cookie$$
cat > $cookies << 'EOF'
# Netscape HTTP Cookie File
# http://curl.haxx.se/rfc/cookie_spec.html
# This file was generated by iotta.snia.org! Edit at your own risk.
# This script can only be run from the computer on which it was originally downloaded.

.iotta.snia.org	TRUE	/	FALSE	0	infodigest	44deff35a991441f206bbd2eb6cd4374edbad220
.iotta.snia.org	TRUE	/	FALSE	0	legal	true
.iotta.snia.org	TRUE	/	FALSE	0	id	434401
EOF

function useWGET {
  wget --content-on-error  --load-cookies=$cookies \
    -O 'msr-cambridge1.tar' -c 'http://server1.iotta.snia.org/traces/386/download?type=file&sType=wget'
}
function useCURL {
  curl -b $cookies -o \
    'msr-cambridge1.tar' -C - -L 'http://server1.iotta.snia.org/traces/386/download?type=file&sType=curl'
}

if which wget >/dev/null 2>&1; then
  useWGET
elif which curl >/dev/null 2>&1; then
  useCURL
else
  echo "Couldn't find either wget or curl. Please install one of them" 1>&2
fi

rm -f $cookies
set -e
