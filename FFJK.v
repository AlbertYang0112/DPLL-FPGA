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
    output reg out,
    output reg out_n
    );

    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            out <= 0;
        end
        else begin
            case({j, k})
                2'b00: begin out <= out; out_n <= out_n; end
                2'b01: begin out <= 1'b0; out_n <= 1'b1; end
                2'b10: begin out <= 1'b1; out_n <= 1'b0; end
                2'b11: begin out <= ~out; out_n <= ~out_n; end
            endcase
        end
    end

endmodule
