`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:24 05/17/2016 
// Design Name: 
// Module Name:    Sout_16bit 
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
module Sout_16bit(
    input clk,
    input rst,
	 input ld,
	 input [15:0]in,
	 output reg Dout
    );
	 reg [15:0]out;
	 always@(posedge clk)
		if(!rst) Dout <= 0;
		else Dout <= out[15];
		
	 always@(posedge clk)
	 if(!rst)
		out<=0;
	 else if(ld) out<=in;
	 else out<={out[14:0], 1'b0};
		


endmodule
