module slowclocktest ();
  reg clk;
  wire slowclk;
  
  
  slowclock DUT(
    .clk(clk),
    .slowclk(slowclk)
  );
  
  always begin
    #1 clk = ~clk;
  end 
  
  
endmodule
