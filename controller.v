`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:49 05/10/2016 
// Design Name: 
// Module Name:    controller 
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
module controller(
    input clk,
	 input rst,
    output reg [1:0]ld,
    output reg [4:0]first,
    output reg [4:0]second,
    output reg [1:0]sel,
    input [7:0]b
    );
	 wire [7:0]p;
	 wire [7:0]r;	 
	 wire [4:0]BP;
	 
	 
	 
	 //assign BP= b[0]+b[1]+b[2]+b[3]+b[4]+b[5]+b[6]+b[7];
	 assign BP= b[0]+b[1]+b[2]+b[3]+b[4];
	 
	 //edgedetector a(.clk(clk),.w(b[0]),.rst(rst),.tick(p[0]));
	 //negdetect a1(.clk(clk),.w(b[0]),.rst(rst),.tick(r[0]));
	 
	 //edgedetector b2(.clk(clk),.w(b[1]),.rst(rst),.tick(p[1]));
	 //negdetect b1(.clk(clk),.w(b[1]),.rst(rst),.tick(r[1]));
	 
	 //edgedetector d(.clk(clk),.w(b[2]),.rst(rst),.tick(p[2]));
	 //negdetect d1(.clk(clk),.w(b[2]),.rst(rst),.tick(r[2]));
	 
	 //edgedetector c(.clk(clk),.w(b[3]),.rst(rst),.tick(p[3]));
	 //negdetect c1(.clk(clk),.w(b[3]),.rst(rst),.tick(r[3]));
	 
	 //edgedetector e(.clk(clk),.w(b[4]),.rst(rst),.tick(p[4]));
	// negdetect e1(.clk(clk),.w(b[4]),.rst(rst),.tick(r[4]));
	 
	// edgedetector f(.clk(clk),.w(b[5]),.rst(rst),.tick(p[5]));
	// negdetect f1(.clk(clk),.w(b[5]),.rst(rst),.tick(r[5]));
	 
	// edgedetector g(.clk(clk),.w(b[6]),.rst(rst),.tick(p[6]));
	 //negdetect g1(.clk(clk),.w(b[6]),.rst(rst),.tick(r[6]));
	 
	//edgedetector h(.clk(clk),.w(b[7]),.rst(rst),.tick(p[7]));
	//negdetect h1(.clk(clk),.w(b[7]),.rst(rst),.tick(r[7]));
	 
	 reg[1:0] state, nextState;
	 parameter [1:0] O=2'b00, F=2'b01, S=2'b10, FS=2'b11;
		
	 always@(*)begin
	
	 case(state)
	 
	 O:if(BP==1)nextState=F;
	 else nextState=O;
	 
	 
	 F: if(BP==1)nextState=F;
	 else if(BP==2) nextState=FS;
	 else nextState=O;
	 
	 
	 S: if(BP==1)nextState=S;
	 else if(BP==2) nextState=FS;
	 else nextState=O;
	 
	 
	 FS: if(BP==1)begin
	 
    if(!b[0]) begin
	 if(first==0) nextState=S; 
	 else nextState=F;
	 end	 
	 
	 else if(!b[1]) begin
	 if(first==1) nextState=S; 
	 else nextState=F;
	 end	
	 
	 else if(!b[2]) begin
	 if(first==2) nextState=S; 
	 else nextState=F;
	 end	
	 
	 else if(!b[3]) begin
	 if(first==3) nextState=S; 
	 else nextState=F;
	 end	
	 
	  else  begin
	 if(first==4) nextState=S; 
	 else nextState=F;
	 end	
	 
//	  else if(r[5]) begin
	/// if(first==5) nextState=S; 
	// else nextState=F;
	// end	
	 
	 // else if(r[6]) begin
	// if(first==6) nextState=S; 
	// else nextState=F;
	// end	
	 // else begin
	 //if(first==7) nextState=S; 
	// else nextState=F;
	// end	
	  	
	 
	 end
	 	
	 else nextState=FS;
	
	 endcase
	 end 
	 
	 always @ (posedge clk or negedge rst) begin
	if(!rst) state <= O;
	else state <= nextState;
	end
	 
	 always@(posedge clk)begin
	 case(state)
	 O: begin first<=-1; second<=-1; sel<=2'b00; ld<=2'b00; end
	 
	 F: begin 
	 second<=-1; 
	 sel<=2'b01;
	 ld<=2'b01;	
	  if(b[0])first<=0;
	 
	  else if(b[1]) first<=1;
	 
	  else if(b[2]) first<=2;
	  
	  else if(b[3]) first<=3;
	  else first<=4;
	  
	 // else if(p[4]) first<=4;
	  
	  //else if(p[5]) first<=5;
	
	 // else if(p[6]) first<=6;
	  
	 // else first<=7;
	  
	  
	  
	  
	 
	  end
	 	 
	 FS:  begin
	 sel<=2'b11;
    ld<=2'b11;	 
	 if(b[0]) begin if(second==-1)second<=0;
	 else first<=0; end
	 
	  else if(b[1]) begin if(second==-1)second<=1;
	 else first<=1; end
	 
	  else if(b[2]) begin if(second==-1)second<=2;
	 else first<=2; end
	  
	  else if(b[3]) begin if(second==-1)second<=3;
	 else first<=3; end
	 
	 else begin if(second==-1)second<=4;
	else first<=4; end
	  
	 // else if(p[4]) begin if(second==-1)second<=4;
	// else first<=4; end
	  
	  //else if(p[5]) begin if(second==-1)second<=5;
	// else first<=5; end
	
	//  else if(p[6]) begin if(second==-1)second<=6;
	// else first<=6; end
	  
	//  else begin if(second==-1)second<=7;
	// else first<=7; end
	 
	 
	 
	 
	  end
	 
	 S: begin first<=-1; 
	 sel<=2'b10;
    ld<=2'b10;
	  if(b[0])second<=0;
	 
	  else if(b[1]) second<=1;
	 
	  else if(b[2]) second<=2;
	  
	  else if(b[3]) second<=3;
	  else second<=4;
	  //else if(p[4]) second<=4;
	  
	  //else if(p[5]) second<=5;
	
	 // else if(p[6]) second<=6;
	  
	 // else  second<=7;
	  
	 
	 	 end
	 endcase
	 end
	 
endmodule
