module {
  func.func @example1(%arg0: memref<1000xi32> {handshake.arg_name = "a"}, %arg1: memref<1000xi32> {handshake.arg_name = "b"}) {
    %true = arith.constant {handshake.name = "constant0"} true
    %false = arith.constant {handshake.name = "constant1"} false
    %c2_i32 = arith.constant {handshake.name = "constant2"} 2 : i32
    %0 = affine.for %arg2 = 0 to 1000 iter_args(%arg3 = %true) -> (i1) {
      %1 = scf.if %arg3 -> (i1) {
        %2 = affine.load %arg0[%arg2] {handshake.name = "load0"} : memref<1000xi32>
        affine.store %2, %arg1[%arg2] {handshake.name = "store0"} : memref<1000xi32>
        %3 = arith.cmpi sge, %2, %c2_i32 {handshake.name = "cmpi0"} : i32
        scf.yield {handshake.name = "yield0"} %3 : i1
      } else {
        scf.yield {handshake.name = "yield1"} %false : i1
      } {handshake.name = "if0"}
      affine.yield {handshake.name = "yield2"} %1 : i1
    } {handshake.name = "for0"}
    return {handshake.name = "return0"}
  }
}

