`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:20:39 05/06/2018 
// Design Name: 
// Module Name:    FFD 
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
module FFD(
    input clk,
    input reset,
    input sigIn,
    output reg sigOut,
    output sigOut_n
    );

    always @(posedge clk or negedge reset) begin
        if(!reset)
            sigOut = 0;
        else begin
            sigOut <= sigIn;
        end
    end
    assign sigOut_n = ~sigOut;

endmodule
