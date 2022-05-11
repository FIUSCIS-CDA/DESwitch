// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed May 11 10:42:35 2022"

module DESwitch(
	E,
	D,
	clk,
	reset,
	Q
);


input wire	E;
input wire	D;
input wire	clk;
input wire	reset;
output wire	Q;

wire	DEclk;
wire	NOTclk;
wire	NOTE;
wire	NOTreset;
wire	NOTresetANDQprime;
wire	QAND___NOTclk___;
wire	QAND___notE___;
wire	Qprime;




assign	NOTreset =  ~reset;

assign	NOTresetANDQprime = NOTreset & Qprime;

assign	Qprime = QAND___NOTclk___ | QAND___notE___ | DEclk;

assign	DEclk = clk & E & D;

assign	NOTclk =  ~clk;

assign	NOTE =  ~E;

assign	QAND___NOTclk___ = NOTclk & NOTresetANDQprime;

assign	QAND___notE___ = NOTE & NOTresetANDQprime;

assign	Q = NOTresetANDQprime;

endmodule
