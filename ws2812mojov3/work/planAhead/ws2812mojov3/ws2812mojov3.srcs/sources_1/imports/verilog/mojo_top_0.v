
module mojo_top_0(
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
    
    output io
    );

wire rst = ~rst_n; // make reset active high

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

assign led = 8'b0;
reg artic;
//assign io = clk;
reg color [24:1];
send_bit_1 send_bit(.bit(1),.clk(clk),.articuno(arti));
assign io = arti;
//send_color send_color(.color(color),.clk(clk),.zapdos(artic));
endmodule


module send_bit_0(
input bit,
input clk,
output reg articuno
);

reg [6:0] p = 7'd0;

always @(posedge clk) begin

    if(bit==0) begin
        if(p < 20) begin
            articuno = 1;
        end
        if(p >= 20) begin
            articuno = 0;
        end
    end
    if(bit==1) begin
        if(p < 40) begin
            articuno = 1;
        end
        if(p >= 40) begin
            articuno = 0;
        end
    end

  p = p + 1;

  if(p == 62) begin
      p = 0;
  end

end

endmodule

module send_color_0(
input [23:0] color,
input clk,
output wire zapdos
);
reg [5:0] index = 5'd24;
send_bit_1 send_bit(.bit(color[index]),.clk(clk),.articuno(zapdos));
always @(negedge zapdos) begin
  index = index + 1;
  if(index == 23) begin
    index = 0;
  end
end

endmodule
