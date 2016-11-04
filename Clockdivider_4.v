`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:46 05/10/2016 
// Design Name: 
// Module Name:    Clockdivider_4 
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
module Clockdivider_4(clk,oclk,rst);
    input clk;
    input rst;
	 output reg oclk;
	 reg [3:0]Q;
	 parameter n=8;
	 //assign oclk=clk;
	 always @(posedge clk or negedge rst)begin
	 if(!rst) begin
			Q<=0;
			oclk=0;
			end
	 else if(Q==n-1)begin
			Q<=0;
			oclk=~oclk;
			end
	 else
			Q<=Q+4'b1;
	 end

endmodule
