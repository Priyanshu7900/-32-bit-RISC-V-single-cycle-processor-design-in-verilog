//ControlUnit

module Control_Unit(Instruction,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite);
input [6:0]Instruction;
output reg Branch,MemtoReg,MemWrite,ALUSrc,RegWrite,MemRead;
output reg [1:0]ALUOp;

always@(*)
begin
case(Instruction)
7'b0110011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b00100010;
7'b0010011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b10100000;
7'b0000011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b01110000;
7'b0100011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b00001000;
7'b1100011:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b00000101;
default:{ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}=8'b00000000;
endcase
end
endmodule
