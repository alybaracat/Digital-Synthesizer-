`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:17:47 05/17/2016 
// Design Name: 
// Module Name:    Divider4 
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
module Divider4(
     clk,
    oclk,
     rst
    );
	 
	  input clk;
    input rst;
	 output reg oclk;
	 reg [1:0]Q;
	 parameter n=2;
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
			Q<=Q+2'b1;
	 end


endmodule
