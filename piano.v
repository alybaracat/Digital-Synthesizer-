`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:12 05/10/2016 
// Design Name: 
// Module Name:    piano 
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
module piano(
    input [7:0]b,
	 input rst,
	 input CLK_IN1,
    output  Dout,
	 output MCLK,
	 output LRCLK,
    output SCLK,
	 output test,
	 output [3:0]bcdsel,
	 output reg [6:0]Y,
	 output reg [3:0]i,
	 output reg led,
	 input option
    );
	 wire [4:0]first,second;
	 wire [15:0]saddr[7:0];
	 wire [15:0]endaddr[7:0];
	 wire [1:0]ld;
	 wire [1:0]sel;
	 reg [15:0]memIn[1:0];	 
	 wire [15:0]SerialIn[1:0];
	 wire [15:0]MemOut;
	 reg [15:0]Serial;
	 reg tempLD;
	reg [9:0]note;
	 
	 
    wire LRCLK_temp; 
	 wire LRCLK2_temp;
	wire LRCLK3_temp;
    wire SCLK_temp;
	  wire SCLK_temp2;
	 wire LRCLK2; 
	  wire testclk; 
   

 
  Clockdiv instance_name
   (// Clock in ports
    .CLK_IN1(CLK_IN1),      // IN
    // Clock out ports
    .Mclk(MCLK),     // OUT
    .LRclk_100(SCLK_temp),     // OUT
    .LRclk_2_100(LRCLK2_temp),     // OUT
    // Status and control signals
    .RESET(~rst));       // IN
// INST_TAG_END ------ End INSTANTIATION Template ---------
	 

	 ClockDivider_10 masterclk1 (.rst(rst),.clk(SCLK_temp),.oclk(SCLK));
	
	 ClockDivider_10 LRtemp (.rst(rst),.clk(LRCLK2_temp),.oclk(LRCLK3_temp));
	Clockdivider_4 finalclockLR2 (.rst(rst),.clk(SCLK_temp2),.oclk(LRCLK2));
	assign SCLK_temp2=SCLK;
	 ClockDivider_32 finalclockLR (.rst(rst),.clk(SCLK_temp2),.oclk(LRCLK));
	 

	//	ClockDivider_1(.rst(rst),.clk(MCLK),.oclk(testclk));
	 
	
	// assign saddr[0]=0;
	// assign endaddr[0]=4096;
	 /*
	 
	 assign saddr[1]=4097;
	 assign endaddr[1]=8192;
	 
	 assign saddr[2]=8193;
	 assign endaddr[2]=12288;
	 
	 assign saddr[3]=12289;
	 assign endaddr[3]=16384;
	 
	 assign saddr[4]=16385;
	 assign endaddr[4]=20480;
	 
	 assign saddr[5]=20481;
	 assign endaddr[5]=24576;
	 
	 assign saddr[6]=24577;
	 assign endaddr[6]=28672;
	 
	 assign saddr[7]=28674;
	 assign endaddr[7]=32768;
	 
	  
	
	 //controller p(.clk(LRCLK),.rst(rst), .ld(ld), .firstf(first), .secondf(second), .sel(sel), .b(b));
	 
	 address_reg15 A1(.first(saddr[0]),.last(endaddr[0]),.clk(~LRCLK),.rst(rst),.ld(b[0]),.out(memIn[0]));
	 //address_reg15 A1(.first(saddr[first]),.last(endaddr[first]),.clk(~LRCLK),.rst(rst),.ld(ld[0]),.out(memIn[0]));
	// address_reg15 A2(.first(saddr[second]),.last(endaddr[second]),.clk(~LRCLK),.rst(rst),.ld(ld[1]),.out(memIn[1]));
	 
Smallmemory memory1(
	  .clka(~LRCLK2), // input clka
     .ena(1'b1), // input ena
     .addra(memIn[0]), // input [15 : 0] addra   !.addra(LRCLK? memIn[0]:memIn[1]
     .douta(SerialIn[0]) // output [15 : 0] douta
     );
	  
	//Sout_16bit S1(.clk(~LRCLK2),.rst(rst),.ld(1'b1),.shift(1'b0),.in(MemOut),.out(SerialIn[0]),.Dout());
	//	Sout_16bit S1(.clk(~LRCLK2),.rst(rst),.ld(~LRCLK),.shift(1'b0),.in(MemOut),.out(SerialIn[0]),.Dout());
	//	Sout_16bit S2(.clk(~LRCLK2),.rst(rst),.ld(LRCLK),.shift(1'b0),.in(MemOut),.out(SerialIn[1]),.Dout());
	//assign SerialIn[0]=MemOut;
	
	always@(posedge LRCLK2)begin
	if(!rst) begin
	Serial<=SerialIn[0]; 
	tempLD<=LRCLK;
	end 
	else  begin
	Serial<=0; 
	tempLD<=0;
	end 
	
	//case(sel)
		//2'b00: begin Serial<=16'b0; tempLD<=0; end
		//2'b01: begin Serial<=SerialIn[0]; tempLD<=LRCLK; end
		//2'b10: begin Serial<=SerialIn[1]; tempLD<=LRCLK; end
		//2'b11: begin Serial<=(SerialIn[0]+SerialIn[1])/2; tempLD<=LRCLK;end
	//endcase
	end
	
	//Sout_16bit Sout(.clk(SCLK),.rst(rst),.ld(tempLD),.shift(tempLD? ~LRCLK:1'b0),.out(),.in(Serial),.Dout(Dout));
	Sout_16bit Sout(.clk(SCLK),.rst(rst),.ld(tempLD),.shift(~LRCLK),.out(),.in(Serial),.Dout(Dout));
	*/
	
	 //address_reg15 A1(.first(saddr[0]),.last(endaddr[0]),.clk(~LRCLK),.rst(rst),.out(memIn[0]));
 reg en;
	reg [25:0]j;
	always@(posedge LRCLK)begin
	if(!rst)begin
		j<=0;
		en<=1'b1;
		end
	else if(j==9312)begin
	j<=0;
	en<=0; end
	else begin
	j<=j+26'b1;
	en<=~en;
	end end
	
	

	 Smallmemory your_instance_name (
  .clka(~LRCLK), // input clka
  .ena(en), // input ena
  .addra(j), // input [11 : 0] addra
  .douta(SerialIn[0]) // output [15 : 0] douta
	);

	 controller p(.clk(SCLK),.rst(rst), .first(first), .second(second), .sel(sel), .b(b));
	  
	  
	//wire [15:0]SS;
	//assign SS=(QQ)/2;
	wire [9:0]Freqtemp;
	
	//non-memoy
	ParameteDivider #(21) freq1(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[0]));
	ParameteDivider #(25) freq2(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[1]));
	ParameteDivider #(33) freq3(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[2]));
	ParameteDivider #(42) freq4(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[3]));
	ParameteDivider #(50) freq5(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[4]));

	//memoy
	assign Freqtemp[5]=LRCLK;
	ParameteDivider #(10) freq7(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[6]));
	ParameteDivider #(1) freq8(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[7]));
	ParameteDivider #(5) freq9(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[8]));
	ParameteDivider #(15) freq10(.clk(LRCLK),.rst(rst),.oclk(Freqtemp[9]));
	reg Freq;
	
	always@ (*)begin
	if(rst) 
	begin
		case(sel)
	2'b00:begin Freq<=0;
				led=1'b0;
				note[4:0]<=5'b10000;
				note[9:5]<=5'b10000;
			end
			
	2'b01:begin 
			if(option)begin Freq<=Freqtemp[first+5];
			note[4:0]<=first+1;
			note[9:5]<=5'b10000;
			end
			
			else begin Freq<=Freqtemp[first];
			
			if (first==0)begin note[4:0]<=5'b00100;
			note[9:5]<=5'b01010;
			end
			else if (first==4)begin note[4:0]<=5'b00110;
			note[9:5]<=5'b01100;
			end
			else begin
			note[4:0]<=5'b00101;
			if(first==1) note[9:5]<=5'b01100;
			else if(first==2) note[9:5]<=5'b01110;
			else note[9:5]<=5'b01010;
			end 
			end
			
			
			led=1'b0;
			
			end
	2'b01:begin 
			if(option)begin Freq<=Freqtemp[second+5];
			note[4:0]<=second+1;
			note[9:5]<=5'b10000;
			end
			
			else begin Freq<=Freqtemp[second];
			
			if (second==0)begin note[4:0]<=5'b00100;
			note[9:5]<=5'b01010;
			end
			else if (second==4)begin note[4:0]<=5'b00110;
			note[9:5]<=5'b01100;
			end
			else begin
			note[4:0]<=5'b00101;
			if(second==1) note[9:5]<=5'b01100;
			else if(second==2) note[9:5]<=5'b01110;
			else note[9:5]<=5'b01010;
			end 
			
			
			end
			led=1'b0;
		end
		2'b11:begin if(option)Freq<=(Freqtemp[first+5]+ Freqtemp[second+5])/2;
		else Freq<=(Freqtemp[first]+ Freqtemp[second])/2;
		note[4:0]<=17;
		note[9:5]<=12;
		led=1'b1;
		end
		endcase
		end
		else begin Freq<=0;
		led=1'b0;
		note[4:0]<=5'b10000;
		note[9:5]<=5'b10000;
		end
	end
	/*always@ (*)begin
	if(rst) begin
	if(b[0])Freq<=Freqtemp[0];
	else if(b[1])Freq<=Freqtemp[1];
	else if(b[2])Freq<=Freqtemp[2];
	else if(b[3])Freq<=Freqtemp[3];
	else if (b[4])Freq<=Freqtemp[4];
	else Freq<=0;
	end
	else Freq<=0;
	end */
	
	//wire Freq440;
	//wire Dout_temp;
	//Divider_100 freq40(.clk(LRCLK),.rst(rst),.oclk(Freq440));
	//ParameteDivider #(freqsel) freq1(.clk(LRCLK),.rst(rst),.oclk(Freq));

	wire Ch1,Ch2;
	reg [15:0]QQ;
	//assign Dout = QQ[15];
	
	always@(Freq) begin
		if(~Freq)QQ <= 16'b0; 
		else if (option) QQ<=SerialIn[0];
		else QQ <= 16'b0111011101001110;//{{6{1'b0}}, {10{1'b1}}};
	end
	/*always@(posedge Freq440)
		if(!rst) QQ <= 16'b0;
		else QQ[5] <= ~QQ[5];*/
	Sout_16bit S1(.clk(SCLK),.rst(rst), .in(QQ),.ld(LRCLK), .Dout(Dout));
  // Sout_16bit S2(.clk(SCLK),.rst(rst), .in(SerialIn[0]),.ld(~LRCLK), .Dout(Ch2));
	
   //Mux multiplexer(.sel(LRCLK), .Ch1(Ch1), .Ch2(Ch2), .Dout(Dout));
	
	/*always@(posedge SCLK) begin
		Dout<=Dout_temp;
	end
*/

		wire [4:0] intemp1;
    assign intemp1=(rst?(option? 15:11):20);
	wire [1:0]Q1;
	wire [6:0]ytemp1,ytemp2,ytemp3,ytemp4;
	RingCounter rcount(.clk(LRCLK),.rst(rst),.Q1(Q1),.Q(bcdsel));
	BCD bcd1(.In(intemp1),.en(1'b1),.Y(ytemp1));
	BCD bcd2(.In(5'b10000),.en(1'b1),.Y(ytemp2));
	BCD bcd3(.In(note[9:5]),.en(1'b1),.Y(ytemp3));
	BCD bcd4(.In(note[4:0]),.en(1'b1),.Y(ytemp4));
	always@(*)begin
	case(Q1)
	2'b00: Y=ytemp1;
	2'b01: Y=ytemp2;
	2'b10: Y=ytemp3;
	2'b11: Y=ytemp4;	
	endcase
	end
	
	
	/*always@(negedge SCLK)begin
	if(!rst)
	i<=4'b0000;
	else if(i==15)begin
	i<=4'b0000;
	end
	else begin
	i<=i+4'b0001;
	end end*/
	
//	wire [1:0]p;
	//wire [1:0]r;
	reg out;
	

	
	
	/*always@(*)
	if(rst)begin
	if(b[0])
	 Dout<=SerialIn[0][i];
	else if(b[1])
	 Dout<=QQ[i];
	 else if(b[2])
	 Dout<=SS[i];
	 else 
	 Dout<=Dout;
	 end
	 else
	 Dout<=0;*/
	 
	//assign Dout=SerialIn[0][i];//	assign Dout=QQ[i]
	//assign led=QQ[i];

endmodule
