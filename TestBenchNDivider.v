`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:10:22 05/06/2018
// Design Name:   NDivider
// Module Name:   /home/iair-p05/Projects/DPLL-FPGA/TestBenchNDivider.v
// Project Name:  DPLL-FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NDivider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBenchNDivider;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] N;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	NDivider uut (
		.clk(clk), 
		.reset(reset), 
		.N(N), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		N = 8'd4;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#100
		reset = 0;
		N = 8'd0;
		#5
		reset = 1;
        
		// Add stimulus here

	end
	always #1 clk = ~clk;
      
endmodule

