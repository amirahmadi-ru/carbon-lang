// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes=false %s
// RUN: %{explorer} --parser_debug --trace_file=- %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes %s
// AUTOUPDATE: %{explorer} %s
// CHECK: result: 10

package ExplorerTest api;

// Test recursive functions inside continuations.

var current: i32 = 0;

fn CountUpTo(x: i32) -> i32 {
  if (x == 0) {
    current = 0;
    __await;
    return 0;
  } else {
    current = 1 + CountUpTo(x - 1);
    __await;
    return current;
  }
}

fn Main() -> i32 {
  __continuation k {
    CountUpTo(5);
  }
  var sum: i32 = 0;
  var count: i32 = 5;
  while (not (count == 0)) {
    __run k;
    sum = sum + current;
    count = count - 1;
  }
  return sum;
}
