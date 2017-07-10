module datapacktest ();
    reg clk;
    reg slowclk;
    reg [23:0] data;
    reg rst;
    wire globalout;
  
  datapack DUT(
    .clk(clk),
    .slowclk(slowclk),
    .data(data),
    .rst(rst),
    .globalout(globalout)
  );
  
  always begin
    #1 clk = ~clk;
  end  
  
  initial begin
    slowclk = 0;
    //Note that this is a string that just goes 1010....
    data = 24'b101010101010101010101010;
    rst = 1'b0;
    #1 slowclk = 1;
    #1 slowclk = 0;
    //We want to test that the output data will be of the form 0,1,0,1,...
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    #30 globalout = 0;
    #32
    #30 globalout = 1;
    #32 
    //Test 24'b0
    data = 24'b0;
    #1 slowclk = 1;
    #1 slowclk = 0;
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    #30 globalout = 0;
    #32
    data = 24'b111111111111111111111111;
    #1 slowclk = 1;
    #1 slowclk = 0;
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    #30 globalout = 1;
    #32 
    //Testing that the reset functionality works
    data = 24'b101010101010101010101010;
    rst = 1'b1;
    #1 slowclk = 1;
    #1 slowclk = 0;
    //Note that we need to have 50us of delay here.
    #100 globalout = 0;
    #1000 globalout = 0;
    #2000 globalout = 0;
    #2490 globalout = 0;
  
    $finish;
   end
  
endmodule
