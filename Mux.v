`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:56 05/17/2016 
// Design Name: 
// Module Name:    Mux 
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
module Mux(
    input sel,
    input Ch1,
    input Ch2,
    output reg Dout
    );

always@ (*)begin
case(sel)
1'b0: Dout=Ch1;
1'b1: Dout=Ch2;
endcase
end
endmodule
