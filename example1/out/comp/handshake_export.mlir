module {
  handshake.func @example1(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: !handshake.control<>, %arg3: !handshake.control<>, %arg4: !handshake.control<>, ...) -> (!handshake.control<>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "b", "a_start", "b_start", "start"], resNames = ["a_end", "b_end", "end"]} {
    %0:4 = fork [4] %arg4 {handshake.bb = 0 : ui32, handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "fork0"} : <>
    %memEnd = mem_controller[%arg1 : memref<1000xi32>] %arg3 (%25, %addressResult_5, %dataResult_6) %54#1 {connectedBlocks = [2 : i32], handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "mem_controller2"} :    (!handshake.channel<i32>, !handshake.channel<i10>, !handshake.channel<i32>) -> ()
    %outputs, %memEnd_0 = mem_controller[%arg0 : memref<1000xi32>] %arg2 (%addressResult) %54#0 {connectedBlocks = [2 : i32], handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "mem_controller3"} :    (!handshake.channel<i10>) -> !handshake.channel<i32>
    %1 = constant %0#0 {handshake.bb = 0 : ui32, handshake.name = "constant3", value = false} : <>, <i1>
    %2 = constant %0#3 {handshake.bb = 0 : ui32, handshake.name = "constant5", value = true} : <>, <i1>
    %3 = extsi %1 {handshake.bb = 0 : ui32, handshake.name = "extsi5"} : <i1> to <i11>
    %4 = mux %9#0 [%3, %trueResult_9] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i11>
    %5 = mux %9#1 [%2, %trueResult_11] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i1>
    %6 = buffer %5 {handshake.bb = 1 : ui32, handshake.name = "buffer2", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i1>
    %7 = buffer %6 {handshake.bb = 1 : ui32, handshake.name = "buffer3", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i1>
    %8:3 = fork [3] %7 {handshake.bb = 1 : ui32, handshake.name = "fork1"} : <i1>
    %result, %index = control_merge %0#2, %trueResult_13  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %9:2 = fork [2] %index {handshake.bb = 1 : ui32, handshake.name = "fork2"} : <i1>
    %10 = buffer %result {handshake.bb = 1 : ui32, handshake.name = "buffer4", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %11 = buffer %10 {handshake.bb = 1 : ui32, handshake.name = "buffer5", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %12:2 = fork [2] %11 {handshake.bb = 1 : ui32, handshake.name = "fork3"} : <>
    %13 = constant %12#1 {handshake.bb = 1 : ui32, handshake.name = "constant6", value = false} : <>, <i1>
    %14 = buffer %4 {handshake.bb = 1 : ui32, handshake.name = "buffer0", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i11>
    %15 = buffer %14 {handshake.bb = 1 : ui32, handshake.name = "buffer1", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i11>
    %trueResult, %falseResult = cond_br %8#0, %15 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i11>
    %trueResult_1, %falseResult_2 = cond_br %8#2, %12#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <>
    %trueResult_3, %falseResult_4 = cond_br %8#1, %13 {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <i1>
    sink %trueResult_3 {handshake.name = "sink0"} : <i1>
    %16 = buffer %trueResult {handshake.bb = 2 : ui32, handshake.name = "buffer6", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i11>
    %17 = buffer %16 {handshake.bb = 2 : ui32, handshake.name = "buffer7", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i11>
    %18:3 = fork [3] %17 {handshake.bb = 2 : ui32, handshake.name = "fork4"} : <i11>
    %19 = trunci %18#0 {handshake.bb = 2 : ui32, handshake.name = "trunci0"} : <i11> to <i10>
    %20 = trunci %18#1 {handshake.bb = 2 : ui32, handshake.name = "trunci1"} : <i11> to <i10>
    %21 = buffer %trueResult_1 {handshake.bb = 2 : ui32, handshake.name = "buffer8", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %22 = buffer %21 {handshake.bb = 2 : ui32, handshake.name = "buffer9", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %23:2 = fork [2] %22 {handshake.bb = 2 : ui32, handshake.name = "fork5"} : <>
    %24 = constant %23#0 {handshake.bb = 2 : ui32, handshake.name = "constant4", value = 1 : i2} : <>, <i2>
    %25 = extsi %24 {handshake.bb = 2 : ui32, handshake.name = "extsi1"} : <i2> to <i32>
    %26 = source {handshake.bb = 2 : ui32, handshake.name = "source0"} : <>
    %27 = constant %26 {handshake.bb = 2 : ui32, handshake.name = "constant10", value = 2 : i3} : <>, <i3>
    %28 = extsi %27 {handshake.bb = 2 : ui32, handshake.name = "extsi2"} : <i3> to <i32>
    %addressResult, %dataResult = load[%20] %outputs {handshake.bb = 2 : ui32, handshake.bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "load0"} : <i10>, <i32>
    %29:2 = fork [2] %dataResult {handshake.bb = 2 : ui32, handshake.name = "fork6"} : <i32>
    %addressResult_5, %dataResult_6 = store[%19] %29#0 {handshake.bb = 2 : ui32, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "store0"} : <i10>, <i32>
    %30 = cmpi sge, %29#1, %28 {handshake.bb = 2 : ui32, handshake.name = "cmpi0"} : <i32>
    %31 = mux %36#1 [%falseResult_4, %30] {handshake.bb = 3 : ui32, handshake.name = "mux2"} : <i1>, <i1>
    %32 = mux %36#0 [%falseResult, %18#2] {handshake.bb = 3 : ui32, handshake.name = "mux3"} : <i1>, <i11>
    %33 = buffer %32 {handshake.bb = 3 : ui32, handshake.name = "buffer12", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i11>
    %34 = buffer %33 {handshake.bb = 3 : ui32, handshake.name = "buffer13", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i11>
    %35 = extsi %34 {handshake.bb = 3 : ui32, handshake.name = "extsi6"} : <i11> to <i12>
    %result_7, %index_8 = control_merge %falseResult_2, %23#1  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    %36:2 = fork [2] %index_8 {handshake.bb = 3 : ui32, handshake.name = "fork7"} : <i1>
    %37 = source {handshake.bb = 3 : ui32, handshake.name = "source1"} : <>
    %38 = constant %37 {handshake.bb = 3 : ui32, handshake.name = "constant11", value = 1000 : i11} : <>, <i11>
    %39 = extsi %38 {handshake.bb = 3 : ui32, handshake.name = "extsi7"} : <i11> to <i12>
    %40 = source {handshake.bb = 3 : ui32, handshake.name = "source2"} : <>
    %41 = constant %40 {handshake.bb = 3 : ui32, handshake.name = "constant12", value = 1 : i2} : <>, <i2>
    %42 = extsi %41 {handshake.bb = 3 : ui32, handshake.name = "extsi8"} : <i2> to <i12>
    %43 = addi %35, %42 {handshake.bb = 3 : ui32, handshake.name = "addi0"} : <i12>
    %44:2 = fork [2] %43 {handshake.bb = 3 : ui32, handshake.name = "fork8"} : <i12>
    %45 = trunci %44#0 {handshake.bb = 3 : ui32, handshake.name = "trunci2"} : <i12> to <i11>
    %46 = cmpi ult, %44#1, %39 {handshake.bb = 3 : ui32, handshake.name = "cmpi1"} : <i12>
    %47:3 = fork [3] %46 {handshake.bb = 3 : ui32, handshake.name = "fork9"} : <i1>
    %trueResult_9, %falseResult_10 = cond_br %47#0, %45 {handshake.bb = 3 : ui32, handshake.name = "cond_br5"} : <i1>, <i11>
    sink %falseResult_10 {handshake.name = "sink2"} : <i11>
    %48 = buffer %31 {handshake.bb = 3 : ui32, handshake.name = "buffer10", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i1>
    %49 = buffer %48 {handshake.bb = 3 : ui32, handshake.name = "buffer11", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i1>
    %trueResult_11, %falseResult_12 = cond_br %47#1, %49 {handshake.bb = 3 : ui32, handshake.name = "cond_br6"} : <i1>, <i1>
    sink %falseResult_12 {handshake.name = "sink3"} : <i1>
    %50 = buffer %result_7 {handshake.bb = 3 : ui32, handshake.name = "buffer14", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %51 = buffer %50 {handshake.bb = 3 : ui32, handshake.name = "buffer15", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %trueResult_13, %falseResult_14 = cond_br %47#2, %51 {handshake.bb = 3 : ui32, handshake.name = "cond_br7"} : <i1>, <>
    %52 = buffer %falseResult_14 {handshake.bb = 4 : ui32, handshake.name = "buffer16", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %53 = buffer %52 {handshake.bb = 4 : ui32, handshake.name = "buffer17", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %54:2 = fork [2] %53 {handshake.bb = 4 : ui32, handshake.name = "fork10"} : <>
    end {handshake.bb = 4 : ui32, handshake.name = "end0"} %memEnd_0, %memEnd, %0#1 : <>, <>, <>
  }
}

