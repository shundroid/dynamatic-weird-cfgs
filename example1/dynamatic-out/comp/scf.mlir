module {
  func.func @example1(%arg0: memref<1000xi32> {handshake.arg_name = "a"}, %arg1: memref<1000xi32> {handshake.arg_name = "b"}) {
    %true = arith.constant {handshake.name = "constant0"} true
    %false = arith.constant {handshake.name = "constant1"} false
    %c2_i32 = arith.constant {handshake.name = "constant2"} 2 : i32
    %c0 = arith.constant {handshake.name = "constant3"} 0 : index
    %c1000 = arith.constant {handshake.name = "constant4"} 1000 : index
    %c1 = arith.constant {handshake.name = "constant5"} 1 : index
    %0:2 = scf.while (%arg2 = %c0, %arg3 = %true) : (index, i1) -> (index, i1) {
      %1 = scf.if %arg3 -> (i1) {
        %4 = memref.load %arg0[%arg2] {handshake.name = "load1"} : memref<1000xi32>
        memref.store %4, %arg1[%arg2] {handshake.name = "store1"} : memref<1000xi32>
        %5 = arith.cmpi sge, %4, %c2_i32 {handshake.name = "cmpi0"} : i32
        scf.yield {handshake.name = "yield0"} %5 : i1
      } else {
        scf.yield {handshake.name = "yield1"} %false : i1
      } {handshake.name = "if0"}
      %2 = arith.addi %arg2, %c1 {handshake.name = "addi0"} : index
      %3 = arith.cmpi ult, %2, %c1000 {handshake.name = "cmpi1"} : index
      scf.condition(%3) {handshake.name = "condition0"} %2, %1 : index, i1
    } do {
    ^bb0(%arg2: index, %arg3: i1):
      scf.yield {handshake.name = "yield4"} %arg2, %arg3 : index, i1
    } attributes {handshake.name = "while0"}
    return {handshake.name = "return0"}
  }
}

