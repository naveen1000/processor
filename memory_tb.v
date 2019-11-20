module memory_tb;
    reg [1:0]addr;
    reg rd;
    wire [16:0]data;
    integer i;

memory RegUT(addr,rd,data);

initial
begin
$monitor ($time," addr=%d, data=%b ",addr,data);
    
    #5 addr=2'b00; rd=1; 
    #5 addr=2'b01; rd=1;   
    #5 addr=2'b10; rd=1; 
    #5 addr=2'b11; rd=1; 

#5 $finish;
end
endmodule