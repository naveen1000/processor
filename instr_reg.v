module inst_reg(
    input [1:0]pc,
    input en,
    output [16:0]ir_data);

//mem_tb
reg [1:0]maddr;
reg mrd;
wire [16:0]data;
memory MemUT(maddr,mrd,data);
initial
begin
//$monitor ($time," addr=%d, data=%b ",maddr,data);
maddr=2'b00; mrd=1;
end
assign ir_data =data;

endmodule 