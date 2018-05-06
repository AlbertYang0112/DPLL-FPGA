`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:08:06 05/06/2018 
// Design Name: 
// Module Name:    PhaseDetector 
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
module PhaseDetector(
    input inputSigA,
    input inputSigB,
    output errSig
    );

    assign errSig = inputSigA ^ inputSigB;

endmodule
