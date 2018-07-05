`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:14:57 05/06/2018 
// Design Name: 
// Module Name:    DLF 
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
module DLF(
    input clk,
    input reset,
    input dirSig,
    input enable,
    input [3:0] kMode,
    output carry,
    output borrow,
    // For debug
    output reg [19:0] count
    );

    //reg [19:0]count;
    reg [19:0]kTop;

    always @(kMode) begin
        case(kMode)
            4'b0001:kTop<=7;
            4'b0010:kTop<=15;
            4'b0011:kTop<=31;
            4'b0100:kTop<=63;
            4'b0101:kTop<=127;
            4'b0110:kTop<=255;
            4'b0111:kTop<=511;
            4'b1000:kTop<=1023;
            4'b1001:kTop<=2047;
            4'b1010:kTop<=4095;
            4'b1011:kTop<=8191;
            4'b1100:kTop<=16383;
            4'd1101:kTop<=32767;
            4'd1110:kTop<=65535;
            4'd1111:kTop<=131072;
            default:kTop<=7;
        endcase
    end
    always @(posedge clk, negedge reset) begin
        if(!reset) 
            count <= 0;
        else if(enable) begin
            if(!dirSig) begin
                if(count == kTop)
                    count <= 0;
                else
                    count <= count + 1;
            end
            else begin
                if(count == 0)
                    count <= kTop;
                else
                    count <= count - 1;
            end
        end
    end
    assign carry = reset & enable & (!dirSig) & (count == kTop);
    assign borrow = reset & enable & dirSig & (count == 0);
endmodule
    