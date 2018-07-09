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
    output dpdOut,
    output dlfCarry,
    output dlfBorrow,
    output inc,
    output dec,
    output DCOout,
    output HDivClk,
    output [19:0]counter
    );

    reg [3:0] kMode = 4'b0011;
    reg [7:0] multN = 8'd128;
    reg [7:0] H = 8'd1;
    wire idclock;
    
    PhaseDetector DPD(
        .inputSigA(baseClockInput),
        .inputSigB(dpllOutput),
        .errSig(dpdOut)
    );

    DLF KCounter(
        .clk(oscInput),
        .reset(reset),
        .dirSig(dpdOut),
        .enable(1),
        .kMode(kMode),
        .carry(dlfCarry),
        .borrow(dlfBorrow),
        .count(counter)
    );

    NDivider oscDIV(
        .clk(oscInput),
        .reset(reset),
        .N(H),
        .out(HDivClk)
    );

    IDCounter DCO(
        .clk(HDivClk),
        .reset(reset),
        .incIn(dlfCarry),
        .decIn(dlfBorrow),
        .IDout(DCOout),
        .inc(inc),
        .dec(dec)
    );

    NDivider DIV(
        .clk(DCOout),
        .reset(reset),
        .N(multN),
        .out(dpllOutput)
    );

    // For debug

    

endmodule
    