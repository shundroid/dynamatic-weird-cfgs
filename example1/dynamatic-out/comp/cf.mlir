module {
  func.func @example1(%arg0: memref<1000xi32> {handshake.arg_name = "a"}, %arg1: memref<1000xi32> {handshake.arg_name = "b"}) {
    %true = arith.constant {handshake.name = "constant0"} true
    %false = arith.constant {handshake.name = "constant1"} false
    %c2_i32 = arith.constant {handshake.name = "constant2"} 2 : i32
    %c0 = arith.constant {handshake.name = "constant3"} 0 : index
    %c1000 = arith.constant {handshake.name = "constant4"} 1000 : index
    %c1 = arith.constant {handshake.name = "constant5"} 1 : index
    cf.br ^bb1(%c0, %true : index, i1) {handshake.name = "br0"}
  ^bb1(%0: index, %1: i1):  // 2 preds: ^bb0, ^bb5
    cf.cond_br %1, ^bb2, ^bb3 {handshake.name = "cond_br0"}
  ^bb2:  // pred: ^bb1
    %2 = memref.load %arg0[%0] {handshake.name = "load1"} : memref<1000xi32>
    memref.store %2, %arg1[%0] {handshake.name = "store1"} : memref<1000xi32>
    %3 = arith.cmpi sge, %2, %c2_i32 {handshake.name = "cmpi0"} : i32
    cf.br ^bb4(%3 : i1) {handshake.name = "br1"}
  ^bb3:  // pred: ^bb1
    cf.br ^bb4(%false : i1) {handshake.name = "br2"}
  ^bb4(%4: i1):  // 2 preds: ^bb2, ^bb3
    cf.br ^bb5 {handshake.name = "br3"}
  ^bb5:  // pred: ^bb4
    %5 = arith.addi %0, %c1 {handshake.name = "addi0"} : index
    %6 = arith.cmpi ult, %5, %c1000 {handshake.name = "cmpi1"} : index
    cf.cond_br %6, ^bb1(%5, %4 : index, i1), ^bb6 {handshake.name = "cond_br1"}
  ^bb6:  // pred: ^bb5
    return {handshake.name = "return0"}
  }
}

