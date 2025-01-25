module {
  handshake.func @example2(%arg0: memref<1000xi32>, %arg1: !handshake.control<>, %arg2: !handshake.control<>, ...) -> (!handshake.channel<i32>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "a_start", "start"], resNames = ["out0", "a_end", "end"]} {
    %0:3 = fork [3] %arg2 {handshake.bb = 0 : ui32, handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "fork0"} : <>
    %1 = buffer %falseResult_5 {handshake.name = "buffer16", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %2 = buffer %1 {handshake.name = "buffer17", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %outputs, %memEnd = mem_controller[%arg0 : memref<1000xi32>] %arg1 (%addressResult) %2 {connectedBlocks = [1 : i32], handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "mem_controller1"} :    (!handshake.channel<i10>) -> !handshake.channel<i32>
    %3 = constant %0#0 {handshake.bb = 0 : ui32, handshake.name = "constant0", value = false} : <>, <i1>
    %4 = extsi %3 {handshake.bb = 0 : ui32, handshake.name = "extsi3"} : <i1> to <i32>
    %5:2 = fork [2] %4 {handshake.bb = 0 : ui32, handshake.name = "fork1"} : <i32>
    %6 = mux %15#0 [%5#0, %36] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i32>
    %7 = buffer %6 {handshake.bb = 1 : ui32, handshake.name = "buffer0", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %8 = buffer %7 {handshake.bb = 1 : ui32, handshake.name = "buffer1", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %9:2 = fork [2] %8 {handshake.bb = 1 : ui32, handshake.name = "fork2"} : <i32>
    %10 = mux %15#1 [%5#1, %31] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i32>
    %11 = buffer %10 {handshake.bb = 1 : ui32, handshake.name = "buffer2", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %12 = buffer %11 {handshake.bb = 1 : ui32, handshake.name = "buffer3", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %13:2 = fork [2] %12 {handshake.bb = 1 : ui32, handshake.name = "fork3"} : <i32>
    %14 = trunci %13#0 {handshake.bb = 1 : ui32, handshake.name = "trunci0"} : <i32> to <i10>
    %result, %index = control_merge %0#2, %38  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %15:2 = fork [2] %index {handshake.bb = 1 : ui32, handshake.name = "fork4"} : <i1>
    %16 = source {handshake.bb = 1 : ui32, handshake.name = "source0"} : <>
    %17 = constant %16 {handshake.bb = 1 : ui32, handshake.name = "constant2", value = 100 : i8} : <>, <i8>
    %18 = extsi %17 {handshake.bb = 1 : ui32, handshake.name = "extsi1"} : <i8> to <i32>
    %addressResult, %dataResult = load[%14] %outputs {handshake.bb = 1 : ui32, handshake.bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "load1"} : <i10>, <i32>
    %19:2 = fork [2] %dataResult {handshake.bb = 1 : ui32, handshake.name = "fork5"} : <i32>
    %20 = addi %9#1, %19#0 {handshake.bb = 1 : ui32, handshake.name = "addi0"} : <i32>
    %21:2 = fork [2] %20 {handshake.bb = 1 : ui32, handshake.name = "fork6"} : <i32>
    %22 = cmpi slt, %21#1, %18 {handshake.bb = 1 : ui32, handshake.name = "cmpi0"} : <i32>
    %23:5 = fork [5] %22 {handshake.bb = 1 : ui32, handshake.name = "fork7"} : <i1>
    %trueResult, %falseResult = cond_br %23#4, %9#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br1"} : <i1>, <i32>
    sink %falseResult {handshake.name = "sink0"} : <i32>
    %trueResult_0, %falseResult_1 = cond_br %23#3, %19#1 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i32>
    sink %falseResult_1 {handshake.name = "sink1"} : <i32>
    %trueResult_2, %falseResult_3 = cond_br %23#2, %13#1 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <i32>
    sink %falseResult_3 {handshake.name = "sink2"} : <i32>
    %24 = buffer %result {handshake.bb = 1 : ui32, handshake.name = "buffer4", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %25 = buffer %24 {handshake.bb = 1 : ui32, handshake.name = "buffer5", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %trueResult_4, %falseResult_5 = cond_br %23#1, %25 {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <>
    %trueResult_6, %falseResult_7 = cond_br %23#0, %21#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br5"} : <i1>, <i32>
    sink %trueResult_6 {handshake.name = "sink3"} : <i32>
    %26 = source {handshake.bb = 2 : ui32, handshake.name = "source1"} : <>
    %27 = constant %26 {handshake.bb = 2 : ui32, handshake.name = "constant5", value = 1 : i2} : <>, <i2>
    %28 = extsi %27 {handshake.bb = 2 : ui32, handshake.name = "extsi2"} : <i2> to <i32>
    %29 = buffer %trueResult_2 {handshake.bb = 2 : ui32, handshake.name = "buffer10", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %30 = buffer %29 {handshake.bb = 2 : ui32, handshake.name = "buffer11", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %31 = addi %30, %28 {handshake.bb = 2 : ui32, handshake.name = "addi1"} : <i32>
    %32 = buffer %trueResult {handshake.bb = 2 : ui32, handshake.name = "buffer6", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %33 = buffer %32 {handshake.bb = 2 : ui32, handshake.name = "buffer7", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %34 = buffer %trueResult_0 {handshake.bb = 2 : ui32, handshake.name = "buffer8", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %35 = buffer %34 {handshake.bb = 2 : ui32, handshake.name = "buffer9", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %36 = addi %33, %35 {handshake.bb = 2 : ui32, handshake.name = "addi2"} : <i32>
    %37 = buffer %trueResult_4 {handshake.bb = 2 : ui32, handshake.name = "buffer12", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %38 = buffer %37 {handshake.bb = 2 : ui32, handshake.name = "buffer13", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %39 = buffer %falseResult_7 {handshake.bb = 3 : ui32, handshake.name = "buffer14", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %40 = buffer %39 {handshake.bb = 3 : ui32, handshake.name = "buffer15", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    end {handshake.bb = 3 : ui32, handshake.name = "end0"} %40, %memEnd, %0#1 : <i32>, <>, <>
  }
}

