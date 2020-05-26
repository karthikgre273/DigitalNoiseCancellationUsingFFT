//`include "DW02_mult_2_stage.v"
module Butterfly(input lastStageFlag,input clock,reset,pushin,output reg pushout,
input real ReIp1,ReIp2,CmpIp1,CmpIp2,
input real twiddleFactorReal,twiddleFactorComplx,
input [8:0] stateIp1,stateIp2,
output real  ReOp1,ReOp2,CmpOp1,CmpOp2,
output reg [8:0] stateOp1,stateOp2,output reg lastStageFlagOp);
real M1,M2,M3,M4;
real S1,S2;


real twiddleFactorReal_1d,twiddleFactorComplx_1d;

real M1_d,M2_d,M3_d,M4_d;
real S1_d,S2_d;

real  ReOp1_d,ReOp2_d,CmpOp1_d,CmpOp2_d;
real  ReOp1_2d,CmpOp1_2d;
real  ReOp1_3d,CmpOp1_3d;
real ReOp2_2d,CmpOp2_2d;

reg lastStageFlag1,lastStageFlag2,lastStageFlag3;

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
		pushout<=0;
		ReOp1_2d<=0;
		CmpOp1_2d<=0;
		stateIp1_2d<=0;
		stateIp2_2d<=0;
		pushin_2d<=0;
		ReOp1_3d<=0;
		CmpOp1_3d<=0;
		M1<=0;
		M2<=0;
		M3<=0;
		M4<=0;
 	 end 
 	 else begin
		if(pushin) begin
			stateIp1_d<=#1 stateIp1;
			stateIp2_d<=#1 stateIp2;
			pushin_d<= #1 pushin;
			lastStageFlag1<=#1 lastStageFlag;			
			
			twiddleFactorReal_1d<=#1 twiddleFactorReal;
			twiddleFactorComplx_1d<=#1 twiddleFactorComplx;
			ReOp1_2d<=#1 ReOp1_d;
			ReOp2_2d<=#1 ReOp2_d;
			CmpOp1_2d<=#1 CmpOp1_d;
			CmpOp2_2d<=#1 CmpOp2_d;
		end
		if(pushin_d) begin
			stateIp1_2d<=#1 stateIp1_d;
			stateIp2_2d<=#1 stateIp2_d;
			pushin_2d<= #1 pushin_d;
			lastStageFlag2<=#1 lastStageFlag1;			
			
			ReOp1_3d<=#1 ReOp1_2d;
			CmpOp1_3d<=#1 CmpOp1_2d;
			M1<=#1 M1_d;
			M2<=#1 M2_d;
			M3<=#1 M3_d;
			M4<=#1 M4_d;
		end
		if(pushin_2d) begin			
			stateOp1<=#1 stateIp1_2d;
			stateOp2<=#1 stateIp2_2d;
			pushout<=#1 pushin_2d;
			lastStageFlagOp<=#1 lastStageFlag2;
			
			ReOp1<=#1 ReOp1_3d;
			CmpOp1<=#1 CmpOp1_3d;
			ReOp2<=#1 S1_d;
			CmpOp2<=#1 S2_d;
		end
 	 end
  end

  //pipeline stage 2    
  
always@(*) begin
	if(reset) begin
		ReOp1_d<=0;
		ReOp2_d<=0;
		CmpOp1_d<=0;
		CmpOp2_d<=0;
		
		M1_d=0;
		M2_d=0;
		M3_d=0;
		M4_d=0;
		
		S1_d<=0;
		S2_d<=0;
	
	end
	
	else begin
		ReOp1_d<=ReIp1+ReIp2;
		ReOp2_d<=ReIp1-ReIp2;
		CmpOp1_d<=CmpIp1+CmpIp2;
		CmpOp2_d<=CmpIp1-CmpIp2;
		
		M1_d=ReOp2_2d*twiddleFactorReal_1d;
		M2_d=ReOp2_2d*twiddleFactorComplx_1d;
		M3_d=CmpOp2_2d*twiddleFactorReal_1d;
		M4_d=CmpOp2_2d*twiddleFactorComplx_1d;
		
		S1_d<=M1-M4;
		S2_d<=M2+M3; 
	end
		
	
end

endmodule

