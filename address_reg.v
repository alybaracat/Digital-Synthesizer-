`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:26 05/10/2016 
// Design Name: 
// Module Name:    address_reg15 
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
module address_reg15(
    input [15:0]first,
    input rst,
    input clk,
    input [15:0]last,
    output reg [15:0]out
    );
	 always@(posedge clk)begin
		if(rst)out<=first;
	 else if(out==last)out<=first;
	 else out<=out+1'b1;
	 
	 end
	


endmodule
