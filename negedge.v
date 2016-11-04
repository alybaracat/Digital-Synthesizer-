`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:49 05/11/2016 
// Design Name: 
// Module Name:    negedge 
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
module negdetect(
	 input clk,
    input w,
    input rst,
    output tick
    );
	
	reg [1:0] state, nextState;
	parameter [1:0] O=2'b00, E=2'b01, Z=2'b10; 
	
	always @ (w or state)
	case (state)
	O: if(w) nextState = O;
		else nextState =E;
	E: if(w) nextState = O;
		else nextState= Z;
	Z: if(w) nextState= O;
		else nextState = Z;
	endcase
	
	always @ (posedge clk or negedge rst) begin
	if(!rst) state <= Z;
	else state <= nextState;
	end
	
	assign tick = (state == E );
	
endmodule
