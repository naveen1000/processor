
module registers(
    input[1:0]addr,
    input rd,wr,
    input [7:0]data_in,
    output reg [7:0]data_out);
    
reg [7:0] r[0:3];
always @(*)
begin
    if(wr)
        r[addr]=data_in;
end
always @(*)
begin
    if(rd)
        data_out=r[addr];
end

//assign data_out=r[addr];

endmodule // register ram module
