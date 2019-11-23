module control_unit_tb;
    reg [15:0]ir_data;
    wire [2:0]addr;
    wire [8:0]data_in;
    wire [8:0]data_out;
    wire wr,rd;
    wire [2:0]opcode;
control_unit CUT(ir_data,cy,zero,alu_out,data_out ,A,B,addr,data_in,wr,rd,opcode);
initial
begin
    $monitor ($time,"opcode=%d,rd=%d, wr=%d,data_in=%d,addr=%d,ir_data=%b",opcode,rd,wr,data_in,addr,ir_data);
        
     #5 ir_data=16'b1000_0000_0000_0001;   
#5 $finish;
end
endmodule