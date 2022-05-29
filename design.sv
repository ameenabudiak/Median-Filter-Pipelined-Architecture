module pipeline(median,A,B,C,D,E,F,G,H,I);
output[7:0] median;
  input [7:0] A,B,C,D,E,F,G,H,I;


reg [7:0] l13_x1,l12_x2,l13_x3,l12_x4,l13_x5,l12_x6; //STAGE ONE REGISTERS

reg [7:0] l23_x1,l24_x2,l23_x3,l24_x4,l23_x5,l25_x6; //STAGE TWO REGISTERS

reg [7:0] l34_x1,l34_x2,l34_x3,l34_x4,l35_x5,l35_x6; //STAGE THREE REGISTERS

reg [7:0] l46_x1,l45_x2,l46_x3,l45_x4,l45_x5; //STAGE FOUR REGISTERS

reg [7:0] l56_x1,l56_x2,l58_x3; //STAGE FIVE REGISTERS

reg [7:0] l67_x1,l67_x2; //STAGE SIX REGISTERS

reg [7:0] l79_x1,l78_x2; //STAGE SEVEN REGISTERS

reg [7:0] l89_x1; //STAGE EIGHT REGISTER

reg [7:0] l9_median;  //FINAL ANSWER

assign  median= l9_median;


  always @ (A or B or C or D or E or F or G or H or I )
begin
 
if(A>B)
begin 
l13_x1<=A;
l12_x2<=B;
end
else
begin
l13_x1<=B;
l12_x2<=A;
end

  
if(D>E)
begin
l13_x3<=D;
l12_x4<=E;
end
else                                //STAGE 1
begin
l13_x3<=E;
l12_x4<=D;
end


if(G>H)
begin
l13_x5<=G;
l12_x6<=H;
end
else
begin
l13_x5<=H;
l12_x6<=G;
end
  
end  

always @ (A or B or C or D or E or F or G or H or I )
  begin
    
if(C<l12_x2)
begin
l23_x1=l12_x2;
  
l24_x2=C;
end
    
else
  
begin
l23_x1=C;
  
l24_x2=l12_x2;
end


if(F<l12_x4)
begin
l24_x4=F; 
l23_x3=l12_x4;
  
                     //STAGE 2
end
else
begin
l23_x3<=F;
  
l24_x4=l12_x4;
end


if(I<l12_x6)
begin
l23_x5=l12_x6;
  
l25_x6=I;
end
else
begin
l23_x5<=I;
l25_x6<=l12_x6;
end

end
  
 always @(A or B or C or D or E or F or G or H or I)
begin

if(l13_x1>l23_x1)
begin
l34_x1<=l13_x1;
l34_x2<=l23_x1;
end
else
begin
l34_x1<=l23_x1;
l34_x2<=l13_x1;
end


if(l13_x3>l23_x3)
begin
l34_x3<=l13_x3;
l34_x4<=l23_x3;
end
else                        //STAGE 3
begin
l34_x3<=l23_x3;
l34_x4<=l13_x3;
end


if(l13_x5>l23_x5)
begin
l35_x5<=l13_x5;
l35_x6<=l23_x5;
end
else
begin
l35_x5<=l23_x5;
l35_x6<=l13_x5;
end

end




always @(A or B or C or D or E or F or G or H or I)
begin

if(l24_x2>l24_x4)
begin
l46_x1<=l24_x2;
l45_x2<=l24_x4;
end
else
begin
l46_x1<=l24_x4;
l45_x2<=l24_x2;
end


if(l34_x2>l34_x4)
begin
l46_x3<=l34_x2;
l45_x4<=l34_x4;
end                         //STAGE 4
else
begin
l46_x3<=l34_x2;
l45_x4<=l34_x4;
end


if(l34_x1>l34_x3)
begin
l45_x5<=l34_x3;
end
else
begin
l45_x5<=l34_x1;
end

end



always @(A or B or C or D or E or F or G or H or I)
begin
if(l45_x2>l25_x6)
begin
l56_x1<=l45_x2;
end
else
begin
l56_x1<=l25_x6;
end


if(l45_x4>l35_x6)
begin
l56_x2<=l45_x4;
end
else
begin
l56_x2<=l35_x6;           //STAGE 5
end


if(l45_x5>l35_x5)
begin
l58_x3<=l35_x5;
end
else
begin
l58_x3<=l45_x5;
end

end



always @(A or B or C or D or E or F or G or H or I)
begin

if(l46_x1>l56_x1)
begin
l67_x1<=l46_x1;
end
else
begin
l67_x1<=l56_x1;
end
                         //STAGE 6

if(l46_x3>l56_x2)
begin
l67_x2<=l56_x2;
end
else
begin
l67_x2<=l46_x3;
end

end

always @(A or B or C or D or E or F or G or H or I)
begin
if(l67_x1>l67_x2)
begin
l79_x1<=l67_x1;
l78_x2<=l67_x2;
end				//STAGE 7
else
begin
l79_x1<=l67_x2;
l78_x2<=l67_x1;
end

end



always @ (A or B or C or D or E or F or G or H or I)
begin
if(l78_x2>l58_x3)
begin
l89_x1<=l78_x2;
end
else				//STAGE 8
begin
l89_x1<=l58_x3;
end

end



always @ (A or B or C or D or E or F or G or H or I)
begin
if(l79_x1>l89_x1)
begin
l9_median<=l89_x1;
end
else				//STAGE 9
begin
l9_median<=l79_x1;
end

end
 
endmodule
