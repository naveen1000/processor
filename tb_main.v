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
//IR_tb
reg [7:0]pc;
reg en;
wire [15:0]ir_data;
inst_reg IUT(pc,en,ir_data);


initial
begin
$monitor ($time," A=%d, B=%d,alu_out=%d,sel=%d,ir_data=%b",A,B,alu_out,addr,ir_data);
    for (i=0; i<11; i=i+1)
    begin
        #5 pc=i;en=1;
        #5 $display("%b",ir_data[15:12]);
        if(ir_data[15:12]==4'b1000) //load 
        begin
            addr=ir_data[9:8]; wr=1; data_in=ir_data[7:0];
            #5 wr=0;
        end
        if(ir_data[15:12]==4'b0000) //add
        begin
        addr=ir_data[5:4]; rd=1;
        #5 A=data_out;
        addr=ir_data[1:0]; rd=1;
        #5 B=data_out;
        #5 $display("opcode=%b",ir_data[15:13]);
        #5 opcode = ir_data[15:13];
        $display("add executed");
        #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
        #5 wr=0; 
        end
        if(ir_data[15:12]==4'b0001) //sub
        begin
        addr=ir_data[5:4]; rd=1;
        #5 A=data_out;
        addr=ir_data[1:0]; rd=1;
        #5 B=data_out;
        #5 $display("opcode=%b",ir_data[14:12]);
        #5 opcode = ir_data[14:12];
        $display("sub executed");
        #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
        #5 wr=0; 
        end


    end

#5 $finish;
end
endmodule