`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:35 10/22/2015 
// Design Name: 
// Module Name:    debounce 
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
module debounce

	(
	 input wire clk, reset,
	 input wire sw,
	 output reg db_level, db_tick
    );
// symbolic state declaration
	localparam	[1:0]
					zero	= 2'b00,
					wait0	= 2'b01,
					one	= 2'b10,
					wait1 = 2'b11;
// number of counter bits (2(N) * 20ns = 40ms)
localparam N=21;
// signal declaration
reg [N-1:0] q_reg, q_next;
reg [1:0] state_reg, state_next;
// body
// fsmd state & data registers
always @(posedge clk, posedge reset)
	if (reset)
		begin
			state_reg <= zero;
			q_reg <= 0;
		end
	else
		begin
			state_reg <= state_next;
			q_reg <= q_next;
		end
// next-state 
always @*
begin
	state_next = state_reg;
	q_next = q_reg;
	db_tick = 1'b0;
	case (state_reg)
		zero:
			begin
				db_level = 1'b0;
				if (sw)
					begin
						state_next = wait1;
						q_next = {N{1'b1}};
					end
			end
		wait1:
			begin
				db_level = 1'b0;
				if (sw)
					begin
						q_next = q_reg - 1;
						if (q_next == 0)
							begin
								state_next = one;
								db_tick = 1'b1;
							end
					end
				else // sw==0
					state_next = zero;
			end
		one:
			begin
				db_level = 1'b1;
				if (~sw)
					begin
						state_next = wait0;
						q_next = {N{1'b1}};
					end
			end
		wait0:
			begin
				db_level = 1'b1;
				if (~sw)
					begin
						q_next = q_reg - 1;
						if (q_next == 0)
							state_next = zero;
					end
				else //sw==1
					state_next = one;
			end
		default: state_next = zero;
	endcase
end //always
endmodule
