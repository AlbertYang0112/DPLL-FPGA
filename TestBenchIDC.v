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
    IDCounter DCO(
        .clk(clock),
        .reset(reset),
        .inc(inc),
        .dec(dec),
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
        #20 inc = 1;
        #2 inc = 0;
        #20 dec = 1;
        #2 dec = 0;
        #20 inc = 1;
        #2 inc = 0;
        #20 dec = 1;
        #2 dec = 0;
    end
    always #1 clock = ~clock;




endmodule
