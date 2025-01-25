module {
  handshake.func @example1(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: !handshake.control<>, %arg3: !handshake.control<>, %arg4: !handshake.control<>, ...) -> (!handshake.control<>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "b", "a_start", "b_start", "start"], resNames = ["a_end", "b_end", "end"]} {
    %memEnd = mem_controller[%arg1 : memref<1000xi32>] %arg3 (%8, %addressResult_7, %dataResult_8) %result_17 {connectedBlocks = [2 : i32], handshake.name = "mem_controller0"} :    (!handshake.channel<i32>, !handshake.channel<i32>, !handshake.channel<i32>) -> ()
    %outputs, %memEnd_0 = mem_controller[%arg0 : memref<1000xi32>] %arg2 (%addressResult) %result_17 {connectedBlocks = [2 : i32], handshake.name = "mem_controller1"} :    (!handshake.channel<i32>) -> !handshake.channel<i32>
    %0 = constant %arg4 {handshake.bb = 0 : ui32, handshake.name = "constant2", value = 0 : i32} : <>, <i32>
    %1 = constant %arg4 {handshake.bb = 0 : ui32, handshake.name = "constant5", value = true} : <>, <i1>
    %2 = br %0 {handshake.bb = 0 : ui32, handshake.name = "br2"} : <i32>
    %3 = br %1 {handshake.bb = 0 : ui32, handshake.name = "br3"} : <i1>
    %4 = br %arg4 {handshake.bb = 0 : ui32, handshake.name = "br4"} : <>
    %5 = mux %index [%2, %trueResult_11] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i32>
    %6 = mux %index [%3, %trueResult_13] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i1>
    %result, %index = control_merge %4, %trueResult_15  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %7 = constant %result {handshake.bb = 1 : ui32, handshake.name = "constant6", value = false} : <>, <i1>
    %trueResult, %falseResult = cond_br %6, %5 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i32>
    %trueResult_1, %falseResult_2 = cond_br %6, %result {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <>
    %trueResult_3, %falseResult_4 = cond_br %6, %7 {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <i1>
    %8 = constant %result_5 {handshake.bb = 2 : ui32, handshake.name = "constant0", value = 1 : i32} : <>, <i32>
    %9 = merge %trueResult {handshake.bb = 2 : ui32, handshake.name = "merge0"} : <i32>
    %result_5, %index_6 = control_merge %trueResult_1  {handshake.bb = 2 : ui32, handshake.name = "control_merge1"} : <>, <i1>
    %10 = source {handshake.bb = 2 : ui32, handshake.name = "source0"} : <>
    %11 = constant %10 {handshake.bb = 2 : ui32, handshake.name = "constant7", value = 2 : i32} : <>, <i32>
    %addressResult, %dataResult = load[%9] %outputs {handshake.bb = 2 : ui32, handshake.name = "load0"} : <i32>, <i32>
    %addressResult_7, %dataResult_8 = store[%9] %dataResult {handshake.bb = 2 : ui32, handshake.name = "store0"} : <i32>, <i32>
    %12 = cmpi sge, %dataResult, %11 {handshake.bb = 2 : ui32, handshake.name = "cmpi0"} : <i32>
    %13 = br %12 {handshake.bb = 2 : ui32, handshake.name = "br5"} : <i1>
    %14 = br %9 {handshake.bb = 2 : ui32, handshake.name = "br6"} : <i32>
    %15 = br %result_5 {handshake.bb = 2 : ui32, handshake.name = "br7"} : <>
    %16 = mux %index_10 [%falseResult_4, %13] {handshake.bb = 3 : ui32, handshake.name = "mux2"} : <i1>, <i1>
    %17 = mux %index_10 [%falseResult, %14] {handshake.bb = 3 : ui32, handshake.name = "mux3"} : <i1>, <i32>
    %result_9, %index_10 = control_merge %falseResult_2, %15  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    %18 = source {handshake.bb = 3 : ui32, handshake.name = "source1"} : <>
    %19 = constant %18 {handshake.bb = 3 : ui32, handshake.name = "constant8", value = 1000 : i32} : <>, <i32>
    %20 = source {handshake.bb = 3 : ui32, handshake.name = "source2"} : <>
    %21 = constant %20 {handshake.bb = 3 : ui32, handshake.name = "constant9", value = 1 : i32} : <>, <i32>
    %22 = addi %17, %21 {handshake.bb = 3 : ui32, handshake.name = "addi0"} : <i32>
    %23 = cmpi ult, %22, %19 {handshake.bb = 3 : ui32, handshake.name = "cmpi1"} : <i32>
    %trueResult_11, %falseResult_12 = cond_br %23, %22 {handshake.bb = 3 : ui32, handshake.name = "cond_br5"} : <i1>, <i32>
    %trueResult_13, %falseResult_14 = cond_br %23, %16 {handshake.bb = 3 : ui32, handshake.name = "cond_br6"} : <i1>, <i1>
    %trueResult_15, %falseResult_16 = cond_br %23, %result_9 {handshake.bb = 3 : ui32, handshake.name = "cond_br7"} : <i1>, <>
    %result_17, %index_18 = control_merge %falseResult_16  {handshake.bb = 4 : ui32, handshake.name = "control_merge3"} : <>, <i1>
    end {handshake.bb = 4 : ui32, handshake.name = "end0"} %memEnd_0, %memEnd, %arg4 : <>, <>, <>
  }
}

