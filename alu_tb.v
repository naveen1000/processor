module alu_tb;
reg [2:0]opcode;
reg [7:0]A,B;
wire [7:0]alu_out;
integer i;
alu DUT(opcode,A,B,alu_out);
initial
begin
$monitor ($time," A=%d, B=%d,out=%d",A,B,alu_out);
    for (i=0; i<8; i=i+1)
    begin
    #5 A=8'h02; B=8'h01; opcode=i;
    end
#5 $finish;
end
endmodule