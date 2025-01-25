module {
  func.func @example1(%arg0: memref<1000xi32> {handshake.arg_name = "a"}, %arg1: memref<1000xi32> {handshake.arg_name = "b"}) {
    %c1 = arith.constant 1 : index
    %c1000 = arith.constant 1000 : index
    %c0 = arith.constant 0 : index
    %c2_i32 = arith.constant 2 : i32
    %false = arith.constant false
    %true = arith.constant true
    cf.br ^bb1(%c0, %true : index, i1) {handshake.name = "br0"}
  ^bb1(%0: index, %1: i1):  // 2 preds: ^bb0, ^bb3
    cf.cond_br %1, ^bb2, ^bb3(%false : i1)
  ^bb2:  // pred: ^bb1
    %2 = memref.load %arg0[%0] {handshake.name = "load1"} : memref<1000xi32>
    memref.store %2, %arg1[%0] {handshake.name = "store1"} : memref<1000xi32>
    %3 = arith.cmpi sge, %2, %c2_i32 {handshake.name = "cmpi0"} : i32
    cf.br ^bb3(%3 : i1) {handshake.name = "br1"}
  ^bb3(%4: i1):  // 2 preds: ^bb1, ^bb2
    %5 = arith.addi %0, %c1 {handshake.name = "addi0"} : index
    %6 = arith.cmpi ult, %5, %c1000 {handshake.name = "cmpi1"} : index
    cf.cond_br %6, ^bb1(%5, %4 : index, i1), ^bb4 {handshake.name = "cond_br1"}
  ^bb4:  // pred: ^bb3
    return {handshake.name = "return0"}
  }
}

