module tb_main;
integer i;
reg [2:0]opcode;
reg [7:0]A,B;
wire [7:0]alu_out;
alu DUT(opcode,A,B,alu_out);

reg [1:0]sel;
wire [7:0]data;
registers RegUT(sel,data);

initial
begin
$monitor ($time," A=%d, B=%d,out=%d,sel=%d,data=%d",A,B,alu_out,sel,data);
    #5 sel=2'b00;
    #5 A=data;
    #5 sel=2'b01;
    #5 B=data;  
    #5 opcode=3'b000;
    #5 opcode=3'b001;
#5 $finish;
end
endmodule