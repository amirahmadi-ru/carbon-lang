// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes=false %s
// RUN: %{not} %{explorer} --parser_debug --trace_file=- %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

var v: i32;
// TODO: This should probably be valid if we allow global variables at all.
// CHECK: COMPILATION ERROR: {{.*}}/explorer/testdata/alias/fail_alias_var.carbon:[[@LINE+1]]: invalid target for alias declaration
alias A = v;

fn Main() -> i32 { return 0; }
