//`include "DW02_mult_2_stage.v"
module Butterfly(input lastStageFlag,input clock,reset,pushin,output reg pushout,
input real ReIp1,ReIp2,CmpIp1,CmpIp2,
input real twiddleFactorReal,twiddleFactorComplx,
input [8:0] stateIp1,stateIp2,
output real  ReOp1,ReOp2,CmpOp1,CmpOp2,
output reg [8:0] stateOp1,stateOp2,output reg lastStageFlagOp);
real M1,M2,M3,M4;
real S1,S2;

real M1_d,M2_d,M3_d,M4_d;
real S1_d,S2_d;

real  ReOp1_d,ReOp2_d,CmpOp1_d,CmpOp2_d;

reg lastStageFlag1,lastStageFlag2,lastStageFlag3;

real CmpIp1_d,CmpIp1_2d;
real ReIp1_d,ReIp1_2d;
reg pushin_d,pushin_2d;
reg [8:0] stateIp1_d,stateIp1_2d;
reg [8:0] stateIp2_d,stateIp2_2d;

real S1_ff,S2_ff;

  //pipeline stage 1
  
  //DW02_mult_2_stage #(.A_width(30),.B_width(22)) mult1(ReIp2, twiddleFactorReal,1'b1,clock,M1);
  //DW02_mult_2_stage #(.A_width(30),.B_width(22)) mult2(ReIp2, twiddleFactorComplx,1'b1,clock,M2);
  //DW02_mult_2_stage #(.A_width(30),.B_width(22)) mult3(CmpIp2, twiddleFactorReal,1'b1,clock,M3);
  //DW02_mult_2_stage #(.A_width(30),.B_width(22)) mult4(CmpIp2, twiddleFactorComplx,1'b1,clock,M4);
  



always@(posedge clock or posedge reset) begin
  
 	 if(reset) begin
  		stateIp1_d<=0;
  		stateIp2_d<=0;
  		CmpIp1_d<=0;
  		ReIp1_d<=0;
  		pushin_d<=0;
		lastStageFlag1<=0;
		lastStageFlag2<=0;
		lastStageFlagOp<=0;
		ReOp1<= 0;
		ReOp2<= 0;
		CmpOp1<= 0;
		CmpOp2<= 0;
		stateOp1<= 0;
		stateOp2<= 0;
 	 end 
 	 else begin
		if(pushin) begin
		 //$display("karthik :",ReIp1," : ",ReIp2," : ",twiddleFactorReal, " : ",twiddleFactorComplx);
			stateIp1_d<=#1 stateIp1;
			stateIp2_d<=#1 stateIp2;
			CmpIp1_d<=#1 CmpIp1;
			ReIp1_d<=#1 ReIp1;
			pushin_d<= #1 pushin;
			lastStageFlag1<=#1 lastStageFlag;
			M1<=#1 M1_d;
			M2<=#1 M2_d;
			M3<=#1 M3_d;
			M4<=#1 M4_d;
		end
		if(pushin_d) begin
		 //$display("karthik :",ReIp1," : ",ReIp2," : ",twiddleFactorReal, " : ",twiddleFactorComplx);
			stateIp1_2d<=#1 stateIp1_d;
			stateIp2_2d<=#1 stateIp2_d;
			CmpIp1_2d<=#1 CmpIp1_d;
			ReIp1_2d<=#1 ReIp1_d;
			pushin_2d<= #1 pushin_d;
			lastStageFlag2<=#1 lastStageFlag1;
			S1<=#1 S1_d;
			S2<=#1 S2_d;
		end
		if(pushin_2d) begin
			ReOp1<=#1 ReOp1_d;
			ReOp2<=#1 ReOp2_d;
			CmpOp1<=#1 CmpOp1_d;
			CmpOp2<=#1 CmpOp2_d;
			stateOp1<=#1 stateIp1_2d;
			stateOp2<=#1 stateIp2_2d;
			pushout<=#1 pushin_2d;
			lastStageFlagOp<=#1 lastStageFlag2;
		end
 	 end
  end

  //pipeline stage 2    
  
always@(*) begin
	M1_d=ReIp2*twiddleFactorReal;
	M2_d=ReIp2*twiddleFactorComplx;
	M3_d=CmpIp2*twiddleFactorReal;
	M4_d=CmpIp2*twiddleFactorComplx;
	
	S1_d<=M1-M4;
	S2_d<=M2+M3; 
		
	ReOp1_d<=ReIp1_2d+S1;
	ReOp2_d<=ReIp1_2d-S1;
	CmpOp1_d<=CmpIp1_2d+S2;
	CmpOp2_d<=CmpIp1_2d-S2;
end

endmodule

