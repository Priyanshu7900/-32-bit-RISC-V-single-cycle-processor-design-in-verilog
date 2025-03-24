//ADDER TO THE PROGRAMM COUNTER ADDRESS PCADDRESS->PCADDRESS+4

module Pcadder(fromPC,nexttoPC);
input [31:0]fromPC;
output [31:0]nexttoPC;
assign nexttoPC=fromPC +3'd4;
endmodule
