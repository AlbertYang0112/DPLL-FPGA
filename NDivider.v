`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:51:00 05/06/2018 
// Design Name: 
// Module Name:    Divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Divide the clk 2 * (N + 1) times. The duty cycle of the output is 50%.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NDivider(
    input clk,
    input reset,
    input [7:0] N,
    output reg out
    );

    reg [7:0]cnt;
    always @(posedge clk or negedge reset) begin
        if(!reset)
        begin
            cnt <= N;
            out <= 0;
        end
        else begin
            if(cnt != 8'd0)
                cnt <= cnt - 1;
            else
            begin
                out <= ~out;
                cnt <= N;
            end
        end
    end

endmodule
