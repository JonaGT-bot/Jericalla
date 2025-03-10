
module RAM(
	input [3:0] DirRam, //Direccion
	input [31:0] DatoIn, //Dato de Escritura
	input EN,
	output reg [31:0] DS //Dato de lectura
);

reg [31:0]mem[0:15]; //Memoria
always @(*)
	begin
	if(EN) begin
		mem[DirRam] = DatoIn; //Escribimos si EN es 1
	end
	else begin
		DS = mem[DirRam]; //Leemos si EN es 0
	end
	end
endmodule

