module registers_tb;
    reg [1:0]sel;
    wire [7:0]data;
    integer i;

registers RegUT(sel,data);

initial
begin
$monitor ($time," sel=%d, data=%d",sel,data);
    for (i=0; i<4; i=i+1)
    begin
    #5 sel=i; 
    end
#5 $finish;
end
endmodule