`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:30:54 01/30/2016
// Design Name:   third_step
// Module Name:   D:/workspace-ISE/PipelineThirdStep/third_step_tb.v
// Project Name:  PipelineThirdStep
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: third_step
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module third_step_tb;

	// Inputs
	reg aluSrc;
	reg [5:0] ALUOp;
	reg regDst;
	reg [31:0] pcPlusFour;
	reg signed [31:0] reg1;
	reg signed [31:0] reg2;
	reg signed [31:0] signExtend;
	reg [4:0] regDst1;
	reg [4:0] regDst2;

	// Outputs
	wire [31:0] addResult;
	wire zero;
	wire [31:0] aluResult;
	wire [31:0] reg2Out;
	wire [4:0] muxRegDstOut;

	// Instantiate the Unit Under Test (UUT)
	third_step uut (
		.aluSrc(aluSrc), 
		.ALUOp(ALUOp), 
		.regDst(regDst), 
		.pcPlusFour(pcPlusFour), 
		.reg1(reg1), 
		.reg2(reg2), 
		.signExtend(signExtend), 
		.regDst1(regDst1), 
		.regDst2(regDst2), 
		.addResult(addResult), 
		.zero(zero), 
		.aluResult(aluResult), 
		.reg2Out(reg2Out), 
		.muxRegDstOut(muxRegDstOut)
	);

	initial begin
		// Initialize Inputs
		aluSrc = 0;
		ALUOp = 0;
		regDst = 0;
		pcPlusFour = 32;
		reg1 = 4;
		reg2 = 32'b10000000_00000000_00000000_00000001;
		signExtend = 25;
		regDst1 = 5'b00101;
		regDst2 = 5'b01000;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here
		regDst = 1;
		#10;
		
		signExtend = 32'b00000000_00000000_00000000_00000111;
		#10;
		/*
		signExtend = 32'b00000000000000000000000000000111;
		#10;
		signExtend = 32'b00000000000000000000000000000111;
		#10;
		signExtend = 32'b00000000000000000000000000000111;
		#10;
		aluSrc = 0;
		signExtend = 32'b00000000000000000000000000100010;
		#10;
		*/	
	end
	
endmodule
