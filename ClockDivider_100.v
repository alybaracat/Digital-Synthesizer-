`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:30 05/10/2016 
// Design Name: 
// Module Name:    ClockDivider_100 
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
module ClockDivider_10(clk,rst,oclk);
	 input clk;
    input rst;
	 output reg oclk;
	 reg [2:0]Q;
	 parameter n=5;
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
			Q<=Q+3'b1;
	 end

endmodule