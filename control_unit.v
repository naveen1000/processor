module control_unit(
    input [15:0]ir_data,
    input cy,zero,alu_out,
    input [8:0]data_out,
    output reg A,B,
    output reg [2:0]addr,
    output reg  [8:0]data_in,
    output reg wr,rd,
    output reg [2:0]opcode   
);
always @(ir_data) 
begin
    case(ir_data[15:12])
        4'b1000: //load 
            begin
                addr=ir_data[9:8]; wr=1; data_in=ir_data[7:0];
                #5 wr=0;$display("ld executed");
            end
        4'b0000: //add
            begin
            addr=ir_data[5:4]; rd=1;
            #5 A=data_out;
            addr=ir_data[1:0]; rd=1;
            #5 B=data_out;
            #5 opcode = ir_data[15:13];
            $display("add executed");
            #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
            #5 wr=0; 
            #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
            #5 wr=0; 
            end


    endcase
end
endmodule // 