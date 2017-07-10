module writetest();
  reg clk;
  reg rst;
  reg value;
  wire out;
   
  write DUT (
    .clk(clk),
    .rst(rst),
    .value(value),
    .out(out)
  );
   
  always begin
    #1 clk = ~clk;
  end  
   
  initial begin
    //Initially the value is set to zero with reset 0
    rst = 0;
    value = 0;
    #1 out = 1;
    #20 out = 0;
    #43
    
    //The value is set to one with reset 0
    
    rst = 0;
    value = 1;
    #1 out = 1;
    #45 out = 0;
    #20
    
    //The reset value is 1 with value being either case
    //Note that at 50Mhz that 50us is 50*50 = 2500 clock cycles. We test every 100
    rst = 1;
    value = 0;
    #1 out = 0;
    #100 out = 0;
    #200 out = 0;
    #300 out = 0;
    #400 out = 0;
    #500 out = 0;
    #600 out = 0;
    #700 out = 0;
    #800 out = 0;
    #900 out = 0;
    #1000 out = 0;
    #1100 out = 0;
    #1200 out = 0;
    #1300 out = 0;
    #1400 out = 0;
    #1500 out = 0;
    #1600 out = 0;
    #1700 out = 0;
    #1800 out = 0;
    #1900 out = 0;
    #2000 out = 0;
    #2100 out = 0;
    #2200 out = 0;
    #2300 out = 0;
    #2400 out = 0;
    #2500 out = 0;
    
    rst = 1;
    value = 1;
    #1 out = 0;
    #100 out = 0;
    #200 out = 0;
    #300 out = 0;
    #400 out = 0;
    #500 out = 0;
    #600 out = 0;
    #700 out = 0;
    #800 out = 0;
    #900 out = 0;
    #1000 out = 0;
    #1100 out = 0;
    #1200 out = 0;
    #1300 out = 0;
    #1400 out = 0;
    #1500 out = 0;
    #1600 out = 0;
    #1700 out = 0;
    #1800 out = 0;
    #1900 out = 0;
    #2000 out = 0;
    #2100 out = 0;
    #2200 out = 0;
    #2300 out = 0;
    #2400 out = 0;
    #2500 out = 0;
    
    
    $finish;
  end
  
endmodule