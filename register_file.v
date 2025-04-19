//REGISTER FILE


module Reg_file(clk,reset,Rs1,Rs2,Rd,Register_write,WriteData,read_data1,read_data2,instruction,out1,out2);
input clk,reset,Register_write;
input [4:0] Rs1,Rs2,Rd;
input [31:0] WriteData,instruction;
output [31:0] read_data1,read_data2,out1,out2;
reg[31:0] Registers[31:0];
integer k;
initial begin
Registers[0]=0;
Registers[1]=4;
Registers[2]=2;
Registers[3]=2;
Registers[4]=4;
Registers[5]=1;
Registers[6]=44;
Registers[7]=4;
Registers[8]=24;
Registers[9]=1;
Registers[10]=23;
Registers[11]=4;
Registers[12]=90;
Registers[13]=10;
Registers[14]=20;
Registers[15]=30;
Registers[16]=40;
Registers[17]=50;
Registers[18]=60;
Registers[19]=70;
Registers[20]=40;
Registers[21]=40;
Registers[22]=90;
Registers[23]=70;
Registers[24]=60;
Registers[25]=65;
Registers[26]=4;
Registers[27]=32;
Registers[28]=12;
Registers[29]=34;
Registers[30]=5;
Registers[31]=10;
end

always@(posedge clk )
begin
 if(Register_write)
begin
Registers[Rd]<=WriteData;
end
end
assign read_data1=((instruction[6:0]==7'b0000011)|(instruction[6:0]==7'b0100011))?Registers[Rs1]+Rs2:Registers[Rs1]; 
// IF MY INSTRUCTION IS OF TYPE LOAD OR STRORE THEN MY SOURCE OR DESTINATION IS CALCULATED BY ADDING THE OFFSET
assign read_data2=((instruction[6:0]==7'b0000011)|(instruction[6:0]==7'b0100011))?((instruction[6:0]==7'b0100011)?Registers[Rd]:0):Registers[Rs2]; 
// IF MY INSTRUCTION IS OF TYPE STORE THEN STORET HE CONTENT INTO THE DATA MEORY OF RD REGISTER

assign out1=Registers[8]; // to see the results of load instructions
assign out2=Registers[9];  // to see the results of load instructions
endmodule
