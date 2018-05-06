`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:55 05/05/2018 
// Design Name:    
// Module Name:    DPLL 
// Project Name:   DPLL-FPGA
// Target Devices: XC6SLX9-2FTG256
// Tool versions: 
// Description:     The digital phase-locked loop.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DPLL(
    input baseClockInput,
    input oscInput,
    input reset,
    output dpllOutput,
    // Signal for debug
    output xorOut
    );

    reg [3:0] kMode = 4'b0011;
    reg [7:0] multN = 8'd4;
    
    PhaseDetector DPD(
        .inputSigA(baseClockInput),
        .inputSigB(dpllOutput),
        .errSig(dpdOut)
    );

    DLF KCounter(
        .clk(sysClk),
        .reset(reset),
        .dirSig(dpdOut),
        .enable(1),
        .kMode(kMode),
        .carry(dlfCarry),
        .borrow(dlfBorrow)        
    );

    IDCounter DCO(
        .clk(sysClk),
        .reset(reset),
        .inc(dlfCarry),
        .dec(dlfBorrow),
        .IDout(DCOout)
    );

    NDivider DIV(
        .clk(DCOout),
        .reset(reset),
        .N(multN),
        .out(dpllOutput)
    );

    // For debug
    assign xorOut = dpdOut;

    

endmodule
    