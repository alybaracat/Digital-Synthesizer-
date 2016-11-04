`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:38 05/17/2016 
// Design Name: 
// Module Name:    Divider_100 
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
module Divider_100(clk,rst,oclk);
	 input clk;
    input rst;
	 output reg oclk;
	 reg [8:0]Q;
	 parameter n=50;
	 //assign oclk=clk;
	 always @(posedge clk or negedge rst)begin
	 if(!rst) begin
			Q<=0;
			oclk<=0;
			end
	 else if(Q==n-1)begin
			Q<=0;
			oclk<=~oclk;
			end
	 else
			Q<=Q+9'b1;
	 end

endmodule