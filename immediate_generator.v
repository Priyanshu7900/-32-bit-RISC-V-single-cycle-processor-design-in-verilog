// Immediate generator


module ImmGen(Opcode,instruction,ImmExt);
input [6:0]Opcode;
input [31:0]instruction;
output reg[31:0]ImmExt;
always@(*)
begin
case(Opcode)
7'b0010011:ImmExt<= {{20{instruction[31]}},instruction[31:20]}; //immediate
7'b1100011:ImmExt<= {{19{instruction[31]}},instruction[31],instruction[30:25],instruction[11:8],1'b0}; // branch
default:ImmExt<=32'b00;
endcase 
end
endmodule
