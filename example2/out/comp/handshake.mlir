module {
  handshake.func @example2(%arg0: memref<1000xi32>, %arg1: !handshake.control<>, %arg2: !handshake.control<>, ...) -> (!handshake.channel<i32>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "a_start", "start"], resNames = ["out0", "a_end", "end"]} {
    %outputs, %memEnd = mem_controller[%arg0 : memref<1000xi32>] %arg1 (%addressResult) %result_10 {connectedBlocks = [1 : i32], handshake.name = "mem_controller0"} :    (!handshake.channel<i32>) -> !handshake.channel<i32>
    %0 = constant %arg2 {handshake.bb = 0 : ui32, handshake.name = "constant1", value = 0 : i32} : <>, <i32>
    %1 = br %0 {handshake.bb = 0 : ui32, handshake.name = "br2"} : <i32>
    %2 = br %arg2 {handshake.bb = 0 : ui32, handshake.name = "br3"} : <>
    %3 = mux %index [%1, %17] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i32>
    %4 = mux %index [%1, %18] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i32>
    %result, %index = control_merge %2, %19  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %5 = source {handshake.bb = 1 : ui32, handshake.name = "source0"} : <>
    %6 = constant %5 {handshake.bb = 1 : ui32, handshake.name = "constant3", value = 100 : i32} : <>, <i32>
    %7 = trunci %4 {handshake.bb = 1 : ui32, handshake.name = "index_cast0"} : <i32> to <i32>
    %addressResult, %dataResult = load[%7] %outputs {handshake.bb = 1 : ui32, handshake.name = "load1"} : <i32>, <i32>
    %8 = addi %3, %dataResult {handshake.bb = 1 : ui32, handshake.name = "addi0"} : <i32>
    %9 = cmpi slt, %8, %6 {handshake.bb = 1 : ui32, handshake.name = "cmpi0"} : <i32>
    %trueResult, %falseResult = cond_br %9, %3 {handshake.bb = 1 : ui32, handshake.name = "cond_br1"} : <i1>, <i32>
    %trueResult_0, %falseResult_1 = cond_br %9, %dataResult {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i32>
    %trueResult_2, %falseResult_3 = cond_br %9, %4 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <i32>
    %trueResult_4, %falseResult_5 = cond_br %9, %result {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <>
    %trueResult_6, %falseResult_7 = cond_br %9, %8 {handshake.bb = 1 : ui32, handshake.name = "cond_br5"} : <i1>, <i32>
    %10 = merge %trueResult {handshake.bb = 2 : ui32, handshake.name = "merge0"} : <i32>
    %11 = merge %trueResult_0 {handshake.bb = 2 : ui32, handshake.name = "merge1"} : <i32>
    %12 = merge %trueResult_2 {handshake.bb = 2 : ui32, handshake.name = "merge2"} : <i32>
    %result_8, %index_9 = control_merge %trueResult_4  {handshake.bb = 2 : ui32, handshake.name = "control_merge1"} : <>, <i1>
    %13 = source {handshake.bb = 2 : ui32, handshake.name = "source1"} : <>
    %14 = constant %13 {handshake.bb = 2 : ui32, handshake.name = "constant4", value = 1 : i32} : <>, <i32>
    %15 = addi %12, %14 {handshake.bb = 2 : ui32, handshake.name = "addi1"} : <i32>
    %16 = addi %10, %11 {handshake.bb = 2 : ui32, handshake.name = "addi2"} : <i32>
    %17 = br %16 {handshake.bb = 2 : ui32, handshake.name = "br4"} : <i32>
    %18 = br %15 {handshake.bb = 2 : ui32, handshake.name = "br5"} : <i32>
    %19 = br %result_8 {handshake.bb = 2 : ui32, handshake.name = "br6"} : <>
    %20 = merge %falseResult_7 {handshake.bb = 3 : ui32, handshake.name = "merge3"} : <i32>
    %result_10, %index_11 = control_merge %falseResult_5  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    end {handshake.bb = 3 : ui32, handshake.name = "end0"} %20, %memEnd, %arg2 : <i32>, <>, <>
  }
}

