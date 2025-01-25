module {
  func.func @example2(%arg0: memref<1000xi32> {handshake.arg_name = "a"}) -> i32 {
    %c100_i32 = arith.constant {handshake.name = "constant0"} 100 : i32
    %c0_i32 = arith.constant {handshake.name = "constant1"} 0 : i32
    %c1_i32 = arith.constant {handshake.name = "constant2"} 1 : i32
    %0:4 = scf.while (%arg1 = %c0_i32, %arg2 = %c0_i32) : (i32, i32) -> (i32, i32, i32, i32) {
      %1 = arith.index_cast %arg2 {handshake.name = "index_cast0"} : i32 to index
      %2 = memref.load %arg0[%1] {handshake.name = "load0"} : memref<1000xi32>
      %3 = arith.addi %arg1, %2 {handshake.name = "addi0"} : i32
      %4 = arith.cmpi slt, %3, %c100_i32 {handshake.name = "cmpi0"} : i32
      scf.condition(%4) {handshake.name = "condition0"} %3, %arg1, %2, %arg2 : i32, i32, i32, i32
    } do {
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32):
      %1 = arith.addi %arg4, %c1_i32 {handshake.name = "addi1"} : i32
      %2 = arith.addi %arg2, %arg3 {handshake.name = "addi2"} : i32
      scf.yield {handshake.name = "yield0"} %2, %1 : i32, i32
    } attributes {handshake.name = "while0"}
    return {handshake.name = "return0"} %0#0 : i32
  }
}

