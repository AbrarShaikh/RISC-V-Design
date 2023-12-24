//TOP MODULE
module alu_v(
    input [3:0] a,b,
    input [2:0] SL,
    output[7:0] out
  );

reg [7:0] an;
reg [3:0] q,r;

assign out = an; 

always@(*)  
case(SL)
   0 :  begin
          an = a + b;
          end
   1 :  begin
         an =  a - b;
         end
   2 : begin 
         an = a * b;  
        end  
   3 : begin
        q = a / b;
        r = a % b;
        an = {q,r};
        #4;
        q = 4'bxxxx;
        r = 4'bxxxx;
        end
   4 : begin 
         an = a | b;  
        end 
   5 : begin 
         an = a & b;  
        end  
   6 : begin 
         an = a ^ b;  
        end  
   7 : begin 
         an = a << b;
         #2.5;
         an = a >> b;
        end       
endcase

endmodule