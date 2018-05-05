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
	reg sysClk;

	// Outputs
	wire dpllOutput;

	// Instantiate the Unit Under Test (UUT)
	DPLL uut (
		.baseClockInput(baseClockInput), 
		.oscInput(oscInput), 
		.dpllOutput(dpllOutput)
	);

	initial begin
		// Initialize Inputs
		baseClockInput = 0;
		oscInput = 0;
        sysClk=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
    always #20 oscInput =~ oscInput;
    always #50 baseClockInput =~ baseClockInput;
    //always #1 sysClk =~ sysClk;
      
endmodule
