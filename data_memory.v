//Data memory

module Datamemmory(clk,reset,Address,Write_data,Mem_write,Mem_read,MemData_out);
input clk,reset,Mem_read,Mem_write;
input[31:0]Address,Write_data;
output [31:0] MemData_out;
reg[31:0]D_memory[63:0];
integer k;
always@(posedge clk or posedge reset)
begin
if(reset)
begin
for(k=0;k<64;k=k+1)
D_memory[k]<=32'b0;
end
else if(Mem_write)
D_memory[Address>>2]<=Write_data;
end
assign MemData_out=(Mem_read)?D_memory[Address]:32'b0;
endmodule
