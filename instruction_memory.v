// INSTRUCTION MEMORY

module Instruction_memory(clk,reset,read_address,instruction_out);
input clk,reset;
input [31:0] read_address;
output reg[31:0]instruction_out;
reg [31:0]instr_memory[63:0];
integer k;
assign instruction_out=instr_memory[read_address];
always@(posedge clk or posedge reset)
begin
if(reset)
begin
for(k=0;k<64;k=k+1)
instr_memory[k]<=32'b0;
end
else
begin
//R-type
instr_memory[0]=32'b0000_0000_0000_0000_0000_0000_0000_0000; // no operation
instr_memory[4]=32'b0000000_11001_10000_000_01101_0110011; //add x13,x16,x25
instr_memory[8]=32'b0100000_00011_01000_000_00101_0110011; //sub x5,x8,x3;
instr_memory[12]=32'b0000000_00011_00010_111_00001_0110011;  //and x1,x2,x3;
instr_memory[16]=32'b0000000_00101_00011_110_00100_0110011;  //or x4,x3,x5;
 //I-type
instr_memory[20]=32'b000000000011_10101_000_10110_0010011;//addi x22,x21,3
instr_memory[24]=32'b000000000001_01000_110_01001_0010011; //ori x9,x8,1;
//L-type
instr_memory[28]=32'b000000001111_00111_010_01000_0000011; //lw x8,15(x7)
instr_memory[32]=32'b000000000011_00011_010_01001_0000011;  //lw x9,3(x3)
//S-type
 instr_memory[36]=32'b0000000_01111_00101_011_01000_0100011; //sw x15,8(x5)
instr_memory[40]=32'b0000000_01110_00110_011_01010_0100011; //sw x14,10(x6)
//SB-type
instr_memory[44]=32'h00948663;//beq x9,x9,12;
end
end
endmodule
