#!/usr/bin/env bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

set -e

echo "Fetching Verible"

LATEST_VERIBLE_RELEASE=$(curl -s \
  https://api.github.com/repos/chipsalliance/verible/releases/latest \
  | grep -o "https:.*Ubuntu.*tar.gz" \
  | sort -r \
  | head -n1)

mkdir /tmp/verible-bin
cd /tmp/verible-bin
wget --no-verbose -O verible.tar.gz "${LATEST_VERIBLE_RELEASE}"
tar -xzf verible.tar.gz --strip-components=1
