`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:12:28 07/06/2018 
// Design Name: 
// Module Name:    TestBenchIDC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TestBenchIDC;

    // Inputs
    reg clock;
    reg reset;
    reg inc;
    reg dec;
    
    // Outputs
    wire DCOout;
    wire incDelayed;
    wire decDelayed;
    wire incIgn;
    wire decIgn;
    IDCounter DCO(
        .clk(clock),
        .reset(reset),
        .incIn(inc),
        .decIn(dec),
        .inc(incDelayed),
        .dec(decDelayed),
        .incIgnore(incIgn),
        .decIgnore(decIgn),
        .IDout(DCOout)
    );

    initial begin
        // Initialize Inputs
        clock = 0;
        reset = 0;
        inc = 0;
        dec = 0;

        #100;

        reset = 1;
        #200 inc = 1;
        #20 inc = 0;
        #10 inc = 1;
        #10 inc = 0;
        #10 inc = 1;
        #10 inc = 0;
        #10 inc = 1;
        #10 inc = 0;
    end
    always #10 clock = ~clock;




endmodule
