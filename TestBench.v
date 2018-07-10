`timescale 1ns / 100ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:42:57 05/06/2018
// Design Name:   DPLL
// Module Name:   /home/thunderbird/Projects/DPLL-FPGA/TestBench.v
// Project Name:  DPLL-FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DPLL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench;

	// Inputs
	reg baseClockInput;
	reg oscInput;
	reg reset;

	// Outputs
	wire dpllOutput;
	wire xorOutput;
	wire dlfCarry;
	wire dlfBorrow;
	wire DCOout;
	wire [19:0]counter;

	// Instantiate the Unit Under Test (UUT)
	DPLL uut (
		.baseClockInput(baseClockInput), 
		.oscInput(oscInput), 
		.reset(reset),
		.dpllOutput(dpllOutput),
		.dpdOut(xorOutput),
		.dlfCarry(dlfCarry),
		.dlfBorrow(dlfBorrow),
		.inc(inc),
		.dec(dec),
		.DCOout(DCOout),
		.HDivClk(HDivClk),
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		baseClockInput = 0;
		oscInput = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		reset = 1;


	end
    always #50 oscInput =~ oscInput;
    always #103200 baseClockInput =~ baseClockInput;
      
endmodule

