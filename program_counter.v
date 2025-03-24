//PROGRAMM COUNTER

module Program_counter(clk,reset,pc_in,pc_out);
input clk,reset;
input  [31:0]pc_in;
output reg [31:0]pc_out;
always@(posedge clk)
begin
if(reset)
pc_out<=32'b00;
else
pc_out<=pc_in;
end
endmodule
