#!/usr/bin/env bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

set -e

echo "Produce Kythe kzips"

# Produce the filelist
fusesoc --cores-root=. run \
  --no-export \
  --tool=icarus \
  --target=sim \
  --setup lowrisc:ibex:ibex_simple_system \
  --RV32E=0 \
  --RV32M=ibex_pkg::RV32MFast
_file_list="build/lowrisc_ibex_ibex_simple_system_0/sim-icarus/lowrisc_ibex_ibex_simple_system_0.scr"

_kzip_output_directory="${PWD}/kythe_output"
mkdir -p "${_kzip_output_directory}"
/tmp/verible-bin/bin/verible-verilog-kythe-kzip-writer \
  --corpus=ibex \
  --code_revision="${GITHUB_SHA}" \
  --filelist_path="${_file_list}" \
  --filelist_root="$(dirname "${_file_list}")" \
  --output_path="${_kzip_output_directory}/${GITHUB_SHA}".kzip
