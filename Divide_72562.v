`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:55 05/17/2016 
// Design Name: 
// Module Name:    Divide_72562 
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
module Divide_72562(
     clk,
     oclk,
     rst
    );
	 input clk;
    input rst;
	 output reg oclk;
	 reg [15:0]Q;
	 parameter n=36281;
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
			Q<=Q+15'b1;
	 end

endmodule


