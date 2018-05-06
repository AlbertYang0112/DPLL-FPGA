`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:00 05/06/2018
// Design Name:   DLF
// Module Name:   /home/iair-p05/Projects/DPLL-FPGA/TestBenchDLF.v
// Project Name:  DPLL-FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DLF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBenchDLF;

	// Inputs
	reg clk;
	reg reset;
	reg dirSig;
	reg enable;
	reg [3:0] kMode;

	// Outputs
	wire carry;
	wire borrow;
	wire [19:0] count;

	// Instantiate the Unit Under Test (UUT)
	DLF uut (
		.clk(clk), 
		.reset(reset), 
		.dirSig(dirSig), 
		.enable(enable), 
		.kMode(kMode), 
		.carry(carry), 
		.borrow(borrow),
		.count(count)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		dirSig = 0;
		enable = 0;
		kMode = 4'b0001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		enable = 1;
		reset = 1;
		#100
		kMode = 4'b0010;
		#100
		dirSig = 1;


	end

	always #1 clk = ~clk;
	
      
endmodule

