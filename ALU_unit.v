module ALU_unit(A,B,Control_in,ALU_result,zero);
input[31:0]A,B;
input [3:0]Control_in;
output reg zero;
output reg[31:0] ALU_result;
always@(Control_in or A or B)
begin
case(Control_in)
4'b0000:begin
zero<=0;
ALU_result<=A&B;
end
4'b0001:begin zero<=0;
ALU_result<=A|B;
end
4'b0010:begin
zero<=0;
ALU_result<=A+B;
end
4'b0110:begin
if(A==B)
begin
zero<=1;
ALU_result=0;
end
else
zero<=0;
ALU_result<=A-B;
end
4'b0011:begin
zero<=0;
ALU_result<=A;  //SPECIALLY USED FOR THE STORE INSTRUCTIONS
end
default:
begin
zero<=0;
ALU_result=0;
end
endcase
end
endmodule
