module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @example2(%arg0: memref<1000xi32>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c100_i32 = arith.constant 100 : i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0:4 = scf.while (%arg1 = %c0_i32, %arg2 = %c0_i32) : (i32, i32) -> (i32, i32, i32, i32) {
      %1 = arith.index_cast %arg2 : i32 to index
      %2 = memref.load %arg0[%1] : memref<1000xi32>
      %3 = arith.addi %arg1, %2 : i32
      %4 = arith.cmpi slt, %3, %c100_i32 : i32
      scf.condition(%4) %3, %arg1, %2, %arg2 : i32, i32, i32, i32
    } do {
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32):
      %1 = arith.addi %arg4, %c1_i32 : i32
      %2 = arith.addi %arg2, %arg3 : i32
      scf.yield %2, %1 : i32, i32
    }
    return %0#0 : i32
  }
}
