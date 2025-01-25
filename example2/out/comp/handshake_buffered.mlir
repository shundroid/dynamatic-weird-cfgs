module {
  handshake.func @example2(%arg0: memref<1000xi32>, %arg1: !handshake.control<>, %arg2: !handshake.control<>, ...) -> (!handshake.channel<i32>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "a_start", "start"], resNames = ["out0", "a_end", "end"]} {
    %0:3 = fork [3] %arg2 {handshake.bb = 0 : ui32, handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "fork0"} : <>
    %1 = buffer %result_10 {handshake.name = "buffer16", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %2 = buffer %1 {handshake.name = "buffer17", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %outputs, %memEnd = mem_controller[%arg0 : memref<1000xi32>] %arg1 (%addressResult) %2 {connectedBlocks = [1 : i32], handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "mem_controller1"} :    (!handshake.channel<i10>) -> !handshake.channel<i32>
    %3 = constant %0#0 {handshake.bb = 0 : ui32, handshake.name = "constant0", value = false} : <>, <i1>
    %4 = br %3 {handshake.bb = 0 : ui32, handshake.name = "br2"} : <i1>
    %5 = extsi %4 {handshake.bb = 0 : ui32, handshake.name = "extsi3"} : <i1> to <i32>
    %6:2 = fork [2] %5 {handshake.bb = 0 : ui32, handshake.name = "fork1"} : <i32>
    %7 = br %0#2 {handshake.bb = 0 : ui32, handshake.name = "br3"} : <>
    %8 = mux %17#0 [%6#0, %42] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i32>
    %9 = buffer %8 {handshake.bb = 1 : ui32, handshake.name = "buffer0", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %10 = buffer %9 {handshake.bb = 1 : ui32, handshake.name = "buffer1", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %11:2 = fork [2] %10 {handshake.bb = 1 : ui32, handshake.name = "fork2"} : <i32>
    %12 = mux %17#1 [%6#1, %43] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i32>
    %13 = buffer %12 {handshake.bb = 1 : ui32, handshake.name = "buffer2", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %14 = buffer %13 {handshake.bb = 1 : ui32, handshake.name = "buffer3", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %15:2 = fork [2] %14 {handshake.bb = 1 : ui32, handshake.name = "fork3"} : <i32>
    %16 = trunci %15#0 {handshake.bb = 1 : ui32, handshake.name = "trunci0"} : <i32> to <i10>
    %result, %index = control_merge %7, %46  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %17:2 = fork [2] %index {handshake.bb = 1 : ui32, handshake.name = "fork4"} : <i1>
    %18 = source {handshake.bb = 1 : ui32, handshake.name = "source0"} : <>
    %19 = constant %18 {handshake.bb = 1 : ui32, handshake.name = "constant2", value = 100 : i8} : <>, <i8>
    %20 = extsi %19 {handshake.bb = 1 : ui32, handshake.name = "extsi1"} : <i8> to <i32>
    %addressResult, %dataResult = load[%16] %outputs {handshake.bb = 1 : ui32, handshake.bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "load1"} : <i10>, <i32>
    %21:2 = fork [2] %dataResult {handshake.bb = 1 : ui32, handshake.name = "fork5"} : <i32>
    %22 = addi %11#1, %21#0 {handshake.bb = 1 : ui32, handshake.name = "addi0"} : <i32>
    %23:2 = fork [2] %22 {handshake.bb = 1 : ui32, handshake.name = "fork6"} : <i32>
    %24 = cmpi slt, %23#1, %20 {handshake.bb = 1 : ui32, handshake.name = "cmpi0"} : <i32>
    %25:5 = fork [5] %24 {handshake.bb = 1 : ui32, handshake.name = "fork7"} : <i1>
    %trueResult, %falseResult = cond_br %25#4, %11#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br1"} : <i1>, <i32>
    sink %falseResult {handshake.name = "sink0"} : <i32>
    %trueResult_0, %falseResult_1 = cond_br %25#3, %21#1 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i32>
    sink %falseResult_1 {handshake.name = "sink1"} : <i32>
    %trueResult_2, %falseResult_3 = cond_br %25#2, %15#1 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <i32>
    sink %falseResult_3 {handshake.name = "sink2"} : <i32>
    %26 = buffer %result {handshake.bb = 1 : ui32, handshake.name = "buffer4", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %27 = buffer %26 {handshake.bb = 1 : ui32, handshake.name = "buffer5", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %trueResult_4, %falseResult_5 = cond_br %25#1, %27 {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <>
    %trueResult_6, %falseResult_7 = cond_br %25#0, %23#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br5"} : <i1>, <i32>
    sink %trueResult_6 {handshake.name = "sink3"} : <i32>
    %28 = merge %trueResult {handshake.bb = 2 : ui32, handshake.name = "merge0"} : <i32>
    %29 = merge %trueResult_0 {handshake.bb = 2 : ui32, handshake.name = "merge1"} : <i32>
    %30 = merge %trueResult_2 {handshake.bb = 2 : ui32, handshake.name = "merge2"} : <i32>
    %result_8, %index_9 = control_merge %trueResult_4  {handshake.bb = 2 : ui32, handshake.name = "control_merge1"} : <>, <i1>
    sink %index_9 {handshake.name = "sink4"} : <i1>
    %31 = source {handshake.bb = 2 : ui32, handshake.name = "source1"} : <>
    %32 = constant %31 {handshake.bb = 2 : ui32, handshake.name = "constant5", value = 1 : i2} : <>, <i2>
    %33 = extsi %32 {handshake.bb = 2 : ui32, handshake.name = "extsi2"} : <i2> to <i32>
    %34 = buffer %30 {handshake.bb = 2 : ui32, handshake.name = "buffer10", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %35 = buffer %34 {handshake.bb = 2 : ui32, handshake.name = "buffer11", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %36 = addi %35, %33 {handshake.bb = 2 : ui32, handshake.name = "addi1"} : <i32>
    %37 = buffer %28 {handshake.bb = 2 : ui32, handshake.name = "buffer6", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %38 = buffer %37 {handshake.bb = 2 : ui32, handshake.name = "buffer7", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %39 = buffer %29 {handshake.bb = 2 : ui32, handshake.name = "buffer8", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %40 = buffer %39 {handshake.bb = 2 : ui32, handshake.name = "buffer9", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    %41 = addi %38, %40 {handshake.bb = 2 : ui32, handshake.name = "addi2"} : <i32>
    %42 = br %41 {handshake.bb = 2 : ui32, handshake.name = "br4"} : <i32>
    %43 = br %36 {handshake.bb = 2 : ui32, handshake.name = "br5"} : <i32>
    %44 = buffer %result_8 {handshake.bb = 2 : ui32, handshake.name = "buffer12", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %45 = buffer %44 {handshake.bb = 2 : ui32, handshake.name = "buffer13", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %46 = br %45 {handshake.bb = 2 : ui32, handshake.name = "br6"} : <>
    %47 = merge %falseResult_7 {handshake.bb = 3 : ui32, handshake.name = "merge3"} : <i32>
    %result_10, %index_11 = control_merge %falseResult_5  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    sink %index_11 {handshake.name = "sink5"} : <i1>
    %48 = buffer %47 {handshake.bb = 3 : ui32, handshake.name = "buffer14", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i32>
    %49 = buffer %48 {handshake.bb = 3 : ui32, handshake.name = "buffer15", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i32>
    end {handshake.bb = 3 : ui32, handshake.name = "end0"} %49, %memEnd, %0#1 : <i32>, <>, <>
  }
}

