module {
  handshake.func @example1(%arg0: memref<1000xi32>, %arg1: memref<1000xi32>, %arg2: !handshake.control<>, %arg3: !handshake.control<>, %arg4: !handshake.control<>, ...) -> (!handshake.control<>, !handshake.control<>, !handshake.control<>) attributes {argNames = ["a", "b", "a_start", "b_start", "start"], resNames = ["a_end", "b_end", "end"]} {
    %0:4 = fork [4] %arg4 {handshake.bb = 0 : ui32, handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "fork0"} : <>
    %memEnd = mem_controller[%arg1 : memref<1000xi32>] %arg3 (%29, %addressResult_7, %dataResult_8) %61#1 {connectedBlocks = [2 : i32], handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "3": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "4": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "mem_controller2"} :    (!handshake.channel<i32>, !handshake.channel<i10>, !handshake.channel<i32>) -> ()
    %outputs, %memEnd_0 = mem_controller[%arg0 : memref<1000xi32>] %arg2 (%addressResult) %61#0 {connectedBlocks = [2 : i32], handshake.bufProps = #handshake<bufProps{"0": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00, "2": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.name = "mem_controller3"} :    (!handshake.channel<i10>) -> !handshake.channel<i32>
    %1 = constant %0#0 {handshake.bb = 0 : ui32, handshake.name = "constant3", value = false} : <>, <i1>
    %2 = constant %0#3 {handshake.bb = 0 : ui32, handshake.name = "constant5", value = true} : <>, <i1>
    %3 = br %1 {handshake.bb = 0 : ui32, handshake.name = "br2"} : <i1>
    %4 = extsi %3 {handshake.bb = 0 : ui32, handshake.name = "extsi5"} : <i1> to <i11>
    %5 = br %2 {handshake.bb = 0 : ui32, handshake.name = "br3"} : <i1>
    %6 = br %0#2 {handshake.bb = 0 : ui32, handshake.name = "br4"} : <>
    %7 = mux %12#0 [%4, %trueResult_11] {handshake.bb = 1 : ui32, handshake.name = "mux0"} : <i1>, <i11>
    %8 = mux %12#1 [%5, %trueResult_13] {handshake.bb = 1 : ui32, handshake.name = "mux1"} : <i1>, <i1>
    %9 = buffer %8 {handshake.bb = 1 : ui32, handshake.name = "buffer2", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i1>
    %10 = buffer %9 {handshake.bb = 1 : ui32, handshake.name = "buffer3", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i1>
    %11:3 = fork [3] %10 {handshake.bb = 1 : ui32, handshake.name = "fork1"} : <i1>
    %result, %index = control_merge %6, %trueResult_15  {handshake.bb = 1 : ui32, handshake.name = "control_merge0"} : <>, <i1>
    %12:2 = fork [2] %index {handshake.bb = 1 : ui32, handshake.name = "fork2"} : <i1>
    %13 = buffer %result {handshake.bb = 1 : ui32, handshake.name = "buffer4", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %14 = buffer %13 {handshake.bb = 1 : ui32, handshake.name = "buffer5", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %15:2 = fork [2] %14 {handshake.bb = 1 : ui32, handshake.name = "fork3"} : <>
    %16 = constant %15#1 {handshake.bb = 1 : ui32, handshake.name = "constant6", value = false} : <>, <i1>
    %17 = buffer %7 {handshake.bb = 1 : ui32, handshake.name = "buffer0", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i11>
    %18 = buffer %17 {handshake.bb = 1 : ui32, handshake.name = "buffer1", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i11>
    %trueResult, %falseResult = cond_br %11#0, %18 {handshake.bb = 1 : ui32, handshake.name = "cond_br2"} : <i1>, <i11>
    %trueResult_1, %falseResult_2 = cond_br %11#2, %15#0 {handshake.bb = 1 : ui32, handshake.name = "cond_br3"} : <i1>, <>
    %trueResult_3, %falseResult_4 = cond_br %11#1, %16 {handshake.bb = 1 : ui32, handshake.name = "cond_br4"} : <i1>, <i1>
    sink %trueResult_3 {handshake.name = "sink0"} : <i1>
    %19 = merge %trueResult {handshake.bb = 2 : ui32, handshake.name = "merge0"} : <i11>
    %20 = buffer %19 {handshake.bb = 2 : ui32, handshake.name = "buffer6", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i11>
    %21 = buffer %20 {handshake.bb = 2 : ui32, handshake.name = "buffer7", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i11>
    %22:3 = fork [3] %21 {handshake.bb = 2 : ui32, handshake.name = "fork4"} : <i11>
    %23 = trunci %22#0 {handshake.bb = 2 : ui32, handshake.name = "trunci0"} : <i11> to <i10>
    %24 = trunci %22#1 {handshake.bb = 2 : ui32, handshake.name = "trunci1"} : <i11> to <i10>
    %result_5, %index_6 = control_merge %trueResult_1  {handshake.bb = 2 : ui32, handshake.name = "control_merge1"} : <>, <i1>
    sink %index_6 {handshake.name = "sink1"} : <i1>
    %25 = buffer %result_5 {handshake.bb = 2 : ui32, handshake.name = "buffer8", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %26 = buffer %25 {handshake.bb = 2 : ui32, handshake.name = "buffer9", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %27:2 = fork [2] %26 {handshake.bb = 2 : ui32, handshake.name = "fork5"} : <>
    %28 = constant %27#0 {handshake.bb = 2 : ui32, handshake.name = "constant4", value = 1 : i2} : <>, <i2>
    %29 = extsi %28 {handshake.bb = 2 : ui32, handshake.name = "extsi1"} : <i2> to <i32>
    %30 = source {handshake.bb = 2 : ui32, handshake.name = "source0"} : <>
    %31 = constant %30 {handshake.bb = 2 : ui32, handshake.name = "constant10", value = 2 : i3} : <>, <i3>
    %32 = extsi %31 {handshake.bb = 2 : ui32, handshake.name = "extsi2"} : <i3> to <i32>
    %addressResult, %dataResult = load[%24] %outputs {handshake.bb = 2 : ui32, handshake.bufProps = #handshake<bufProps{"1": [0,0], [0,0], 0.000000e+00, 0.000000e+00, 0.000000e+00}>, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "load0"} : <i10>, <i32>
    %33:2 = fork [2] %dataResult {handshake.bb = 2 : ui32, handshake.name = "fork6"} : <i32>
    %addressResult_7, %dataResult_8 = store[%23] %33#0 {handshake.bb = 2 : ui32, handshake.mem_interface = #handshake.mem_interface<MC>, handshake.name = "store0"} : <i10>, <i32>
    %34 = cmpi sge, %33#1, %32 {handshake.bb = 2 : ui32, handshake.name = "cmpi0"} : <i32>
    %35 = br %34 {handshake.bb = 2 : ui32, handshake.name = "br5"} : <i1>
    %36 = br %22#2 {handshake.bb = 2 : ui32, handshake.name = "br6"} : <i11>
    %37 = br %27#1 {handshake.bb = 2 : ui32, handshake.name = "br7"} : <>
    %38 = mux %43#1 [%falseResult_4, %35] {handshake.bb = 3 : ui32, handshake.name = "mux2"} : <i1>, <i1>
    %39 = mux %43#0 [%falseResult, %36] {handshake.bb = 3 : ui32, handshake.name = "mux3"} : <i1>, <i11>
    %40 = buffer %39 {handshake.bb = 3 : ui32, handshake.name = "buffer12", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i11>
    %41 = buffer %40 {handshake.bb = 3 : ui32, handshake.name = "buffer13", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i11>
    %42 = extsi %41 {handshake.bb = 3 : ui32, handshake.name = "extsi6"} : <i11> to <i12>
    %result_9, %index_10 = control_merge %falseResult_2, %37  {handshake.bb = 3 : ui32, handshake.name = "control_merge2"} : <>, <i1>
    %43:2 = fork [2] %index_10 {handshake.bb = 3 : ui32, handshake.name = "fork7"} : <i1>
    %44 = source {handshake.bb = 3 : ui32, handshake.name = "source1"} : <>
    %45 = constant %44 {handshake.bb = 3 : ui32, handshake.name = "constant11", value = 1000 : i11} : <>, <i11>
    %46 = extsi %45 {handshake.bb = 3 : ui32, handshake.name = "extsi7"} : <i11> to <i12>
    %47 = source {handshake.bb = 3 : ui32, handshake.name = "source2"} : <>
    %48 = constant %47 {handshake.bb = 3 : ui32, handshake.name = "constant12", value = 1 : i2} : <>, <i2>
    %49 = extsi %48 {handshake.bb = 3 : ui32, handshake.name = "extsi8"} : <i2> to <i12>
    %50 = addi %42, %49 {handshake.bb = 3 : ui32, handshake.name = "addi0"} : <i12>
    %51:2 = fork [2] %50 {handshake.bb = 3 : ui32, handshake.name = "fork8"} : <i12>
    %52 = trunci %51#0 {handshake.bb = 3 : ui32, handshake.name = "trunci2"} : <i12> to <i11>
    %53 = cmpi ult, %51#1, %46 {handshake.bb = 3 : ui32, handshake.name = "cmpi1"} : <i12>
    %54:3 = fork [3] %53 {handshake.bb = 3 : ui32, handshake.name = "fork9"} : <i1>
    %trueResult_11, %falseResult_12 = cond_br %54#0, %52 {handshake.bb = 3 : ui32, handshake.name = "cond_br5"} : <i1>, <i11>
    sink %falseResult_12 {handshake.name = "sink2"} : <i11>
    %55 = buffer %38 {handshake.bb = 3 : ui32, handshake.name = "buffer10", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <i1>
    %56 = buffer %55 {handshake.bb = 3 : ui32, handshake.name = "buffer11", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <i1>
    %trueResult_13, %falseResult_14 = cond_br %54#1, %56 {handshake.bb = 3 : ui32, handshake.name = "cond_br6"} : <i1>, <i1>
    sink %falseResult_14 {handshake.name = "sink3"} : <i1>
    %57 = buffer %result_9 {handshake.bb = 3 : ui32, handshake.name = "buffer14", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %58 = buffer %57 {handshake.bb = 3 : ui32, handshake.name = "buffer15", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %trueResult_15, %falseResult_16 = cond_br %54#2, %58 {handshake.bb = 3 : ui32, handshake.name = "cond_br7"} : <i1>, <>
    %result_17, %index_18 = control_merge %falseResult_16  {handshake.bb = 4 : ui32, handshake.name = "control_merge3"} : <>, <i1>
    sink %index_18 {handshake.name = "sink4"} : <i1>
    %59 = buffer %result_17 {handshake.bb = 4 : ui32, handshake.name = "buffer16", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {D: 1, V: 1, R: 0}>}} : <>
    %60 = buffer %59 {handshake.bb = 4 : ui32, handshake.name = "buffer17", hw.parameters = {NUM_SLOTS = 1 : ui32, TIMING = #handshake<timing {R: 1}>}} : <>
    %61:2 = fork [2] %60 {handshake.bb = 4 : ui32, handshake.name = "fork10"} : <>
    end {handshake.bb = 4 : ui32, handshake.name = "end0"} %memEnd_0, %memEnd, %0#1 : <>, <>, <>
  }
}

