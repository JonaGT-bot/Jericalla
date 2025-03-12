module Jericalla(
	input [16:0] Instruccion,
	output reg [31:0] Salida,
	output reg Zflag
);
	
	wire [31:0] wire1, wire2, wire3;
	
ROM RomTB(.Dir1Rom(Instruccion [8:5]), .Dir2Rom(Instruccion [4:1]), .DatoL1(wire1), .DatoL2(wire2));
Alu AluTB(.A(wire1), .B(wire2), .op(Instruccion [12:9]), .Res(wire3), .Zflag(Zflag));
RAM RamTB(.DirRam(Instruccion [16:13]), .DatoIn(wire3), .EN(Instruccion [0]), .DS(Salida));
endmodule

module JericallaTB();

reg [16:0] InstruccionTB;
wire [31:0] SalidaTB;
wire ZflagTB;

Jericalla TestBench(.Instruccion(InstruccionTB), .Salida(SalidaTB), .Zflag(ZflagTB));

initial
begin
	//Suma
	InstruccionTB = 32'b00100010010001101;
	#100
	
	//Leer
	InstruccionTB = 32'b00100000000000000;
	#100
	
	$stop;
end
endmodule