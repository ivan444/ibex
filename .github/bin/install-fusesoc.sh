#!/usr/bin/env bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

set -e

echo "Installing fusesoc and related dependencies"

sudo apt install -y \
  python3 \
  python3-pip

pip3 install --upgrade --user fusesoc

# Ibex runtime dependencies for executing fusesoc
pip3 install --user -r python-requirements.txt
