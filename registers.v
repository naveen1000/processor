
module registers(
    input[1:0]sel,
    output [7:0]data);

reg [7:0] r[0:3];
    initial 
    begin
    r[0]=8'h02; r[1]=8'h01;
    r[2]=8'h02; r[3]=8'h01;
end

assign data=r[sel];

endmodule // registers
