module tb_alu;
//Inputs
 reg[3:0] A,B;
 reg[2:0] ALU_Sel;

//Outputs
 wire[7:0] ALU_Out;
 // Verilog code for ALU
 integer i;
 alu_v test_unit(
            .a(A),.b(B),  // ALU 4-bit Inputs                 
            .SL(ALU_Sel),// ALU Selection
            .out(ALU_Out) // ALU 8-bit Output
     );

initial begin
  $dumpfile("waveform_alu.vcd");
  $dumpvars(0,tb_alu );
    // hold reset state for 5 ns.
      A = 4'hB;
      B = 4'h3;
      ALU_Sel = 2'b00;
      
      for (i=0;i<8;i=i+1)
      begin
        #5;
        ALU_Sel = ALU_Sel + 1'b1;
      end;
      
    end
endmodule