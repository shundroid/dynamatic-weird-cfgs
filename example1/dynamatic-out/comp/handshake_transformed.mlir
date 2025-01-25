module {
  handshake.func @example1(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: !handshake.control<>, %arg3: !handshake.control<>, %arg4: !handshake.control<>, ...) -> (!handshake.control<>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "b", "a_start", "b_start", "start"], resNames = ["a_end", "b_end", "end"]} {
    %0:4 = fork [4] %arg4 {handshake.bb = 0 : ui32, handshake.name = "fork0"} : <>
    %memEnd = mem_controller[%arg1 : memref<1000xi32>] %arg3 (%19, %addressResult_7, %dataResult_8) %43#1 {connectedBlocks = [2 : i32], handshake.name = "mem_controller2"} :    (!handshake.channel<i32>, !handshake.channel<i10>, !handshake.channel<i32>) -> ()
    %outputs, %memEnd_0 = mem_controller[%arg0 : memref<1000xi32>] %arg2 (%addressResult) %43#0 {connectedBlocks = [2 : i32], handshake.name = "mem_controller3"} :    (!handshake.channel<i10>) -> !handshake.channel<i32>
    %1 = constant %0#0 {handshake.bb = 0 : ui32, handshake.name = "constant3", value = false} : <>, <i1>
    %2 = constant %0#3 {handshake.bb = 0 : ui32, handshake.name = "constant5", value = true} : <>, <i1>
    %3 = br %1 {handshake.bb = 0 : ui32, handshake.name = "br2"} : <i1>
    %4 = extsi %3 {handshake.bb = 0 : ui32, handshake.name = "extsi5"} : <i1> to <i11>
    %5 = br %2 {handshake.bb = 0 : ui32, handshake.name = "br3"} : <i1>
    %6 = br %0#2 {handshake.bb = 0 : ui32, handshake.name = "br4"} : <>
    %7 = mux %10#0 [%4, %trueResult_11] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i11>
    %8 = mux %10#1 [%5, %trueResult_13] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i1>
    %9:3 = fork [3] %8 {handshake.bb = 1 : ui32, handshake.name = "fork1"} : <i1>
    %result, %index = control_merge %6, %trueResult_15  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %10:2 = fork [2] %index {handshake.bb = 1 : ui32, handshake.name = "fork2"} : <i1>
    %11:2 = fork [2] %result {handshake.bb = 1 : ui32, handshake.name = "fork3"} : <>
    %12 = constant %11#1 {handshake.bb = 1 : ui32, handshake.name = "constant6", value = false} : <>, <i1>
    %trueResult, %falseResult = cond_br %9#0, %7 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i11>
    %trueResult_1, %falseResult_2 = cond_br %9#2, %11#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <>
    %trueResult_3, %falseResult_4 = cond_br %9#1, %12 {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <i1>
    sink %trueResult_3 {handshake.name = "sink0"} : <i1>
    %13 = merge %trueResult {handshake.bb = 2 : ui32, handshake.name = "merge0"} : <i11>
    %14:3 = fork [3] %13 {handshake.bb = 2 : ui32, handshake.name = "fork4"} : <i11>
    %15 = trunci %14#0 {handshake.bb = 2 : ui32, handshake.name = "trunci0"} : <i11> to <i10>
    %16 = trunci %14#1 {handshake.bb = 2 : ui32, handshake.name = "trunci1"} : <i11> to <i10>
    %result_5, %index_6 = control_merge %trueResult_1  {handshake.bb = 2 : ui32, handshake.name = "control_merge1"} : <>, <i1>
    sink %index_6 {handshake.name = "sink1"} : <i1>
    %17:2 = fork [2] %result_5 {handshake.bb = 2 : ui32, handshake.name = "fork5"} : <>
    %18 = constant %17#0 {handshake.bb = 2 : ui32, handshake.name = "constant4", value = 1 : i2} : <>, <i2>
    %19 = extsi %18 {handshake.bb = 2 : ui32, handshake.name = "extsi1"} : <i2> to <i32>
    %20 = source {handshake.bb = 2 : ui32, handshake.name = "source0"} : <>
    %21 = constant %20 {handshake.bb = 2 : ui32, handshake.name = "constant10", value = 2 : i3} : <>, <i3>
    %22 = extsi %21 {handshake.bb = 2 : ui32, handshake.name = "extsi2"} : <i3> to <i32>
    %addressResult, %dataResult = load[%16] %outputs {handshake.bb = 2 : ui32, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "load0"} : <i10>, <i32>
    %23:2 = fork [2] %dataResult {handshake.bb = 2 : ui32, handshake.name = "fork6"} : <i32>
    %addressResult_7, %dataResult_8 = store[%15] %23#0 {handshake.bb = 2 : ui32, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "store0"} : <i10>, <i32>
    %24 = cmpi sge, %23#1, %22 {handshake.bb = 2 : ui32, handshake.name = "cmpi0"} : <i32>
    %25 = br %24 {handshake.bb = 2 : ui32, handshake.name = "br5"} : <i1>
    %26 = br %14#2 {handshake.bb = 2 : ui32, handshake.name = "br6"} : <i11>
    %27 = br %17#1 {handshake.bb = 2 : ui32, handshake.name = "br7"} : <>
    %28 = mux %31#1 [%falseResult_4, %25] {handshake.bb = 3 : ui32, handshake.name = "mux2"} : <i1>, <i1>
    %29 = mux %31#0 [%falseResult, %26] {handshake.bb = 3 : ui32, handshake.name = "mux3"} : <i1>, <i11>
    %30 = extsi %29 {handshake.bb = 3 : ui32, handshake.name = "extsi6"} : <i11> to <i12>
    %result_9, %index_10 = control_merge %falseResult_2, %27  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    %31:2 = fork [2] %index_10 {handshake.bb = 3 : ui32, handshake.name = "fork7"} : <i1>
    %32 = source {handshake.bb = 3 : ui32, handshake.name = "source1"} : <>
    %33 = constant %32 {handshake.bb = 3 : ui32, handshake.name = "constant11", value = 1000 : i11} : <>, <i11>
    %34 = extsi %33 {handshake.bb = 3 : ui32, handshake.name = "extsi7"} : <i11> to <i12>
    %35 = source {handshake.bb = 3 : ui32, handshake.name = "source2"} : <>
    %36 = constant %35 {handshake.bb = 3 : ui32, handshake.name = "constant12", value = 1 : i2} : <>, <i2>
    %37 = extsi %36 {handshake.bb = 3 : ui32, handshake.name = "extsi8"} : <i2> to <i12>
    %38 = addi %30, %37 {handshake.bb = 3 : ui32, handshake.name = "addi0"} : <i12>
    %39:2 = fork [2] %38 {handshake.bb = 3 : ui32, handshake.name = "fork8"} : <i12>
    %40 = trunci %39#0 {handshake.bb = 3 : ui32, handshake.name = "trunci2"} : <i12> to <i11>
    %41 = cmpi ult, %39#1, %34 {handshake.bb = 3 : ui32, handshake.name = "cmpi1"} : <i12>
    %42:3 = fork [3] %41 {handshake.bb = 3 : ui32, handshake.name = "fork9"} : <i1>
    %trueResult_11, %falseResult_12 = cond_br %42#0, %40 {handshake.bb = 3 : ui32, handshake.name = "cond_br5"} : <i1>, <i11>
    sink %falseResult_12 {handshake.name = "sink2"} : <i11>
    %trueResult_13, %falseResult_14 = cond_br %42#1, %28 {handshake.bb = 3 : ui32, handshake.name = "cond_br6"} : <i1>, <i1>
    sink %falseResult_14 {handshake.name = "sink3"} : <i1>
    %trueResult_15, %falseResult_16 = cond_br %42#2, %result_9 {handshake.bb = 3 : ui32, handshake.name = "cond_br7"} : <i1>, <>
    %result_17, %index_18 = control_merge %falseResult_16  {handshake.bb = 4 : ui32, handshake.name = "control_merge3"} : <>, <i1>
    sink %index_18 {handshake.name = "sink4"} : <i1>
    %43:2 = fork [2] %result_17 {handshake.bb = 4 : ui32, handshake.name = "fork10"} : <>
    end {handshake.bb = 4 : ui32, handshake.name = "end0"} %memEnd_0, %memEnd, %0#1 : <>, <>, <>
  }
}

