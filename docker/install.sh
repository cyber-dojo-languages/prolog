#!/bin/sh -eu

# Records the Prolog this image holds, in the shape every image shares. Its
# version is SWI-Prolog's: that is the system which implements it here. The
# installed system is asked, so the version is one the image can run rather
# than one written down when someone last edited this file.
# swipl --version prints "SWI-Prolog version 10.1.14 for aarch64-linux".
readonly LANGUAGE_VERSION=$(swipl --version | cut -d' ' -f3)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo 'Could not read a version from swipl --version' >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "Prolog",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF
