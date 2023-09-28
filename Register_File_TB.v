`timescale 1ns/1ps
module reg_tb #(parameter width = 16 , parameter depth = 8 ) ();

reg  [ width-1 :0 ] WrData_TB;
reg  [2:0] Address_TB;
reg  WrEn_TB;
reg  RdEn_TB;
reg  CLK_TB;
reg  RST_TB;
wire [ width-1 :0 ] RdData_TB;

always #5 CLK_TB=~CLK_TB;


Register_File DUT (
.WrData 	(WrData_TB),
.Address	(Address_TB),
.WrEn   	(WrEn_TB),
.RdEn   	(RdEn_TB),
.CLK   		(CLK_TB),
.RST  		(RST_TB),
.RdData 	(RdData_TB)
);


initial
	begin
		CLK_TB	 	=1'b0;
		RST_TB	  	=1'b1;
		Address_TB	=3'b000;
		WrData_TB	='d0;
		WrEn_TB	 	=1'b0;
		RdEn_TB	 	=1'b0;
		
		#10
		$display("TEST WRITE ON ADDRESS = 2 WITH THE VALUE 14d AND READ ALSO "); // i can't test the write function without seeing the output of the regFile :(
		Address_TB  =3'b010;
		WrEn_TB	 	=1'b1;
		WrData_TB	='d14;
		#10 
		WrEn_TB	 	=1'b0;
		RdEn_TB	 	=1'b1;
		#10
		if(RdData_TB=='d14 )
			$display("Test is passed " );
		else
			$display("Test is failed " );
		
		$display("SECOND TEST ON ADDRESS = 3 WITH THE VALUE 6 ");
		Address_TB  =3'b011;
		WrEn_TB	 	=1'b1;
		RdEn_TB	 	=1'b0;
		WrData_TB	='d6;
		#10
		WrEn_TB	 	=1'b0;
		RdEn_TB	 	=1'b1;
		#10
		if(RdData_TB=='d6 )
			$display("Test is passed " );
		else
			$display("Test is failed " );
		
		
		$display("TEST OF RST " );
		RST_TB = 1'b0;
		#5
		RST_TB = 1'b1;
		#2
		if(RdData_TB == 'd0)
			$display("The test is passed" );
		else
			$display("Test is failed " );
		

		#150
		
		$stop;
	end
endmodule


