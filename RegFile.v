module Register_File #(parameter width = 16 , parameter depth = 8 ) 
(
input wire [ width-1 :0 ] WrData,
input wire [2:0] Address,
input wire  WrEn,
input wire  RdEn,
input wire  CLK,
input wire  RST,
output reg [ width-1 :0 ] RdData
);
reg [width-1 :0 ] RegFile [depth-1:0];

always@(posedge CLK or negedge RST)
 begin
	if(!RST)
		begin
			RegFile[0] <= 'd0;
			RegFile[1] <= 'd0;
			RegFile[2] <= 'd0;
			RegFile[3] <= 'd0;
			RegFile[4] <= 'd0;
			RegFile[5] <= 'd0;
			RegFile[6] <= 'd0;
			RegFile[7] <= 'd0;
		end
	else
		begin
			if(WrEn && !RdEn)
				begin
					RegFile[Address] <= WrData;
				end
			else if (RdEn && !WrEn)
				begin
					RdData <= RegFile[Address];
				end
		end
 end
 
 endmodule