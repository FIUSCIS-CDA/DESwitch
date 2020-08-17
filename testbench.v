module testbench();

reg clk, reset, D, E;
wire Q;

localparam CLK_PERIOD=20;

always @*
begin
   clk <= 0;  # (CLK_PERIOD/2);
   clk <= 1;  # (CLK_PERIOD/2);
end

DESwitch myRegister(reset, clk, D, E, Q);

initial begin
reset=1;  #CLK_PERIOD;
reset=0;D=1;E=0; #(CLK_PERIOD/4);
if (Q !== 0) begin
   $display("Error: Register changed on falling edge"); $stop;
end
#(CLK_PERIOD/2);
if (Q !== 0) begin
   $display("Error: Register changed with enable signal off"); $stop;
end
#(CLK_PERIOD/4);
E=1; #(CLK_PERIOD/4);
if (Q !== 0) begin
   $display("Error: Register changed on falling edge"); $stop;
end
#(CLK_PERIOD/2);
if (Q !== D) begin
   $display("Error: Register did not change with enable signal on"); $stop;
end
$display("All tests passed.");
end

endmodule