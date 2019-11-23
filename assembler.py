codes={
    "ADD": "0000", 
    "SUB": "0001",
    "AND": "0010",
    "OR" : "0011",
    "XOR": "0100",
    "INV": "0101",
    "SHL": "0110",
    "MOV": "0111",
    "LDI": "1000",
    "JZ" : "1001",
    "INC": "1010",
    "DEC": "1011",
    "HLT": "1100",
    "JC" : "1101",
    "JNZ": "1110",
    "JMP": "1111",
    "R0" : "0000", 
    "R1" : "0001", 
    "R2" : "0010", 
    "R3" : "0011",
}
f = open("machine_code.mem", "w")
lines = [line.rstrip('\n') for line in open('assembly_code.txt')]
print(lines)
for line in lines:
    keys=line.split(" ")
    print(keys)
    s=""
    for i in keys:
        p=codes.get(i)
        if(codes.get(i)==None):
            if(i.isnumeric()):
                p="{:04b}".format(int(i))
        s=s+str(p)+"_"
    print(s)
    f.write(s+"\n")
f.close()
