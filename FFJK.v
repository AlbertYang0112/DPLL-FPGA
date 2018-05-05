`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:36 05/06/2018 
// Design Name: 
// Module Name:    FFJK 
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
module FFJK(
    input clk,
    input reset,
    input j,
    input k,
    output reg out
    output out_n
    );
    if(!reset) begin
        q <= 0b'0;
    end
    else begin
        case({j, k})
            2'b00: q <= q;
            2'b01: q <= 1'b0;
            2'b10: q <= 1'b1;
            2'b11: q <= ~q;
        endcase
    end
    assign out_n = ~out;

endmodule
