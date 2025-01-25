module {
  handshake.func @example2(%arg0: memref<1000xi32>, %arg1: !handshake.control<>, %arg2: !handshake.control<>, ...) -> (!handshake.channel<i32>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "a_start", "start"], resNames = ["out0", "a_end", "end"]} {
    %0:3 = fork [3] %arg2 {handshake.bb = 0 : ui32, handshake.name = "fork0"} : <>
    %outputs, %memEnd = mem_controller[%arg0 : memref<1000xi32>] %arg1 (%addressResult) %result_10 {connectedBlocks = [1 : i32], handshake.name = "mem_controller1"} :    (!handshake.channel<i10>) -> !handshake.channel<i32>
    %1 = constant %0#0 {handshake.bb = 0 : ui32, handshake.name = "constant0", value = false} : <>, <i1>
    %2 = br %1 {handshake.bb = 0 : ui32, handshake.name = "br2"} : <i1>
    %3 = extsi %2 {handshake.bb = 0 : ui32, handshake.name = "extsi3"} : <i1> to <i32>
    %4:2 = fork [2] %3 {handshake.bb = 0 : ui32, handshake.name = "fork1"} : <i32>
    %5 = br %0#2 {handshake.bb = 0 : ui32, handshake.name = "br3"} : <>
    %6 = mux %11#0 [%4#0, %28] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i32>
    %7:2 = fork [2] %6 {handshake.bb = 1 : ui32, handshake.name = "fork2"} : <i32>
    %8 = mux %11#1 [%4#1, %29] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i32>
    %9:2 = fork [2] %8 {handshake.bb = 1 : ui32, handshake.name = "fork3"} : <i32>
    %10 = trunci %9#0 {handshake.bb = 1 : ui32, handshake.name = "trunci0"} : <i32> to <i10>
    %result, %index = control_merge %5, %30  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %11:2 = fork [2] %index {handshake.bb = 1 : ui32, handshake.name = "fork4"} : <i1>
    %12 = source {handshake.bb = 1 : ui32, handshake.name = "source0"} : <>
    %13 = constant %12 {handshake.bb = 1 : ui32, handshake.name = "constant2", value = 100 : i8} : <>, <i8>
    %14 = extsi %13 {handshake.bb = 1 : ui32, handshake.name = "extsi1"} : <i8> to <i32>
    %addressResult, %dataResult = load[%10] %outputs {handshake.bb = 1 : ui32, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "load1"} : <i10>, <i32>
    %15:2 = fork [2] %dataResult {handshake.bb = 1 : ui32, handshake.name = "fork5"} : <i32>
    %16 = addi %7#1, %15#0 {handshake.bb = 1 : ui32, handshake.name = "addi0"} : <i32>
    %17:2 = fork [2] %16 {handshake.bb = 1 : ui32, handshake.name = "fork6"} : <i32>
    %18 = cmpi slt, %17#1, %14 {handshake.bb = 1 : ui32, handshake.name = "cmpi0"} : <i32>
    %19:5 = fork [5] %18 {handshake.bb = 1 : ui32, handshake.name = "fork7"} : <i1>
    %trueResult, %falseResult = cond_br %19#4, %7#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br1"} : <i1>, <i32>
    sink %falseResult {handshake.name = "sink0"} : <i32>
    %trueResult_0, %falseResult_1 = cond_br %19#3, %15#1 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i32>
    sink %falseResult_1 {handshake.name = "sink1"} : <i32>
    %trueResult_2, %falseResult_3 = cond_br %19#2, %9#1 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <i32>
    sink %falseResult_3 {handshake.name = "sink2"} : <i32>
    %trueResult_4, %falseResult_5 = cond_br %19#1, %result {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <>
    %trueResult_6, %falseResult_7 = cond_br %19#0, %17#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br5"} : <i1>, <i32>
    sink %trueResult_6 {handshake.name = "sink3"} : <i32>
    %20 = merge %trueResult {handshake.bb = 2 : ui32, handshake.name = "merge0"} : <i32>
    %21 = merge %trueResult_0 {handshake.bb = 2 : ui32, handshake.name = "merge1"} : <i32>
    %22 = merge %trueResult_2 {handshake.bb = 2 : ui32, handshake.name = "merge2"} : <i32>
    %result_8, %index_9 = control_merge %trueResult_4  {handshake.bb = 2 : ui32, handshake.name = "control_merge1"} : <>, <i1>
    sink %index_9 {handshake.name = "sink4"} : <i1>
    %23 = source {handshake.bb = 2 : ui32, handshake.name = "source1"} : <>
    %24 = constant %23 {handshake.bb = 2 : ui32, handshake.name = "constant5", value = 1 : i2} : <>, <i2>
    %25 = extsi %24 {handshake.bb = 2 : ui32, handshake.name = "extsi2"} : <i2> to <i32>
    %26 = addi %22, %25 {handshake.bb = 2 : ui32, handshake.name = "addi1"} : <i32>
    %27 = addi %20, %21 {handshake.bb = 2 : ui32, handshake.name = "addi2"} : <i32>
    %28 = br %27 {handshake.bb = 2 : ui32, handshake.name = "br4"} : <i32>
    %29 = br %26 {handshake.bb = 2 : ui32, handshake.name = "br5"} : <i32>
    %30 = br %result_8 {handshake.bb = 2 : ui32, handshake.name = "br6"} : <>
    %31 = merge %falseResult_7 {handshake.bb = 3 : ui32, handshake.name = "merge3"} : <i32>
    %result_10, %index_11 = control_merge %falseResult_5  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    sink %index_11 {handshake.name = "sink5"} : <i1>
    end {handshake.bb = 3 : ui32, handshake.name = "end0"} %31, %memEnd, %0#1 : <i32>, <>, <>
  }
}

