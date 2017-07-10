module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full
    output ws2812out //output pin P51 for ws2812 strip
    );

wire rst = ~rst_n; // make reset active high
//globalout is the output to the pin for driving the led strip
reg globalout;
// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

assign led = 8'b0;
assign ws2812out = globalout;
endmodule



module write(
    //50Mhz clock input 
    input clk,
    input rst,
    input value,
    output out
);





endmodule



module datapack(
    //50Mhz clock input
    input clk,
    input slowclk,
    input[23:0] data,
    input rst,
    output globalout
);

reg [4:0] index = 5'b00000;

always @(posedge slowclk)
begin
  //We want to select from the data array the rightmost element initially
  if(index<5'b11000 && ~rst) 
  begin
    writeable write(.clk(clk), .rst(1'b0),.value(data[index]),.out(globalout));
    index[4:0] <= index[4:0] + 5'b1;
  end

  if(index<5'b11000 && rst) 
  begin
    index <= 5'b0;
    writeable write(.clk(clk), .rst(1'b1), .value(1'b0), .out(globalout)); 
  end
  if(index == 5'b11000 && ~rst) index <= 5'b00000;
  if(index == 5'b11000 && rst) 
  begin
    index <= 5'b00000;
    //We must have 
    writeable write(.clk(clk), .rst(1'b1), .value(1'b0), .out(globalout));
  end
end
endmodule






module slowclock(
    //50Mhz clock input
    input clk,
    //800Khz clock correstponding to sending another bit to LED Strip
    output slowclk
);

reg[7:0] counter;
//When counter == 63 increment slowclock
always @(posedge clk)
begin
  
end

endmodule


