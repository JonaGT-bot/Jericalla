
module ROM(
	input [3:0] Dir1Rom, //Direccion
	input [3:0] Dir2Rom, //Direccion
	output reg [31:0] DatoL1, //Dato de lectura
	output reg [31:0] DatoL2 //Dato de lectura
);

reg [31:0]mem[0:15]; //Memoria

initial
begin  
	#100;
	$readmemb("datos", inst.mem); //Leer en binario
end 

always @(*)
begin
	DatoL1 = mem[Dir1Rom];
	DatoL2 = mem[Dir2Rom];
end
endmodule
