module inst_reg(
    input [1:0]pc,
    input en,
    output [16:0]ir_data);


memory MemUT(pc,en,ir_data);

endmodule 