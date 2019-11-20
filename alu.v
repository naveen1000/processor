module alu(opcode,A,B,alu_out);
input [2:0]opcode;
input [7:0]A,B;
output reg [7:0]alu_out;


always @(opcode,A,B) 
begin
case(opcode)
0: alu_out <= A + B;
1: alu_out <= A - B;
2: alu_out <= A & B;
3: alu_out <= A | B;
4: alu_out <= A ^ B;
5: alu_out <= ~A;
6: alu_out <= A>>B;
7: alu_out <= 0;
default: alu_out <= 0; 
endcase
//$display($time," ALU: %b",ALUOut);
//$display($time, " Zero: %b", (ALUOut==0));
end
endmodule // alu