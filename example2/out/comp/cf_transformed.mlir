module {
  func.func @example2(%arg0: memref<1000xi32> {handshake.arg_name = "a"}) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c100_i32 = arith.constant 100 : i32
    cf.br ^bb1(%c0_i32, %c0_i32 : i32, i32) {handshake.name = "br0"}
  ^bb1(%0: i32, %1: i32):  // 2 preds: ^bb0, ^bb2
    %2 = arith.index_cast %1 {handshake.name = "index_cast0"} : i32 to index
    %3 = memref.load %arg0[%2] {handshake.name = "load0"} : memref<1000xi32>
    %4 = arith.addi %0, %3 {handshake.name = "addi0"} : i32
    %5 = arith.cmpi slt, %4, %c100_i32 {handshake.name = "cmpi0"} : i32
    cf.cond_br %5, ^bb2(%0, %3, %1 : i32, i32, i32), ^bb3 {handshake.name = "cond_br0"}
  ^bb2(%6: i32, %7: i32, %8: i32):  // pred: ^bb1
    %9 = arith.addi %8, %c1_i32 {handshake.name = "addi1"} : i32
    %10 = arith.addi %6, %7 {handshake.name = "addi2"} : i32
    cf.br ^bb1(%10, %9 : i32, i32) {handshake.name = "br1"}
  ^bb3:  // pred: ^bb1
    return {handshake.name = "return0"} %4 : i32
  }
}

