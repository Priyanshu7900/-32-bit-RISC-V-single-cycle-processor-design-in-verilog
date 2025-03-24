//Instantiation of all modules here

module top(clk,reset);
input clk,reset;
wire[31:0]PC_top,instruction_top,Rd1_top,Rd2_top,Immext_top,mux1_top,Sum_out_top,NexttoPC_top,PCin_top,
address_top,Memdata_top,Writeback_top;
wire Regwrite_top,ALUsrc_top,zero_top,branch_top ,sel2_top,MemtoReg_top,Memwrite_top,Memread_top;
wire [1:0] ALUop_top;
wire [3:0]control_top;

//Program counter
Program_counter PC1(.clk(clk),.reset(reset),.pc_in(PCin_top),.pc_out(Pc_top));

//PC adder
Pcadder PCadd1(.fromPC(PC_top),.nexttoPC(NexttoPC_top));

//Instruction Memory
Instruction_memory instr_mem1(.clk(clk),.reset(reset),.read_address(PC_top),.instruction_out(instruction_top));

//Register file
Reg_file Regfile1(.clk(clk),.reset(reset),.Rs1(instruction_top[19:15]),.Rs2(instruction_top[24:20]),.Rd(instruction_top[11:7]),
.Register_write(Regwrite_top),.WriteData(Writeback_top),.read_data1(Rd1_top),.read_data2(Rd2_top));

//ImmGen
ImmGen Immgen1(.Opcode(instruction_top[6:0]),.instruction(instruction_top),.ImmExt(Immext_top));

//ControlUnit
Control_Unit Ctrl1(.Instruction(instruction_top[6:0]),.Branch(branch_top),.MemRead(Memread_top),.MemtoReg(MemtoReg_top),.ALUOp(ALUop_top),.MemWrite(Memwrite_top),.ALUSrc(ALUsrc_top),.RegWrite(Regwrite_top));

//Alu control
ALUcontrol aluctrl1(.ALUop(ALUop_top),.fun7(instruction_top[30]),.fun3(instruction_top[14:12]),.Control_out(control_top));

//ALU
ALU_unit ALU1(.A(Rd1_top),.B(mux1_top),.Control_in(control_top),.ALU_result(address_top),.zero(zero_top));

//ALU_mux
Mux1 ALU_mux1(.sel1(ALUsrc_top),.A1(Rd2_top),.B1(Immext_top),.Mux1_out(mux1_top));

//Adder
Adder adder1(.in1(PC_top),.in2(Immext_top),.sum(Sum_out_top));


//AND gate
And_logic and1(.branch(branch_top) ,.zero(zero_top),.and_out(sel2_top));

// Mux
Mux2  adder_mux1(.sel2(sel2_top),.A2(NexttoPC_top),.B2(Sum_out_top),.Mux2_out(PCin_top));

//Data memory
Datamemmory datamem1(.clk(clk),.reset(reset),.Address(address_top),.Write_data(Rd2_top),.Mem_write(Memwrite_top),.Mem_read(Memread_top),.MemData_out(Memdata_top));

//Mux
Mux3 memory_mux1(.sel3(MemtoReg_top),.A3(address_top),.B3(Memdata_top),.Mux3_out(Writeback_top));
endmodule
