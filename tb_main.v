module tb_main;
integer i;
//alu_tb
reg [2:0]opcode;
reg [7:0]A,B;
wire [7:0]alu_out;
alu DUT(opcode,A,B,alu_out);
//reg_tb
reg [1:0]addr;
reg rd;
reg wr;
reg [7:0]data_in;
wire [7:0]data_out;
registers RegUT(addr,rd,wr,data_in,data_out);

initial
begin
$monitor ($time," A=%d, B=%d,alu_out=%d,sel=%d,data=%d",A,B,alu_out,addr,data_out);
    #5 #5 addr=2'b00; wr=1; data_in=8'h03;
    #5 wr=0; 
    #5 #5 addr=2'b01; wr=1; data_in=8'h02;
    #5 wr=0; 
    #5 addr=2'b00; rd=1;
    #5 A=data_out;
    #5 addr=2'b01; rd=1;
    #5 B=data_out; 
    
    #5 opcode=3'b000;
    #5 opcode=3'b001;

#5 $finish;
end
endmodule