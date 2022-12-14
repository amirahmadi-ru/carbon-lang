// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes=false %s
// RUN: %{explorer} --parser_debug --trace_file=- %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes %s
// AUTOUPDATE: %{explorer} %s
// CHECK: result: 3

package ExplorerTest api;

// Assignment for continuations is shallow, so `k2` refers to the same
// continuation as `k1`.

var x: i32 = 0;

fn Foo() {
  x = x + 1;
  __await;
  x = x + 2;
}

fn Main() -> i32 {
  __continuation k1 {
    Foo();
  }
  var k2: __Continuation = k1;
  __run k1;
  __run k2;
  return x;
}
