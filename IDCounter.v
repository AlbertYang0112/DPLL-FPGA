`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:44:23 05/06/2018 
// Design Name: 
// Module Name:    IDCounter 
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
module IDCounter(
    input clk,
    input reset,
    input inc,
    input dec,
    output IDout
    );

    wire Q1, Qn1, Q2, Qn2, Q3, Qn3;
    wire Q4, Qn4, Q5, Qn5, Q6, Qn6;
    wire Q7, Qn7, Q8, Qn8, Q9, Qn9;
    wire D7, D8;    
    FFD FFD1(clk, reset, dec, Q1, Qn1);
    FFD FFD2(clk, reset, inc, Q2, Qn2); 
    FFD FFD3(clk, reset, Q1, Q3, Qn3);
    FFD FFD4(clk, reset, Q2, Q4, Qn4); 
    FFD FFD5(clk, reset, Q3, Q5,Qn5);
    FFD FFD6(clk, reset, Q4, Q6,Qn6);
    assign D7=((Q9 & Qn1 & Q3)|(Q9 & Q5 & Qn3));
    assign D8=((Qn9 & Qn2 & Q4)|(Qn9 & Q6 & Qn4));
    FFD FFD7(clk, reset, D7, Q7, Qn7 );
    FFD FFD8(clk, reset, D8, Q8, Qn8);
    FFJK FFJK1(clk, reset, Qn7, Qn8, Q9, Qn9);
    assign IDout = (!clk)&Q9; 

endmodule
