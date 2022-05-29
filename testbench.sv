
module tb;
  reg [7:0] A,B,C,D,E,F,G,H,I;
  wire [7:0] median;
 
  
  pipeline pipeline1(median,A,B,C,D,E,F,G,H,I);
  
  initial 
    begin
      
        $dumpfile("dump.vcd");
  $dumpvars;

      
      
      A=8'b00110001;
      B=8'b00001001;
      C=8'b01010101;
      D=8'b10101011;
      E=8'b00110011;
      F=8'b00000001;
      G=8'b01111111;
      H=8'b01101101;
      I=8'b00101010;
      #1 $display("%d,%d,%d,%d,%d,%d,%d,%d,%d,median is %d",A,B,C,D,E,F,G,H,I,median);
                  
    end        
endmodule
