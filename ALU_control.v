module ALUcontrol(ALUop,fun7,fun3,Control_out);
input fun7;
input[2:0]fun3;
input[1:0]ALUop;
output reg[3:0]Control_out;

always@(*)
begin
case({ALUop,fun7,fun3})
6'b000_010:Control_out=4'b0010;
6'b000_011:Control_out=4'b0011;
6'b010_000:Control_out=4'b0110;
6'b100_000:Control_out=4'b0010;
6'b101_000:Control_out=4'b0110;
6'b100_111:Control_out=4'b0000;
6'b100_110:Control_out=4'b0001;
default:Control_out=4'b0010;
endcase
end
endmodule
