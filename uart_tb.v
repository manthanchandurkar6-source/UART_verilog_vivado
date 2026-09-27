`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2026 07:53:41 PM
// Design Name: 
// Module Name: uart_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_tb();
reg clk, rst, write, rx;
reg [7:0] data_in;
wire [7:0] data_out;
wire done, tx;

uart_top uut (.clk(clk), .rst(rst), .write(write), .rx(tx), .data_in(data_in), .tx(tx), .data_out(data_out), .done(done));

initial 
begin
clk = 1'b0;
forever #10 clk = ~clk;
end


initial
begin
rst = 1'b1;
write = 1'b0;

#100;
rst = 1'b0;
#100;

data_in = 8'hA5;
write = 1'b1;
#20;
write = 1'b0;
wait (done);
#1000;

data_in = 8'hC3;
write = 1'b1;
#20;
write = 1'b0;
wait(done);
#1000;
    
data_in = 8'hE2;
write = 1'b1;
#20;
write = 1'b0;
wait (done);
#1000;

data_in = 8'hC7;
write = 1'b1;
#20;
write = 1'b0;
wait (done); 
#1000;
    
data_in = 8'hA2;
write = 1'b1;
#20;
write = 1'b0;
wait (done);
#1000;


data_in = 8'hB6;
write = 1'b1;
#20;
write = 1'b0;
wait (done); 
#1000;    

#500000 $finish;

end

endmodule
