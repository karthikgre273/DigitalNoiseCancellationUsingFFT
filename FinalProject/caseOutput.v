`include "Butterfly.v"
module fftCalculator(input clock,reset,
input signed [19:0] realInput,imagInput, input startIn,
output reg outputFlag,
output reg signed [19:0] realOutput,imagOutput);
wire lastStageFlagOp;
reg[10:0] state;
integer i;
reg [7:0] outputAddress;
reg writeBack,lastStageFlag,computationAvailbleFlag;
reg[7:0] inputAddressCounter,reversedAddress;
reg inputDataStartFLag;
wire startFlagDetected;
reg inputBufferFlag;
reg computationFlag,OutputMemoryRightEnable;
 
reg pushinB0;
wire pushoutB0;
reg signed [29:0] realIp1B0,realIp2B0,imgIp1B0,imgIp2B0;
reg signed [21:0] twiddleFactorRealB0,twiddleFactorimgB0;
reg [11:0] stateIp1B0,stateIp2B0;
wire signed [29:0]  ReOp1B0,ReOp2B0,imgOp1B0,imgOp2B0;
wire [11:0] stateOp1B0,stateOp2B0;
 
reg pushinB1;
wire pushoutB1;
reg signed [29:0] realIp1B1,realIp2B1,imgIp1B1,imgIp2B1;
reg signed [21:0] twiddleFactorRealB1,twiddleFactorimgB1;
reg [11:0] stateIp1B1,stateIp2B1;
wire signed [29:0]  ReOp1B1,ReOp2B1,imgOp1B1,imgOp2B1;
wire [11:0] stateOp1B1,stateOp2B1;
 
reg pushinB2;
wire pushoutB2;
reg signed [29:0] realIp1B2,realIp2B2,imgIp1B2,imgIp2B2;
reg signed [21:0] twiddleFactorRealB2,twiddleFactorimgB2;
reg [11:0] stateIp1B2,stateIp2B2;
wire signed [29:0]  ReOp1B2,ReOp2B2,imgOp1B2,imgOp2B2;
wire [11:0] stateOp1B2,stateOp2B2;
 
reg pushinB3;
wire pushoutB3;
reg signed [29:0] realIp1B3,realIp2B3,imgIp1B3,imgIp2B3;
reg signed [21:0] twiddleFactorRealB3,twiddleFactorimgB3;
reg [11:0] stateIp1B3,stateIp2B3;
wire signed [29:0]  ReOp1B3,ReOp2B3,imgOp1B3,imgOp2B3;
wire [11:0] stateOp1B3,stateOp2B3;
 
reg pushinB4;
wire pushoutB4;
reg signed [29:0] realIp1B4,realIp2B4,imgIp1B4,imgIp2B4;
reg signed [21:0] twiddleFactorRealB4,twiddleFactorimgB4;
reg [11:0] stateIp1B4,stateIp2B4;
wire signed [29:0]  ReOp1B4,ReOp2B4,imgOp1B4,imgOp2B4;
wire [11:0] stateOp1B4,stateOp2B4;
 
reg pushinB5;
wire pushoutB5;
reg signed [29:0] realIp1B5,realIp2B5,imgIp1B5,imgIp2B5;
reg signed [21:0] twiddleFactorRealB5,twiddleFactorimgB5;
reg [11:0] stateIp1B5,stateIp2B5;
wire signed [29:0]  ReOp1B5,ReOp2B5,imgOp1B5,imgOp2B5;
wire [11:0] stateOp1B5,stateOp2B5;
 
reg pushinB6;
wire pushoutB6;
reg signed [29:0] realIp1B6,realIp2B6,imgIp1B6,imgIp2B6;
reg signed [21:0] twiddleFactorRealB6,twiddleFactorimgB6;
reg [11:0] stateIp1B6,stateIp2B6;
wire signed [29:0]  ReOp1B6,ReOp2B6,imgOp1B6,imgOp2B6;
wire [11:0] stateOp1B6,stateOp2B6;
 
reg pushinB7;
wire pushoutB7;
reg signed [29:0] realIp1B7,realIp2B7,imgIp1B7,imgIp2B7;
reg signed [21:0] twiddleFactorRealB7,twiddleFactorimgB7;
reg [11:0] stateIp1B7,stateIp2B7;
wire signed [29:0]  ReOp1B7,ReOp2B7,imgOp1B7,imgOp2B7;
wire [11:0] stateOp1B7,stateOp2B7;
reg signed [29:0] imagInputBuffer [0:511] , imagWorkingBuffer[0:511],imagOuptutBuff[0:511];
reg signed [29:0] realInputBuffer [0:511] , realWorkingBuffer[0:511],realOutputBuff[0:511];
reg [29:0] testImaInp, testImaw,testImao;
reg [29:0] testRealInp, testRealw,testRealo;
Butterfly buff1(lastStageFlag,clock,reset,pushinB0,pushoutB0,realIp1B0,realIp2B0,imgIp1B0,imgIp2B0,twiddleFactorRealB0,twiddleFactorimgB0,stateIp1B0,stateIp2B0,ReOp1B0,ReOp2B0,imgOp1B0,imgOp2B0,stateOp1B0,stateOp2B0,lastStageFlagOp);

Butterfly buff2(lastStageFlag,clock,reset,pushinB1,pushoutB1,realIp1B1,realIp2B1,imgIp1B1,imgIp2B1,twiddleFactorRealB1,twiddleFactorimgB1,stateIp1B1,stateIp2B1,ReOp1B1,ReOp2B1,imgOp1B1,imgOp2B1,stateOp1B1,stateOp2B1,lastStageFlagOp);

Butterfly buff3(lastStageFlag,clock,reset,pushinB2,pushoutB2,realIp1B2,realIp2B2,imgIp1B2,imgIp2B2,twiddleFactorRealB2,twiddleFactorimgB2,stateIp1B2,stateIp2B2,ReOp1B2,ReOp2B2,imgOp1B2,imgOp2B2,stateOp1B2,stateOp2B2,lastStageFlagOp);

Butterfly buff4(lastStageFlag,clock,reset,pushinB3,pushoutB3,realIp1B3,realIp2B3,imgIp1B3,imgIp2B3,twiddleFactorRealB3,twiddleFactorimgB3,stateIp1B3,stateIp2B3,ReOp1B3,ReOp2B3,imgOp1B3,imgOp2B3,stateOp1B3,stateOp2B3,lastStageFlagOp);

Butterfly buff5(lastStageFlag,clock,reset,pushinB4,pushoutB4,realIp1B4,realIp2B4,imgIp1B4,imgIp2B4,twiddleFactorRealB4,twiddleFactorimgB4,stateIp1B4,stateIp2B4,ReOp1B4,ReOp2B4,imgOp1B4,imgOp2B4,stateOp1B4,stateOp2B4,lastStageFlagOp);

Butterfly buff6(lastStageFlag,clock,reset,pushinB5,pushoutB5,realIp1B5,realIp2B5,imgIp1B5,imgIp2B5,twiddleFactorRealB5,twiddleFactorimgB5,stateIp1B5,stateIp2B5,ReOp1B5,ReOp2B5,imgOp1B5,imgOp2B5,stateOp1B5,stateOp2B5,lastStageFlagOp);

Butterfly buff7(lastStageFlag,clock,reset,pushinB6,pushoutB6,realIp1B6,realIp2B6,imgIp1B6,imgIp2B6,twiddleFactorRealB6,twiddleFactorimgB6,stateIp1B6,stateIp2B6,ReOp1B6,ReOp2B6,imgOp1B6,imgOp2B6,stateOp1B6,stateOp2B6,lastStageFlagOp);

Butterfly buff8(lastStageFlag,clock,reset,pushinB7,pushoutB7,realIp1B7,realIp2B7,imgIp1B7,imgIp2B7,twiddleFactorRealB7,twiddleFactorimgB7,stateIp1B7,stateIp2B7,ReOp1B7,ReOp2B7,imgOp1B7,imgOp2B7,stateOp1B7,stateOp2B7,lastStageFlagOp);

assign complexOutput=complxMem[outputAddress];
assign realOutput=realMem[outputAddress];
always @(*) begin
	if(reset) begin
		realOutput<=20'd0;
		imagOutput<=20'd0;
	end
	else begin
		if(inputDataStartFLag) begin
			reversedAddress= ({inputAddressCounter[0],inputAddressCounter[1],inputAddressCounter[2],inputAddressCounter[3],inputAddressCounter[4],inputAddressCounter[5],inputAddressCounter[6],inputAddressCounter[7],inputAddressCounter[8]});
		end
		else begin
			 reversedAddress=0;
		end
		realOutput<= realOutputBuff[(outputAddress)][29:10];
		imagOutput<= imagOuptutBuff[(outputAddress)][29:10];
		testRealInp <= realInputBuffer[128];
	end
end

always @(posedge clock or posedge reset ) begin

	if(reset) begin
		for(i=0;i<512;i=i+1) begin
			realWorkingBuffer[i]<= #1 0;
			imagWorkingBuffer[i]<= #1 0;
			realInputBuffer[i]<= #1 0;
			imagInputBuffer[i]<= #1 0;
			realOutputBuff[i]<= #1 0;
			imagOuptutBuff[i]<= #1 0;
		end
		inputAddressCounter<=#1 0;
		inputBufferFlag<=#1 0;
		computationFlag<=#1 0;
		computationAvailbleFlag<=#1 0;
		lastStageFlag<=#1 0;
		state<=#1 1;
		outputAddress<=#1 0;
		outputFlag<=#1 0;
		writeBack<=#1 0;
	end
	else begin
		if(startIn) inputDataStartFLag<=#1 1;
			if(inputDataStartFLag || startIn) begin
				if(startIn) begin
					inputAddressCounter <= #1 1;
					realInputBuffer[0] <= #1 {{{8{realInput[19]}},realInput},2'b00};
					imagInputBuffer[0] <= #1 {{{8{imagInput[19]}},imagInput},2'b00};
				end
				else begin
					inputAddressCounter <= #1 (inputAddressCounter+1)%256;
					realInputBuffer[reversedAddress] <= #1 {{{8{realInput[19]}},realInput},2'b00};
					imagInputBuffer[reversedAddress] <= #1 {{{8{imagInput[19]}},imagInput},2'b00};
				end
			end
			if(inputAddressCounter==255) begin
				inputBufferFlag<= #1 1;
				inputDataStartFLag<=#1 0;
			end
			if(inputBufferFlag) begin
				for(i=0;i<256;i=i+1) begin
					realWorkingBuffer[i] <= #1 realInputBuffer[i];
					imagWorkingBuffer[i] <= #1 imagInputBuffer[i];
				end
				inputBufferFlag<=#1 0;
				computationFlag<=#1 1;
				computationAvailbleFlag<=#1 computationFlag?1:0;
				state<=#1 1;
			end
			if(computationFlag) begin
				if(state==256) begin
					state<=#1 (computationAvailbleFlag || inputBufferFlag)?1:0;
				end
				if(state==0) begin
					state<=#1 (inputBufferFlag)?1:0;
				end
				state<=(state+1);
				pushinB0<=#1 1'b1;
				pushinB1<=#1 1'b1;
				pushinB2<=#1 1'b1;
				pushinB3<=#1 1'b1;
			end
			else begin
				state<=0;
				pushinB0<=1'b0;
				pushinB1<=1'b0;
				pushinB2<=1'b0;
				pushinB3<=1'b0;
			end
			if(lastStageFlagOp) begin
				if(pushoutB0) begin
					realOutputBuff[stateOp1B0]<=#1 ReOp1B0;
					realOutputBuff[stateOp2B0]<=#1 ReOp2B0;
					imagOuptutBuff[stateOp1B0]<=#1 imgOp1B0;
					imagOuptutBuff[stateOp2B0]<=#1 imgOp2B0;
				end

				if(pushoutB1) begin
					realOutputBuff[stateOp1B1]<=#1 ReOp1B1;
					realOutputBuff[stateOp2B1]<=#1 ReOp2B1;
					imagOuptutBuff[stateOp1B1]<=#1 imgOp1B1;
					imagOuptutBuff[stateOp2B1]<=#1 imgOp2B1;
				end

				if(pushoutB2) begin
					realOutputBuff[stateOp1B2]<=#1 ReOp1B2;
					realOutputBuff[stateOp2B2]<=#1 ReOp2B2;
					imagOuptutBuff[stateOp1B2]<=#1 imgOp1B2;
					imagOuptutBuff[stateOp2B2]<=#1 imgOp2B2;
				end

				if(pushoutB3) begin
					realOutputBuff[stateOp1B3]<=#1 ReOp1B3;
					realOutputBuff[stateOp2B3]<=#1 ReOp2B3;
					imagOuptutBuff[stateOp1B3]<=#1 imgOp1B3;
					imagOuptutBuff[stateOp2B3]<=#1 imgOp2B3;
				end

				if(pushoutB4) begin
					realOutputBuff[stateOp1B4]<=#1 ReOp1B4;
					realOutputBuff[stateOp2B4]<=#1 ReOp2B4;
					imagOuptutBuff[stateOp1B4]<=#1 imgOp1B4;
					imagOuptutBuff[stateOp2B4]<=#1 imgOp2B4;
				end

				if(pushoutB5) begin
					realOutputBuff[stateOp1B5]<=#1 ReOp1B5;
					realOutputBuff[stateOp2B5]<=#1 ReOp2B5;
					imagOuptutBuff[stateOp1B5]<=#1 imgOp1B5;
					imagOuptutBuff[stateOp2B5]<=#1 imgOp2B5;
				end

				if(pushoutB6) begin
					realOutputBuff[stateOp1B6]<=#1 ReOp1B6;
					realOutputBuff[stateOp2B6]<=#1 ReOp2B6;
					imagOuptutBuff[stateOp1B6]<=#1 imgOp1B6;
					imagOuptutBuff[stateOp2B6]<=#1 imgOp2B6;
				end

				if(pushoutB7) begin
					realOutputBuff[stateOp1B7]<=#1 ReOp1B7;
					realOutputBuff[stateOp2B7]<=#1 ReOp2B7;
					imagOuptutBuff[stateOp1B7]<=#1 imgOp1B7;
					imagOuptutBuff[stateOp2B7]<=#1 imgOp2B7;
				end

				if(stateOp2B3==511) begin
					computationFlag<=#1 (computationAvailbleFlag || inputBufferFlag)?1:0;
					computationAvailbleFlag<=#1 0;
				end
			end
			else begin
				if(pushoutB0) begin
					realWorkingBuffer[stateOp1B0]<=#1 ReOp1B0;
					realWorkingBuffer[stateOp2B0]<=#1 ReOp2B0;
					imagWorkingBuffer[stateOp1B0]<=#1 imgOp1B0;
					imagWorkingBuffer[stateOp2B0]<=#1 imgOp2B0;
				end
				if(pushoutB1) begin
					realWorkingBuffer[stateOp1B1]<=#1 ReOp1B1;
					realWorkingBuffer[stateOp2B1]<=#1 ReOp2B1;
					imagWorkingBuffer[stateOp1B1]<=#1 imgOp1B1;
					imagWorkingBuffer[stateOp2B1]<=#1 imgOp2B1;
				end
				if(pushoutB2) begin
					realWorkingBuffer[stateOp1B2]<=#1 ReOp1B2;
					realWorkingBuffer[stateOp2B2]<=#1 ReOp2B2;
					imagWorkingBuffer[stateOp1B2]<=#1 imgOp1B2;
					imagWorkingBuffer[stateOp2B2]<=#1 imgOp2B2;
				end
				if(pushoutB3) begin
					realWorkingBuffer[stateOp1B3]<=#1 ReOp1B3;
					realWorkingBuffer[stateOp2B3]<=#1 ReOp2B3;
					imagWorkingBuffer[stateOp1B3]<=#1 imgOp1B3;
					imagWorkingBuffer[stateOp2B3]<=#1 imgOp2B3;
				end
			end
			if(lastStageFlagOp==1 && stateOp2B3==511) begin
				outputFlag<=#3 1'b1;
				writeBack<=#1 1'b1;
				outputAddress<=#1 12'd0;
			end
			else if(writeBack) begin
				if(outputAddress==255) begin
					outputAddress<=#1 12'd0;
					writeBack<=#1 1'b0;
				end
				else begin
					outputAddress<=#1 outputAddress+12'd1;
					outputFlag<=#3 1'b0;
				end
			end
		case (state)
			 default: begin
				 pushinB0 <= 1'b0;
				 imgIp1B0 <= 30'd0;
				 realIp1B0 <= 30'd0;
				 imgIp2B0 <= 30'd0;
				 realIp2B0 <= 30'd0;
				 twiddleFactorRealB0 <=30'd0;
				 twiddleFactorimgB0 <=30'd0;
				 stateIp1B0<=8'd0;
				 stateIp2B0<=8'd0;

				 pushinB1 <= 1'b0;
				 imgIp1B1 <= 30'd0;
				 realIp1B1 <= 30'd0;
				 imgIp2B1 <= 30'd0;
				 realIp2B1 <= 30'd0;
				 twiddleFactorRealB1 <=30'd0;
				 twiddleFactorimgB1 <=30'd0;
				 stateIp1B1<=8'd0;
				 stateIp2B1<=8'd0;

				 pushinB2 <= 1'b0;
				 imgIp1B2 <= 30'd0;
				 realIp1B2 <= 30'd0;
				 imgIp2B2 <= 30'd0;
				 realIp2B2 <= 30'd0;
				 twiddleFactorRealB2 <=30'd0;
				 twiddleFactorimgB2 <=30'd0;
				 stateIp1B2<=8'd0;
				 stateIp2B2<=8'd0;

				 pushinB3 <= 1'b0;
				 imgIp1B3 <= 30'd0;
				 realIp1B3 <= 30'd0;
				 imgIp2B3 <= 30'd0;
				 realIp2B3 <= 30'd0;
				 twiddleFactorRealB3 <=30'd0;
				 twiddleFactorimgB3 <=30'd0;
				 stateIp1B3<=8'd0;
				 stateIp2B3<=8'd0;

				 pushinB4 <= 1'b0;
				 imgIp1B4 <= 30'd0;
				 realIp1B4 <= 30'd0;
				 imgIp2B4 <= 30'd0;
				 realIp2B4 <= 30'd0;
				 twiddleFactorRealB4 <=30'd0;
				 twiddleFactorimgB4 <=30'd0;
				 stateIp1B4<=8'd0;
				 stateIp2B4<=8'd0;

				 pushinB5 <= 1'b0;
				 imgIp1B5 <= 30'd0;
				 realIp1B5 <= 30'd0;
				 imgIp2B5 <= 30'd0;
				 realIp2B5 <= 30'd0;
				 twiddleFactorRealB5 <=30'd0;
				 twiddleFactorimgB5 <=30'd0;
				 stateIp1B5<=8'd0;
				 stateIp2B5<=8'd0;

				 pushinB6 <= 1'b0;
				 imgIp1B6 <= 30'd0;
				 realIp1B6 <= 30'd0;
				 imgIp2B6 <= 30'd0;
				 realIp2B6 <= 30'd0;
				 twiddleFactorRealB6 <=30'd0;
				 twiddleFactorimgB6 <=30'd0;
				 stateIp1B6<=8'd0;
				 stateIp2B6<=8'd0;

				 pushinB7 <= 1'b0;
				 imgIp1B7 <= 30'd0;
				 realIp1B7 <= 30'd0;
				 imgIp2B7 <= 30'd0;
				 realIp2B7 <= 30'd0;
				 twiddleFactorRealB7 <=30'd0;
				 twiddleFactorimgB7 <=30'd0;
				 stateIp1B7<=8'd0;
				 stateIp2B7<=8'd0;

			 end
			 8'd1 : begin

				 lastStageFlag<=1'b0;

				 //(0,1)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[1];
				 realIp2B0 <= realWorkingBuffer[1];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd1;

				 //(2,3)
				 imgIp1B1 <= imagWorkingBuffer[2];
				 realIp1B1 <= realWorkingBuffer[2];
				 imgIp2B1 <= imagWorkingBuffer[3];
				 realIp2B1 <= realWorkingBuffer[3];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd2;
				 stateIp2B1<=12'd3;

				 //(4,5)
				 imgIp1B2 <= imagWorkingBuffer[4];
				 realIp1B2 <= realWorkingBuffer[4];
				 imgIp2B2 <= imagWorkingBuffer[5];
				 realIp2B2 <= realWorkingBuffer[5];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd4;
				 stateIp2B2<=12'd5;

				 //(6,7)
				 imgIp1B3 <= imagWorkingBuffer[6];
				 realIp1B3 <= realWorkingBuffer[6];
				 imgIp2B3 <= imagWorkingBuffer[7];
				 realIp2B3 <= realWorkingBuffer[7];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd6;
				 stateIp2B3<=12'd7;

				 //(8,9)
				 imgIp1B4 <= imagWorkingBuffer[8];
				 realIp1B4 <= realWorkingBuffer[8];
				 imgIp2B4 <= imagWorkingBuffer[9];
				 realIp2B4 <= realWorkingBuffer[9];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd8;
				 stateIp2B4<=12'd9;

				 //(10,11)
				 imgIp1B5 <= imagWorkingBuffer[10];
				 realIp1B5 <= realWorkingBuffer[10];
				 imgIp2B5 <= imagWorkingBuffer[11];
				 realIp2B5 <= realWorkingBuffer[11];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd10;
				 stateIp2B5<=12'd11;

				 //(12,13)
				 imgIp1B6 <= imagWorkingBuffer[12];
				 realIp1B6 <= realWorkingBuffer[12];
				 imgIp2B6 <= imagWorkingBuffer[13];
				 realIp2B6 <= realWorkingBuffer[13];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd12;
				 stateIp2B6<=12'd13;

				 //(14,15)
				 imgIp1B7 <= imagWorkingBuffer[14];
				 realIp1B7 <= realWorkingBuffer[14];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd14;
				 stateIp2B7<=12'd15;
			 end
			 8'd2 : begin

				 //(16,17)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[17];
				 realIp2B0 <= realWorkingBuffer[17];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd17;

				 //(18,19)
				 imgIp1B1 <= imagWorkingBuffer[18];
				 realIp1B1 <= realWorkingBuffer[18];
				 imgIp2B1 <= imagWorkingBuffer[19];
				 realIp2B1 <= realWorkingBuffer[19];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd18;
				 stateIp2B1<=12'd19;

				 //(20,21)
				 imgIp1B2 <= imagWorkingBuffer[20];
				 realIp1B2 <= realWorkingBuffer[20];
				 imgIp2B2 <= imagWorkingBuffer[21];
				 realIp2B2 <= realWorkingBuffer[21];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd20;
				 stateIp2B2<=12'd21;

				 //(22,23)
				 imgIp1B3 <= imagWorkingBuffer[22];
				 realIp1B3 <= realWorkingBuffer[22];
				 imgIp2B3 <= imagWorkingBuffer[23];
				 realIp2B3 <= realWorkingBuffer[23];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd22;
				 stateIp2B3<=12'd23;

				 //(24,25)
				 imgIp1B4 <= imagWorkingBuffer[24];
				 realIp1B4 <= realWorkingBuffer[24];
				 imgIp2B4 <= imagWorkingBuffer[25];
				 realIp2B4 <= realWorkingBuffer[25];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd24;
				 stateIp2B4<=12'd25;

				 //(26,27)
				 imgIp1B5 <= imagWorkingBuffer[26];
				 realIp1B5 <= realWorkingBuffer[26];
				 imgIp2B5 <= imagWorkingBuffer[27];
				 realIp2B5 <= realWorkingBuffer[27];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd26;
				 stateIp2B5<=12'd27;

				 //(28,29)
				 imgIp1B6 <= imagWorkingBuffer[28];
				 realIp1B6 <= realWorkingBuffer[28];
				 imgIp2B6 <= imagWorkingBuffer[29];
				 realIp2B6 <= realWorkingBuffer[29];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd28;
				 stateIp2B6<=12'd29;

				 //(30,31)
				 imgIp1B7 <= imagWorkingBuffer[30];
				 realIp1B7 <= realWorkingBuffer[30];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd30;
				 stateIp2B7<=12'd31;
			 end
			 8'd3 : begin

				 //(32,33)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[33];
				 realIp2B0 <= realWorkingBuffer[33];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd33;

				 //(34,35)
				 imgIp1B1 <= imagWorkingBuffer[34];
				 realIp1B1 <= realWorkingBuffer[34];
				 imgIp2B1 <= imagWorkingBuffer[35];
				 realIp2B1 <= realWorkingBuffer[35];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd34;
				 stateIp2B1<=12'd35;

				 //(36,37)
				 imgIp1B2 <= imagWorkingBuffer[36];
				 realIp1B2 <= realWorkingBuffer[36];
				 imgIp2B2 <= imagWorkingBuffer[37];
				 realIp2B2 <= realWorkingBuffer[37];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd36;
				 stateIp2B2<=12'd37;

				 //(38,39)
				 imgIp1B3 <= imagWorkingBuffer[38];
				 realIp1B3 <= realWorkingBuffer[38];
				 imgIp2B3 <= imagWorkingBuffer[39];
				 realIp2B3 <= realWorkingBuffer[39];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd38;
				 stateIp2B3<=12'd39;

				 //(40,41)
				 imgIp1B4 <= imagWorkingBuffer[40];
				 realIp1B4 <= realWorkingBuffer[40];
				 imgIp2B4 <= imagWorkingBuffer[41];
				 realIp2B4 <= realWorkingBuffer[41];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd40;
				 stateIp2B4<=12'd41;

				 //(42,43)
				 imgIp1B5 <= imagWorkingBuffer[42];
				 realIp1B5 <= realWorkingBuffer[42];
				 imgIp2B5 <= imagWorkingBuffer[43];
				 realIp2B5 <= realWorkingBuffer[43];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd42;
				 stateIp2B5<=12'd43;

				 //(44,45)
				 imgIp1B6 <= imagWorkingBuffer[44];
				 realIp1B6 <= realWorkingBuffer[44];
				 imgIp2B6 <= imagWorkingBuffer[45];
				 realIp2B6 <= realWorkingBuffer[45];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd44;
				 stateIp2B6<=12'd45;

				 //(46,47)
				 imgIp1B7 <= imagWorkingBuffer[46];
				 realIp1B7 <= realWorkingBuffer[46];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd46;
				 stateIp2B7<=12'd47;
			 end
			 8'd4 : begin

				 //(48,49)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[49];
				 realIp2B0 <= realWorkingBuffer[49];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd49;

				 //(50,51)
				 imgIp1B1 <= imagWorkingBuffer[50];
				 realIp1B1 <= realWorkingBuffer[50];
				 imgIp2B1 <= imagWorkingBuffer[51];
				 realIp2B1 <= realWorkingBuffer[51];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd50;
				 stateIp2B1<=12'd51;

				 //(52,53)
				 imgIp1B2 <= imagWorkingBuffer[52];
				 realIp1B2 <= realWorkingBuffer[52];
				 imgIp2B2 <= imagWorkingBuffer[53];
				 realIp2B2 <= realWorkingBuffer[53];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd52;
				 stateIp2B2<=12'd53;

				 //(54,55)
				 imgIp1B3 <= imagWorkingBuffer[54];
				 realIp1B3 <= realWorkingBuffer[54];
				 imgIp2B3 <= imagWorkingBuffer[55];
				 realIp2B3 <= realWorkingBuffer[55];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd54;
				 stateIp2B3<=12'd55;

				 //(56,57)
				 imgIp1B4 <= imagWorkingBuffer[56];
				 realIp1B4 <= realWorkingBuffer[56];
				 imgIp2B4 <= imagWorkingBuffer[57];
				 realIp2B4 <= realWorkingBuffer[57];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd56;
				 stateIp2B4<=12'd57;

				 //(58,59)
				 imgIp1B5 <= imagWorkingBuffer[58];
				 realIp1B5 <= realWorkingBuffer[58];
				 imgIp2B5 <= imagWorkingBuffer[59];
				 realIp2B5 <= realWorkingBuffer[59];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd58;
				 stateIp2B5<=12'd59;

				 //(60,61)
				 imgIp1B6 <= imagWorkingBuffer[60];
				 realIp1B6 <= realWorkingBuffer[60];
				 imgIp2B6 <= imagWorkingBuffer[61];
				 realIp2B6 <= realWorkingBuffer[61];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd60;
				 stateIp2B6<=12'd61;

				 //(62,63)
				 imgIp1B7 <= imagWorkingBuffer[62];
				 realIp1B7 <= realWorkingBuffer[62];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd62;
				 stateIp2B7<=12'd63;
			 end
			 8'd5 : begin

				 //(64,65)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[65];
				 realIp2B0 <= realWorkingBuffer[65];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd65;

				 //(66,67)
				 imgIp1B1 <= imagWorkingBuffer[66];
				 realIp1B1 <= realWorkingBuffer[66];
				 imgIp2B1 <= imagWorkingBuffer[67];
				 realIp2B1 <= realWorkingBuffer[67];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd66;
				 stateIp2B1<=12'd67;

				 //(68,69)
				 imgIp1B2 <= imagWorkingBuffer[68];
				 realIp1B2 <= realWorkingBuffer[68];
				 imgIp2B2 <= imagWorkingBuffer[69];
				 realIp2B2 <= realWorkingBuffer[69];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd68;
				 stateIp2B2<=12'd69;

				 //(70,71)
				 imgIp1B3 <= imagWorkingBuffer[70];
				 realIp1B3 <= realWorkingBuffer[70];
				 imgIp2B3 <= imagWorkingBuffer[71];
				 realIp2B3 <= realWorkingBuffer[71];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd70;
				 stateIp2B3<=12'd71;

				 //(72,73)
				 imgIp1B4 <= imagWorkingBuffer[72];
				 realIp1B4 <= realWorkingBuffer[72];
				 imgIp2B4 <= imagWorkingBuffer[73];
				 realIp2B4 <= realWorkingBuffer[73];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd72;
				 stateIp2B4<=12'd73;

				 //(74,75)
				 imgIp1B5 <= imagWorkingBuffer[74];
				 realIp1B5 <= realWorkingBuffer[74];
				 imgIp2B5 <= imagWorkingBuffer[75];
				 realIp2B5 <= realWorkingBuffer[75];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd74;
				 stateIp2B5<=12'd75;

				 //(76,77)
				 imgIp1B6 <= imagWorkingBuffer[76];
				 realIp1B6 <= realWorkingBuffer[76];
				 imgIp2B6 <= imagWorkingBuffer[77];
				 realIp2B6 <= realWorkingBuffer[77];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd76;
				 stateIp2B6<=12'd77;

				 //(78,79)
				 imgIp1B7 <= imagWorkingBuffer[78];
				 realIp1B7 <= realWorkingBuffer[78];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd78;
				 stateIp2B7<=12'd79;
			 end
			 8'd6 : begin

				 //(80,81)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[81];
				 realIp2B0 <= realWorkingBuffer[81];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd81;

				 //(82,83)
				 imgIp1B1 <= imagWorkingBuffer[82];
				 realIp1B1 <= realWorkingBuffer[82];
				 imgIp2B1 <= imagWorkingBuffer[83];
				 realIp2B1 <= realWorkingBuffer[83];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd82;
				 stateIp2B1<=12'd83;

				 //(84,85)
				 imgIp1B2 <= imagWorkingBuffer[84];
				 realIp1B2 <= realWorkingBuffer[84];
				 imgIp2B2 <= imagWorkingBuffer[85];
				 realIp2B2 <= realWorkingBuffer[85];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd84;
				 stateIp2B2<=12'd85;

				 //(86,87)
				 imgIp1B3 <= imagWorkingBuffer[86];
				 realIp1B3 <= realWorkingBuffer[86];
				 imgIp2B3 <= imagWorkingBuffer[87];
				 realIp2B3 <= realWorkingBuffer[87];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd86;
				 stateIp2B3<=12'd87;

				 //(88,89)
				 imgIp1B4 <= imagWorkingBuffer[88];
				 realIp1B4 <= realWorkingBuffer[88];
				 imgIp2B4 <= imagWorkingBuffer[89];
				 realIp2B4 <= realWorkingBuffer[89];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd88;
				 stateIp2B4<=12'd89;

				 //(90,91)
				 imgIp1B5 <= imagWorkingBuffer[90];
				 realIp1B5 <= realWorkingBuffer[90];
				 imgIp2B5 <= imagWorkingBuffer[91];
				 realIp2B5 <= realWorkingBuffer[91];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd90;
				 stateIp2B5<=12'd91;

				 //(92,93)
				 imgIp1B6 <= imagWorkingBuffer[92];
				 realIp1B6 <= realWorkingBuffer[92];
				 imgIp2B6 <= imagWorkingBuffer[93];
				 realIp2B6 <= realWorkingBuffer[93];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd92;
				 stateIp2B6<=12'd93;

				 //(94,95)
				 imgIp1B7 <= imagWorkingBuffer[94];
				 realIp1B7 <= realWorkingBuffer[94];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd94;
				 stateIp2B7<=12'd95;
			 end
			 8'd7 : begin

				 //(96,97)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[97];
				 realIp2B0 <= realWorkingBuffer[97];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd97;

				 //(98,99)
				 imgIp1B1 <= imagWorkingBuffer[98];
				 realIp1B1 <= realWorkingBuffer[98];
				 imgIp2B1 <= imagWorkingBuffer[99];
				 realIp2B1 <= realWorkingBuffer[99];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd98;
				 stateIp2B1<=12'd99;

				 //(100,101)
				 imgIp1B2 <= imagWorkingBuffer[100];
				 realIp1B2 <= realWorkingBuffer[100];
				 imgIp2B2 <= imagWorkingBuffer[101];
				 realIp2B2 <= realWorkingBuffer[101];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd100;
				 stateIp2B2<=12'd101;

				 //(102,103)
				 imgIp1B3 <= imagWorkingBuffer[102];
				 realIp1B3 <= realWorkingBuffer[102];
				 imgIp2B3 <= imagWorkingBuffer[103];
				 realIp2B3 <= realWorkingBuffer[103];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd102;
				 stateIp2B3<=12'd103;

				 //(104,105)
				 imgIp1B4 <= imagWorkingBuffer[104];
				 realIp1B4 <= realWorkingBuffer[104];
				 imgIp2B4 <= imagWorkingBuffer[105];
				 realIp2B4 <= realWorkingBuffer[105];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd104;
				 stateIp2B4<=12'd105;

				 //(106,107)
				 imgIp1B5 <= imagWorkingBuffer[106];
				 realIp1B5 <= realWorkingBuffer[106];
				 imgIp2B5 <= imagWorkingBuffer[107];
				 realIp2B5 <= realWorkingBuffer[107];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd106;
				 stateIp2B5<=12'd107;

				 //(108,109)
				 imgIp1B6 <= imagWorkingBuffer[108];
				 realIp1B6 <= realWorkingBuffer[108];
				 imgIp2B6 <= imagWorkingBuffer[109];
				 realIp2B6 <= realWorkingBuffer[109];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd108;
				 stateIp2B6<=12'd109;

				 //(110,111)
				 imgIp1B7 <= imagWorkingBuffer[110];
				 realIp1B7 <= realWorkingBuffer[110];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd110;
				 stateIp2B7<=12'd111;
			 end
			 8'd8 : begin

				 //(112,113)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[113];
				 realIp2B0 <= realWorkingBuffer[113];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd112;
				 stateIp2B0<=12'd113;

				 //(114,115)
				 imgIp1B1 <= imagWorkingBuffer[114];
				 realIp1B1 <= realWorkingBuffer[114];
				 imgIp2B1 <= imagWorkingBuffer[115];
				 realIp2B1 <= realWorkingBuffer[115];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd114;
				 stateIp2B1<=12'd115;

				 //(116,117)
				 imgIp1B2 <= imagWorkingBuffer[116];
				 realIp1B2 <= realWorkingBuffer[116];
				 imgIp2B2 <= imagWorkingBuffer[117];
				 realIp2B2 <= realWorkingBuffer[117];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd116;
				 stateIp2B2<=12'd117;

				 //(118,119)
				 imgIp1B3 <= imagWorkingBuffer[118];
				 realIp1B3 <= realWorkingBuffer[118];
				 imgIp2B3 <= imagWorkingBuffer[119];
				 realIp2B3 <= realWorkingBuffer[119];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd118;
				 stateIp2B3<=12'd119;

				 //(120,121)
				 imgIp1B4 <= imagWorkingBuffer[120];
				 realIp1B4 <= realWorkingBuffer[120];
				 imgIp2B4 <= imagWorkingBuffer[121];
				 realIp2B4 <= realWorkingBuffer[121];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd120;
				 stateIp2B4<=12'd121;

				 //(122,123)
				 imgIp1B5 <= imagWorkingBuffer[122];
				 realIp1B5 <= realWorkingBuffer[122];
				 imgIp2B5 <= imagWorkingBuffer[123];
				 realIp2B5 <= realWorkingBuffer[123];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd122;
				 stateIp2B5<=12'd123;

				 //(124,125)
				 imgIp1B6 <= imagWorkingBuffer[124];
				 realIp1B6 <= realWorkingBuffer[124];
				 imgIp2B6 <= imagWorkingBuffer[125];
				 realIp2B6 <= realWorkingBuffer[125];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd124;
				 stateIp2B6<=12'd125;

				 //(126,127)
				 imgIp1B7 <= imagWorkingBuffer[126];
				 realIp1B7 <= realWorkingBuffer[126];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd126;
				 stateIp2B7<=12'd127;
			 end
			 8'd9 : begin

				 //(128,129)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[129];
				 realIp2B0 <= realWorkingBuffer[129];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd129;

				 //(130,131)
				 imgIp1B1 <= imagWorkingBuffer[130];
				 realIp1B1 <= realWorkingBuffer[130];
				 imgIp2B1 <= imagWorkingBuffer[131];
				 realIp2B1 <= realWorkingBuffer[131];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd130;
				 stateIp2B1<=12'd131;

				 //(132,133)
				 imgIp1B2 <= imagWorkingBuffer[132];
				 realIp1B2 <= realWorkingBuffer[132];
				 imgIp2B2 <= imagWorkingBuffer[133];
				 realIp2B2 <= realWorkingBuffer[133];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd132;
				 stateIp2B2<=12'd133;

				 //(134,135)
				 imgIp1B3 <= imagWorkingBuffer[134];
				 realIp1B3 <= realWorkingBuffer[134];
				 imgIp2B3 <= imagWorkingBuffer[135];
				 realIp2B3 <= realWorkingBuffer[135];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd134;
				 stateIp2B3<=12'd135;

				 //(136,137)
				 imgIp1B4 <= imagWorkingBuffer[136];
				 realIp1B4 <= realWorkingBuffer[136];
				 imgIp2B4 <= imagWorkingBuffer[137];
				 realIp2B4 <= realWorkingBuffer[137];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd136;
				 stateIp2B4<=12'd137;

				 //(138,139)
				 imgIp1B5 <= imagWorkingBuffer[138];
				 realIp1B5 <= realWorkingBuffer[138];
				 imgIp2B5 <= imagWorkingBuffer[139];
				 realIp2B5 <= realWorkingBuffer[139];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd138;
				 stateIp2B5<=12'd139;

				 //(140,141)
				 imgIp1B6 <= imagWorkingBuffer[140];
				 realIp1B6 <= realWorkingBuffer[140];
				 imgIp2B6 <= imagWorkingBuffer[141];
				 realIp2B6 <= realWorkingBuffer[141];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd140;
				 stateIp2B6<=12'd141;

				 //(142,143)
				 imgIp1B7 <= imagWorkingBuffer[142];
				 realIp1B7 <= realWorkingBuffer[142];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd142;
				 stateIp2B7<=12'd143;
			 end
			 8'd10 : begin

				 //(144,145)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[145];
				 realIp2B0 <= realWorkingBuffer[145];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd145;

				 //(146,147)
				 imgIp1B1 <= imagWorkingBuffer[146];
				 realIp1B1 <= realWorkingBuffer[146];
				 imgIp2B1 <= imagWorkingBuffer[147];
				 realIp2B1 <= realWorkingBuffer[147];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd146;
				 stateIp2B1<=12'd147;

				 //(148,149)
				 imgIp1B2 <= imagWorkingBuffer[148];
				 realIp1B2 <= realWorkingBuffer[148];
				 imgIp2B2 <= imagWorkingBuffer[149];
				 realIp2B2 <= realWorkingBuffer[149];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd148;
				 stateIp2B2<=12'd149;

				 //(150,151)
				 imgIp1B3 <= imagWorkingBuffer[150];
				 realIp1B3 <= realWorkingBuffer[150];
				 imgIp2B3 <= imagWorkingBuffer[151];
				 realIp2B3 <= realWorkingBuffer[151];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd150;
				 stateIp2B3<=12'd151;

				 //(152,153)
				 imgIp1B4 <= imagWorkingBuffer[152];
				 realIp1B4 <= realWorkingBuffer[152];
				 imgIp2B4 <= imagWorkingBuffer[153];
				 realIp2B4 <= realWorkingBuffer[153];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd152;
				 stateIp2B4<=12'd153;

				 //(154,155)
				 imgIp1B5 <= imagWorkingBuffer[154];
				 realIp1B5 <= realWorkingBuffer[154];
				 imgIp2B5 <= imagWorkingBuffer[155];
				 realIp2B5 <= realWorkingBuffer[155];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd154;
				 stateIp2B5<=12'd155;

				 //(156,157)
				 imgIp1B6 <= imagWorkingBuffer[156];
				 realIp1B6 <= realWorkingBuffer[156];
				 imgIp2B6 <= imagWorkingBuffer[157];
				 realIp2B6 <= realWorkingBuffer[157];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd156;
				 stateIp2B6<=12'd157;

				 //(158,159)
				 imgIp1B7 <= imagWorkingBuffer[158];
				 realIp1B7 <= realWorkingBuffer[158];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd158;
				 stateIp2B7<=12'd159;
			 end
			 8'd11 : begin

				 //(160,161)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[161];
				 realIp2B0 <= realWorkingBuffer[161];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd161;

				 //(162,163)
				 imgIp1B1 <= imagWorkingBuffer[162];
				 realIp1B1 <= realWorkingBuffer[162];
				 imgIp2B1 <= imagWorkingBuffer[163];
				 realIp2B1 <= realWorkingBuffer[163];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd162;
				 stateIp2B1<=12'd163;

				 //(164,165)
				 imgIp1B2 <= imagWorkingBuffer[164];
				 realIp1B2 <= realWorkingBuffer[164];
				 imgIp2B2 <= imagWorkingBuffer[165];
				 realIp2B2 <= realWorkingBuffer[165];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd164;
				 stateIp2B2<=12'd165;

				 //(166,167)
				 imgIp1B3 <= imagWorkingBuffer[166];
				 realIp1B3 <= realWorkingBuffer[166];
				 imgIp2B3 <= imagWorkingBuffer[167];
				 realIp2B3 <= realWorkingBuffer[167];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd166;
				 stateIp2B3<=12'd167;

				 //(168,169)
				 imgIp1B4 <= imagWorkingBuffer[168];
				 realIp1B4 <= realWorkingBuffer[168];
				 imgIp2B4 <= imagWorkingBuffer[169];
				 realIp2B4 <= realWorkingBuffer[169];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd168;
				 stateIp2B4<=12'd169;

				 //(170,171)
				 imgIp1B5 <= imagWorkingBuffer[170];
				 realIp1B5 <= realWorkingBuffer[170];
				 imgIp2B5 <= imagWorkingBuffer[171];
				 realIp2B5 <= realWorkingBuffer[171];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd170;
				 stateIp2B5<=12'd171;

				 //(172,173)
				 imgIp1B6 <= imagWorkingBuffer[172];
				 realIp1B6 <= realWorkingBuffer[172];
				 imgIp2B6 <= imagWorkingBuffer[173];
				 realIp2B6 <= realWorkingBuffer[173];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd172;
				 stateIp2B6<=12'd173;

				 //(174,175)
				 imgIp1B7 <= imagWorkingBuffer[174];
				 realIp1B7 <= realWorkingBuffer[174];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd174;
				 stateIp2B7<=12'd175;
			 end
			 8'd12 : begin

				 //(176,177)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[177];
				 realIp2B0 <= realWorkingBuffer[177];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd176;
				 stateIp2B0<=12'd177;

				 //(178,179)
				 imgIp1B1 <= imagWorkingBuffer[178];
				 realIp1B1 <= realWorkingBuffer[178];
				 imgIp2B1 <= imagWorkingBuffer[179];
				 realIp2B1 <= realWorkingBuffer[179];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd178;
				 stateIp2B1<=12'd179;

				 //(180,181)
				 imgIp1B2 <= imagWorkingBuffer[180];
				 realIp1B2 <= realWorkingBuffer[180];
				 imgIp2B2 <= imagWorkingBuffer[181];
				 realIp2B2 <= realWorkingBuffer[181];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd180;
				 stateIp2B2<=12'd181;

				 //(182,183)
				 imgIp1B3 <= imagWorkingBuffer[182];
				 realIp1B3 <= realWorkingBuffer[182];
				 imgIp2B3 <= imagWorkingBuffer[183];
				 realIp2B3 <= realWorkingBuffer[183];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd182;
				 stateIp2B3<=12'd183;

				 //(184,185)
				 imgIp1B4 <= imagWorkingBuffer[184];
				 realIp1B4 <= realWorkingBuffer[184];
				 imgIp2B4 <= imagWorkingBuffer[185];
				 realIp2B4 <= realWorkingBuffer[185];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd184;
				 stateIp2B4<=12'd185;

				 //(186,187)
				 imgIp1B5 <= imagWorkingBuffer[186];
				 realIp1B5 <= realWorkingBuffer[186];
				 imgIp2B5 <= imagWorkingBuffer[187];
				 realIp2B5 <= realWorkingBuffer[187];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd186;
				 stateIp2B5<=12'd187;

				 //(188,189)
				 imgIp1B6 <= imagWorkingBuffer[188];
				 realIp1B6 <= realWorkingBuffer[188];
				 imgIp2B6 <= imagWorkingBuffer[189];
				 realIp2B6 <= realWorkingBuffer[189];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd188;
				 stateIp2B6<=12'd189;

				 //(190,191)
				 imgIp1B7 <= imagWorkingBuffer[190];
				 realIp1B7 <= realWorkingBuffer[190];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd190;
				 stateIp2B7<=12'd191;
			 end
			 8'd13 : begin

				 //(192,193)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[193];
				 realIp2B0 <= realWorkingBuffer[193];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd193;

				 //(194,195)
				 imgIp1B1 <= imagWorkingBuffer[194];
				 realIp1B1 <= realWorkingBuffer[194];
				 imgIp2B1 <= imagWorkingBuffer[195];
				 realIp2B1 <= realWorkingBuffer[195];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd194;
				 stateIp2B1<=12'd195;

				 //(196,197)
				 imgIp1B2 <= imagWorkingBuffer[196];
				 realIp1B2 <= realWorkingBuffer[196];
				 imgIp2B2 <= imagWorkingBuffer[197];
				 realIp2B2 <= realWorkingBuffer[197];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd196;
				 stateIp2B2<=12'd197;

				 //(198,199)
				 imgIp1B3 <= imagWorkingBuffer[198];
				 realIp1B3 <= realWorkingBuffer[198];
				 imgIp2B3 <= imagWorkingBuffer[199];
				 realIp2B3 <= realWorkingBuffer[199];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd198;
				 stateIp2B3<=12'd199;

				 //(200,201)
				 imgIp1B4 <= imagWorkingBuffer[200];
				 realIp1B4 <= realWorkingBuffer[200];
				 imgIp2B4 <= imagWorkingBuffer[201];
				 realIp2B4 <= realWorkingBuffer[201];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd200;
				 stateIp2B4<=12'd201;

				 //(202,203)
				 imgIp1B5 <= imagWorkingBuffer[202];
				 realIp1B5 <= realWorkingBuffer[202];
				 imgIp2B5 <= imagWorkingBuffer[203];
				 realIp2B5 <= realWorkingBuffer[203];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd202;
				 stateIp2B5<=12'd203;

				 //(204,205)
				 imgIp1B6 <= imagWorkingBuffer[204];
				 realIp1B6 <= realWorkingBuffer[204];
				 imgIp2B6 <= imagWorkingBuffer[205];
				 realIp2B6 <= realWorkingBuffer[205];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd204;
				 stateIp2B6<=12'd205;

				 //(206,207)
				 imgIp1B7 <= imagWorkingBuffer[206];
				 realIp1B7 <= realWorkingBuffer[206];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd206;
				 stateIp2B7<=12'd207;
			 end
			 8'd14 : begin

				 //(208,209)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[209];
				 realIp2B0 <= realWorkingBuffer[209];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd208;
				 stateIp2B0<=12'd209;

				 //(210,211)
				 imgIp1B1 <= imagWorkingBuffer[210];
				 realIp1B1 <= realWorkingBuffer[210];
				 imgIp2B1 <= imagWorkingBuffer[211];
				 realIp2B1 <= realWorkingBuffer[211];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd210;
				 stateIp2B1<=12'd211;

				 //(212,213)
				 imgIp1B2 <= imagWorkingBuffer[212];
				 realIp1B2 <= realWorkingBuffer[212];
				 imgIp2B2 <= imagWorkingBuffer[213];
				 realIp2B2 <= realWorkingBuffer[213];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd212;
				 stateIp2B2<=12'd213;

				 //(214,215)
				 imgIp1B3 <= imagWorkingBuffer[214];
				 realIp1B3 <= realWorkingBuffer[214];
				 imgIp2B3 <= imagWorkingBuffer[215];
				 realIp2B3 <= realWorkingBuffer[215];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd214;
				 stateIp2B3<=12'd215;

				 //(216,217)
				 imgIp1B4 <= imagWorkingBuffer[216];
				 realIp1B4 <= realWorkingBuffer[216];
				 imgIp2B4 <= imagWorkingBuffer[217];
				 realIp2B4 <= realWorkingBuffer[217];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd216;
				 stateIp2B4<=12'd217;

				 //(218,219)
				 imgIp1B5 <= imagWorkingBuffer[218];
				 realIp1B5 <= realWorkingBuffer[218];
				 imgIp2B5 <= imagWorkingBuffer[219];
				 realIp2B5 <= realWorkingBuffer[219];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd218;
				 stateIp2B5<=12'd219;

				 //(220,221)
				 imgIp1B6 <= imagWorkingBuffer[220];
				 realIp1B6 <= realWorkingBuffer[220];
				 imgIp2B6 <= imagWorkingBuffer[221];
				 realIp2B6 <= realWorkingBuffer[221];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd220;
				 stateIp2B6<=12'd221;

				 //(222,223)
				 imgIp1B7 <= imagWorkingBuffer[222];
				 realIp1B7 <= realWorkingBuffer[222];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd222;
				 stateIp2B7<=12'd223;
			 end
			 8'd15 : begin

				 //(224,225)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[225];
				 realIp2B0 <= realWorkingBuffer[225];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd224;
				 stateIp2B0<=12'd225;

				 //(226,227)
				 imgIp1B1 <= imagWorkingBuffer[226];
				 realIp1B1 <= realWorkingBuffer[226];
				 imgIp2B1 <= imagWorkingBuffer[227];
				 realIp2B1 <= realWorkingBuffer[227];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd226;
				 stateIp2B1<=12'd227;

				 //(228,229)
				 imgIp1B2 <= imagWorkingBuffer[228];
				 realIp1B2 <= realWorkingBuffer[228];
				 imgIp2B2 <= imagWorkingBuffer[229];
				 realIp2B2 <= realWorkingBuffer[229];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd228;
				 stateIp2B2<=12'd229;

				 //(230,231)
				 imgIp1B3 <= imagWorkingBuffer[230];
				 realIp1B3 <= realWorkingBuffer[230];
				 imgIp2B3 <= imagWorkingBuffer[231];
				 realIp2B3 <= realWorkingBuffer[231];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd230;
				 stateIp2B3<=12'd231;

				 //(232,233)
				 imgIp1B4 <= imagWorkingBuffer[232];
				 realIp1B4 <= realWorkingBuffer[232];
				 imgIp2B4 <= imagWorkingBuffer[233];
				 realIp2B4 <= realWorkingBuffer[233];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd232;
				 stateIp2B4<=12'd233;

				 //(234,235)
				 imgIp1B5 <= imagWorkingBuffer[234];
				 realIp1B5 <= realWorkingBuffer[234];
				 imgIp2B5 <= imagWorkingBuffer[235];
				 realIp2B5 <= realWorkingBuffer[235];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd234;
				 stateIp2B5<=12'd235;

				 //(236,237)
				 imgIp1B6 <= imagWorkingBuffer[236];
				 realIp1B6 <= realWorkingBuffer[236];
				 imgIp2B6 <= imagWorkingBuffer[237];
				 realIp2B6 <= realWorkingBuffer[237];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd236;
				 stateIp2B6<=12'd237;

				 //(238,239)
				 imgIp1B7 <= imagWorkingBuffer[238];
				 realIp1B7 <= realWorkingBuffer[238];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd238;
				 stateIp2B7<=12'd239;
			 end
			 8'd16 : begin

				 //(240,241)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[241];
				 realIp2B0 <= realWorkingBuffer[241];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd240;
				 stateIp2B0<=12'd241;

				 //(242,243)
				 imgIp1B1 <= imagWorkingBuffer[242];
				 realIp1B1 <= realWorkingBuffer[242];
				 imgIp2B1 <= imagWorkingBuffer[243];
				 realIp2B1 <= realWorkingBuffer[243];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd242;
				 stateIp2B1<=12'd243;

				 //(244,245)
				 imgIp1B2 <= imagWorkingBuffer[244];
				 realIp1B2 <= realWorkingBuffer[244];
				 imgIp2B2 <= imagWorkingBuffer[245];
				 realIp2B2 <= realWorkingBuffer[245];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd244;
				 stateIp2B2<=12'd245;

				 //(246,247)
				 imgIp1B3 <= imagWorkingBuffer[246];
				 realIp1B3 <= realWorkingBuffer[246];
				 imgIp2B3 <= imagWorkingBuffer[247];
				 realIp2B3 <= realWorkingBuffer[247];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd246;
				 stateIp2B3<=12'd247;

				 //(248,249)
				 imgIp1B4 <= imagWorkingBuffer[248];
				 realIp1B4 <= realWorkingBuffer[248];
				 imgIp2B4 <= imagWorkingBuffer[249];
				 realIp2B4 <= realWorkingBuffer[249];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd248;
				 stateIp2B4<=12'd249;

				 //(250,251)
				 imgIp1B5 <= imagWorkingBuffer[250];
				 realIp1B5 <= realWorkingBuffer[250];
				 imgIp2B5 <= imagWorkingBuffer[251];
				 realIp2B5 <= realWorkingBuffer[251];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd250;
				 stateIp2B5<=12'd251;

				 //(252,253)
				 imgIp1B6 <= imagWorkingBuffer[252];
				 realIp1B6 <= realWorkingBuffer[252];
				 imgIp2B6 <= imagWorkingBuffer[253];
				 realIp2B6 <= realWorkingBuffer[253];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd252;
				 stateIp2B6<=12'd253;

				 //(254,255)
				 imgIp1B7 <= imagWorkingBuffer[254];
				 realIp1B7 <= realWorkingBuffer[254];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd254;
				 stateIp2B7<=12'd255;
			 end
			 8'd17 : begin

				 //(256,257)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[257];
				 realIp2B0 <= realWorkingBuffer[257];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd257;

				 //(258,259)
				 imgIp1B1 <= imagWorkingBuffer[258];
				 realIp1B1 <= realWorkingBuffer[258];
				 imgIp2B1 <= imagWorkingBuffer[259];
				 realIp2B1 <= realWorkingBuffer[259];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd258;
				 stateIp2B1<=12'd259;

				 //(260,261)
				 imgIp1B2 <= imagWorkingBuffer[260];
				 realIp1B2 <= realWorkingBuffer[260];
				 imgIp2B2 <= imagWorkingBuffer[261];
				 realIp2B2 <= realWorkingBuffer[261];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd260;
				 stateIp2B2<=12'd261;

				 //(262,263)
				 imgIp1B3 <= imagWorkingBuffer[262];
				 realIp1B3 <= realWorkingBuffer[262];
				 imgIp2B3 <= imagWorkingBuffer[263];
				 realIp2B3 <= realWorkingBuffer[263];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd262;
				 stateIp2B3<=12'd263;

				 //(264,265)
				 imgIp1B4 <= imagWorkingBuffer[264];
				 realIp1B4 <= realWorkingBuffer[264];
				 imgIp2B4 <= imagWorkingBuffer[265];
				 realIp2B4 <= realWorkingBuffer[265];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd264;
				 stateIp2B4<=12'd265;

				 //(266,267)
				 imgIp1B5 <= imagWorkingBuffer[266];
				 realIp1B5 <= realWorkingBuffer[266];
				 imgIp2B5 <= imagWorkingBuffer[267];
				 realIp2B5 <= realWorkingBuffer[267];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd266;
				 stateIp2B5<=12'd267;

				 //(268,269)
				 imgIp1B6 <= imagWorkingBuffer[268];
				 realIp1B6 <= realWorkingBuffer[268];
				 imgIp2B6 <= imagWorkingBuffer[269];
				 realIp2B6 <= realWorkingBuffer[269];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd268;
				 stateIp2B6<=12'd269;

				 //(270,271)
				 imgIp1B7 <= imagWorkingBuffer[270];
				 realIp1B7 <= realWorkingBuffer[270];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd270;
				 stateIp2B7<=12'd271;
			 end
			 8'd18 : begin

				 //(272,273)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[273];
				 realIp2B0 <= realWorkingBuffer[273];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd273;

				 //(274,275)
				 imgIp1B1 <= imagWorkingBuffer[274];
				 realIp1B1 <= realWorkingBuffer[274];
				 imgIp2B1 <= imagWorkingBuffer[275];
				 realIp2B1 <= realWorkingBuffer[275];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd274;
				 stateIp2B1<=12'd275;

				 //(276,277)
				 imgIp1B2 <= imagWorkingBuffer[276];
				 realIp1B2 <= realWorkingBuffer[276];
				 imgIp2B2 <= imagWorkingBuffer[277];
				 realIp2B2 <= realWorkingBuffer[277];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd276;
				 stateIp2B2<=12'd277;

				 //(278,279)
				 imgIp1B3 <= imagWorkingBuffer[278];
				 realIp1B3 <= realWorkingBuffer[278];
				 imgIp2B3 <= imagWorkingBuffer[279];
				 realIp2B3 <= realWorkingBuffer[279];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd278;
				 stateIp2B3<=12'd279;

				 //(280,281)
				 imgIp1B4 <= imagWorkingBuffer[280];
				 realIp1B4 <= realWorkingBuffer[280];
				 imgIp2B4 <= imagWorkingBuffer[281];
				 realIp2B4 <= realWorkingBuffer[281];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd280;
				 stateIp2B4<=12'd281;

				 //(282,283)
				 imgIp1B5 <= imagWorkingBuffer[282];
				 realIp1B5 <= realWorkingBuffer[282];
				 imgIp2B5 <= imagWorkingBuffer[283];
				 realIp2B5 <= realWorkingBuffer[283];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd282;
				 stateIp2B5<=12'd283;

				 //(284,285)
				 imgIp1B6 <= imagWorkingBuffer[284];
				 realIp1B6 <= realWorkingBuffer[284];
				 imgIp2B6 <= imagWorkingBuffer[285];
				 realIp2B6 <= realWorkingBuffer[285];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd284;
				 stateIp2B6<=12'd285;

				 //(286,287)
				 imgIp1B7 <= imagWorkingBuffer[286];
				 realIp1B7 <= realWorkingBuffer[286];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd286;
				 stateIp2B7<=12'd287;
			 end
			 8'd19 : begin

				 //(288,289)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[289];
				 realIp2B0 <= realWorkingBuffer[289];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd289;

				 //(290,291)
				 imgIp1B1 <= imagWorkingBuffer[290];
				 realIp1B1 <= realWorkingBuffer[290];
				 imgIp2B1 <= imagWorkingBuffer[291];
				 realIp2B1 <= realWorkingBuffer[291];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd290;
				 stateIp2B1<=12'd291;

				 //(292,293)
				 imgIp1B2 <= imagWorkingBuffer[292];
				 realIp1B2 <= realWorkingBuffer[292];
				 imgIp2B2 <= imagWorkingBuffer[293];
				 realIp2B2 <= realWorkingBuffer[293];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd292;
				 stateIp2B2<=12'd293;

				 //(294,295)
				 imgIp1B3 <= imagWorkingBuffer[294];
				 realIp1B3 <= realWorkingBuffer[294];
				 imgIp2B3 <= imagWorkingBuffer[295];
				 realIp2B3 <= realWorkingBuffer[295];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd294;
				 stateIp2B3<=12'd295;

				 //(296,297)
				 imgIp1B4 <= imagWorkingBuffer[296];
				 realIp1B4 <= realWorkingBuffer[296];
				 imgIp2B4 <= imagWorkingBuffer[297];
				 realIp2B4 <= realWorkingBuffer[297];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd296;
				 stateIp2B4<=12'd297;

				 //(298,299)
				 imgIp1B5 <= imagWorkingBuffer[298];
				 realIp1B5 <= realWorkingBuffer[298];
				 imgIp2B5 <= imagWorkingBuffer[299];
				 realIp2B5 <= realWorkingBuffer[299];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd298;
				 stateIp2B5<=12'd299;

				 //(300,301)
				 imgIp1B6 <= imagWorkingBuffer[300];
				 realIp1B6 <= realWorkingBuffer[300];
				 imgIp2B6 <= imagWorkingBuffer[301];
				 realIp2B6 <= realWorkingBuffer[301];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd300;
				 stateIp2B6<=12'd301;

				 //(302,303)
				 imgIp1B7 <= imagWorkingBuffer[302];
				 realIp1B7 <= realWorkingBuffer[302];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd302;
				 stateIp2B7<=12'd303;
			 end
			 8'd20 : begin

				 //(304,305)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[305];
				 realIp2B0 <= realWorkingBuffer[305];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd304;
				 stateIp2B0<=12'd305;

				 //(306,307)
				 imgIp1B1 <= imagWorkingBuffer[306];
				 realIp1B1 <= realWorkingBuffer[306];
				 imgIp2B1 <= imagWorkingBuffer[307];
				 realIp2B1 <= realWorkingBuffer[307];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd306;
				 stateIp2B1<=12'd307;

				 //(308,309)
				 imgIp1B2 <= imagWorkingBuffer[308];
				 realIp1B2 <= realWorkingBuffer[308];
				 imgIp2B2 <= imagWorkingBuffer[309];
				 realIp2B2 <= realWorkingBuffer[309];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd308;
				 stateIp2B2<=12'd309;

				 //(310,311)
				 imgIp1B3 <= imagWorkingBuffer[310];
				 realIp1B3 <= realWorkingBuffer[310];
				 imgIp2B3 <= imagWorkingBuffer[311];
				 realIp2B3 <= realWorkingBuffer[311];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd310;
				 stateIp2B3<=12'd311;

				 //(312,313)
				 imgIp1B4 <= imagWorkingBuffer[312];
				 realIp1B4 <= realWorkingBuffer[312];
				 imgIp2B4 <= imagWorkingBuffer[313];
				 realIp2B4 <= realWorkingBuffer[313];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd312;
				 stateIp2B4<=12'd313;

				 //(314,315)
				 imgIp1B5 <= imagWorkingBuffer[314];
				 realIp1B5 <= realWorkingBuffer[314];
				 imgIp2B5 <= imagWorkingBuffer[315];
				 realIp2B5 <= realWorkingBuffer[315];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd314;
				 stateIp2B5<=12'd315;

				 //(316,317)
				 imgIp1B6 <= imagWorkingBuffer[316];
				 realIp1B6 <= realWorkingBuffer[316];
				 imgIp2B6 <= imagWorkingBuffer[317];
				 realIp2B6 <= realWorkingBuffer[317];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd316;
				 stateIp2B6<=12'd317;

				 //(318,319)
				 imgIp1B7 <= imagWorkingBuffer[318];
				 realIp1B7 <= realWorkingBuffer[318];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd318;
				 stateIp2B7<=12'd319;
			 end
			 8'd21 : begin

				 //(320,321)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[321];
				 realIp2B0 <= realWorkingBuffer[321];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd321;

				 //(322,323)
				 imgIp1B1 <= imagWorkingBuffer[322];
				 realIp1B1 <= realWorkingBuffer[322];
				 imgIp2B1 <= imagWorkingBuffer[323];
				 realIp2B1 <= realWorkingBuffer[323];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd322;
				 stateIp2B1<=12'd323;

				 //(324,325)
				 imgIp1B2 <= imagWorkingBuffer[324];
				 realIp1B2 <= realWorkingBuffer[324];
				 imgIp2B2 <= imagWorkingBuffer[325];
				 realIp2B2 <= realWorkingBuffer[325];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd324;
				 stateIp2B2<=12'd325;

				 //(326,327)
				 imgIp1B3 <= imagWorkingBuffer[326];
				 realIp1B3 <= realWorkingBuffer[326];
				 imgIp2B3 <= imagWorkingBuffer[327];
				 realIp2B3 <= realWorkingBuffer[327];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd326;
				 stateIp2B3<=12'd327;

				 //(328,329)
				 imgIp1B4 <= imagWorkingBuffer[328];
				 realIp1B4 <= realWorkingBuffer[328];
				 imgIp2B4 <= imagWorkingBuffer[329];
				 realIp2B4 <= realWorkingBuffer[329];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd328;
				 stateIp2B4<=12'd329;

				 //(330,331)
				 imgIp1B5 <= imagWorkingBuffer[330];
				 realIp1B5 <= realWorkingBuffer[330];
				 imgIp2B5 <= imagWorkingBuffer[331];
				 realIp2B5 <= realWorkingBuffer[331];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd330;
				 stateIp2B5<=12'd331;

				 //(332,333)
				 imgIp1B6 <= imagWorkingBuffer[332];
				 realIp1B6 <= realWorkingBuffer[332];
				 imgIp2B6 <= imagWorkingBuffer[333];
				 realIp2B6 <= realWorkingBuffer[333];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd332;
				 stateIp2B6<=12'd333;

				 //(334,335)
				 imgIp1B7 <= imagWorkingBuffer[334];
				 realIp1B7 <= realWorkingBuffer[334];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd334;
				 stateIp2B7<=12'd335;
			 end
			 8'd22 : begin

				 //(336,337)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[337];
				 realIp2B0 <= realWorkingBuffer[337];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd336;
				 stateIp2B0<=12'd337;

				 //(338,339)
				 imgIp1B1 <= imagWorkingBuffer[338];
				 realIp1B1 <= realWorkingBuffer[338];
				 imgIp2B1 <= imagWorkingBuffer[339];
				 realIp2B1 <= realWorkingBuffer[339];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd338;
				 stateIp2B1<=12'd339;

				 //(340,341)
				 imgIp1B2 <= imagWorkingBuffer[340];
				 realIp1B2 <= realWorkingBuffer[340];
				 imgIp2B2 <= imagWorkingBuffer[341];
				 realIp2B2 <= realWorkingBuffer[341];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd340;
				 stateIp2B2<=12'd341;

				 //(342,343)
				 imgIp1B3 <= imagWorkingBuffer[342];
				 realIp1B3 <= realWorkingBuffer[342];
				 imgIp2B3 <= imagWorkingBuffer[343];
				 realIp2B3 <= realWorkingBuffer[343];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd342;
				 stateIp2B3<=12'd343;

				 //(344,345)
				 imgIp1B4 <= imagWorkingBuffer[344];
				 realIp1B4 <= realWorkingBuffer[344];
				 imgIp2B4 <= imagWorkingBuffer[345];
				 realIp2B4 <= realWorkingBuffer[345];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd344;
				 stateIp2B4<=12'd345;

				 //(346,347)
				 imgIp1B5 <= imagWorkingBuffer[346];
				 realIp1B5 <= realWorkingBuffer[346];
				 imgIp2B5 <= imagWorkingBuffer[347];
				 realIp2B5 <= realWorkingBuffer[347];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd346;
				 stateIp2B5<=12'd347;

				 //(348,349)
				 imgIp1B6 <= imagWorkingBuffer[348];
				 realIp1B6 <= realWorkingBuffer[348];
				 imgIp2B6 <= imagWorkingBuffer[349];
				 realIp2B6 <= realWorkingBuffer[349];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd348;
				 stateIp2B6<=12'd349;

				 //(350,351)
				 imgIp1B7 <= imagWorkingBuffer[350];
				 realIp1B7 <= realWorkingBuffer[350];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd350;
				 stateIp2B7<=12'd351;
			 end
			 8'd23 : begin

				 //(352,353)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[353];
				 realIp2B0 <= realWorkingBuffer[353];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd352;
				 stateIp2B0<=12'd353;

				 //(354,355)
				 imgIp1B1 <= imagWorkingBuffer[354];
				 realIp1B1 <= realWorkingBuffer[354];
				 imgIp2B1 <= imagWorkingBuffer[355];
				 realIp2B1 <= realWorkingBuffer[355];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd354;
				 stateIp2B1<=12'd355;

				 //(356,357)
				 imgIp1B2 <= imagWorkingBuffer[356];
				 realIp1B2 <= realWorkingBuffer[356];
				 imgIp2B2 <= imagWorkingBuffer[357];
				 realIp2B2 <= realWorkingBuffer[357];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd356;
				 stateIp2B2<=12'd357;

				 //(358,359)
				 imgIp1B3 <= imagWorkingBuffer[358];
				 realIp1B3 <= realWorkingBuffer[358];
				 imgIp2B3 <= imagWorkingBuffer[359];
				 realIp2B3 <= realWorkingBuffer[359];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd358;
				 stateIp2B3<=12'd359;

				 //(360,361)
				 imgIp1B4 <= imagWorkingBuffer[360];
				 realIp1B4 <= realWorkingBuffer[360];
				 imgIp2B4 <= imagWorkingBuffer[361];
				 realIp2B4 <= realWorkingBuffer[361];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd360;
				 stateIp2B4<=12'd361;

				 //(362,363)
				 imgIp1B5 <= imagWorkingBuffer[362];
				 realIp1B5 <= realWorkingBuffer[362];
				 imgIp2B5 <= imagWorkingBuffer[363];
				 realIp2B5 <= realWorkingBuffer[363];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd362;
				 stateIp2B5<=12'd363;

				 //(364,365)
				 imgIp1B6 <= imagWorkingBuffer[364];
				 realIp1B6 <= realWorkingBuffer[364];
				 imgIp2B6 <= imagWorkingBuffer[365];
				 realIp2B6 <= realWorkingBuffer[365];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd364;
				 stateIp2B6<=12'd365;

				 //(366,367)
				 imgIp1B7 <= imagWorkingBuffer[366];
				 realIp1B7 <= realWorkingBuffer[366];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd366;
				 stateIp2B7<=12'd367;
			 end
			 8'd24 : begin

				 //(368,369)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[369];
				 realIp2B0 <= realWorkingBuffer[369];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd368;
				 stateIp2B0<=12'd369;

				 //(370,371)
				 imgIp1B1 <= imagWorkingBuffer[370];
				 realIp1B1 <= realWorkingBuffer[370];
				 imgIp2B1 <= imagWorkingBuffer[371];
				 realIp2B1 <= realWorkingBuffer[371];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd370;
				 stateIp2B1<=12'd371;

				 //(372,373)
				 imgIp1B2 <= imagWorkingBuffer[372];
				 realIp1B2 <= realWorkingBuffer[372];
				 imgIp2B2 <= imagWorkingBuffer[373];
				 realIp2B2 <= realWorkingBuffer[373];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd372;
				 stateIp2B2<=12'd373;

				 //(374,375)
				 imgIp1B3 <= imagWorkingBuffer[374];
				 realIp1B3 <= realWorkingBuffer[374];
				 imgIp2B3 <= imagWorkingBuffer[375];
				 realIp2B3 <= realWorkingBuffer[375];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd374;
				 stateIp2B3<=12'd375;

				 //(376,377)
				 imgIp1B4 <= imagWorkingBuffer[376];
				 realIp1B4 <= realWorkingBuffer[376];
				 imgIp2B4 <= imagWorkingBuffer[377];
				 realIp2B4 <= realWorkingBuffer[377];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd376;
				 stateIp2B4<=12'd377;

				 //(378,379)
				 imgIp1B5 <= imagWorkingBuffer[378];
				 realIp1B5 <= realWorkingBuffer[378];
				 imgIp2B5 <= imagWorkingBuffer[379];
				 realIp2B5 <= realWorkingBuffer[379];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd378;
				 stateIp2B5<=12'd379;

				 //(380,381)
				 imgIp1B6 <= imagWorkingBuffer[380];
				 realIp1B6 <= realWorkingBuffer[380];
				 imgIp2B6 <= imagWorkingBuffer[381];
				 realIp2B6 <= realWorkingBuffer[381];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd380;
				 stateIp2B6<=12'd381;

				 //(382,383)
				 imgIp1B7 <= imagWorkingBuffer[382];
				 realIp1B7 <= realWorkingBuffer[382];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd382;
				 stateIp2B7<=12'd383;
			 end
			 8'd25 : begin

				 //(384,385)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[385];
				 realIp2B0 <= realWorkingBuffer[385];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd385;

				 //(386,387)
				 imgIp1B1 <= imagWorkingBuffer[386];
				 realIp1B1 <= realWorkingBuffer[386];
				 imgIp2B1 <= imagWorkingBuffer[387];
				 realIp2B1 <= realWorkingBuffer[387];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd386;
				 stateIp2B1<=12'd387;

				 //(388,389)
				 imgIp1B2 <= imagWorkingBuffer[388];
				 realIp1B2 <= realWorkingBuffer[388];
				 imgIp2B2 <= imagWorkingBuffer[389];
				 realIp2B2 <= realWorkingBuffer[389];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd388;
				 stateIp2B2<=12'd389;

				 //(390,391)
				 imgIp1B3 <= imagWorkingBuffer[390];
				 realIp1B3 <= realWorkingBuffer[390];
				 imgIp2B3 <= imagWorkingBuffer[391];
				 realIp2B3 <= realWorkingBuffer[391];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd390;
				 stateIp2B3<=12'd391;

				 //(392,393)
				 imgIp1B4 <= imagWorkingBuffer[392];
				 realIp1B4 <= realWorkingBuffer[392];
				 imgIp2B4 <= imagWorkingBuffer[393];
				 realIp2B4 <= realWorkingBuffer[393];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd392;
				 stateIp2B4<=12'd393;

				 //(394,395)
				 imgIp1B5 <= imagWorkingBuffer[394];
				 realIp1B5 <= realWorkingBuffer[394];
				 imgIp2B5 <= imagWorkingBuffer[395];
				 realIp2B5 <= realWorkingBuffer[395];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd394;
				 stateIp2B5<=12'd395;

				 //(396,397)
				 imgIp1B6 <= imagWorkingBuffer[396];
				 realIp1B6 <= realWorkingBuffer[396];
				 imgIp2B6 <= imagWorkingBuffer[397];
				 realIp2B6 <= realWorkingBuffer[397];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd396;
				 stateIp2B6<=12'd397;

				 //(398,399)
				 imgIp1B7 <= imagWorkingBuffer[398];
				 realIp1B7 <= realWorkingBuffer[398];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd398;
				 stateIp2B7<=12'd399;
			 end
			 8'd26 : begin

				 //(400,401)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[401];
				 realIp2B0 <= realWorkingBuffer[401];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd400;
				 stateIp2B0<=12'd401;

				 //(402,403)
				 imgIp1B1 <= imagWorkingBuffer[402];
				 realIp1B1 <= realWorkingBuffer[402];
				 imgIp2B1 <= imagWorkingBuffer[403];
				 realIp2B1 <= realWorkingBuffer[403];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd402;
				 stateIp2B1<=12'd403;

				 //(404,405)
				 imgIp1B2 <= imagWorkingBuffer[404];
				 realIp1B2 <= realWorkingBuffer[404];
				 imgIp2B2 <= imagWorkingBuffer[405];
				 realIp2B2 <= realWorkingBuffer[405];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd404;
				 stateIp2B2<=12'd405;

				 //(406,407)
				 imgIp1B3 <= imagWorkingBuffer[406];
				 realIp1B3 <= realWorkingBuffer[406];
				 imgIp2B3 <= imagWorkingBuffer[407];
				 realIp2B3 <= realWorkingBuffer[407];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd406;
				 stateIp2B3<=12'd407;

				 //(408,409)
				 imgIp1B4 <= imagWorkingBuffer[408];
				 realIp1B4 <= realWorkingBuffer[408];
				 imgIp2B4 <= imagWorkingBuffer[409];
				 realIp2B4 <= realWorkingBuffer[409];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd408;
				 stateIp2B4<=12'd409;

				 //(410,411)
				 imgIp1B5 <= imagWorkingBuffer[410];
				 realIp1B5 <= realWorkingBuffer[410];
				 imgIp2B5 <= imagWorkingBuffer[411];
				 realIp2B5 <= realWorkingBuffer[411];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd410;
				 stateIp2B5<=12'd411;

				 //(412,413)
				 imgIp1B6 <= imagWorkingBuffer[412];
				 realIp1B6 <= realWorkingBuffer[412];
				 imgIp2B6 <= imagWorkingBuffer[413];
				 realIp2B6 <= realWorkingBuffer[413];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd412;
				 stateIp2B6<=12'd413;

				 //(414,415)
				 imgIp1B7 <= imagWorkingBuffer[414];
				 realIp1B7 <= realWorkingBuffer[414];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd414;
				 stateIp2B7<=12'd415;
			 end
			 8'd27 : begin

				 //(416,417)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[417];
				 realIp2B0 <= realWorkingBuffer[417];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd416;
				 stateIp2B0<=12'd417;

				 //(418,419)
				 imgIp1B1 <= imagWorkingBuffer[418];
				 realIp1B1 <= realWorkingBuffer[418];
				 imgIp2B1 <= imagWorkingBuffer[419];
				 realIp2B1 <= realWorkingBuffer[419];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd418;
				 stateIp2B1<=12'd419;

				 //(420,421)
				 imgIp1B2 <= imagWorkingBuffer[420];
				 realIp1B2 <= realWorkingBuffer[420];
				 imgIp2B2 <= imagWorkingBuffer[421];
				 realIp2B2 <= realWorkingBuffer[421];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd420;
				 stateIp2B2<=12'd421;

				 //(422,423)
				 imgIp1B3 <= imagWorkingBuffer[422];
				 realIp1B3 <= realWorkingBuffer[422];
				 imgIp2B3 <= imagWorkingBuffer[423];
				 realIp2B3 <= realWorkingBuffer[423];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd422;
				 stateIp2B3<=12'd423;

				 //(424,425)
				 imgIp1B4 <= imagWorkingBuffer[424];
				 realIp1B4 <= realWorkingBuffer[424];
				 imgIp2B4 <= imagWorkingBuffer[425];
				 realIp2B4 <= realWorkingBuffer[425];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd424;
				 stateIp2B4<=12'd425;

				 //(426,427)
				 imgIp1B5 <= imagWorkingBuffer[426];
				 realIp1B5 <= realWorkingBuffer[426];
				 imgIp2B5 <= imagWorkingBuffer[427];
				 realIp2B5 <= realWorkingBuffer[427];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd426;
				 stateIp2B5<=12'd427;

				 //(428,429)
				 imgIp1B6 <= imagWorkingBuffer[428];
				 realIp1B6 <= realWorkingBuffer[428];
				 imgIp2B6 <= imagWorkingBuffer[429];
				 realIp2B6 <= realWorkingBuffer[429];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd428;
				 stateIp2B6<=12'd429;

				 //(430,431)
				 imgIp1B7 <= imagWorkingBuffer[430];
				 realIp1B7 <= realWorkingBuffer[430];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd430;
				 stateIp2B7<=12'd431;
			 end
			 8'd28 : begin

				 //(432,433)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[433];
				 realIp2B0 <= realWorkingBuffer[433];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd432;
				 stateIp2B0<=12'd433;

				 //(434,435)
				 imgIp1B1 <= imagWorkingBuffer[434];
				 realIp1B1 <= realWorkingBuffer[434];
				 imgIp2B1 <= imagWorkingBuffer[435];
				 realIp2B1 <= realWorkingBuffer[435];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd434;
				 stateIp2B1<=12'd435;

				 //(436,437)
				 imgIp1B2 <= imagWorkingBuffer[436];
				 realIp1B2 <= realWorkingBuffer[436];
				 imgIp2B2 <= imagWorkingBuffer[437];
				 realIp2B2 <= realWorkingBuffer[437];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd436;
				 stateIp2B2<=12'd437;

				 //(438,439)
				 imgIp1B3 <= imagWorkingBuffer[438];
				 realIp1B3 <= realWorkingBuffer[438];
				 imgIp2B3 <= imagWorkingBuffer[439];
				 realIp2B3 <= realWorkingBuffer[439];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd438;
				 stateIp2B3<=12'd439;

				 //(440,441)
				 imgIp1B4 <= imagWorkingBuffer[440];
				 realIp1B4 <= realWorkingBuffer[440];
				 imgIp2B4 <= imagWorkingBuffer[441];
				 realIp2B4 <= realWorkingBuffer[441];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd440;
				 stateIp2B4<=12'd441;

				 //(442,443)
				 imgIp1B5 <= imagWorkingBuffer[442];
				 realIp1B5 <= realWorkingBuffer[442];
				 imgIp2B5 <= imagWorkingBuffer[443];
				 realIp2B5 <= realWorkingBuffer[443];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd442;
				 stateIp2B5<=12'd443;

				 //(444,445)
				 imgIp1B6 <= imagWorkingBuffer[444];
				 realIp1B6 <= realWorkingBuffer[444];
				 imgIp2B6 <= imagWorkingBuffer[445];
				 realIp2B6 <= realWorkingBuffer[445];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd444;
				 stateIp2B6<=12'd445;

				 //(446,447)
				 imgIp1B7 <= imagWorkingBuffer[446];
				 realIp1B7 <= realWorkingBuffer[446];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd446;
				 stateIp2B7<=12'd447;
			 end
			 8'd29 : begin

				 //(448,449)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[449];
				 realIp2B0 <= realWorkingBuffer[449];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd448;
				 stateIp2B0<=12'd449;

				 //(450,451)
				 imgIp1B1 <= imagWorkingBuffer[450];
				 realIp1B1 <= realWorkingBuffer[450];
				 imgIp2B1 <= imagWorkingBuffer[451];
				 realIp2B1 <= realWorkingBuffer[451];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd450;
				 stateIp2B1<=12'd451;

				 //(452,453)
				 imgIp1B2 <= imagWorkingBuffer[452];
				 realIp1B2 <= realWorkingBuffer[452];
				 imgIp2B2 <= imagWorkingBuffer[453];
				 realIp2B2 <= realWorkingBuffer[453];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd452;
				 stateIp2B2<=12'd453;

				 //(454,455)
				 imgIp1B3 <= imagWorkingBuffer[454];
				 realIp1B3 <= realWorkingBuffer[454];
				 imgIp2B3 <= imagWorkingBuffer[455];
				 realIp2B3 <= realWorkingBuffer[455];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd454;
				 stateIp2B3<=12'd455;

				 //(456,457)
				 imgIp1B4 <= imagWorkingBuffer[456];
				 realIp1B4 <= realWorkingBuffer[456];
				 imgIp2B4 <= imagWorkingBuffer[457];
				 realIp2B4 <= realWorkingBuffer[457];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd456;
				 stateIp2B4<=12'd457;

				 //(458,459)
				 imgIp1B5 <= imagWorkingBuffer[458];
				 realIp1B5 <= realWorkingBuffer[458];
				 imgIp2B5 <= imagWorkingBuffer[459];
				 realIp2B5 <= realWorkingBuffer[459];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd458;
				 stateIp2B5<=12'd459;

				 //(460,461)
				 imgIp1B6 <= imagWorkingBuffer[460];
				 realIp1B6 <= realWorkingBuffer[460];
				 imgIp2B6 <= imagWorkingBuffer[461];
				 realIp2B6 <= realWorkingBuffer[461];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd460;
				 stateIp2B6<=12'd461;

				 //(462,463)
				 imgIp1B7 <= imagWorkingBuffer[462];
				 realIp1B7 <= realWorkingBuffer[462];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd462;
				 stateIp2B7<=12'd463;
			 end
			 8'd30 : begin

				 //(464,465)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[465];
				 realIp2B0 <= realWorkingBuffer[465];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd464;
				 stateIp2B0<=12'd465;

				 //(466,467)
				 imgIp1B1 <= imagWorkingBuffer[466];
				 realIp1B1 <= realWorkingBuffer[466];
				 imgIp2B1 <= imagWorkingBuffer[467];
				 realIp2B1 <= realWorkingBuffer[467];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd466;
				 stateIp2B1<=12'd467;

				 //(468,469)
				 imgIp1B2 <= imagWorkingBuffer[468];
				 realIp1B2 <= realWorkingBuffer[468];
				 imgIp2B2 <= imagWorkingBuffer[469];
				 realIp2B2 <= realWorkingBuffer[469];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd468;
				 stateIp2B2<=12'd469;

				 //(470,471)
				 imgIp1B3 <= imagWorkingBuffer[470];
				 realIp1B3 <= realWorkingBuffer[470];
				 imgIp2B3 <= imagWorkingBuffer[471];
				 realIp2B3 <= realWorkingBuffer[471];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd470;
				 stateIp2B3<=12'd471;

				 //(472,473)
				 imgIp1B4 <= imagWorkingBuffer[472];
				 realIp1B4 <= realWorkingBuffer[472];
				 imgIp2B4 <= imagWorkingBuffer[473];
				 realIp2B4 <= realWorkingBuffer[473];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd472;
				 stateIp2B4<=12'd473;

				 //(474,475)
				 imgIp1B5 <= imagWorkingBuffer[474];
				 realIp1B5 <= realWorkingBuffer[474];
				 imgIp2B5 <= imagWorkingBuffer[475];
				 realIp2B5 <= realWorkingBuffer[475];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd474;
				 stateIp2B5<=12'd475;

				 //(476,477)
				 imgIp1B6 <= imagWorkingBuffer[476];
				 realIp1B6 <= realWorkingBuffer[476];
				 imgIp2B6 <= imagWorkingBuffer[477];
				 realIp2B6 <= realWorkingBuffer[477];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd476;
				 stateIp2B6<=12'd477;

				 //(478,479)
				 imgIp1B7 <= imagWorkingBuffer[478];
				 realIp1B7 <= realWorkingBuffer[478];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd478;
				 stateIp2B7<=12'd479;
			 end
			 8'd31 : begin

				 //(480,481)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[481];
				 realIp2B0 <= realWorkingBuffer[481];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd480;
				 stateIp2B0<=12'd481;

				 //(482,483)
				 imgIp1B1 <= imagWorkingBuffer[482];
				 realIp1B1 <= realWorkingBuffer[482];
				 imgIp2B1 <= imagWorkingBuffer[483];
				 realIp2B1 <= realWorkingBuffer[483];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd482;
				 stateIp2B1<=12'd483;

				 //(484,485)
				 imgIp1B2 <= imagWorkingBuffer[484];
				 realIp1B2 <= realWorkingBuffer[484];
				 imgIp2B2 <= imagWorkingBuffer[485];
				 realIp2B2 <= realWorkingBuffer[485];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd484;
				 stateIp2B2<=12'd485;

				 //(486,487)
				 imgIp1B3 <= imagWorkingBuffer[486];
				 realIp1B3 <= realWorkingBuffer[486];
				 imgIp2B3 <= imagWorkingBuffer[487];
				 realIp2B3 <= realWorkingBuffer[487];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd486;
				 stateIp2B3<=12'd487;

				 //(488,489)
				 imgIp1B4 <= imagWorkingBuffer[488];
				 realIp1B4 <= realWorkingBuffer[488];
				 imgIp2B4 <= imagWorkingBuffer[489];
				 realIp2B4 <= realWorkingBuffer[489];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd488;
				 stateIp2B4<=12'd489;

				 //(490,491)
				 imgIp1B5 <= imagWorkingBuffer[490];
				 realIp1B5 <= realWorkingBuffer[490];
				 imgIp2B5 <= imagWorkingBuffer[491];
				 realIp2B5 <= realWorkingBuffer[491];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd490;
				 stateIp2B5<=12'd491;

				 //(492,493)
				 imgIp1B6 <= imagWorkingBuffer[492];
				 realIp1B6 <= realWorkingBuffer[492];
				 imgIp2B6 <= imagWorkingBuffer[493];
				 realIp2B6 <= realWorkingBuffer[493];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd492;
				 stateIp2B6<=12'd493;

				 //(494,495)
				 imgIp1B7 <= imagWorkingBuffer[494];
				 realIp1B7 <= realWorkingBuffer[494];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd494;
				 stateIp2B7<=12'd495;
			 end
			 8'd32 : begin

				 //(496,497)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[497];
				 realIp2B0 <= realWorkingBuffer[497];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd496;
				 stateIp2B0<=12'd497;

				 //(498,499)
				 imgIp1B1 <= imagWorkingBuffer[498];
				 realIp1B1 <= realWorkingBuffer[498];
				 imgIp2B1 <= imagWorkingBuffer[499];
				 realIp2B1 <= realWorkingBuffer[499];
				 twiddleFactorRealB1 <=1.0;
				 twiddleFactorimgB1 <=-0.0;
				 stateIp1B1<=12'd498;
				 stateIp2B1<=12'd499;

				 //(500,501)
				 imgIp1B2 <= imagWorkingBuffer[500];
				 realIp1B2 <= realWorkingBuffer[500];
				 imgIp2B2 <= imagWorkingBuffer[501];
				 realIp2B2 <= realWorkingBuffer[501];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=-0.0;
				 stateIp1B2<=12'd500;
				 stateIp2B2<=12'd501;

				 //(502,503)
				 imgIp1B3 <= imagWorkingBuffer[502];
				 realIp1B3 <= realWorkingBuffer[502];
				 imgIp2B3 <= imagWorkingBuffer[503];
				 realIp2B3 <= realWorkingBuffer[503];
				 twiddleFactorRealB3 <=1.0;
				 twiddleFactorimgB3 <=-0.0;
				 stateIp1B3<=12'd502;
				 stateIp2B3<=12'd503;

				 //(504,505)
				 imgIp1B4 <= imagWorkingBuffer[504];
				 realIp1B4 <= realWorkingBuffer[504];
				 imgIp2B4 <= imagWorkingBuffer[505];
				 realIp2B4 <= realWorkingBuffer[505];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd504;
				 stateIp2B4<=12'd505;

				 //(506,507)
				 imgIp1B5 <= imagWorkingBuffer[506];
				 realIp1B5 <= realWorkingBuffer[506];
				 imgIp2B5 <= imagWorkingBuffer[507];
				 realIp2B5 <= realWorkingBuffer[507];
				 twiddleFactorRealB5 <=1.0;
				 twiddleFactorimgB5 <=-0.0;
				 stateIp1B5<=12'd506;
				 stateIp2B5<=12'd507;

				 //(508,509)
				 imgIp1B6 <= imagWorkingBuffer[508];
				 realIp1B6 <= realWorkingBuffer[508];
				 imgIp2B6 <= imagWorkingBuffer[509];
				 realIp2B6 <= realWorkingBuffer[509];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=-0.0;
				 stateIp1B6<=12'd508;
				 stateIp2B6<=12'd509;

				 //(510,511)
				 imgIp1B7 <= imagWorkingBuffer[510];
				 realIp1B7 <= realWorkingBuffer[510];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=1.0;
				 twiddleFactorimgB7 <=-0.0;
				 stateIp1B7<=12'd510;
				 stateIp2B7<=12'd511;
			 end
			 8'd33 : begin

				 //(0,2)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[2];
				 realIp2B0 <= realWorkingBuffer[2];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd2;

				 //(1,3)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[3];
				 realIp2B1 <= realWorkingBuffer[3];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd3;

				 //(4,6)
				 imgIp1B2 <= imagWorkingBuffer[4];
				 realIp1B2 <= realWorkingBuffer[4];
				 imgIp2B2 <= imagWorkingBuffer[6];
				 realIp2B2 <= realWorkingBuffer[6];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd4;
				 stateIp2B2<=12'd6;

				 //(5,7)
				 imgIp1B3 <= imagWorkingBuffer[5];
				 realIp1B3 <= realWorkingBuffer[5];
				 imgIp2B3 <= imagWorkingBuffer[7];
				 realIp2B3 <= realWorkingBuffer[7];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd5;
				 stateIp2B3<=12'd7;

				 //(8,10)
				 imgIp1B4 <= imagWorkingBuffer[8];
				 realIp1B4 <= realWorkingBuffer[8];
				 imgIp2B4 <= imagWorkingBuffer[10];
				 realIp2B4 <= realWorkingBuffer[10];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd8;
				 stateIp2B4<=12'd10;

				 //(9,11)
				 imgIp1B5 <= imagWorkingBuffer[9];
				 realIp1B5 <= realWorkingBuffer[9];
				 imgIp2B5 <= imagWorkingBuffer[11];
				 realIp2B5 <= realWorkingBuffer[11];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd9;
				 stateIp2B5<=12'd11;

				 //(12,14)
				 imgIp1B6 <= imagWorkingBuffer[12];
				 realIp1B6 <= realWorkingBuffer[12];
				 imgIp2B6 <= imagWorkingBuffer[14];
				 realIp2B6 <= realWorkingBuffer[14];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd12;
				 stateIp2B6<=12'd14;

				 //(13,15)
				 imgIp1B7 <= imagWorkingBuffer[13];
				 realIp1B7 <= realWorkingBuffer[13];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd13;
				 stateIp2B7<=12'd15;
			 end
			 8'd34 : begin

				 //(16,18)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[18];
				 realIp2B0 <= realWorkingBuffer[18];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd18;

				 //(17,19)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[19];
				 realIp2B1 <= realWorkingBuffer[19];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd19;

				 //(20,22)
				 imgIp1B2 <= imagWorkingBuffer[20];
				 realIp1B2 <= realWorkingBuffer[20];
				 imgIp2B2 <= imagWorkingBuffer[22];
				 realIp2B2 <= realWorkingBuffer[22];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd20;
				 stateIp2B2<=12'd22;

				 //(21,23)
				 imgIp1B3 <= imagWorkingBuffer[21];
				 realIp1B3 <= realWorkingBuffer[21];
				 imgIp2B3 <= imagWorkingBuffer[23];
				 realIp2B3 <= realWorkingBuffer[23];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd21;
				 stateIp2B3<=12'd23;

				 //(24,26)
				 imgIp1B4 <= imagWorkingBuffer[24];
				 realIp1B4 <= realWorkingBuffer[24];
				 imgIp2B4 <= imagWorkingBuffer[26];
				 realIp2B4 <= realWorkingBuffer[26];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd24;
				 stateIp2B4<=12'd26;

				 //(25,27)
				 imgIp1B5 <= imagWorkingBuffer[25];
				 realIp1B5 <= realWorkingBuffer[25];
				 imgIp2B5 <= imagWorkingBuffer[27];
				 realIp2B5 <= realWorkingBuffer[27];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd25;
				 stateIp2B5<=12'd27;

				 //(28,30)
				 imgIp1B6 <= imagWorkingBuffer[28];
				 realIp1B6 <= realWorkingBuffer[28];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd28;
				 stateIp2B6<=12'd30;

				 //(29,31)
				 imgIp1B7 <= imagWorkingBuffer[29];
				 realIp1B7 <= realWorkingBuffer[29];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd29;
				 stateIp2B7<=12'd31;
			 end
			 8'd35 : begin

				 //(32,34)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[34];
				 realIp2B0 <= realWorkingBuffer[34];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd34;

				 //(33,35)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[35];
				 realIp2B1 <= realWorkingBuffer[35];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd35;

				 //(36,38)
				 imgIp1B2 <= imagWorkingBuffer[36];
				 realIp1B2 <= realWorkingBuffer[36];
				 imgIp2B2 <= imagWorkingBuffer[38];
				 realIp2B2 <= realWorkingBuffer[38];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd36;
				 stateIp2B2<=12'd38;

				 //(37,39)
				 imgIp1B3 <= imagWorkingBuffer[37];
				 realIp1B3 <= realWorkingBuffer[37];
				 imgIp2B3 <= imagWorkingBuffer[39];
				 realIp2B3 <= realWorkingBuffer[39];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd37;
				 stateIp2B3<=12'd39;

				 //(40,42)
				 imgIp1B4 <= imagWorkingBuffer[40];
				 realIp1B4 <= realWorkingBuffer[40];
				 imgIp2B4 <= imagWorkingBuffer[42];
				 realIp2B4 <= realWorkingBuffer[42];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd40;
				 stateIp2B4<=12'd42;

				 //(41,43)
				 imgIp1B5 <= imagWorkingBuffer[41];
				 realIp1B5 <= realWorkingBuffer[41];
				 imgIp2B5 <= imagWorkingBuffer[43];
				 realIp2B5 <= realWorkingBuffer[43];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd41;
				 stateIp2B5<=12'd43;

				 //(44,46)
				 imgIp1B6 <= imagWorkingBuffer[44];
				 realIp1B6 <= realWorkingBuffer[44];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd44;
				 stateIp2B6<=12'd46;

				 //(45,47)
				 imgIp1B7 <= imagWorkingBuffer[45];
				 realIp1B7 <= realWorkingBuffer[45];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd45;
				 stateIp2B7<=12'd47;
			 end
			 8'd36 : begin

				 //(48,50)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[50];
				 realIp2B0 <= realWorkingBuffer[50];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd50;

				 //(49,51)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[51];
				 realIp2B1 <= realWorkingBuffer[51];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd49;
				 stateIp2B1<=12'd51;

				 //(52,54)
				 imgIp1B2 <= imagWorkingBuffer[52];
				 realIp1B2 <= realWorkingBuffer[52];
				 imgIp2B2 <= imagWorkingBuffer[54];
				 realIp2B2 <= realWorkingBuffer[54];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd52;
				 stateIp2B2<=12'd54;

				 //(53,55)
				 imgIp1B3 <= imagWorkingBuffer[53];
				 realIp1B3 <= realWorkingBuffer[53];
				 imgIp2B3 <= imagWorkingBuffer[55];
				 realIp2B3 <= realWorkingBuffer[55];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd53;
				 stateIp2B3<=12'd55;

				 //(56,58)
				 imgIp1B4 <= imagWorkingBuffer[56];
				 realIp1B4 <= realWorkingBuffer[56];
				 imgIp2B4 <= imagWorkingBuffer[58];
				 realIp2B4 <= realWorkingBuffer[58];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd56;
				 stateIp2B4<=12'd58;

				 //(57,59)
				 imgIp1B5 <= imagWorkingBuffer[57];
				 realIp1B5 <= realWorkingBuffer[57];
				 imgIp2B5 <= imagWorkingBuffer[59];
				 realIp2B5 <= realWorkingBuffer[59];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd57;
				 stateIp2B5<=12'd59;

				 //(60,62)
				 imgIp1B6 <= imagWorkingBuffer[60];
				 realIp1B6 <= realWorkingBuffer[60];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd60;
				 stateIp2B6<=12'd62;

				 //(61,63)
				 imgIp1B7 <= imagWorkingBuffer[61];
				 realIp1B7 <= realWorkingBuffer[61];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd61;
				 stateIp2B7<=12'd63;
			 end
			 8'd37 : begin

				 //(64,66)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[66];
				 realIp2B0 <= realWorkingBuffer[66];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd66;

				 //(65,67)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[67];
				 realIp2B1 <= realWorkingBuffer[67];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd67;

				 //(68,70)
				 imgIp1B2 <= imagWorkingBuffer[68];
				 realIp1B2 <= realWorkingBuffer[68];
				 imgIp2B2 <= imagWorkingBuffer[70];
				 realIp2B2 <= realWorkingBuffer[70];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd68;
				 stateIp2B2<=12'd70;

				 //(69,71)
				 imgIp1B3 <= imagWorkingBuffer[69];
				 realIp1B3 <= realWorkingBuffer[69];
				 imgIp2B3 <= imagWorkingBuffer[71];
				 realIp2B3 <= realWorkingBuffer[71];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd69;
				 stateIp2B3<=12'd71;

				 //(72,74)
				 imgIp1B4 <= imagWorkingBuffer[72];
				 realIp1B4 <= realWorkingBuffer[72];
				 imgIp2B4 <= imagWorkingBuffer[74];
				 realIp2B4 <= realWorkingBuffer[74];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd72;
				 stateIp2B4<=12'd74;

				 //(73,75)
				 imgIp1B5 <= imagWorkingBuffer[73];
				 realIp1B5 <= realWorkingBuffer[73];
				 imgIp2B5 <= imagWorkingBuffer[75];
				 realIp2B5 <= realWorkingBuffer[75];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd73;
				 stateIp2B5<=12'd75;

				 //(76,78)
				 imgIp1B6 <= imagWorkingBuffer[76];
				 realIp1B6 <= realWorkingBuffer[76];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd76;
				 stateIp2B6<=12'd78;

				 //(77,79)
				 imgIp1B7 <= imagWorkingBuffer[77];
				 realIp1B7 <= realWorkingBuffer[77];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd77;
				 stateIp2B7<=12'd79;
			 end
			 8'd38 : begin

				 //(80,82)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[82];
				 realIp2B0 <= realWorkingBuffer[82];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd82;

				 //(81,83)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[83];
				 realIp2B1 <= realWorkingBuffer[83];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd81;
				 stateIp2B1<=12'd83;

				 //(84,86)
				 imgIp1B2 <= imagWorkingBuffer[84];
				 realIp1B2 <= realWorkingBuffer[84];
				 imgIp2B2 <= imagWorkingBuffer[86];
				 realIp2B2 <= realWorkingBuffer[86];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd84;
				 stateIp2B2<=12'd86;

				 //(85,87)
				 imgIp1B3 <= imagWorkingBuffer[85];
				 realIp1B3 <= realWorkingBuffer[85];
				 imgIp2B3 <= imagWorkingBuffer[87];
				 realIp2B3 <= realWorkingBuffer[87];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd85;
				 stateIp2B3<=12'd87;

				 //(88,90)
				 imgIp1B4 <= imagWorkingBuffer[88];
				 realIp1B4 <= realWorkingBuffer[88];
				 imgIp2B4 <= imagWorkingBuffer[90];
				 realIp2B4 <= realWorkingBuffer[90];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd88;
				 stateIp2B4<=12'd90;

				 //(89,91)
				 imgIp1B5 <= imagWorkingBuffer[89];
				 realIp1B5 <= realWorkingBuffer[89];
				 imgIp2B5 <= imagWorkingBuffer[91];
				 realIp2B5 <= realWorkingBuffer[91];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd89;
				 stateIp2B5<=12'd91;

				 //(92,94)
				 imgIp1B6 <= imagWorkingBuffer[92];
				 realIp1B6 <= realWorkingBuffer[92];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd92;
				 stateIp2B6<=12'd94;

				 //(93,95)
				 imgIp1B7 <= imagWorkingBuffer[93];
				 realIp1B7 <= realWorkingBuffer[93];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd93;
				 stateIp2B7<=12'd95;
			 end
			 8'd39 : begin

				 //(96,98)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[98];
				 realIp2B0 <= realWorkingBuffer[98];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd98;

				 //(97,99)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[99];
				 realIp2B1 <= realWorkingBuffer[99];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd97;
				 stateIp2B1<=12'd99;

				 //(100,102)
				 imgIp1B2 <= imagWorkingBuffer[100];
				 realIp1B2 <= realWorkingBuffer[100];
				 imgIp2B2 <= imagWorkingBuffer[102];
				 realIp2B2 <= realWorkingBuffer[102];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd100;
				 stateIp2B2<=12'd102;

				 //(101,103)
				 imgIp1B3 <= imagWorkingBuffer[101];
				 realIp1B3 <= realWorkingBuffer[101];
				 imgIp2B3 <= imagWorkingBuffer[103];
				 realIp2B3 <= realWorkingBuffer[103];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd101;
				 stateIp2B3<=12'd103;

				 //(104,106)
				 imgIp1B4 <= imagWorkingBuffer[104];
				 realIp1B4 <= realWorkingBuffer[104];
				 imgIp2B4 <= imagWorkingBuffer[106];
				 realIp2B4 <= realWorkingBuffer[106];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd104;
				 stateIp2B4<=12'd106;

				 //(105,107)
				 imgIp1B5 <= imagWorkingBuffer[105];
				 realIp1B5 <= realWorkingBuffer[105];
				 imgIp2B5 <= imagWorkingBuffer[107];
				 realIp2B5 <= realWorkingBuffer[107];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd105;
				 stateIp2B5<=12'd107;

				 //(108,110)
				 imgIp1B6 <= imagWorkingBuffer[108];
				 realIp1B6 <= realWorkingBuffer[108];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd108;
				 stateIp2B6<=12'd110;

				 //(109,111)
				 imgIp1B7 <= imagWorkingBuffer[109];
				 realIp1B7 <= realWorkingBuffer[109];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd109;
				 stateIp2B7<=12'd111;
			 end
			 8'd40 : begin

				 //(112,114)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[114];
				 realIp2B0 <= realWorkingBuffer[114];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd112;
				 stateIp2B0<=12'd114;

				 //(113,115)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[115];
				 realIp2B1 <= realWorkingBuffer[115];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd113;
				 stateIp2B1<=12'd115;

				 //(116,118)
				 imgIp1B2 <= imagWorkingBuffer[116];
				 realIp1B2 <= realWorkingBuffer[116];
				 imgIp2B2 <= imagWorkingBuffer[118];
				 realIp2B2 <= realWorkingBuffer[118];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd116;
				 stateIp2B2<=12'd118;

				 //(117,119)
				 imgIp1B3 <= imagWorkingBuffer[117];
				 realIp1B3 <= realWorkingBuffer[117];
				 imgIp2B3 <= imagWorkingBuffer[119];
				 realIp2B3 <= realWorkingBuffer[119];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd117;
				 stateIp2B3<=12'd119;

				 //(120,122)
				 imgIp1B4 <= imagWorkingBuffer[120];
				 realIp1B4 <= realWorkingBuffer[120];
				 imgIp2B4 <= imagWorkingBuffer[122];
				 realIp2B4 <= realWorkingBuffer[122];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd120;
				 stateIp2B4<=12'd122;

				 //(121,123)
				 imgIp1B5 <= imagWorkingBuffer[121];
				 realIp1B5 <= realWorkingBuffer[121];
				 imgIp2B5 <= imagWorkingBuffer[123];
				 realIp2B5 <= realWorkingBuffer[123];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd121;
				 stateIp2B5<=12'd123;

				 //(124,126)
				 imgIp1B6 <= imagWorkingBuffer[124];
				 realIp1B6 <= realWorkingBuffer[124];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd124;
				 stateIp2B6<=12'd126;

				 //(125,127)
				 imgIp1B7 <= imagWorkingBuffer[125];
				 realIp1B7 <= realWorkingBuffer[125];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd125;
				 stateIp2B7<=12'd127;
			 end
			 8'd41 : begin

				 //(128,130)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[130];
				 realIp2B0 <= realWorkingBuffer[130];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd130;

				 //(129,131)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[131];
				 realIp2B1 <= realWorkingBuffer[131];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd131;

				 //(132,134)
				 imgIp1B2 <= imagWorkingBuffer[132];
				 realIp1B2 <= realWorkingBuffer[132];
				 imgIp2B2 <= imagWorkingBuffer[134];
				 realIp2B2 <= realWorkingBuffer[134];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd132;
				 stateIp2B2<=12'd134;

				 //(133,135)
				 imgIp1B3 <= imagWorkingBuffer[133];
				 realIp1B3 <= realWorkingBuffer[133];
				 imgIp2B3 <= imagWorkingBuffer[135];
				 realIp2B3 <= realWorkingBuffer[135];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd133;
				 stateIp2B3<=12'd135;

				 //(136,138)
				 imgIp1B4 <= imagWorkingBuffer[136];
				 realIp1B4 <= realWorkingBuffer[136];
				 imgIp2B4 <= imagWorkingBuffer[138];
				 realIp2B4 <= realWorkingBuffer[138];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd136;
				 stateIp2B4<=12'd138;

				 //(137,139)
				 imgIp1B5 <= imagWorkingBuffer[137];
				 realIp1B5 <= realWorkingBuffer[137];
				 imgIp2B5 <= imagWorkingBuffer[139];
				 realIp2B5 <= realWorkingBuffer[139];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd137;
				 stateIp2B5<=12'd139;

				 //(140,142)
				 imgIp1B6 <= imagWorkingBuffer[140];
				 realIp1B6 <= realWorkingBuffer[140];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd140;
				 stateIp2B6<=12'd142;

				 //(141,143)
				 imgIp1B7 <= imagWorkingBuffer[141];
				 realIp1B7 <= realWorkingBuffer[141];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd141;
				 stateIp2B7<=12'd143;
			 end
			 8'd42 : begin

				 //(144,146)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[146];
				 realIp2B0 <= realWorkingBuffer[146];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd146;

				 //(145,147)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[147];
				 realIp2B1 <= realWorkingBuffer[147];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd145;
				 stateIp2B1<=12'd147;

				 //(148,150)
				 imgIp1B2 <= imagWorkingBuffer[148];
				 realIp1B2 <= realWorkingBuffer[148];
				 imgIp2B2 <= imagWorkingBuffer[150];
				 realIp2B2 <= realWorkingBuffer[150];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd148;
				 stateIp2B2<=12'd150;

				 //(149,151)
				 imgIp1B3 <= imagWorkingBuffer[149];
				 realIp1B3 <= realWorkingBuffer[149];
				 imgIp2B3 <= imagWorkingBuffer[151];
				 realIp2B3 <= realWorkingBuffer[151];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd149;
				 stateIp2B3<=12'd151;

				 //(152,154)
				 imgIp1B4 <= imagWorkingBuffer[152];
				 realIp1B4 <= realWorkingBuffer[152];
				 imgIp2B4 <= imagWorkingBuffer[154];
				 realIp2B4 <= realWorkingBuffer[154];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd152;
				 stateIp2B4<=12'd154;

				 //(153,155)
				 imgIp1B5 <= imagWorkingBuffer[153];
				 realIp1B5 <= realWorkingBuffer[153];
				 imgIp2B5 <= imagWorkingBuffer[155];
				 realIp2B5 <= realWorkingBuffer[155];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd153;
				 stateIp2B5<=12'd155;

				 //(156,158)
				 imgIp1B6 <= imagWorkingBuffer[156];
				 realIp1B6 <= realWorkingBuffer[156];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd156;
				 stateIp2B6<=12'd158;

				 //(157,159)
				 imgIp1B7 <= imagWorkingBuffer[157];
				 realIp1B7 <= realWorkingBuffer[157];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd157;
				 stateIp2B7<=12'd159;
			 end
			 8'd43 : begin

				 //(160,162)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[162];
				 realIp2B0 <= realWorkingBuffer[162];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd162;

				 //(161,163)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[163];
				 realIp2B1 <= realWorkingBuffer[163];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd161;
				 stateIp2B1<=12'd163;

				 //(164,166)
				 imgIp1B2 <= imagWorkingBuffer[164];
				 realIp1B2 <= realWorkingBuffer[164];
				 imgIp2B2 <= imagWorkingBuffer[166];
				 realIp2B2 <= realWorkingBuffer[166];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd164;
				 stateIp2B2<=12'd166;

				 //(165,167)
				 imgIp1B3 <= imagWorkingBuffer[165];
				 realIp1B3 <= realWorkingBuffer[165];
				 imgIp2B3 <= imagWorkingBuffer[167];
				 realIp2B3 <= realWorkingBuffer[167];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd165;
				 stateIp2B3<=12'd167;

				 //(168,170)
				 imgIp1B4 <= imagWorkingBuffer[168];
				 realIp1B4 <= realWorkingBuffer[168];
				 imgIp2B4 <= imagWorkingBuffer[170];
				 realIp2B4 <= realWorkingBuffer[170];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd168;
				 stateIp2B4<=12'd170;

				 //(169,171)
				 imgIp1B5 <= imagWorkingBuffer[169];
				 realIp1B5 <= realWorkingBuffer[169];
				 imgIp2B5 <= imagWorkingBuffer[171];
				 realIp2B5 <= realWorkingBuffer[171];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd169;
				 stateIp2B5<=12'd171;

				 //(172,174)
				 imgIp1B6 <= imagWorkingBuffer[172];
				 realIp1B6 <= realWorkingBuffer[172];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd172;
				 stateIp2B6<=12'd174;

				 //(173,175)
				 imgIp1B7 <= imagWorkingBuffer[173];
				 realIp1B7 <= realWorkingBuffer[173];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd173;
				 stateIp2B7<=12'd175;
			 end
			 8'd44 : begin

				 //(176,178)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[178];
				 realIp2B0 <= realWorkingBuffer[178];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd176;
				 stateIp2B0<=12'd178;

				 //(177,179)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[179];
				 realIp2B1 <= realWorkingBuffer[179];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd177;
				 stateIp2B1<=12'd179;

				 //(180,182)
				 imgIp1B2 <= imagWorkingBuffer[180];
				 realIp1B2 <= realWorkingBuffer[180];
				 imgIp2B2 <= imagWorkingBuffer[182];
				 realIp2B2 <= realWorkingBuffer[182];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd180;
				 stateIp2B2<=12'd182;

				 //(181,183)
				 imgIp1B3 <= imagWorkingBuffer[181];
				 realIp1B3 <= realWorkingBuffer[181];
				 imgIp2B3 <= imagWorkingBuffer[183];
				 realIp2B3 <= realWorkingBuffer[183];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd181;
				 stateIp2B3<=12'd183;

				 //(184,186)
				 imgIp1B4 <= imagWorkingBuffer[184];
				 realIp1B4 <= realWorkingBuffer[184];
				 imgIp2B4 <= imagWorkingBuffer[186];
				 realIp2B4 <= realWorkingBuffer[186];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd184;
				 stateIp2B4<=12'd186;

				 //(185,187)
				 imgIp1B5 <= imagWorkingBuffer[185];
				 realIp1B5 <= realWorkingBuffer[185];
				 imgIp2B5 <= imagWorkingBuffer[187];
				 realIp2B5 <= realWorkingBuffer[187];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd185;
				 stateIp2B5<=12'd187;

				 //(188,190)
				 imgIp1B6 <= imagWorkingBuffer[188];
				 realIp1B6 <= realWorkingBuffer[188];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd188;
				 stateIp2B6<=12'd190;

				 //(189,191)
				 imgIp1B7 <= imagWorkingBuffer[189];
				 realIp1B7 <= realWorkingBuffer[189];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd189;
				 stateIp2B7<=12'd191;
			 end
			 8'd45 : begin

				 //(192,194)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[194];
				 realIp2B0 <= realWorkingBuffer[194];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd194;

				 //(193,195)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[195];
				 realIp2B1 <= realWorkingBuffer[195];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd193;
				 stateIp2B1<=12'd195;

				 //(196,198)
				 imgIp1B2 <= imagWorkingBuffer[196];
				 realIp1B2 <= realWorkingBuffer[196];
				 imgIp2B2 <= imagWorkingBuffer[198];
				 realIp2B2 <= realWorkingBuffer[198];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd196;
				 stateIp2B2<=12'd198;

				 //(197,199)
				 imgIp1B3 <= imagWorkingBuffer[197];
				 realIp1B3 <= realWorkingBuffer[197];
				 imgIp2B3 <= imagWorkingBuffer[199];
				 realIp2B3 <= realWorkingBuffer[199];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd197;
				 stateIp2B3<=12'd199;

				 //(200,202)
				 imgIp1B4 <= imagWorkingBuffer[200];
				 realIp1B4 <= realWorkingBuffer[200];
				 imgIp2B4 <= imagWorkingBuffer[202];
				 realIp2B4 <= realWorkingBuffer[202];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd200;
				 stateIp2B4<=12'd202;

				 //(201,203)
				 imgIp1B5 <= imagWorkingBuffer[201];
				 realIp1B5 <= realWorkingBuffer[201];
				 imgIp2B5 <= imagWorkingBuffer[203];
				 realIp2B5 <= realWorkingBuffer[203];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd201;
				 stateIp2B5<=12'd203;

				 //(204,206)
				 imgIp1B6 <= imagWorkingBuffer[204];
				 realIp1B6 <= realWorkingBuffer[204];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd204;
				 stateIp2B6<=12'd206;

				 //(205,207)
				 imgIp1B7 <= imagWorkingBuffer[205];
				 realIp1B7 <= realWorkingBuffer[205];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd205;
				 stateIp2B7<=12'd207;
			 end
			 8'd46 : begin

				 //(208,210)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[210];
				 realIp2B0 <= realWorkingBuffer[210];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd208;
				 stateIp2B0<=12'd210;

				 //(209,211)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[211];
				 realIp2B1 <= realWorkingBuffer[211];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd209;
				 stateIp2B1<=12'd211;

				 //(212,214)
				 imgIp1B2 <= imagWorkingBuffer[212];
				 realIp1B2 <= realWorkingBuffer[212];
				 imgIp2B2 <= imagWorkingBuffer[214];
				 realIp2B2 <= realWorkingBuffer[214];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd212;
				 stateIp2B2<=12'd214;

				 //(213,215)
				 imgIp1B3 <= imagWorkingBuffer[213];
				 realIp1B3 <= realWorkingBuffer[213];
				 imgIp2B3 <= imagWorkingBuffer[215];
				 realIp2B3 <= realWorkingBuffer[215];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd213;
				 stateIp2B3<=12'd215;

				 //(216,218)
				 imgIp1B4 <= imagWorkingBuffer[216];
				 realIp1B4 <= realWorkingBuffer[216];
				 imgIp2B4 <= imagWorkingBuffer[218];
				 realIp2B4 <= realWorkingBuffer[218];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd216;
				 stateIp2B4<=12'd218;

				 //(217,219)
				 imgIp1B5 <= imagWorkingBuffer[217];
				 realIp1B5 <= realWorkingBuffer[217];
				 imgIp2B5 <= imagWorkingBuffer[219];
				 realIp2B5 <= realWorkingBuffer[219];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd217;
				 stateIp2B5<=12'd219;

				 //(220,222)
				 imgIp1B6 <= imagWorkingBuffer[220];
				 realIp1B6 <= realWorkingBuffer[220];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd220;
				 stateIp2B6<=12'd222;

				 //(221,223)
				 imgIp1B7 <= imagWorkingBuffer[221];
				 realIp1B7 <= realWorkingBuffer[221];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd221;
				 stateIp2B7<=12'd223;
			 end
			 8'd47 : begin

				 //(224,226)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[226];
				 realIp2B0 <= realWorkingBuffer[226];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd224;
				 stateIp2B0<=12'd226;

				 //(225,227)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[227];
				 realIp2B1 <= realWorkingBuffer[227];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd225;
				 stateIp2B1<=12'd227;

				 //(228,230)
				 imgIp1B2 <= imagWorkingBuffer[228];
				 realIp1B2 <= realWorkingBuffer[228];
				 imgIp2B2 <= imagWorkingBuffer[230];
				 realIp2B2 <= realWorkingBuffer[230];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd228;
				 stateIp2B2<=12'd230;

				 //(229,231)
				 imgIp1B3 <= imagWorkingBuffer[229];
				 realIp1B3 <= realWorkingBuffer[229];
				 imgIp2B3 <= imagWorkingBuffer[231];
				 realIp2B3 <= realWorkingBuffer[231];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd229;
				 stateIp2B3<=12'd231;

				 //(232,234)
				 imgIp1B4 <= imagWorkingBuffer[232];
				 realIp1B4 <= realWorkingBuffer[232];
				 imgIp2B4 <= imagWorkingBuffer[234];
				 realIp2B4 <= realWorkingBuffer[234];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd232;
				 stateIp2B4<=12'd234;

				 //(233,235)
				 imgIp1B5 <= imagWorkingBuffer[233];
				 realIp1B5 <= realWorkingBuffer[233];
				 imgIp2B5 <= imagWorkingBuffer[235];
				 realIp2B5 <= realWorkingBuffer[235];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd233;
				 stateIp2B5<=12'd235;

				 //(236,238)
				 imgIp1B6 <= imagWorkingBuffer[236];
				 realIp1B6 <= realWorkingBuffer[236];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd236;
				 stateIp2B6<=12'd238;

				 //(237,239)
				 imgIp1B7 <= imagWorkingBuffer[237];
				 realIp1B7 <= realWorkingBuffer[237];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd237;
				 stateIp2B7<=12'd239;
			 end
			 8'd48 : begin

				 //(240,242)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[242];
				 realIp2B0 <= realWorkingBuffer[242];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd240;
				 stateIp2B0<=12'd242;

				 //(241,243)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[243];
				 realIp2B1 <= realWorkingBuffer[243];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd241;
				 stateIp2B1<=12'd243;

				 //(244,246)
				 imgIp1B2 <= imagWorkingBuffer[244];
				 realIp1B2 <= realWorkingBuffer[244];
				 imgIp2B2 <= imagWorkingBuffer[246];
				 realIp2B2 <= realWorkingBuffer[246];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd244;
				 stateIp2B2<=12'd246;

				 //(245,247)
				 imgIp1B3 <= imagWorkingBuffer[245];
				 realIp1B3 <= realWorkingBuffer[245];
				 imgIp2B3 <= imagWorkingBuffer[247];
				 realIp2B3 <= realWorkingBuffer[247];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd245;
				 stateIp2B3<=12'd247;

				 //(248,250)
				 imgIp1B4 <= imagWorkingBuffer[248];
				 realIp1B4 <= realWorkingBuffer[248];
				 imgIp2B4 <= imagWorkingBuffer[250];
				 realIp2B4 <= realWorkingBuffer[250];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd248;
				 stateIp2B4<=12'd250;

				 //(249,251)
				 imgIp1B5 <= imagWorkingBuffer[249];
				 realIp1B5 <= realWorkingBuffer[249];
				 imgIp2B5 <= imagWorkingBuffer[251];
				 realIp2B5 <= realWorkingBuffer[251];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd249;
				 stateIp2B5<=12'd251;

				 //(252,254)
				 imgIp1B6 <= imagWorkingBuffer[252];
				 realIp1B6 <= realWorkingBuffer[252];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd252;
				 stateIp2B6<=12'd254;

				 //(253,255)
				 imgIp1B7 <= imagWorkingBuffer[253];
				 realIp1B7 <= realWorkingBuffer[253];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd253;
				 stateIp2B7<=12'd255;
			 end
			 8'd49 : begin

				 //(256,258)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[258];
				 realIp2B0 <= realWorkingBuffer[258];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd258;

				 //(257,259)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[259];
				 realIp2B1 <= realWorkingBuffer[259];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd259;

				 //(260,262)
				 imgIp1B2 <= imagWorkingBuffer[260];
				 realIp1B2 <= realWorkingBuffer[260];
				 imgIp2B2 <= imagWorkingBuffer[262];
				 realIp2B2 <= realWorkingBuffer[262];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd260;
				 stateIp2B2<=12'd262;

				 //(261,263)
				 imgIp1B3 <= imagWorkingBuffer[261];
				 realIp1B3 <= realWorkingBuffer[261];
				 imgIp2B3 <= imagWorkingBuffer[263];
				 realIp2B3 <= realWorkingBuffer[263];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd261;
				 stateIp2B3<=12'd263;

				 //(264,266)
				 imgIp1B4 <= imagWorkingBuffer[264];
				 realIp1B4 <= realWorkingBuffer[264];
				 imgIp2B4 <= imagWorkingBuffer[266];
				 realIp2B4 <= realWorkingBuffer[266];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd264;
				 stateIp2B4<=12'd266;

				 //(265,267)
				 imgIp1B5 <= imagWorkingBuffer[265];
				 realIp1B5 <= realWorkingBuffer[265];
				 imgIp2B5 <= imagWorkingBuffer[267];
				 realIp2B5 <= realWorkingBuffer[267];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd265;
				 stateIp2B5<=12'd267;

				 //(268,270)
				 imgIp1B6 <= imagWorkingBuffer[268];
				 realIp1B6 <= realWorkingBuffer[268];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd268;
				 stateIp2B6<=12'd270;

				 //(269,271)
				 imgIp1B7 <= imagWorkingBuffer[269];
				 realIp1B7 <= realWorkingBuffer[269];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd269;
				 stateIp2B7<=12'd271;
			 end
			 8'd50 : begin

				 //(272,274)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[274];
				 realIp2B0 <= realWorkingBuffer[274];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd274;

				 //(273,275)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[275];
				 realIp2B1 <= realWorkingBuffer[275];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd273;
				 stateIp2B1<=12'd275;

				 //(276,278)
				 imgIp1B2 <= imagWorkingBuffer[276];
				 realIp1B2 <= realWorkingBuffer[276];
				 imgIp2B2 <= imagWorkingBuffer[278];
				 realIp2B2 <= realWorkingBuffer[278];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd276;
				 stateIp2B2<=12'd278;

				 //(277,279)
				 imgIp1B3 <= imagWorkingBuffer[277];
				 realIp1B3 <= realWorkingBuffer[277];
				 imgIp2B3 <= imagWorkingBuffer[279];
				 realIp2B3 <= realWorkingBuffer[279];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd277;
				 stateIp2B3<=12'd279;

				 //(280,282)
				 imgIp1B4 <= imagWorkingBuffer[280];
				 realIp1B4 <= realWorkingBuffer[280];
				 imgIp2B4 <= imagWorkingBuffer[282];
				 realIp2B4 <= realWorkingBuffer[282];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd280;
				 stateIp2B4<=12'd282;

				 //(281,283)
				 imgIp1B5 <= imagWorkingBuffer[281];
				 realIp1B5 <= realWorkingBuffer[281];
				 imgIp2B5 <= imagWorkingBuffer[283];
				 realIp2B5 <= realWorkingBuffer[283];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd281;
				 stateIp2B5<=12'd283;

				 //(284,286)
				 imgIp1B6 <= imagWorkingBuffer[284];
				 realIp1B6 <= realWorkingBuffer[284];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd284;
				 stateIp2B6<=12'd286;

				 //(285,287)
				 imgIp1B7 <= imagWorkingBuffer[285];
				 realIp1B7 <= realWorkingBuffer[285];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd285;
				 stateIp2B7<=12'd287;
			 end
			 8'd51 : begin

				 //(288,290)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[290];
				 realIp2B0 <= realWorkingBuffer[290];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd290;

				 //(289,291)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[291];
				 realIp2B1 <= realWorkingBuffer[291];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd289;
				 stateIp2B1<=12'd291;

				 //(292,294)
				 imgIp1B2 <= imagWorkingBuffer[292];
				 realIp1B2 <= realWorkingBuffer[292];
				 imgIp2B2 <= imagWorkingBuffer[294];
				 realIp2B2 <= realWorkingBuffer[294];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd292;
				 stateIp2B2<=12'd294;

				 //(293,295)
				 imgIp1B3 <= imagWorkingBuffer[293];
				 realIp1B3 <= realWorkingBuffer[293];
				 imgIp2B3 <= imagWorkingBuffer[295];
				 realIp2B3 <= realWorkingBuffer[295];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd293;
				 stateIp2B3<=12'd295;

				 //(296,298)
				 imgIp1B4 <= imagWorkingBuffer[296];
				 realIp1B4 <= realWorkingBuffer[296];
				 imgIp2B4 <= imagWorkingBuffer[298];
				 realIp2B4 <= realWorkingBuffer[298];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd296;
				 stateIp2B4<=12'd298;

				 //(297,299)
				 imgIp1B5 <= imagWorkingBuffer[297];
				 realIp1B5 <= realWorkingBuffer[297];
				 imgIp2B5 <= imagWorkingBuffer[299];
				 realIp2B5 <= realWorkingBuffer[299];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd297;
				 stateIp2B5<=12'd299;

				 //(300,302)
				 imgIp1B6 <= imagWorkingBuffer[300];
				 realIp1B6 <= realWorkingBuffer[300];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd300;
				 stateIp2B6<=12'd302;

				 //(301,303)
				 imgIp1B7 <= imagWorkingBuffer[301];
				 realIp1B7 <= realWorkingBuffer[301];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd301;
				 stateIp2B7<=12'd303;
			 end
			 8'd52 : begin

				 //(304,306)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[306];
				 realIp2B0 <= realWorkingBuffer[306];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd304;
				 stateIp2B0<=12'd306;

				 //(305,307)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[307];
				 realIp2B1 <= realWorkingBuffer[307];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd305;
				 stateIp2B1<=12'd307;

				 //(308,310)
				 imgIp1B2 <= imagWorkingBuffer[308];
				 realIp1B2 <= realWorkingBuffer[308];
				 imgIp2B2 <= imagWorkingBuffer[310];
				 realIp2B2 <= realWorkingBuffer[310];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd308;
				 stateIp2B2<=12'd310;

				 //(309,311)
				 imgIp1B3 <= imagWorkingBuffer[309];
				 realIp1B3 <= realWorkingBuffer[309];
				 imgIp2B3 <= imagWorkingBuffer[311];
				 realIp2B3 <= realWorkingBuffer[311];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd309;
				 stateIp2B3<=12'd311;

				 //(312,314)
				 imgIp1B4 <= imagWorkingBuffer[312];
				 realIp1B4 <= realWorkingBuffer[312];
				 imgIp2B4 <= imagWorkingBuffer[314];
				 realIp2B4 <= realWorkingBuffer[314];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd312;
				 stateIp2B4<=12'd314;

				 //(313,315)
				 imgIp1B5 <= imagWorkingBuffer[313];
				 realIp1B5 <= realWorkingBuffer[313];
				 imgIp2B5 <= imagWorkingBuffer[315];
				 realIp2B5 <= realWorkingBuffer[315];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd313;
				 stateIp2B5<=12'd315;

				 //(316,318)
				 imgIp1B6 <= imagWorkingBuffer[316];
				 realIp1B6 <= realWorkingBuffer[316];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd316;
				 stateIp2B6<=12'd318;

				 //(317,319)
				 imgIp1B7 <= imagWorkingBuffer[317];
				 realIp1B7 <= realWorkingBuffer[317];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd317;
				 stateIp2B7<=12'd319;
			 end
			 8'd53 : begin

				 //(320,322)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[322];
				 realIp2B0 <= realWorkingBuffer[322];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd322;

				 //(321,323)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[323];
				 realIp2B1 <= realWorkingBuffer[323];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd321;
				 stateIp2B1<=12'd323;

				 //(324,326)
				 imgIp1B2 <= imagWorkingBuffer[324];
				 realIp1B2 <= realWorkingBuffer[324];
				 imgIp2B2 <= imagWorkingBuffer[326];
				 realIp2B2 <= realWorkingBuffer[326];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd324;
				 stateIp2B2<=12'd326;

				 //(325,327)
				 imgIp1B3 <= imagWorkingBuffer[325];
				 realIp1B3 <= realWorkingBuffer[325];
				 imgIp2B3 <= imagWorkingBuffer[327];
				 realIp2B3 <= realWorkingBuffer[327];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd325;
				 stateIp2B3<=12'd327;

				 //(328,330)
				 imgIp1B4 <= imagWorkingBuffer[328];
				 realIp1B4 <= realWorkingBuffer[328];
				 imgIp2B4 <= imagWorkingBuffer[330];
				 realIp2B4 <= realWorkingBuffer[330];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd328;
				 stateIp2B4<=12'd330;

				 //(329,331)
				 imgIp1B5 <= imagWorkingBuffer[329];
				 realIp1B5 <= realWorkingBuffer[329];
				 imgIp2B5 <= imagWorkingBuffer[331];
				 realIp2B5 <= realWorkingBuffer[331];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd329;
				 stateIp2B5<=12'd331;

				 //(332,334)
				 imgIp1B6 <= imagWorkingBuffer[332];
				 realIp1B6 <= realWorkingBuffer[332];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd332;
				 stateIp2B6<=12'd334;

				 //(333,335)
				 imgIp1B7 <= imagWorkingBuffer[333];
				 realIp1B7 <= realWorkingBuffer[333];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd333;
				 stateIp2B7<=12'd335;
			 end
			 8'd54 : begin

				 //(336,338)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[338];
				 realIp2B0 <= realWorkingBuffer[338];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd336;
				 stateIp2B0<=12'd338;

				 //(337,339)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[339];
				 realIp2B1 <= realWorkingBuffer[339];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd337;
				 stateIp2B1<=12'd339;

				 //(340,342)
				 imgIp1B2 <= imagWorkingBuffer[340];
				 realIp1B2 <= realWorkingBuffer[340];
				 imgIp2B2 <= imagWorkingBuffer[342];
				 realIp2B2 <= realWorkingBuffer[342];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd340;
				 stateIp2B2<=12'd342;

				 //(341,343)
				 imgIp1B3 <= imagWorkingBuffer[341];
				 realIp1B3 <= realWorkingBuffer[341];
				 imgIp2B3 <= imagWorkingBuffer[343];
				 realIp2B3 <= realWorkingBuffer[343];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd341;
				 stateIp2B3<=12'd343;

				 //(344,346)
				 imgIp1B4 <= imagWorkingBuffer[344];
				 realIp1B4 <= realWorkingBuffer[344];
				 imgIp2B4 <= imagWorkingBuffer[346];
				 realIp2B4 <= realWorkingBuffer[346];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd344;
				 stateIp2B4<=12'd346;

				 //(345,347)
				 imgIp1B5 <= imagWorkingBuffer[345];
				 realIp1B5 <= realWorkingBuffer[345];
				 imgIp2B5 <= imagWorkingBuffer[347];
				 realIp2B5 <= realWorkingBuffer[347];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd345;
				 stateIp2B5<=12'd347;

				 //(348,350)
				 imgIp1B6 <= imagWorkingBuffer[348];
				 realIp1B6 <= realWorkingBuffer[348];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd348;
				 stateIp2B6<=12'd350;

				 //(349,351)
				 imgIp1B7 <= imagWorkingBuffer[349];
				 realIp1B7 <= realWorkingBuffer[349];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd349;
				 stateIp2B7<=12'd351;
			 end
			 8'd55 : begin

				 //(352,354)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[354];
				 realIp2B0 <= realWorkingBuffer[354];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd352;
				 stateIp2B0<=12'd354;

				 //(353,355)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[355];
				 realIp2B1 <= realWorkingBuffer[355];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd353;
				 stateIp2B1<=12'd355;

				 //(356,358)
				 imgIp1B2 <= imagWorkingBuffer[356];
				 realIp1B2 <= realWorkingBuffer[356];
				 imgIp2B2 <= imagWorkingBuffer[358];
				 realIp2B2 <= realWorkingBuffer[358];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd356;
				 stateIp2B2<=12'd358;

				 //(357,359)
				 imgIp1B3 <= imagWorkingBuffer[357];
				 realIp1B3 <= realWorkingBuffer[357];
				 imgIp2B3 <= imagWorkingBuffer[359];
				 realIp2B3 <= realWorkingBuffer[359];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd357;
				 stateIp2B3<=12'd359;

				 //(360,362)
				 imgIp1B4 <= imagWorkingBuffer[360];
				 realIp1B4 <= realWorkingBuffer[360];
				 imgIp2B4 <= imagWorkingBuffer[362];
				 realIp2B4 <= realWorkingBuffer[362];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd360;
				 stateIp2B4<=12'd362;

				 //(361,363)
				 imgIp1B5 <= imagWorkingBuffer[361];
				 realIp1B5 <= realWorkingBuffer[361];
				 imgIp2B5 <= imagWorkingBuffer[363];
				 realIp2B5 <= realWorkingBuffer[363];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd361;
				 stateIp2B5<=12'd363;

				 //(364,366)
				 imgIp1B6 <= imagWorkingBuffer[364];
				 realIp1B6 <= realWorkingBuffer[364];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd364;
				 stateIp2B6<=12'd366;

				 //(365,367)
				 imgIp1B7 <= imagWorkingBuffer[365];
				 realIp1B7 <= realWorkingBuffer[365];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd365;
				 stateIp2B7<=12'd367;
			 end
			 8'd56 : begin

				 //(368,370)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[370];
				 realIp2B0 <= realWorkingBuffer[370];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd368;
				 stateIp2B0<=12'd370;

				 //(369,371)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[371];
				 realIp2B1 <= realWorkingBuffer[371];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd369;
				 stateIp2B1<=12'd371;

				 //(372,374)
				 imgIp1B2 <= imagWorkingBuffer[372];
				 realIp1B2 <= realWorkingBuffer[372];
				 imgIp2B2 <= imagWorkingBuffer[374];
				 realIp2B2 <= realWorkingBuffer[374];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd372;
				 stateIp2B2<=12'd374;

				 //(373,375)
				 imgIp1B3 <= imagWorkingBuffer[373];
				 realIp1B3 <= realWorkingBuffer[373];
				 imgIp2B3 <= imagWorkingBuffer[375];
				 realIp2B3 <= realWorkingBuffer[375];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd373;
				 stateIp2B3<=12'd375;

				 //(376,378)
				 imgIp1B4 <= imagWorkingBuffer[376];
				 realIp1B4 <= realWorkingBuffer[376];
				 imgIp2B4 <= imagWorkingBuffer[378];
				 realIp2B4 <= realWorkingBuffer[378];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd376;
				 stateIp2B4<=12'd378;

				 //(377,379)
				 imgIp1B5 <= imagWorkingBuffer[377];
				 realIp1B5 <= realWorkingBuffer[377];
				 imgIp2B5 <= imagWorkingBuffer[379];
				 realIp2B5 <= realWorkingBuffer[379];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd377;
				 stateIp2B5<=12'd379;

				 //(380,382)
				 imgIp1B6 <= imagWorkingBuffer[380];
				 realIp1B6 <= realWorkingBuffer[380];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd380;
				 stateIp2B6<=12'd382;

				 //(381,383)
				 imgIp1B7 <= imagWorkingBuffer[381];
				 realIp1B7 <= realWorkingBuffer[381];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd381;
				 stateIp2B7<=12'd383;
			 end
			 8'd57 : begin

				 //(384,386)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[386];
				 realIp2B0 <= realWorkingBuffer[386];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd386;

				 //(385,387)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[387];
				 realIp2B1 <= realWorkingBuffer[387];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd385;
				 stateIp2B1<=12'd387;

				 //(388,390)
				 imgIp1B2 <= imagWorkingBuffer[388];
				 realIp1B2 <= realWorkingBuffer[388];
				 imgIp2B2 <= imagWorkingBuffer[390];
				 realIp2B2 <= realWorkingBuffer[390];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd388;
				 stateIp2B2<=12'd390;

				 //(389,391)
				 imgIp1B3 <= imagWorkingBuffer[389];
				 realIp1B3 <= realWorkingBuffer[389];
				 imgIp2B3 <= imagWorkingBuffer[391];
				 realIp2B3 <= realWorkingBuffer[391];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd389;
				 stateIp2B3<=12'd391;

				 //(392,394)
				 imgIp1B4 <= imagWorkingBuffer[392];
				 realIp1B4 <= realWorkingBuffer[392];
				 imgIp2B4 <= imagWorkingBuffer[394];
				 realIp2B4 <= realWorkingBuffer[394];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd392;
				 stateIp2B4<=12'd394;

				 //(393,395)
				 imgIp1B5 <= imagWorkingBuffer[393];
				 realIp1B5 <= realWorkingBuffer[393];
				 imgIp2B5 <= imagWorkingBuffer[395];
				 realIp2B5 <= realWorkingBuffer[395];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd393;
				 stateIp2B5<=12'd395;

				 //(396,398)
				 imgIp1B6 <= imagWorkingBuffer[396];
				 realIp1B6 <= realWorkingBuffer[396];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd396;
				 stateIp2B6<=12'd398;

				 //(397,399)
				 imgIp1B7 <= imagWorkingBuffer[397];
				 realIp1B7 <= realWorkingBuffer[397];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd397;
				 stateIp2B7<=12'd399;
			 end
			 8'd58 : begin

				 //(400,402)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[402];
				 realIp2B0 <= realWorkingBuffer[402];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd400;
				 stateIp2B0<=12'd402;

				 //(401,403)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[403];
				 realIp2B1 <= realWorkingBuffer[403];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd401;
				 stateIp2B1<=12'd403;

				 //(404,406)
				 imgIp1B2 <= imagWorkingBuffer[404];
				 realIp1B2 <= realWorkingBuffer[404];
				 imgIp2B2 <= imagWorkingBuffer[406];
				 realIp2B2 <= realWorkingBuffer[406];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd404;
				 stateIp2B2<=12'd406;

				 //(405,407)
				 imgIp1B3 <= imagWorkingBuffer[405];
				 realIp1B3 <= realWorkingBuffer[405];
				 imgIp2B3 <= imagWorkingBuffer[407];
				 realIp2B3 <= realWorkingBuffer[407];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd405;
				 stateIp2B3<=12'd407;

				 //(408,410)
				 imgIp1B4 <= imagWorkingBuffer[408];
				 realIp1B4 <= realWorkingBuffer[408];
				 imgIp2B4 <= imagWorkingBuffer[410];
				 realIp2B4 <= realWorkingBuffer[410];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd408;
				 stateIp2B4<=12'd410;

				 //(409,411)
				 imgIp1B5 <= imagWorkingBuffer[409];
				 realIp1B5 <= realWorkingBuffer[409];
				 imgIp2B5 <= imagWorkingBuffer[411];
				 realIp2B5 <= realWorkingBuffer[411];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd409;
				 stateIp2B5<=12'd411;

				 //(412,414)
				 imgIp1B6 <= imagWorkingBuffer[412];
				 realIp1B6 <= realWorkingBuffer[412];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd412;
				 stateIp2B6<=12'd414;

				 //(413,415)
				 imgIp1B7 <= imagWorkingBuffer[413];
				 realIp1B7 <= realWorkingBuffer[413];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd413;
				 stateIp2B7<=12'd415;
			 end
			 8'd59 : begin

				 //(416,418)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[418];
				 realIp2B0 <= realWorkingBuffer[418];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd416;
				 stateIp2B0<=12'd418;

				 //(417,419)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[419];
				 realIp2B1 <= realWorkingBuffer[419];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd417;
				 stateIp2B1<=12'd419;

				 //(420,422)
				 imgIp1B2 <= imagWorkingBuffer[420];
				 realIp1B2 <= realWorkingBuffer[420];
				 imgIp2B2 <= imagWorkingBuffer[422];
				 realIp2B2 <= realWorkingBuffer[422];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd420;
				 stateIp2B2<=12'd422;

				 //(421,423)
				 imgIp1B3 <= imagWorkingBuffer[421];
				 realIp1B3 <= realWorkingBuffer[421];
				 imgIp2B3 <= imagWorkingBuffer[423];
				 realIp2B3 <= realWorkingBuffer[423];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd421;
				 stateIp2B3<=12'd423;

				 //(424,426)
				 imgIp1B4 <= imagWorkingBuffer[424];
				 realIp1B4 <= realWorkingBuffer[424];
				 imgIp2B4 <= imagWorkingBuffer[426];
				 realIp2B4 <= realWorkingBuffer[426];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd424;
				 stateIp2B4<=12'd426;

				 //(425,427)
				 imgIp1B5 <= imagWorkingBuffer[425];
				 realIp1B5 <= realWorkingBuffer[425];
				 imgIp2B5 <= imagWorkingBuffer[427];
				 realIp2B5 <= realWorkingBuffer[427];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd425;
				 stateIp2B5<=12'd427;

				 //(428,430)
				 imgIp1B6 <= imagWorkingBuffer[428];
				 realIp1B6 <= realWorkingBuffer[428];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd428;
				 stateIp2B6<=12'd430;

				 //(429,431)
				 imgIp1B7 <= imagWorkingBuffer[429];
				 realIp1B7 <= realWorkingBuffer[429];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd429;
				 stateIp2B7<=12'd431;
			 end
			 8'd60 : begin

				 //(432,434)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[434];
				 realIp2B0 <= realWorkingBuffer[434];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd432;
				 stateIp2B0<=12'd434;

				 //(433,435)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[435];
				 realIp2B1 <= realWorkingBuffer[435];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd433;
				 stateIp2B1<=12'd435;

				 //(436,438)
				 imgIp1B2 <= imagWorkingBuffer[436];
				 realIp1B2 <= realWorkingBuffer[436];
				 imgIp2B2 <= imagWorkingBuffer[438];
				 realIp2B2 <= realWorkingBuffer[438];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd436;
				 stateIp2B2<=12'd438;

				 //(437,439)
				 imgIp1B3 <= imagWorkingBuffer[437];
				 realIp1B3 <= realWorkingBuffer[437];
				 imgIp2B3 <= imagWorkingBuffer[439];
				 realIp2B3 <= realWorkingBuffer[439];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd437;
				 stateIp2B3<=12'd439;

				 //(440,442)
				 imgIp1B4 <= imagWorkingBuffer[440];
				 realIp1B4 <= realWorkingBuffer[440];
				 imgIp2B4 <= imagWorkingBuffer[442];
				 realIp2B4 <= realWorkingBuffer[442];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd440;
				 stateIp2B4<=12'd442;

				 //(441,443)
				 imgIp1B5 <= imagWorkingBuffer[441];
				 realIp1B5 <= realWorkingBuffer[441];
				 imgIp2B5 <= imagWorkingBuffer[443];
				 realIp2B5 <= realWorkingBuffer[443];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd441;
				 stateIp2B5<=12'd443;

				 //(444,446)
				 imgIp1B6 <= imagWorkingBuffer[444];
				 realIp1B6 <= realWorkingBuffer[444];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd444;
				 stateIp2B6<=12'd446;

				 //(445,447)
				 imgIp1B7 <= imagWorkingBuffer[445];
				 realIp1B7 <= realWorkingBuffer[445];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd445;
				 stateIp2B7<=12'd447;
			 end
			 8'd61 : begin

				 //(448,450)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[450];
				 realIp2B0 <= realWorkingBuffer[450];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd448;
				 stateIp2B0<=12'd450;

				 //(449,451)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[451];
				 realIp2B1 <= realWorkingBuffer[451];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd449;
				 stateIp2B1<=12'd451;

				 //(452,454)
				 imgIp1B2 <= imagWorkingBuffer[452];
				 realIp1B2 <= realWorkingBuffer[452];
				 imgIp2B2 <= imagWorkingBuffer[454];
				 realIp2B2 <= realWorkingBuffer[454];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd452;
				 stateIp2B2<=12'd454;

				 //(453,455)
				 imgIp1B3 <= imagWorkingBuffer[453];
				 realIp1B3 <= realWorkingBuffer[453];
				 imgIp2B3 <= imagWorkingBuffer[455];
				 realIp2B3 <= realWorkingBuffer[455];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd453;
				 stateIp2B3<=12'd455;

				 //(456,458)
				 imgIp1B4 <= imagWorkingBuffer[456];
				 realIp1B4 <= realWorkingBuffer[456];
				 imgIp2B4 <= imagWorkingBuffer[458];
				 realIp2B4 <= realWorkingBuffer[458];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd456;
				 stateIp2B4<=12'd458;

				 //(457,459)
				 imgIp1B5 <= imagWorkingBuffer[457];
				 realIp1B5 <= realWorkingBuffer[457];
				 imgIp2B5 <= imagWorkingBuffer[459];
				 realIp2B5 <= realWorkingBuffer[459];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd457;
				 stateIp2B5<=12'd459;

				 //(460,462)
				 imgIp1B6 <= imagWorkingBuffer[460];
				 realIp1B6 <= realWorkingBuffer[460];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd460;
				 stateIp2B6<=12'd462;

				 //(461,463)
				 imgIp1B7 <= imagWorkingBuffer[461];
				 realIp1B7 <= realWorkingBuffer[461];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd461;
				 stateIp2B7<=12'd463;
			 end
			 8'd62 : begin

				 //(464,466)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[466];
				 realIp2B0 <= realWorkingBuffer[466];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd464;
				 stateIp2B0<=12'd466;

				 //(465,467)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[467];
				 realIp2B1 <= realWorkingBuffer[467];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd465;
				 stateIp2B1<=12'd467;

				 //(468,470)
				 imgIp1B2 <= imagWorkingBuffer[468];
				 realIp1B2 <= realWorkingBuffer[468];
				 imgIp2B2 <= imagWorkingBuffer[470];
				 realIp2B2 <= realWorkingBuffer[470];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd468;
				 stateIp2B2<=12'd470;

				 //(469,471)
				 imgIp1B3 <= imagWorkingBuffer[469];
				 realIp1B3 <= realWorkingBuffer[469];
				 imgIp2B3 <= imagWorkingBuffer[471];
				 realIp2B3 <= realWorkingBuffer[471];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd469;
				 stateIp2B3<=12'd471;

				 //(472,474)
				 imgIp1B4 <= imagWorkingBuffer[472];
				 realIp1B4 <= realWorkingBuffer[472];
				 imgIp2B4 <= imagWorkingBuffer[474];
				 realIp2B4 <= realWorkingBuffer[474];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd472;
				 stateIp2B4<=12'd474;

				 //(473,475)
				 imgIp1B5 <= imagWorkingBuffer[473];
				 realIp1B5 <= realWorkingBuffer[473];
				 imgIp2B5 <= imagWorkingBuffer[475];
				 realIp2B5 <= realWorkingBuffer[475];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd473;
				 stateIp2B5<=12'd475;

				 //(476,478)
				 imgIp1B6 <= imagWorkingBuffer[476];
				 realIp1B6 <= realWorkingBuffer[476];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd476;
				 stateIp2B6<=12'd478;

				 //(477,479)
				 imgIp1B7 <= imagWorkingBuffer[477];
				 realIp1B7 <= realWorkingBuffer[477];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd477;
				 stateIp2B7<=12'd479;
			 end
			 8'd63 : begin

				 //(480,482)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[482];
				 realIp2B0 <= realWorkingBuffer[482];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd480;
				 stateIp2B0<=12'd482;

				 //(481,483)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[483];
				 realIp2B1 <= realWorkingBuffer[483];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd481;
				 stateIp2B1<=12'd483;

				 //(484,486)
				 imgIp1B2 <= imagWorkingBuffer[484];
				 realIp1B2 <= realWorkingBuffer[484];
				 imgIp2B2 <= imagWorkingBuffer[486];
				 realIp2B2 <= realWorkingBuffer[486];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd484;
				 stateIp2B2<=12'd486;

				 //(485,487)
				 imgIp1B3 <= imagWorkingBuffer[485];
				 realIp1B3 <= realWorkingBuffer[485];
				 imgIp2B3 <= imagWorkingBuffer[487];
				 realIp2B3 <= realWorkingBuffer[487];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd485;
				 stateIp2B3<=12'd487;

				 //(488,490)
				 imgIp1B4 <= imagWorkingBuffer[488];
				 realIp1B4 <= realWorkingBuffer[488];
				 imgIp2B4 <= imagWorkingBuffer[490];
				 realIp2B4 <= realWorkingBuffer[490];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd488;
				 stateIp2B4<=12'd490;

				 //(489,491)
				 imgIp1B5 <= imagWorkingBuffer[489];
				 realIp1B5 <= realWorkingBuffer[489];
				 imgIp2B5 <= imagWorkingBuffer[491];
				 realIp2B5 <= realWorkingBuffer[491];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd489;
				 stateIp2B5<=12'd491;

				 //(492,494)
				 imgIp1B6 <= imagWorkingBuffer[492];
				 realIp1B6 <= realWorkingBuffer[492];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd492;
				 stateIp2B6<=12'd494;

				 //(493,495)
				 imgIp1B7 <= imagWorkingBuffer[493];
				 realIp1B7 <= realWorkingBuffer[493];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd493;
				 stateIp2B7<=12'd495;
			 end
			 8'd64 : begin

				 //(496,498)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[498];
				 realIp2B0 <= realWorkingBuffer[498];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=0.99992;
				 stateIp1B0<=12'd496;
				 stateIp2B0<=12'd498;

				 //(497,499)
				 imgIp1B1 <= imagWorkingBuffer[497];
				 realIp1B1 <= realWorkingBuffer[497];
				 imgIp2B1 <= imagWorkingBuffer[499];
				 realIp2B1 <= realWorkingBuffer[499];
				 twiddleFactorRealB1 <=0.0;
				 twiddleFactorimgB1 <=-0.012272;
				 stateIp1B1<=12'd497;
				 stateIp2B1<=12'd499;

				 //(500,502)
				 imgIp1B2 <= imagWorkingBuffer[500];
				 realIp1B2 <= realWorkingBuffer[500];
				 imgIp2B2 <= imagWorkingBuffer[502];
				 realIp2B2 <= realWorkingBuffer[502];
				 twiddleFactorRealB2 <=1.0;
				 twiddleFactorimgB2 <=0.99992;
				 stateIp1B2<=12'd500;
				 stateIp2B2<=12'd502;

				 //(501,503)
				 imgIp1B3 <= imagWorkingBuffer[501];
				 realIp1B3 <= realWorkingBuffer[501];
				 imgIp2B3 <= imagWorkingBuffer[503];
				 realIp2B3 <= realWorkingBuffer[503];
				 twiddleFactorRealB3 <=0.0;
				 twiddleFactorimgB3 <=-0.012272;
				 stateIp1B3<=12'd501;
				 stateIp2B3<=12'd503;

				 //(504,506)
				 imgIp1B4 <= imagWorkingBuffer[504];
				 realIp1B4 <= realWorkingBuffer[504];
				 imgIp2B4 <= imagWorkingBuffer[506];
				 realIp2B4 <= realWorkingBuffer[506];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=0.99992;
				 stateIp1B4<=12'd504;
				 stateIp2B4<=12'd506;

				 //(505,507)
				 imgIp1B5 <= imagWorkingBuffer[505];
				 realIp1B5 <= realWorkingBuffer[505];
				 imgIp2B5 <= imagWorkingBuffer[507];
				 realIp2B5 <= realWorkingBuffer[507];
				 twiddleFactorRealB5 <=0.0;
				 twiddleFactorimgB5 <=-0.012272;
				 stateIp1B5<=12'd505;
				 stateIp2B5<=12'd507;

				 //(508,510)
				 imgIp1B6 <= imagWorkingBuffer[508];
				 realIp1B6 <= realWorkingBuffer[508];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=1.0;
				 twiddleFactorimgB6 <=0.99992;
				 stateIp1B6<=12'd508;
				 stateIp2B6<=12'd510;

				 //(509,511)
				 imgIp1B7 <= imagWorkingBuffer[509];
				 realIp1B7 <= realWorkingBuffer[509];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=0.0;
				 twiddleFactorimgB7 <=-0.012272;
				 stateIp1B7<=12'd509;
				 stateIp2B7<=12'd511;
			 end
			 8'd65 : begin

				 //(0,4)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[4];
				 realIp2B0 <= realWorkingBuffer[4];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd4;

				 //(1,5)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[5];
				 realIp2B1 <= realWorkingBuffer[5];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd5;

				 //(2,6)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[6];
				 realIp2B2 <= realWorkingBuffer[6];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd6;

				 //(3,7)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[7];
				 realIp2B3 <= realWorkingBuffer[7];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd7;

				 //(8,12)
				 imgIp1B4 <= imagWorkingBuffer[8];
				 realIp1B4 <= realWorkingBuffer[8];
				 imgIp2B4 <= imagWorkingBuffer[12];
				 realIp2B4 <= realWorkingBuffer[12];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd8;
				 stateIp2B4<=12'd12;

				 //(9,13)
				 imgIp1B5 <= imagWorkingBuffer[9];
				 realIp1B5 <= realWorkingBuffer[9];
				 imgIp2B5 <= imagWorkingBuffer[13];
				 realIp2B5 <= realWorkingBuffer[13];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd9;
				 stateIp2B5<=12'd13;

				 //(10,14)
				 imgIp1B6 <= imagWorkingBuffer[10];
				 realIp1B6 <= realWorkingBuffer[10];
				 imgIp2B6 <= imagWorkingBuffer[14];
				 realIp2B6 <= realWorkingBuffer[14];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd10;
				 stateIp2B6<=12'd14;

				 //(11,15)
				 imgIp1B7 <= imagWorkingBuffer[11];
				 realIp1B7 <= realWorkingBuffer[11];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd11;
				 stateIp2B7<=12'd15;
			 end
			 8'd66 : begin

				 //(16,20)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[20];
				 realIp2B0 <= realWorkingBuffer[20];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd20;

				 //(17,21)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[21];
				 realIp2B1 <= realWorkingBuffer[21];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd21;

				 //(18,22)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[22];
				 realIp2B2 <= realWorkingBuffer[22];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd18;
				 stateIp2B2<=12'd22;

				 //(19,23)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[23];
				 realIp2B3 <= realWorkingBuffer[23];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd19;
				 stateIp2B3<=12'd23;

				 //(24,28)
				 imgIp1B4 <= imagWorkingBuffer[24];
				 realIp1B4 <= realWorkingBuffer[24];
				 imgIp2B4 <= imagWorkingBuffer[28];
				 realIp2B4 <= realWorkingBuffer[28];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd24;
				 stateIp2B4<=12'd28;

				 //(25,29)
				 imgIp1B5 <= imagWorkingBuffer[25];
				 realIp1B5 <= realWorkingBuffer[25];
				 imgIp2B5 <= imagWorkingBuffer[29];
				 realIp2B5 <= realWorkingBuffer[29];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd25;
				 stateIp2B5<=12'd29;

				 //(26,30)
				 imgIp1B6 <= imagWorkingBuffer[26];
				 realIp1B6 <= realWorkingBuffer[26];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd26;
				 stateIp2B6<=12'd30;

				 //(27,31)
				 imgIp1B7 <= imagWorkingBuffer[27];
				 realIp1B7 <= realWorkingBuffer[27];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd27;
				 stateIp2B7<=12'd31;
			 end
			 8'd67 : begin

				 //(32,36)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[36];
				 realIp2B0 <= realWorkingBuffer[36];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd36;

				 //(33,37)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[37];
				 realIp2B1 <= realWorkingBuffer[37];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd37;

				 //(34,38)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[38];
				 realIp2B2 <= realWorkingBuffer[38];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd34;
				 stateIp2B2<=12'd38;

				 //(35,39)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[39];
				 realIp2B3 <= realWorkingBuffer[39];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd35;
				 stateIp2B3<=12'd39;

				 //(40,44)
				 imgIp1B4 <= imagWorkingBuffer[40];
				 realIp1B4 <= realWorkingBuffer[40];
				 imgIp2B4 <= imagWorkingBuffer[44];
				 realIp2B4 <= realWorkingBuffer[44];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd40;
				 stateIp2B4<=12'd44;

				 //(41,45)
				 imgIp1B5 <= imagWorkingBuffer[41];
				 realIp1B5 <= realWorkingBuffer[41];
				 imgIp2B5 <= imagWorkingBuffer[45];
				 realIp2B5 <= realWorkingBuffer[45];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd41;
				 stateIp2B5<=12'd45;

				 //(42,46)
				 imgIp1B6 <= imagWorkingBuffer[42];
				 realIp1B6 <= realWorkingBuffer[42];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd42;
				 stateIp2B6<=12'd46;

				 //(43,47)
				 imgIp1B7 <= imagWorkingBuffer[43];
				 realIp1B7 <= realWorkingBuffer[43];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd43;
				 stateIp2B7<=12'd47;
			 end
			 8'd68 : begin

				 //(48,52)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[52];
				 realIp2B0 <= realWorkingBuffer[52];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd52;

				 //(49,53)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[53];
				 realIp2B1 <= realWorkingBuffer[53];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd49;
				 stateIp2B1<=12'd53;

				 //(50,54)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[54];
				 realIp2B2 <= realWorkingBuffer[54];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd50;
				 stateIp2B2<=12'd54;

				 //(51,55)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[55];
				 realIp2B3 <= realWorkingBuffer[55];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd51;
				 stateIp2B3<=12'd55;

				 //(56,60)
				 imgIp1B4 <= imagWorkingBuffer[56];
				 realIp1B4 <= realWorkingBuffer[56];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd56;
				 stateIp2B4<=12'd60;

				 //(57,61)
				 imgIp1B5 <= imagWorkingBuffer[57];
				 realIp1B5 <= realWorkingBuffer[57];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd57;
				 stateIp2B5<=12'd61;

				 //(58,62)
				 imgIp1B6 <= imagWorkingBuffer[58];
				 realIp1B6 <= realWorkingBuffer[58];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd58;
				 stateIp2B6<=12'd62;

				 //(59,63)
				 imgIp1B7 <= imagWorkingBuffer[59];
				 realIp1B7 <= realWorkingBuffer[59];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd59;
				 stateIp2B7<=12'd63;
			 end
			 8'd69 : begin

				 //(64,68)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[68];
				 realIp2B0 <= realWorkingBuffer[68];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd68;

				 //(65,69)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[69];
				 realIp2B1 <= realWorkingBuffer[69];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd69;

				 //(66,70)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[70];
				 realIp2B2 <= realWorkingBuffer[70];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd66;
				 stateIp2B2<=12'd70;

				 //(67,71)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[71];
				 realIp2B3 <= realWorkingBuffer[71];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd67;
				 stateIp2B3<=12'd71;

				 //(72,76)
				 imgIp1B4 <= imagWorkingBuffer[72];
				 realIp1B4 <= realWorkingBuffer[72];
				 imgIp2B4 <= imagWorkingBuffer[76];
				 realIp2B4 <= realWorkingBuffer[76];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd72;
				 stateIp2B4<=12'd76;

				 //(73,77)
				 imgIp1B5 <= imagWorkingBuffer[73];
				 realIp1B5 <= realWorkingBuffer[73];
				 imgIp2B5 <= imagWorkingBuffer[77];
				 realIp2B5 <= realWorkingBuffer[77];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd73;
				 stateIp2B5<=12'd77;

				 //(74,78)
				 imgIp1B6 <= imagWorkingBuffer[74];
				 realIp1B6 <= realWorkingBuffer[74];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd74;
				 stateIp2B6<=12'd78;

				 //(75,79)
				 imgIp1B7 <= imagWorkingBuffer[75];
				 realIp1B7 <= realWorkingBuffer[75];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd75;
				 stateIp2B7<=12'd79;
			 end
			 8'd70 : begin

				 //(80,84)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[84];
				 realIp2B0 <= realWorkingBuffer[84];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd84;

				 //(81,85)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[85];
				 realIp2B1 <= realWorkingBuffer[85];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd81;
				 stateIp2B1<=12'd85;

				 //(82,86)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[86];
				 realIp2B2 <= realWorkingBuffer[86];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd82;
				 stateIp2B2<=12'd86;

				 //(83,87)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[87];
				 realIp2B3 <= realWorkingBuffer[87];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd83;
				 stateIp2B3<=12'd87;

				 //(88,92)
				 imgIp1B4 <= imagWorkingBuffer[88];
				 realIp1B4 <= realWorkingBuffer[88];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd88;
				 stateIp2B4<=12'd92;

				 //(89,93)
				 imgIp1B5 <= imagWorkingBuffer[89];
				 realIp1B5 <= realWorkingBuffer[89];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd89;
				 stateIp2B5<=12'd93;

				 //(90,94)
				 imgIp1B6 <= imagWorkingBuffer[90];
				 realIp1B6 <= realWorkingBuffer[90];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd90;
				 stateIp2B6<=12'd94;

				 //(91,95)
				 imgIp1B7 <= imagWorkingBuffer[91];
				 realIp1B7 <= realWorkingBuffer[91];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd91;
				 stateIp2B7<=12'd95;
			 end
			 8'd71 : begin

				 //(96,100)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[100];
				 realIp2B0 <= realWorkingBuffer[100];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd100;

				 //(97,101)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[101];
				 realIp2B1 <= realWorkingBuffer[101];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd97;
				 stateIp2B1<=12'd101;

				 //(98,102)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[102];
				 realIp2B2 <= realWorkingBuffer[102];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd98;
				 stateIp2B2<=12'd102;

				 //(99,103)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[103];
				 realIp2B3 <= realWorkingBuffer[103];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd99;
				 stateIp2B3<=12'd103;

				 //(104,108)
				 imgIp1B4 <= imagWorkingBuffer[104];
				 realIp1B4 <= realWorkingBuffer[104];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd104;
				 stateIp2B4<=12'd108;

				 //(105,109)
				 imgIp1B5 <= imagWorkingBuffer[105];
				 realIp1B5 <= realWorkingBuffer[105];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd105;
				 stateIp2B5<=12'd109;

				 //(106,110)
				 imgIp1B6 <= imagWorkingBuffer[106];
				 realIp1B6 <= realWorkingBuffer[106];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd106;
				 stateIp2B6<=12'd110;

				 //(107,111)
				 imgIp1B7 <= imagWorkingBuffer[107];
				 realIp1B7 <= realWorkingBuffer[107];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd107;
				 stateIp2B7<=12'd111;
			 end
			 8'd72 : begin

				 //(112,116)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[116];
				 realIp2B0 <= realWorkingBuffer[116];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd112;
				 stateIp2B0<=12'd116;

				 //(113,117)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[117];
				 realIp2B1 <= realWorkingBuffer[117];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd113;
				 stateIp2B1<=12'd117;

				 //(114,118)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[118];
				 realIp2B2 <= realWorkingBuffer[118];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd114;
				 stateIp2B2<=12'd118;

				 //(115,119)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[119];
				 realIp2B3 <= realWorkingBuffer[119];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd115;
				 stateIp2B3<=12'd119;

				 //(120,124)
				 imgIp1B4 <= imagWorkingBuffer[120];
				 realIp1B4 <= realWorkingBuffer[120];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd120;
				 stateIp2B4<=12'd124;

				 //(121,125)
				 imgIp1B5 <= imagWorkingBuffer[121];
				 realIp1B5 <= realWorkingBuffer[121];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd121;
				 stateIp2B5<=12'd125;

				 //(122,126)
				 imgIp1B6 <= imagWorkingBuffer[122];
				 realIp1B6 <= realWorkingBuffer[122];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd122;
				 stateIp2B6<=12'd126;

				 //(123,127)
				 imgIp1B7 <= imagWorkingBuffer[123];
				 realIp1B7 <= realWorkingBuffer[123];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd123;
				 stateIp2B7<=12'd127;
			 end
			 8'd73 : begin

				 //(128,132)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[132];
				 realIp2B0 <= realWorkingBuffer[132];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd132;

				 //(129,133)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[133];
				 realIp2B1 <= realWorkingBuffer[133];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd133;

				 //(130,134)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[134];
				 realIp2B2 <= realWorkingBuffer[134];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd130;
				 stateIp2B2<=12'd134;

				 //(131,135)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[135];
				 realIp2B3 <= realWorkingBuffer[135];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd131;
				 stateIp2B3<=12'd135;

				 //(136,140)
				 imgIp1B4 <= imagWorkingBuffer[136];
				 realIp1B4 <= realWorkingBuffer[136];
				 imgIp2B4 <= imagWorkingBuffer[140];
				 realIp2B4 <= realWorkingBuffer[140];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd136;
				 stateIp2B4<=12'd140;

				 //(137,141)
				 imgIp1B5 <= imagWorkingBuffer[137];
				 realIp1B5 <= realWorkingBuffer[137];
				 imgIp2B5 <= imagWorkingBuffer[141];
				 realIp2B5 <= realWorkingBuffer[141];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd137;
				 stateIp2B5<=12'd141;

				 //(138,142)
				 imgIp1B6 <= imagWorkingBuffer[138];
				 realIp1B6 <= realWorkingBuffer[138];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd138;
				 stateIp2B6<=12'd142;

				 //(139,143)
				 imgIp1B7 <= imagWorkingBuffer[139];
				 realIp1B7 <= realWorkingBuffer[139];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd139;
				 stateIp2B7<=12'd143;
			 end
			 8'd74 : begin

				 //(144,148)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[148];
				 realIp2B0 <= realWorkingBuffer[148];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd148;

				 //(145,149)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[149];
				 realIp2B1 <= realWorkingBuffer[149];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd145;
				 stateIp2B1<=12'd149;

				 //(146,150)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[150];
				 realIp2B2 <= realWorkingBuffer[150];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd146;
				 stateIp2B2<=12'd150;

				 //(147,151)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[151];
				 realIp2B3 <= realWorkingBuffer[151];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd147;
				 stateIp2B3<=12'd151;

				 //(152,156)
				 imgIp1B4 <= imagWorkingBuffer[152];
				 realIp1B4 <= realWorkingBuffer[152];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd152;
				 stateIp2B4<=12'd156;

				 //(153,157)
				 imgIp1B5 <= imagWorkingBuffer[153];
				 realIp1B5 <= realWorkingBuffer[153];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd153;
				 stateIp2B5<=12'd157;

				 //(154,158)
				 imgIp1B6 <= imagWorkingBuffer[154];
				 realIp1B6 <= realWorkingBuffer[154];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd154;
				 stateIp2B6<=12'd158;

				 //(155,159)
				 imgIp1B7 <= imagWorkingBuffer[155];
				 realIp1B7 <= realWorkingBuffer[155];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd155;
				 stateIp2B7<=12'd159;
			 end
			 8'd75 : begin

				 //(160,164)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[164];
				 realIp2B0 <= realWorkingBuffer[164];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd164;

				 //(161,165)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[165];
				 realIp2B1 <= realWorkingBuffer[165];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd161;
				 stateIp2B1<=12'd165;

				 //(162,166)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[166];
				 realIp2B2 <= realWorkingBuffer[166];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd162;
				 stateIp2B2<=12'd166;

				 //(163,167)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[167];
				 realIp2B3 <= realWorkingBuffer[167];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd163;
				 stateIp2B3<=12'd167;

				 //(168,172)
				 imgIp1B4 <= imagWorkingBuffer[168];
				 realIp1B4 <= realWorkingBuffer[168];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd168;
				 stateIp2B4<=12'd172;

				 //(169,173)
				 imgIp1B5 <= imagWorkingBuffer[169];
				 realIp1B5 <= realWorkingBuffer[169];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd169;
				 stateIp2B5<=12'd173;

				 //(170,174)
				 imgIp1B6 <= imagWorkingBuffer[170];
				 realIp1B6 <= realWorkingBuffer[170];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd170;
				 stateIp2B6<=12'd174;

				 //(171,175)
				 imgIp1B7 <= imagWorkingBuffer[171];
				 realIp1B7 <= realWorkingBuffer[171];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd171;
				 stateIp2B7<=12'd175;
			 end
			 8'd76 : begin

				 //(176,180)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[180];
				 realIp2B0 <= realWorkingBuffer[180];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd176;
				 stateIp2B0<=12'd180;

				 //(177,181)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[181];
				 realIp2B1 <= realWorkingBuffer[181];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd177;
				 stateIp2B1<=12'd181;

				 //(178,182)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[182];
				 realIp2B2 <= realWorkingBuffer[182];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd178;
				 stateIp2B2<=12'd182;

				 //(179,183)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[183];
				 realIp2B3 <= realWorkingBuffer[183];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd179;
				 stateIp2B3<=12'd183;

				 //(184,188)
				 imgIp1B4 <= imagWorkingBuffer[184];
				 realIp1B4 <= realWorkingBuffer[184];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd184;
				 stateIp2B4<=12'd188;

				 //(185,189)
				 imgIp1B5 <= imagWorkingBuffer[185];
				 realIp1B5 <= realWorkingBuffer[185];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd185;
				 stateIp2B5<=12'd189;

				 //(186,190)
				 imgIp1B6 <= imagWorkingBuffer[186];
				 realIp1B6 <= realWorkingBuffer[186];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd186;
				 stateIp2B6<=12'd190;

				 //(187,191)
				 imgIp1B7 <= imagWorkingBuffer[187];
				 realIp1B7 <= realWorkingBuffer[187];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd187;
				 stateIp2B7<=12'd191;
			 end
			 8'd77 : begin

				 //(192,196)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[196];
				 realIp2B0 <= realWorkingBuffer[196];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd196;

				 //(193,197)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[197];
				 realIp2B1 <= realWorkingBuffer[197];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd193;
				 stateIp2B1<=12'd197;

				 //(194,198)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[198];
				 realIp2B2 <= realWorkingBuffer[198];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd194;
				 stateIp2B2<=12'd198;

				 //(195,199)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[199];
				 realIp2B3 <= realWorkingBuffer[199];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd195;
				 stateIp2B3<=12'd199;

				 //(200,204)
				 imgIp1B4 <= imagWorkingBuffer[200];
				 realIp1B4 <= realWorkingBuffer[200];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd200;
				 stateIp2B4<=12'd204;

				 //(201,205)
				 imgIp1B5 <= imagWorkingBuffer[201];
				 realIp1B5 <= realWorkingBuffer[201];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd201;
				 stateIp2B5<=12'd205;

				 //(202,206)
				 imgIp1B6 <= imagWorkingBuffer[202];
				 realIp1B6 <= realWorkingBuffer[202];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd202;
				 stateIp2B6<=12'd206;

				 //(203,207)
				 imgIp1B7 <= imagWorkingBuffer[203];
				 realIp1B7 <= realWorkingBuffer[203];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd203;
				 stateIp2B7<=12'd207;
			 end
			 8'd78 : begin

				 //(208,212)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[212];
				 realIp2B0 <= realWorkingBuffer[212];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd208;
				 stateIp2B0<=12'd212;

				 //(209,213)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[213];
				 realIp2B1 <= realWorkingBuffer[213];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd209;
				 stateIp2B1<=12'd213;

				 //(210,214)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[214];
				 realIp2B2 <= realWorkingBuffer[214];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd210;
				 stateIp2B2<=12'd214;

				 //(211,215)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[215];
				 realIp2B3 <= realWorkingBuffer[215];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd211;
				 stateIp2B3<=12'd215;

				 //(216,220)
				 imgIp1B4 <= imagWorkingBuffer[216];
				 realIp1B4 <= realWorkingBuffer[216];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd216;
				 stateIp2B4<=12'd220;

				 //(217,221)
				 imgIp1B5 <= imagWorkingBuffer[217];
				 realIp1B5 <= realWorkingBuffer[217];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd217;
				 stateIp2B5<=12'd221;

				 //(218,222)
				 imgIp1B6 <= imagWorkingBuffer[218];
				 realIp1B6 <= realWorkingBuffer[218];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd218;
				 stateIp2B6<=12'd222;

				 //(219,223)
				 imgIp1B7 <= imagWorkingBuffer[219];
				 realIp1B7 <= realWorkingBuffer[219];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd219;
				 stateIp2B7<=12'd223;
			 end
			 8'd79 : begin

				 //(224,228)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[228];
				 realIp2B0 <= realWorkingBuffer[228];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd224;
				 stateIp2B0<=12'd228;

				 //(225,229)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[229];
				 realIp2B1 <= realWorkingBuffer[229];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd225;
				 stateIp2B1<=12'd229;

				 //(226,230)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[230];
				 realIp2B2 <= realWorkingBuffer[230];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd226;
				 stateIp2B2<=12'd230;

				 //(227,231)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[231];
				 realIp2B3 <= realWorkingBuffer[231];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd227;
				 stateIp2B3<=12'd231;

				 //(232,236)
				 imgIp1B4 <= imagWorkingBuffer[232];
				 realIp1B4 <= realWorkingBuffer[232];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd232;
				 stateIp2B4<=12'd236;

				 //(233,237)
				 imgIp1B5 <= imagWorkingBuffer[233];
				 realIp1B5 <= realWorkingBuffer[233];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd233;
				 stateIp2B5<=12'd237;

				 //(234,238)
				 imgIp1B6 <= imagWorkingBuffer[234];
				 realIp1B6 <= realWorkingBuffer[234];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd234;
				 stateIp2B6<=12'd238;

				 //(235,239)
				 imgIp1B7 <= imagWorkingBuffer[235];
				 realIp1B7 <= realWorkingBuffer[235];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd235;
				 stateIp2B7<=12'd239;
			 end
			 8'd80 : begin

				 //(240,244)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[244];
				 realIp2B0 <= realWorkingBuffer[244];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd240;
				 stateIp2B0<=12'd244;

				 //(241,245)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[245];
				 realIp2B1 <= realWorkingBuffer[245];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd241;
				 stateIp2B1<=12'd245;

				 //(242,246)
				 imgIp1B2 <= imagWorkingBuffer[242];
				 realIp1B2 <= realWorkingBuffer[242];
				 imgIp2B2 <= imagWorkingBuffer[246];
				 realIp2B2 <= realWorkingBuffer[246];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd242;
				 stateIp2B2<=12'd246;

				 //(243,247)
				 imgIp1B3 <= imagWorkingBuffer[243];
				 realIp1B3 <= realWorkingBuffer[243];
				 imgIp2B3 <= imagWorkingBuffer[247];
				 realIp2B3 <= realWorkingBuffer[247];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd243;
				 stateIp2B3<=12'd247;

				 //(248,252)
				 imgIp1B4 <= imagWorkingBuffer[248];
				 realIp1B4 <= realWorkingBuffer[248];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd248;
				 stateIp2B4<=12'd252;

				 //(249,253)
				 imgIp1B5 <= imagWorkingBuffer[249];
				 realIp1B5 <= realWorkingBuffer[249];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd249;
				 stateIp2B5<=12'd253;

				 //(250,254)
				 imgIp1B6 <= imagWorkingBuffer[250];
				 realIp1B6 <= realWorkingBuffer[250];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd250;
				 stateIp2B6<=12'd254;

				 //(251,255)
				 imgIp1B7 <= imagWorkingBuffer[251];
				 realIp1B7 <= realWorkingBuffer[251];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd251;
				 stateIp2B7<=12'd255;
			 end
			 8'd81 : begin

				 //(256,260)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[260];
				 realIp2B0 <= realWorkingBuffer[260];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd260;

				 //(257,261)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[261];
				 realIp2B1 <= realWorkingBuffer[261];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd261;

				 //(258,262)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[262];
				 realIp2B2 <= realWorkingBuffer[262];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd258;
				 stateIp2B2<=12'd262;

				 //(259,263)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[263];
				 realIp2B3 <= realWorkingBuffer[263];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd259;
				 stateIp2B3<=12'd263;

				 //(264,268)
				 imgIp1B4 <= imagWorkingBuffer[264];
				 realIp1B4 <= realWorkingBuffer[264];
				 imgIp2B4 <= imagWorkingBuffer[268];
				 realIp2B4 <= realWorkingBuffer[268];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd264;
				 stateIp2B4<=12'd268;

				 //(265,269)
				 imgIp1B5 <= imagWorkingBuffer[265];
				 realIp1B5 <= realWorkingBuffer[265];
				 imgIp2B5 <= imagWorkingBuffer[269];
				 realIp2B5 <= realWorkingBuffer[269];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd265;
				 stateIp2B5<=12'd269;

				 //(266,270)
				 imgIp1B6 <= imagWorkingBuffer[266];
				 realIp1B6 <= realWorkingBuffer[266];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd266;
				 stateIp2B6<=12'd270;

				 //(267,271)
				 imgIp1B7 <= imagWorkingBuffer[267];
				 realIp1B7 <= realWorkingBuffer[267];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd267;
				 stateIp2B7<=12'd271;
			 end
			 8'd82 : begin

				 //(272,276)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[276];
				 realIp2B0 <= realWorkingBuffer[276];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd276;

				 //(273,277)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[277];
				 realIp2B1 <= realWorkingBuffer[277];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd273;
				 stateIp2B1<=12'd277;

				 //(274,278)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[278];
				 realIp2B2 <= realWorkingBuffer[278];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd274;
				 stateIp2B2<=12'd278;

				 //(275,279)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[279];
				 realIp2B3 <= realWorkingBuffer[279];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd275;
				 stateIp2B3<=12'd279;

				 //(280,284)
				 imgIp1B4 <= imagWorkingBuffer[280];
				 realIp1B4 <= realWorkingBuffer[280];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd280;
				 stateIp2B4<=12'd284;

				 //(281,285)
				 imgIp1B5 <= imagWorkingBuffer[281];
				 realIp1B5 <= realWorkingBuffer[281];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd281;
				 stateIp2B5<=12'd285;

				 //(282,286)
				 imgIp1B6 <= imagWorkingBuffer[282];
				 realIp1B6 <= realWorkingBuffer[282];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd282;
				 stateIp2B6<=12'd286;

				 //(283,287)
				 imgIp1B7 <= imagWorkingBuffer[283];
				 realIp1B7 <= realWorkingBuffer[283];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd283;
				 stateIp2B7<=12'd287;
			 end
			 8'd83 : begin

				 //(288,292)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[292];
				 realIp2B0 <= realWorkingBuffer[292];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd292;

				 //(289,293)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[293];
				 realIp2B1 <= realWorkingBuffer[293];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd289;
				 stateIp2B1<=12'd293;

				 //(290,294)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[294];
				 realIp2B2 <= realWorkingBuffer[294];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd290;
				 stateIp2B2<=12'd294;

				 //(291,295)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[295];
				 realIp2B3 <= realWorkingBuffer[295];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd291;
				 stateIp2B3<=12'd295;

				 //(296,300)
				 imgIp1B4 <= imagWorkingBuffer[296];
				 realIp1B4 <= realWorkingBuffer[296];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd296;
				 stateIp2B4<=12'd300;

				 //(297,301)
				 imgIp1B5 <= imagWorkingBuffer[297];
				 realIp1B5 <= realWorkingBuffer[297];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd297;
				 stateIp2B5<=12'd301;

				 //(298,302)
				 imgIp1B6 <= imagWorkingBuffer[298];
				 realIp1B6 <= realWorkingBuffer[298];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd298;
				 stateIp2B6<=12'd302;

				 //(299,303)
				 imgIp1B7 <= imagWorkingBuffer[299];
				 realIp1B7 <= realWorkingBuffer[299];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd299;
				 stateIp2B7<=12'd303;
			 end
			 8'd84 : begin

				 //(304,308)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[308];
				 realIp2B0 <= realWorkingBuffer[308];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd304;
				 stateIp2B0<=12'd308;

				 //(305,309)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[309];
				 realIp2B1 <= realWorkingBuffer[309];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd305;
				 stateIp2B1<=12'd309;

				 //(306,310)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[310];
				 realIp2B2 <= realWorkingBuffer[310];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd306;
				 stateIp2B2<=12'd310;

				 //(307,311)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[311];
				 realIp2B3 <= realWorkingBuffer[311];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd307;
				 stateIp2B3<=12'd311;

				 //(312,316)
				 imgIp1B4 <= imagWorkingBuffer[312];
				 realIp1B4 <= realWorkingBuffer[312];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd312;
				 stateIp2B4<=12'd316;

				 //(313,317)
				 imgIp1B5 <= imagWorkingBuffer[313];
				 realIp1B5 <= realWorkingBuffer[313];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd313;
				 stateIp2B5<=12'd317;

				 //(314,318)
				 imgIp1B6 <= imagWorkingBuffer[314];
				 realIp1B6 <= realWorkingBuffer[314];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd314;
				 stateIp2B6<=12'd318;

				 //(315,319)
				 imgIp1B7 <= imagWorkingBuffer[315];
				 realIp1B7 <= realWorkingBuffer[315];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd315;
				 stateIp2B7<=12'd319;
			 end
			 8'd85 : begin

				 //(320,324)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[324];
				 realIp2B0 <= realWorkingBuffer[324];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd324;

				 //(321,325)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[325];
				 realIp2B1 <= realWorkingBuffer[325];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd321;
				 stateIp2B1<=12'd325;

				 //(322,326)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[326];
				 realIp2B2 <= realWorkingBuffer[326];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd322;
				 stateIp2B2<=12'd326;

				 //(323,327)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[327];
				 realIp2B3 <= realWorkingBuffer[327];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd323;
				 stateIp2B3<=12'd327;

				 //(328,332)
				 imgIp1B4 <= imagWorkingBuffer[328];
				 realIp1B4 <= realWorkingBuffer[328];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd328;
				 stateIp2B4<=12'd332;

				 //(329,333)
				 imgIp1B5 <= imagWorkingBuffer[329];
				 realIp1B5 <= realWorkingBuffer[329];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd329;
				 stateIp2B5<=12'd333;

				 //(330,334)
				 imgIp1B6 <= imagWorkingBuffer[330];
				 realIp1B6 <= realWorkingBuffer[330];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd330;
				 stateIp2B6<=12'd334;

				 //(331,335)
				 imgIp1B7 <= imagWorkingBuffer[331];
				 realIp1B7 <= realWorkingBuffer[331];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd331;
				 stateIp2B7<=12'd335;
			 end
			 8'd86 : begin

				 //(336,340)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[340];
				 realIp2B0 <= realWorkingBuffer[340];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd336;
				 stateIp2B0<=12'd340;

				 //(337,341)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[341];
				 realIp2B1 <= realWorkingBuffer[341];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd337;
				 stateIp2B1<=12'd341;

				 //(338,342)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[342];
				 realIp2B2 <= realWorkingBuffer[342];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd338;
				 stateIp2B2<=12'd342;

				 //(339,343)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[343];
				 realIp2B3 <= realWorkingBuffer[343];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd339;
				 stateIp2B3<=12'd343;

				 //(344,348)
				 imgIp1B4 <= imagWorkingBuffer[344];
				 realIp1B4 <= realWorkingBuffer[344];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd344;
				 stateIp2B4<=12'd348;

				 //(345,349)
				 imgIp1B5 <= imagWorkingBuffer[345];
				 realIp1B5 <= realWorkingBuffer[345];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd345;
				 stateIp2B5<=12'd349;

				 //(346,350)
				 imgIp1B6 <= imagWorkingBuffer[346];
				 realIp1B6 <= realWorkingBuffer[346];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd346;
				 stateIp2B6<=12'd350;

				 //(347,351)
				 imgIp1B7 <= imagWorkingBuffer[347];
				 realIp1B7 <= realWorkingBuffer[347];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd347;
				 stateIp2B7<=12'd351;
			 end
			 8'd87 : begin

				 //(352,356)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[356];
				 realIp2B0 <= realWorkingBuffer[356];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd352;
				 stateIp2B0<=12'd356;

				 //(353,357)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[357];
				 realIp2B1 <= realWorkingBuffer[357];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd353;
				 stateIp2B1<=12'd357;

				 //(354,358)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[358];
				 realIp2B2 <= realWorkingBuffer[358];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd354;
				 stateIp2B2<=12'd358;

				 //(355,359)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[359];
				 realIp2B3 <= realWorkingBuffer[359];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd355;
				 stateIp2B3<=12'd359;

				 //(360,364)
				 imgIp1B4 <= imagWorkingBuffer[360];
				 realIp1B4 <= realWorkingBuffer[360];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd360;
				 stateIp2B4<=12'd364;

				 //(361,365)
				 imgIp1B5 <= imagWorkingBuffer[361];
				 realIp1B5 <= realWorkingBuffer[361];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd361;
				 stateIp2B5<=12'd365;

				 //(362,366)
				 imgIp1B6 <= imagWorkingBuffer[362];
				 realIp1B6 <= realWorkingBuffer[362];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd362;
				 stateIp2B6<=12'd366;

				 //(363,367)
				 imgIp1B7 <= imagWorkingBuffer[363];
				 realIp1B7 <= realWorkingBuffer[363];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd363;
				 stateIp2B7<=12'd367;
			 end
			 8'd88 : begin

				 //(368,372)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[372];
				 realIp2B0 <= realWorkingBuffer[372];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd368;
				 stateIp2B0<=12'd372;

				 //(369,373)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[373];
				 realIp2B1 <= realWorkingBuffer[373];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd369;
				 stateIp2B1<=12'd373;

				 //(370,374)
				 imgIp1B2 <= imagWorkingBuffer[370];
				 realIp1B2 <= realWorkingBuffer[370];
				 imgIp2B2 <= imagWorkingBuffer[374];
				 realIp2B2 <= realWorkingBuffer[374];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd370;
				 stateIp2B2<=12'd374;

				 //(371,375)
				 imgIp1B3 <= imagWorkingBuffer[371];
				 realIp1B3 <= realWorkingBuffer[371];
				 imgIp2B3 <= imagWorkingBuffer[375];
				 realIp2B3 <= realWorkingBuffer[375];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd371;
				 stateIp2B3<=12'd375;

				 //(376,380)
				 imgIp1B4 <= imagWorkingBuffer[376];
				 realIp1B4 <= realWorkingBuffer[376];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd376;
				 stateIp2B4<=12'd380;

				 //(377,381)
				 imgIp1B5 <= imagWorkingBuffer[377];
				 realIp1B5 <= realWorkingBuffer[377];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd377;
				 stateIp2B5<=12'd381;

				 //(378,382)
				 imgIp1B6 <= imagWorkingBuffer[378];
				 realIp1B6 <= realWorkingBuffer[378];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd378;
				 stateIp2B6<=12'd382;

				 //(379,383)
				 imgIp1B7 <= imagWorkingBuffer[379];
				 realIp1B7 <= realWorkingBuffer[379];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd379;
				 stateIp2B7<=12'd383;
			 end
			 8'd89 : begin

				 //(384,388)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[388];
				 realIp2B0 <= realWorkingBuffer[388];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd388;

				 //(385,389)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[389];
				 realIp2B1 <= realWorkingBuffer[389];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd385;
				 stateIp2B1<=12'd389;

				 //(386,390)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[390];
				 realIp2B2 <= realWorkingBuffer[390];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd386;
				 stateIp2B2<=12'd390;

				 //(387,391)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[391];
				 realIp2B3 <= realWorkingBuffer[391];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd387;
				 stateIp2B3<=12'd391;

				 //(392,396)
				 imgIp1B4 <= imagWorkingBuffer[392];
				 realIp1B4 <= realWorkingBuffer[392];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd392;
				 stateIp2B4<=12'd396;

				 //(393,397)
				 imgIp1B5 <= imagWorkingBuffer[393];
				 realIp1B5 <= realWorkingBuffer[393];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd393;
				 stateIp2B5<=12'd397;

				 //(394,398)
				 imgIp1B6 <= imagWorkingBuffer[394];
				 realIp1B6 <= realWorkingBuffer[394];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd394;
				 stateIp2B6<=12'd398;

				 //(395,399)
				 imgIp1B7 <= imagWorkingBuffer[395];
				 realIp1B7 <= realWorkingBuffer[395];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd395;
				 stateIp2B7<=12'd399;
			 end
			 8'd90 : begin

				 //(400,404)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[404];
				 realIp2B0 <= realWorkingBuffer[404];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd400;
				 stateIp2B0<=12'd404;

				 //(401,405)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[405];
				 realIp2B1 <= realWorkingBuffer[405];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd401;
				 stateIp2B1<=12'd405;

				 //(402,406)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[406];
				 realIp2B2 <= realWorkingBuffer[406];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd402;
				 stateIp2B2<=12'd406;

				 //(403,407)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[407];
				 realIp2B3 <= realWorkingBuffer[407];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd403;
				 stateIp2B3<=12'd407;

				 //(408,412)
				 imgIp1B4 <= imagWorkingBuffer[408];
				 realIp1B4 <= realWorkingBuffer[408];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd408;
				 stateIp2B4<=12'd412;

				 //(409,413)
				 imgIp1B5 <= imagWorkingBuffer[409];
				 realIp1B5 <= realWorkingBuffer[409];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd409;
				 stateIp2B5<=12'd413;

				 //(410,414)
				 imgIp1B6 <= imagWorkingBuffer[410];
				 realIp1B6 <= realWorkingBuffer[410];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd410;
				 stateIp2B6<=12'd414;

				 //(411,415)
				 imgIp1B7 <= imagWorkingBuffer[411];
				 realIp1B7 <= realWorkingBuffer[411];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd411;
				 stateIp2B7<=12'd415;
			 end
			 8'd91 : begin

				 //(416,420)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[420];
				 realIp2B0 <= realWorkingBuffer[420];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd416;
				 stateIp2B0<=12'd420;

				 //(417,421)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[421];
				 realIp2B1 <= realWorkingBuffer[421];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd417;
				 stateIp2B1<=12'd421;

				 //(418,422)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[422];
				 realIp2B2 <= realWorkingBuffer[422];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd418;
				 stateIp2B2<=12'd422;

				 //(419,423)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[423];
				 realIp2B3 <= realWorkingBuffer[423];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd419;
				 stateIp2B3<=12'd423;

				 //(424,428)
				 imgIp1B4 <= imagWorkingBuffer[424];
				 realIp1B4 <= realWorkingBuffer[424];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd424;
				 stateIp2B4<=12'd428;

				 //(425,429)
				 imgIp1B5 <= imagWorkingBuffer[425];
				 realIp1B5 <= realWorkingBuffer[425];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd425;
				 stateIp2B5<=12'd429;

				 //(426,430)
				 imgIp1B6 <= imagWorkingBuffer[426];
				 realIp1B6 <= realWorkingBuffer[426];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd426;
				 stateIp2B6<=12'd430;

				 //(427,431)
				 imgIp1B7 <= imagWorkingBuffer[427];
				 realIp1B7 <= realWorkingBuffer[427];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd427;
				 stateIp2B7<=12'd431;
			 end
			 8'd92 : begin

				 //(432,436)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[436];
				 realIp2B0 <= realWorkingBuffer[436];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd432;
				 stateIp2B0<=12'd436;

				 //(433,437)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[437];
				 realIp2B1 <= realWorkingBuffer[437];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd433;
				 stateIp2B1<=12'd437;

				 //(434,438)
				 imgIp1B2 <= imagWorkingBuffer[434];
				 realIp1B2 <= realWorkingBuffer[434];
				 imgIp2B2 <= imagWorkingBuffer[438];
				 realIp2B2 <= realWorkingBuffer[438];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd434;
				 stateIp2B2<=12'd438;

				 //(435,439)
				 imgIp1B3 <= imagWorkingBuffer[435];
				 realIp1B3 <= realWorkingBuffer[435];
				 imgIp2B3 <= imagWorkingBuffer[439];
				 realIp2B3 <= realWorkingBuffer[439];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd435;
				 stateIp2B3<=12'd439;

				 //(440,444)
				 imgIp1B4 <= imagWorkingBuffer[440];
				 realIp1B4 <= realWorkingBuffer[440];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd440;
				 stateIp2B4<=12'd444;

				 //(441,445)
				 imgIp1B5 <= imagWorkingBuffer[441];
				 realIp1B5 <= realWorkingBuffer[441];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd441;
				 stateIp2B5<=12'd445;

				 //(442,446)
				 imgIp1B6 <= imagWorkingBuffer[442];
				 realIp1B6 <= realWorkingBuffer[442];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd442;
				 stateIp2B6<=12'd446;

				 //(443,447)
				 imgIp1B7 <= imagWorkingBuffer[443];
				 realIp1B7 <= realWorkingBuffer[443];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd443;
				 stateIp2B7<=12'd447;
			 end
			 8'd93 : begin

				 //(448,452)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[452];
				 realIp2B0 <= realWorkingBuffer[452];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd448;
				 stateIp2B0<=12'd452;

				 //(449,453)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[453];
				 realIp2B1 <= realWorkingBuffer[453];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd449;
				 stateIp2B1<=12'd453;

				 //(450,454)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[454];
				 realIp2B2 <= realWorkingBuffer[454];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd450;
				 stateIp2B2<=12'd454;

				 //(451,455)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[455];
				 realIp2B3 <= realWorkingBuffer[455];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd451;
				 stateIp2B3<=12'd455;

				 //(456,460)
				 imgIp1B4 <= imagWorkingBuffer[456];
				 realIp1B4 <= realWorkingBuffer[456];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd456;
				 stateIp2B4<=12'd460;

				 //(457,461)
				 imgIp1B5 <= imagWorkingBuffer[457];
				 realIp1B5 <= realWorkingBuffer[457];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd457;
				 stateIp2B5<=12'd461;

				 //(458,462)
				 imgIp1B6 <= imagWorkingBuffer[458];
				 realIp1B6 <= realWorkingBuffer[458];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd458;
				 stateIp2B6<=12'd462;

				 //(459,463)
				 imgIp1B7 <= imagWorkingBuffer[459];
				 realIp1B7 <= realWorkingBuffer[459];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd459;
				 stateIp2B7<=12'd463;
			 end
			 8'd94 : begin

				 //(464,468)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[468];
				 realIp2B0 <= realWorkingBuffer[468];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd464;
				 stateIp2B0<=12'd468;

				 //(465,469)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[469];
				 realIp2B1 <= realWorkingBuffer[469];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd465;
				 stateIp2B1<=12'd469;

				 //(466,470)
				 imgIp1B2 <= imagWorkingBuffer[466];
				 realIp1B2 <= realWorkingBuffer[466];
				 imgIp2B2 <= imagWorkingBuffer[470];
				 realIp2B2 <= realWorkingBuffer[470];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd466;
				 stateIp2B2<=12'd470;

				 //(467,471)
				 imgIp1B3 <= imagWorkingBuffer[467];
				 realIp1B3 <= realWorkingBuffer[467];
				 imgIp2B3 <= imagWorkingBuffer[471];
				 realIp2B3 <= realWorkingBuffer[471];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd467;
				 stateIp2B3<=12'd471;

				 //(472,476)
				 imgIp1B4 <= imagWorkingBuffer[472];
				 realIp1B4 <= realWorkingBuffer[472];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd472;
				 stateIp2B4<=12'd476;

				 //(473,477)
				 imgIp1B5 <= imagWorkingBuffer[473];
				 realIp1B5 <= realWorkingBuffer[473];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd473;
				 stateIp2B5<=12'd477;

				 //(474,478)
				 imgIp1B6 <= imagWorkingBuffer[474];
				 realIp1B6 <= realWorkingBuffer[474];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd474;
				 stateIp2B6<=12'd478;

				 //(475,479)
				 imgIp1B7 <= imagWorkingBuffer[475];
				 realIp1B7 <= realWorkingBuffer[475];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd475;
				 stateIp2B7<=12'd479;
			 end
			 8'd95 : begin

				 //(480,484)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[484];
				 realIp2B0 <= realWorkingBuffer[484];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd480;
				 stateIp2B0<=12'd484;

				 //(481,485)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[485];
				 realIp2B1 <= realWorkingBuffer[485];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd481;
				 stateIp2B1<=12'd485;

				 //(482,486)
				 imgIp1B2 <= imagWorkingBuffer[482];
				 realIp1B2 <= realWorkingBuffer[482];
				 imgIp2B2 <= imagWorkingBuffer[486];
				 realIp2B2 <= realWorkingBuffer[486];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd482;
				 stateIp2B2<=12'd486;

				 //(483,487)
				 imgIp1B3 <= imagWorkingBuffer[483];
				 realIp1B3 <= realWorkingBuffer[483];
				 imgIp2B3 <= imagWorkingBuffer[487];
				 realIp2B3 <= realWorkingBuffer[487];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd483;
				 stateIp2B3<=12'd487;

				 //(488,492)
				 imgIp1B4 <= imagWorkingBuffer[488];
				 realIp1B4 <= realWorkingBuffer[488];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd488;
				 stateIp2B4<=12'd492;

				 //(489,493)
				 imgIp1B5 <= imagWorkingBuffer[489];
				 realIp1B5 <= realWorkingBuffer[489];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd489;
				 stateIp2B5<=12'd493;

				 //(490,494)
				 imgIp1B6 <= imagWorkingBuffer[490];
				 realIp1B6 <= realWorkingBuffer[490];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd490;
				 stateIp2B6<=12'd494;

				 //(491,495)
				 imgIp1B7 <= imagWorkingBuffer[491];
				 realIp1B7 <= realWorkingBuffer[491];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd491;
				 stateIp2B7<=12'd495;
			 end
			 8'd96 : begin

				 //(496,500)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[500];
				 realIp2B0 <= realWorkingBuffer[500];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd496;
				 stateIp2B0<=12'd500;

				 //(497,501)
				 imgIp1B1 <= imagWorkingBuffer[497];
				 realIp1B1 <= realWorkingBuffer[497];
				 imgIp2B1 <= imagWorkingBuffer[501];
				 realIp2B1 <= realWorkingBuffer[501];
				 twiddleFactorRealB1 <=0.7073882691671998;
				 twiddleFactorimgB1 <=-0.706825181105366;
				 stateIp1B1<=12'd497;
				 stateIp2B1<=12'd501;

				 //(498,502)
				 imgIp1B2 <= imagWorkingBuffer[498];
				 realIp1B2 <= realWorkingBuffer[498];
				 imgIp2B2 <= imagWorkingBuffer[502];
				 realIp2B2 <= realWorkingBuffer[502];
				 twiddleFactorRealB2 <=0.0;
				 twiddleFactorimgB2 <=-0.9999996829318346;
				 stateIp1B2<=12'd498;
				 stateIp2B2<=12'd502;

				 //(499,503)
				 imgIp1B3 <= imagWorkingBuffer[499];
				 realIp1B3 <= realWorkingBuffer[499];
				 imgIp2B3 <= imagWorkingBuffer[503];
				 realIp2B3 <= realWorkingBuffer[503];
				 twiddleFactorRealB3 <=-0.7062616448200052;
				 twiddleFactorimgB3 <=-0.7079509086484322;
				 stateIp1B3<=12'd499;
				 stateIp2B3<=12'd503;

				 //(504,508)
				 imgIp1B4 <= imagWorkingBuffer[504];
				 realIp1B4 <= realWorkingBuffer[504];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=1.0;
				 twiddleFactorimgB4 <=-0.0;
				 stateIp1B4<=12'd504;
				 stateIp2B4<=12'd508;

				 //(505,509)
				 imgIp1B5 <= imagWorkingBuffer[505];
				 realIp1B5 <= realWorkingBuffer[505];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=0.7073882691671998;
				 twiddleFactorimgB5 <=-0.706825181105366;
				 stateIp1B5<=12'd505;
				 stateIp2B5<=12'd509;

				 //(506,510)
				 imgIp1B6 <= imagWorkingBuffer[506];
				 realIp1B6 <= realWorkingBuffer[506];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=0.0;
				 twiddleFactorimgB6 <=-0.9999996829318346;
				 stateIp1B6<=12'd506;
				 stateIp2B6<=12'd510;

				 //(507,511)
				 imgIp1B7 <= imagWorkingBuffer[507];
				 realIp1B7 <= realWorkingBuffer[507];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.7062616448200052;
				 twiddleFactorimgB7 <=-0.7079509086484322;
				 stateIp1B7<=12'd507;
				 stateIp2B7<=12'd511;
			 end
			 8'd97 : begin

				 //(0,8)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[8];
				 realIp2B0 <= realWorkingBuffer[8];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd8;

				 //(1,9)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[9];
				 realIp2B1 <= realWorkingBuffer[9];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd9;

				 //(2,10)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[10];
				 realIp2B2 <= realWorkingBuffer[10];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd10;

				 //(3,11)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[11];
				 realIp2B3 <= realWorkingBuffer[11];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd11;

				 //(4,12)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[12];
				 realIp2B4 <= realWorkingBuffer[12];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd4;
				 stateIp2B4<=12'd12;

				 //(5,13)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[13];
				 realIp2B5 <= realWorkingBuffer[13];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd5;
				 stateIp2B5<=12'd13;

				 //(6,14)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[14];
				 realIp2B6 <= realWorkingBuffer[14];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd6;
				 stateIp2B6<=12'd14;

				 //(7,15)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd7;
				 stateIp2B7<=12'd15;
			 end
			 8'd98 : begin

				 //(16,24)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[24];
				 realIp2B0 <= realWorkingBuffer[24];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd24;

				 //(17,25)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[25];
				 realIp2B1 <= realWorkingBuffer[25];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd25;

				 //(18,26)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[26];
				 realIp2B2 <= realWorkingBuffer[26];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd18;
				 stateIp2B2<=12'd26;

				 //(19,27)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[27];
				 realIp2B3 <= realWorkingBuffer[27];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd19;
				 stateIp2B3<=12'd27;

				 //(20,28)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[28];
				 realIp2B4 <= realWorkingBuffer[28];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd20;
				 stateIp2B4<=12'd28;

				 //(21,29)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[29];
				 realIp2B5 <= realWorkingBuffer[29];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd21;
				 stateIp2B5<=12'd29;

				 //(22,30)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd22;
				 stateIp2B6<=12'd30;

				 //(23,31)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd23;
				 stateIp2B7<=12'd31;
			 end
			 8'd99 : begin

				 //(32,40)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[40];
				 realIp2B0 <= realWorkingBuffer[40];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd40;

				 //(33,41)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[41];
				 realIp2B1 <= realWorkingBuffer[41];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd41;

				 //(34,42)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[42];
				 realIp2B2 <= realWorkingBuffer[42];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd34;
				 stateIp2B2<=12'd42;

				 //(35,43)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[43];
				 realIp2B3 <= realWorkingBuffer[43];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd35;
				 stateIp2B3<=12'd43;

				 //(36,44)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[44];
				 realIp2B4 <= realWorkingBuffer[44];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd36;
				 stateIp2B4<=12'd44;

				 //(37,45)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[45];
				 realIp2B5 <= realWorkingBuffer[45];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd37;
				 stateIp2B5<=12'd45;

				 //(38,46)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd38;
				 stateIp2B6<=12'd46;

				 //(39,47)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd39;
				 stateIp2B7<=12'd47;
			 end
			 8'd100 : begin

				 //(48,56)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[56];
				 realIp2B0 <= realWorkingBuffer[56];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd56;

				 //(49,57)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[57];
				 realIp2B1 <= realWorkingBuffer[57];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd49;
				 stateIp2B1<=12'd57;

				 //(50,58)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[58];
				 realIp2B2 <= realWorkingBuffer[58];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd50;
				 stateIp2B2<=12'd58;

				 //(51,59)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[59];
				 realIp2B3 <= realWorkingBuffer[59];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd51;
				 stateIp2B3<=12'd59;

				 //(52,60)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd52;
				 stateIp2B4<=12'd60;

				 //(53,61)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd53;
				 stateIp2B5<=12'd61;

				 //(54,62)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd54;
				 stateIp2B6<=12'd62;

				 //(55,63)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd55;
				 stateIp2B7<=12'd63;
			 end
			 8'd101 : begin

				 //(64,72)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[72];
				 realIp2B0 <= realWorkingBuffer[72];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd72;

				 //(65,73)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[73];
				 realIp2B1 <= realWorkingBuffer[73];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd73;

				 //(66,74)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[74];
				 realIp2B2 <= realWorkingBuffer[74];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd66;
				 stateIp2B2<=12'd74;

				 //(67,75)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[75];
				 realIp2B3 <= realWorkingBuffer[75];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd67;
				 stateIp2B3<=12'd75;

				 //(68,76)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[76];
				 realIp2B4 <= realWorkingBuffer[76];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd68;
				 stateIp2B4<=12'd76;

				 //(69,77)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[77];
				 realIp2B5 <= realWorkingBuffer[77];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd69;
				 stateIp2B5<=12'd77;

				 //(70,78)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd70;
				 stateIp2B6<=12'd78;

				 //(71,79)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd71;
				 stateIp2B7<=12'd79;
			 end
			 8'd102 : begin

				 //(80,88)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[88];
				 realIp2B0 <= realWorkingBuffer[88];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd88;

				 //(81,89)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[89];
				 realIp2B1 <= realWorkingBuffer[89];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd81;
				 stateIp2B1<=12'd89;

				 //(82,90)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[90];
				 realIp2B2 <= realWorkingBuffer[90];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd82;
				 stateIp2B2<=12'd90;

				 //(83,91)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[91];
				 realIp2B3 <= realWorkingBuffer[91];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd83;
				 stateIp2B3<=12'd91;

				 //(84,92)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd84;
				 stateIp2B4<=12'd92;

				 //(85,93)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd85;
				 stateIp2B5<=12'd93;

				 //(86,94)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd86;
				 stateIp2B6<=12'd94;

				 //(87,95)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd87;
				 stateIp2B7<=12'd95;
			 end
			 8'd103 : begin

				 //(96,104)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[104];
				 realIp2B0 <= realWorkingBuffer[104];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd104;

				 //(97,105)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[105];
				 realIp2B1 <= realWorkingBuffer[105];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd97;
				 stateIp2B1<=12'd105;

				 //(98,106)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[106];
				 realIp2B2 <= realWorkingBuffer[106];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd98;
				 stateIp2B2<=12'd106;

				 //(99,107)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[107];
				 realIp2B3 <= realWorkingBuffer[107];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd99;
				 stateIp2B3<=12'd107;

				 //(100,108)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd100;
				 stateIp2B4<=12'd108;

				 //(101,109)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd101;
				 stateIp2B5<=12'd109;

				 //(102,110)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd102;
				 stateIp2B6<=12'd110;

				 //(103,111)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd103;
				 stateIp2B7<=12'd111;
			 end
			 8'd104 : begin

				 //(112,120)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd112;
				 stateIp2B0<=12'd120;

				 //(113,121)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd113;
				 stateIp2B1<=12'd121;

				 //(114,122)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd114;
				 stateIp2B2<=12'd122;

				 //(115,123)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd115;
				 stateIp2B3<=12'd123;

				 //(116,124)
				 imgIp1B4 <= imagWorkingBuffer[116];
				 realIp1B4 <= realWorkingBuffer[116];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd116;
				 stateIp2B4<=12'd124;

				 //(117,125)
				 imgIp1B5 <= imagWorkingBuffer[117];
				 realIp1B5 <= realWorkingBuffer[117];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd117;
				 stateIp2B5<=12'd125;

				 //(118,126)
				 imgIp1B6 <= imagWorkingBuffer[118];
				 realIp1B6 <= realWorkingBuffer[118];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd118;
				 stateIp2B6<=12'd126;

				 //(119,127)
				 imgIp1B7 <= imagWorkingBuffer[119];
				 realIp1B7 <= realWorkingBuffer[119];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd119;
				 stateIp2B7<=12'd127;
			 end
			 8'd105 : begin

				 //(128,136)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[136];
				 realIp2B0 <= realWorkingBuffer[136];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd136;

				 //(129,137)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[137];
				 realIp2B1 <= realWorkingBuffer[137];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd137;

				 //(130,138)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[138];
				 realIp2B2 <= realWorkingBuffer[138];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd130;
				 stateIp2B2<=12'd138;

				 //(131,139)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[139];
				 realIp2B3 <= realWorkingBuffer[139];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd131;
				 stateIp2B3<=12'd139;

				 //(132,140)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[140];
				 realIp2B4 <= realWorkingBuffer[140];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd132;
				 stateIp2B4<=12'd140;

				 //(133,141)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[141];
				 realIp2B5 <= realWorkingBuffer[141];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd133;
				 stateIp2B5<=12'd141;

				 //(134,142)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd134;
				 stateIp2B6<=12'd142;

				 //(135,143)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd135;
				 stateIp2B7<=12'd143;
			 end
			 8'd106 : begin

				 //(144,152)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[152];
				 realIp2B0 <= realWorkingBuffer[152];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd152;

				 //(145,153)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[153];
				 realIp2B1 <= realWorkingBuffer[153];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd145;
				 stateIp2B1<=12'd153;

				 //(146,154)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[154];
				 realIp2B2 <= realWorkingBuffer[154];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd146;
				 stateIp2B2<=12'd154;

				 //(147,155)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[155];
				 realIp2B3 <= realWorkingBuffer[155];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd147;
				 stateIp2B3<=12'd155;

				 //(148,156)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd148;
				 stateIp2B4<=12'd156;

				 //(149,157)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd149;
				 stateIp2B5<=12'd157;

				 //(150,158)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd150;
				 stateIp2B6<=12'd158;

				 //(151,159)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd151;
				 stateIp2B7<=12'd159;
			 end
			 8'd107 : begin

				 //(160,168)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[168];
				 realIp2B0 <= realWorkingBuffer[168];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd168;

				 //(161,169)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[169];
				 realIp2B1 <= realWorkingBuffer[169];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd161;
				 stateIp2B1<=12'd169;

				 //(162,170)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[170];
				 realIp2B2 <= realWorkingBuffer[170];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd162;
				 stateIp2B2<=12'd170;

				 //(163,171)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[171];
				 realIp2B3 <= realWorkingBuffer[171];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd163;
				 stateIp2B3<=12'd171;

				 //(164,172)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd164;
				 stateIp2B4<=12'd172;

				 //(165,173)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd165;
				 stateIp2B5<=12'd173;

				 //(166,174)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd166;
				 stateIp2B6<=12'd174;

				 //(167,175)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd167;
				 stateIp2B7<=12'd175;
			 end
			 8'd108 : begin

				 //(176,184)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd176;
				 stateIp2B0<=12'd184;

				 //(177,185)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd177;
				 stateIp2B1<=12'd185;

				 //(178,186)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd178;
				 stateIp2B2<=12'd186;

				 //(179,187)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd179;
				 stateIp2B3<=12'd187;

				 //(180,188)
				 imgIp1B4 <= imagWorkingBuffer[180];
				 realIp1B4 <= realWorkingBuffer[180];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd180;
				 stateIp2B4<=12'd188;

				 //(181,189)
				 imgIp1B5 <= imagWorkingBuffer[181];
				 realIp1B5 <= realWorkingBuffer[181];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd181;
				 stateIp2B5<=12'd189;

				 //(182,190)
				 imgIp1B6 <= imagWorkingBuffer[182];
				 realIp1B6 <= realWorkingBuffer[182];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd182;
				 stateIp2B6<=12'd190;

				 //(183,191)
				 imgIp1B7 <= imagWorkingBuffer[183];
				 realIp1B7 <= realWorkingBuffer[183];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd183;
				 stateIp2B7<=12'd191;
			 end
			 8'd109 : begin

				 //(192,200)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[200];
				 realIp2B0 <= realWorkingBuffer[200];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd200;

				 //(193,201)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[201];
				 realIp2B1 <= realWorkingBuffer[201];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd193;
				 stateIp2B1<=12'd201;

				 //(194,202)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[202];
				 realIp2B2 <= realWorkingBuffer[202];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd194;
				 stateIp2B2<=12'd202;

				 //(195,203)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[203];
				 realIp2B3 <= realWorkingBuffer[203];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd195;
				 stateIp2B3<=12'd203;

				 //(196,204)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd196;
				 stateIp2B4<=12'd204;

				 //(197,205)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd197;
				 stateIp2B5<=12'd205;

				 //(198,206)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd198;
				 stateIp2B6<=12'd206;

				 //(199,207)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd199;
				 stateIp2B7<=12'd207;
			 end
			 8'd110 : begin

				 //(208,216)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd208;
				 stateIp2B0<=12'd216;

				 //(209,217)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd209;
				 stateIp2B1<=12'd217;

				 //(210,218)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd210;
				 stateIp2B2<=12'd218;

				 //(211,219)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd211;
				 stateIp2B3<=12'd219;

				 //(212,220)
				 imgIp1B4 <= imagWorkingBuffer[212];
				 realIp1B4 <= realWorkingBuffer[212];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd212;
				 stateIp2B4<=12'd220;

				 //(213,221)
				 imgIp1B5 <= imagWorkingBuffer[213];
				 realIp1B5 <= realWorkingBuffer[213];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd213;
				 stateIp2B5<=12'd221;

				 //(214,222)
				 imgIp1B6 <= imagWorkingBuffer[214];
				 realIp1B6 <= realWorkingBuffer[214];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd214;
				 stateIp2B6<=12'd222;

				 //(215,223)
				 imgIp1B7 <= imagWorkingBuffer[215];
				 realIp1B7 <= realWorkingBuffer[215];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd215;
				 stateIp2B7<=12'd223;
			 end
			 8'd111 : begin

				 //(224,232)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd224;
				 stateIp2B0<=12'd232;

				 //(225,233)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd225;
				 stateIp2B1<=12'd233;

				 //(226,234)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd226;
				 stateIp2B2<=12'd234;

				 //(227,235)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd227;
				 stateIp2B3<=12'd235;

				 //(228,236)
				 imgIp1B4 <= imagWorkingBuffer[228];
				 realIp1B4 <= realWorkingBuffer[228];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd228;
				 stateIp2B4<=12'd236;

				 //(229,237)
				 imgIp1B5 <= imagWorkingBuffer[229];
				 realIp1B5 <= realWorkingBuffer[229];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd229;
				 stateIp2B5<=12'd237;

				 //(230,238)
				 imgIp1B6 <= imagWorkingBuffer[230];
				 realIp1B6 <= realWorkingBuffer[230];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd230;
				 stateIp2B6<=12'd238;

				 //(231,239)
				 imgIp1B7 <= imagWorkingBuffer[231];
				 realIp1B7 <= realWorkingBuffer[231];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd231;
				 stateIp2B7<=12'd239;
			 end
			 8'd112 : begin

				 //(240,248)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd240;
				 stateIp2B0<=12'd248;

				 //(241,249)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd241;
				 stateIp2B1<=12'd249;

				 //(242,250)
				 imgIp1B2 <= imagWorkingBuffer[242];
				 realIp1B2 <= realWorkingBuffer[242];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd242;
				 stateIp2B2<=12'd250;

				 //(243,251)
				 imgIp1B3 <= imagWorkingBuffer[243];
				 realIp1B3 <= realWorkingBuffer[243];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd243;
				 stateIp2B3<=12'd251;

				 //(244,252)
				 imgIp1B4 <= imagWorkingBuffer[244];
				 realIp1B4 <= realWorkingBuffer[244];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd244;
				 stateIp2B4<=12'd252;

				 //(245,253)
				 imgIp1B5 <= imagWorkingBuffer[245];
				 realIp1B5 <= realWorkingBuffer[245];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd245;
				 stateIp2B5<=12'd253;

				 //(246,254)
				 imgIp1B6 <= imagWorkingBuffer[246];
				 realIp1B6 <= realWorkingBuffer[246];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd246;
				 stateIp2B6<=12'd254;

				 //(247,255)
				 imgIp1B7 <= imagWorkingBuffer[247];
				 realIp1B7 <= realWorkingBuffer[247];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd247;
				 stateIp2B7<=12'd255;
			 end
			 8'd113 : begin

				 //(256,264)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[264];
				 realIp2B0 <= realWorkingBuffer[264];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd264;

				 //(257,265)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[265];
				 realIp2B1 <= realWorkingBuffer[265];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd265;

				 //(258,266)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[266];
				 realIp2B2 <= realWorkingBuffer[266];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd258;
				 stateIp2B2<=12'd266;

				 //(259,267)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[267];
				 realIp2B3 <= realWorkingBuffer[267];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd259;
				 stateIp2B3<=12'd267;

				 //(260,268)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[268];
				 realIp2B4 <= realWorkingBuffer[268];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd260;
				 stateIp2B4<=12'd268;

				 //(261,269)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[269];
				 realIp2B5 <= realWorkingBuffer[269];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd261;
				 stateIp2B5<=12'd269;

				 //(262,270)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd262;
				 stateIp2B6<=12'd270;

				 //(263,271)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd263;
				 stateIp2B7<=12'd271;
			 end
			 8'd114 : begin

				 //(272,280)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[280];
				 realIp2B0 <= realWorkingBuffer[280];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd280;

				 //(273,281)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[281];
				 realIp2B1 <= realWorkingBuffer[281];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd273;
				 stateIp2B1<=12'd281;

				 //(274,282)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[282];
				 realIp2B2 <= realWorkingBuffer[282];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd274;
				 stateIp2B2<=12'd282;

				 //(275,283)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[283];
				 realIp2B3 <= realWorkingBuffer[283];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd275;
				 stateIp2B3<=12'd283;

				 //(276,284)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd276;
				 stateIp2B4<=12'd284;

				 //(277,285)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd277;
				 stateIp2B5<=12'd285;

				 //(278,286)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd278;
				 stateIp2B6<=12'd286;

				 //(279,287)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd279;
				 stateIp2B7<=12'd287;
			 end
			 8'd115 : begin

				 //(288,296)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[296];
				 realIp2B0 <= realWorkingBuffer[296];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd296;

				 //(289,297)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[297];
				 realIp2B1 <= realWorkingBuffer[297];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd289;
				 stateIp2B1<=12'd297;

				 //(290,298)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[298];
				 realIp2B2 <= realWorkingBuffer[298];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd290;
				 stateIp2B2<=12'd298;

				 //(291,299)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[299];
				 realIp2B3 <= realWorkingBuffer[299];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd291;
				 stateIp2B3<=12'd299;

				 //(292,300)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd292;
				 stateIp2B4<=12'd300;

				 //(293,301)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd293;
				 stateIp2B5<=12'd301;

				 //(294,302)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd294;
				 stateIp2B6<=12'd302;

				 //(295,303)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd295;
				 stateIp2B7<=12'd303;
			 end
			 8'd116 : begin

				 //(304,312)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd304;
				 stateIp2B0<=12'd312;

				 //(305,313)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd305;
				 stateIp2B1<=12'd313;

				 //(306,314)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd306;
				 stateIp2B2<=12'd314;

				 //(307,315)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd307;
				 stateIp2B3<=12'd315;

				 //(308,316)
				 imgIp1B4 <= imagWorkingBuffer[308];
				 realIp1B4 <= realWorkingBuffer[308];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd308;
				 stateIp2B4<=12'd316;

				 //(309,317)
				 imgIp1B5 <= imagWorkingBuffer[309];
				 realIp1B5 <= realWorkingBuffer[309];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd309;
				 stateIp2B5<=12'd317;

				 //(310,318)
				 imgIp1B6 <= imagWorkingBuffer[310];
				 realIp1B6 <= realWorkingBuffer[310];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd310;
				 stateIp2B6<=12'd318;

				 //(311,319)
				 imgIp1B7 <= imagWorkingBuffer[311];
				 realIp1B7 <= realWorkingBuffer[311];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd311;
				 stateIp2B7<=12'd319;
			 end
			 8'd117 : begin

				 //(320,328)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[328];
				 realIp2B0 <= realWorkingBuffer[328];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd328;

				 //(321,329)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[329];
				 realIp2B1 <= realWorkingBuffer[329];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd321;
				 stateIp2B1<=12'd329;

				 //(322,330)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[330];
				 realIp2B2 <= realWorkingBuffer[330];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd322;
				 stateIp2B2<=12'd330;

				 //(323,331)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[331];
				 realIp2B3 <= realWorkingBuffer[331];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd323;
				 stateIp2B3<=12'd331;

				 //(324,332)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd324;
				 stateIp2B4<=12'd332;

				 //(325,333)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd325;
				 stateIp2B5<=12'd333;

				 //(326,334)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd326;
				 stateIp2B6<=12'd334;

				 //(327,335)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd327;
				 stateIp2B7<=12'd335;
			 end
			 8'd118 : begin

				 //(336,344)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd336;
				 stateIp2B0<=12'd344;

				 //(337,345)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd337;
				 stateIp2B1<=12'd345;

				 //(338,346)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd338;
				 stateIp2B2<=12'd346;

				 //(339,347)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd339;
				 stateIp2B3<=12'd347;

				 //(340,348)
				 imgIp1B4 <= imagWorkingBuffer[340];
				 realIp1B4 <= realWorkingBuffer[340];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd340;
				 stateIp2B4<=12'd348;

				 //(341,349)
				 imgIp1B5 <= imagWorkingBuffer[341];
				 realIp1B5 <= realWorkingBuffer[341];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd341;
				 stateIp2B5<=12'd349;

				 //(342,350)
				 imgIp1B6 <= imagWorkingBuffer[342];
				 realIp1B6 <= realWorkingBuffer[342];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd342;
				 stateIp2B6<=12'd350;

				 //(343,351)
				 imgIp1B7 <= imagWorkingBuffer[343];
				 realIp1B7 <= realWorkingBuffer[343];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd343;
				 stateIp2B7<=12'd351;
			 end
			 8'd119 : begin

				 //(352,360)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd352;
				 stateIp2B0<=12'd360;

				 //(353,361)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd353;
				 stateIp2B1<=12'd361;

				 //(354,362)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd354;
				 stateIp2B2<=12'd362;

				 //(355,363)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd355;
				 stateIp2B3<=12'd363;

				 //(356,364)
				 imgIp1B4 <= imagWorkingBuffer[356];
				 realIp1B4 <= realWorkingBuffer[356];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd356;
				 stateIp2B4<=12'd364;

				 //(357,365)
				 imgIp1B5 <= imagWorkingBuffer[357];
				 realIp1B5 <= realWorkingBuffer[357];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd357;
				 stateIp2B5<=12'd365;

				 //(358,366)
				 imgIp1B6 <= imagWorkingBuffer[358];
				 realIp1B6 <= realWorkingBuffer[358];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd358;
				 stateIp2B6<=12'd366;

				 //(359,367)
				 imgIp1B7 <= imagWorkingBuffer[359];
				 realIp1B7 <= realWorkingBuffer[359];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd359;
				 stateIp2B7<=12'd367;
			 end
			 8'd120 : begin

				 //(368,376)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd368;
				 stateIp2B0<=12'd376;

				 //(369,377)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd369;
				 stateIp2B1<=12'd377;

				 //(370,378)
				 imgIp1B2 <= imagWorkingBuffer[370];
				 realIp1B2 <= realWorkingBuffer[370];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd370;
				 stateIp2B2<=12'd378;

				 //(371,379)
				 imgIp1B3 <= imagWorkingBuffer[371];
				 realIp1B3 <= realWorkingBuffer[371];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd371;
				 stateIp2B3<=12'd379;

				 //(372,380)
				 imgIp1B4 <= imagWorkingBuffer[372];
				 realIp1B4 <= realWorkingBuffer[372];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd372;
				 stateIp2B4<=12'd380;

				 //(373,381)
				 imgIp1B5 <= imagWorkingBuffer[373];
				 realIp1B5 <= realWorkingBuffer[373];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd373;
				 stateIp2B5<=12'd381;

				 //(374,382)
				 imgIp1B6 <= imagWorkingBuffer[374];
				 realIp1B6 <= realWorkingBuffer[374];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd374;
				 stateIp2B6<=12'd382;

				 //(375,383)
				 imgIp1B7 <= imagWorkingBuffer[375];
				 realIp1B7 <= realWorkingBuffer[375];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd375;
				 stateIp2B7<=12'd383;
			 end
			 8'd121 : begin

				 //(384,392)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[392];
				 realIp2B0 <= realWorkingBuffer[392];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd392;

				 //(385,393)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[393];
				 realIp2B1 <= realWorkingBuffer[393];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd385;
				 stateIp2B1<=12'd393;

				 //(386,394)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[394];
				 realIp2B2 <= realWorkingBuffer[394];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd386;
				 stateIp2B2<=12'd394;

				 //(387,395)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[395];
				 realIp2B3 <= realWorkingBuffer[395];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd387;
				 stateIp2B3<=12'd395;

				 //(388,396)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd388;
				 stateIp2B4<=12'd396;

				 //(389,397)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd389;
				 stateIp2B5<=12'd397;

				 //(390,398)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd390;
				 stateIp2B6<=12'd398;

				 //(391,399)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd391;
				 stateIp2B7<=12'd399;
			 end
			 8'd122 : begin

				 //(400,408)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd400;
				 stateIp2B0<=12'd408;

				 //(401,409)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd401;
				 stateIp2B1<=12'd409;

				 //(402,410)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd402;
				 stateIp2B2<=12'd410;

				 //(403,411)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd403;
				 stateIp2B3<=12'd411;

				 //(404,412)
				 imgIp1B4 <= imagWorkingBuffer[404];
				 realIp1B4 <= realWorkingBuffer[404];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd404;
				 stateIp2B4<=12'd412;

				 //(405,413)
				 imgIp1B5 <= imagWorkingBuffer[405];
				 realIp1B5 <= realWorkingBuffer[405];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd405;
				 stateIp2B5<=12'd413;

				 //(406,414)
				 imgIp1B6 <= imagWorkingBuffer[406];
				 realIp1B6 <= realWorkingBuffer[406];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd406;
				 stateIp2B6<=12'd414;

				 //(407,415)
				 imgIp1B7 <= imagWorkingBuffer[407];
				 realIp1B7 <= realWorkingBuffer[407];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd407;
				 stateIp2B7<=12'd415;
			 end
			 8'd123 : begin

				 //(416,424)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd416;
				 stateIp2B0<=12'd424;

				 //(417,425)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd417;
				 stateIp2B1<=12'd425;

				 //(418,426)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd418;
				 stateIp2B2<=12'd426;

				 //(419,427)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd419;
				 stateIp2B3<=12'd427;

				 //(420,428)
				 imgIp1B4 <= imagWorkingBuffer[420];
				 realIp1B4 <= realWorkingBuffer[420];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd420;
				 stateIp2B4<=12'd428;

				 //(421,429)
				 imgIp1B5 <= imagWorkingBuffer[421];
				 realIp1B5 <= realWorkingBuffer[421];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd421;
				 stateIp2B5<=12'd429;

				 //(422,430)
				 imgIp1B6 <= imagWorkingBuffer[422];
				 realIp1B6 <= realWorkingBuffer[422];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd422;
				 stateIp2B6<=12'd430;

				 //(423,431)
				 imgIp1B7 <= imagWorkingBuffer[423];
				 realIp1B7 <= realWorkingBuffer[423];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd423;
				 stateIp2B7<=12'd431;
			 end
			 8'd124 : begin

				 //(432,440)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd432;
				 stateIp2B0<=12'd440;

				 //(433,441)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd433;
				 stateIp2B1<=12'd441;

				 //(434,442)
				 imgIp1B2 <= imagWorkingBuffer[434];
				 realIp1B2 <= realWorkingBuffer[434];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd434;
				 stateIp2B2<=12'd442;

				 //(435,443)
				 imgIp1B3 <= imagWorkingBuffer[435];
				 realIp1B3 <= realWorkingBuffer[435];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd435;
				 stateIp2B3<=12'd443;

				 //(436,444)
				 imgIp1B4 <= imagWorkingBuffer[436];
				 realIp1B4 <= realWorkingBuffer[436];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd436;
				 stateIp2B4<=12'd444;

				 //(437,445)
				 imgIp1B5 <= imagWorkingBuffer[437];
				 realIp1B5 <= realWorkingBuffer[437];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd437;
				 stateIp2B5<=12'd445;

				 //(438,446)
				 imgIp1B6 <= imagWorkingBuffer[438];
				 realIp1B6 <= realWorkingBuffer[438];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd438;
				 stateIp2B6<=12'd446;

				 //(439,447)
				 imgIp1B7 <= imagWorkingBuffer[439];
				 realIp1B7 <= realWorkingBuffer[439];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd439;
				 stateIp2B7<=12'd447;
			 end
			 8'd125 : begin

				 //(448,456)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd448;
				 stateIp2B0<=12'd456;

				 //(449,457)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd449;
				 stateIp2B1<=12'd457;

				 //(450,458)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd450;
				 stateIp2B2<=12'd458;

				 //(451,459)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd451;
				 stateIp2B3<=12'd459;

				 //(452,460)
				 imgIp1B4 <= imagWorkingBuffer[452];
				 realIp1B4 <= realWorkingBuffer[452];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd452;
				 stateIp2B4<=12'd460;

				 //(453,461)
				 imgIp1B5 <= imagWorkingBuffer[453];
				 realIp1B5 <= realWorkingBuffer[453];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd453;
				 stateIp2B5<=12'd461;

				 //(454,462)
				 imgIp1B6 <= imagWorkingBuffer[454];
				 realIp1B6 <= realWorkingBuffer[454];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd454;
				 stateIp2B6<=12'd462;

				 //(455,463)
				 imgIp1B7 <= imagWorkingBuffer[455];
				 realIp1B7 <= realWorkingBuffer[455];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd455;
				 stateIp2B7<=12'd463;
			 end
			 8'd126 : begin

				 //(464,472)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd464;
				 stateIp2B0<=12'd472;

				 //(465,473)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd465;
				 stateIp2B1<=12'd473;

				 //(466,474)
				 imgIp1B2 <= imagWorkingBuffer[466];
				 realIp1B2 <= realWorkingBuffer[466];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd466;
				 stateIp2B2<=12'd474;

				 //(467,475)
				 imgIp1B3 <= imagWorkingBuffer[467];
				 realIp1B3 <= realWorkingBuffer[467];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd467;
				 stateIp2B3<=12'd475;

				 //(468,476)
				 imgIp1B4 <= imagWorkingBuffer[468];
				 realIp1B4 <= realWorkingBuffer[468];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd468;
				 stateIp2B4<=12'd476;

				 //(469,477)
				 imgIp1B5 <= imagWorkingBuffer[469];
				 realIp1B5 <= realWorkingBuffer[469];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd469;
				 stateIp2B5<=12'd477;

				 //(470,478)
				 imgIp1B6 <= imagWorkingBuffer[470];
				 realIp1B6 <= realWorkingBuffer[470];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd470;
				 stateIp2B6<=12'd478;

				 //(471,479)
				 imgIp1B7 <= imagWorkingBuffer[471];
				 realIp1B7 <= realWorkingBuffer[471];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd471;
				 stateIp2B7<=12'd479;
			 end
			 8'd127 : begin

				 //(480,488)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd480;
				 stateIp2B0<=12'd488;

				 //(481,489)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd481;
				 stateIp2B1<=12'd489;

				 //(482,490)
				 imgIp1B2 <= imagWorkingBuffer[482];
				 realIp1B2 <= realWorkingBuffer[482];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd482;
				 stateIp2B2<=12'd490;

				 //(483,491)
				 imgIp1B3 <= imagWorkingBuffer[483];
				 realIp1B3 <= realWorkingBuffer[483];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd483;
				 stateIp2B3<=12'd491;

				 //(484,492)
				 imgIp1B4 <= imagWorkingBuffer[484];
				 realIp1B4 <= realWorkingBuffer[484];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd484;
				 stateIp2B4<=12'd492;

				 //(485,493)
				 imgIp1B5 <= imagWorkingBuffer[485];
				 realIp1B5 <= realWorkingBuffer[485];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd485;
				 stateIp2B5<=12'd493;

				 //(486,494)
				 imgIp1B6 <= imagWorkingBuffer[486];
				 realIp1B6 <= realWorkingBuffer[486];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd486;
				 stateIp2B6<=12'd494;

				 //(487,495)
				 imgIp1B7 <= imagWorkingBuffer[487];
				 realIp1B7 <= realWorkingBuffer[487];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd487;
				 stateIp2B7<=12'd495;
			 end
			 8'd128 : begin

				 //(496,504)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd496;
				 stateIp2B0<=12'd504;

				 //(497,505)
				 imgIp1B1 <= imagWorkingBuffer[497];
				 realIp1B1 <= realWorkingBuffer[497];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=0.9239556994702721;
				 twiddleFactorimgB1 <=-0.3824994972760097;
				 stateIp1B1<=12'd497;
				 stateIp2B1<=12'd505;

				 //(498,506)
				 imgIp1B2 <= imagWorkingBuffer[498];
				 realIp1B2 <= realWorkingBuffer[498];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=0.7073882691671998;
				 twiddleFactorimgB2 <=-0.706825181105366;
				 stateIp1B2<=12'd498;
				 stateIp2B2<=12'd506;

				 //(499,507)
				 imgIp1B3 <= imagWorkingBuffer[499];
				 realIp1B3 <= realWorkingBuffer[499];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=0.38323514660061825;
				 twiddleFactorimgB3 <=-0.9236508119468106;
				 stateIp1B3<=12'd499;
				 stateIp2B3<=12'd507;

				 //(500,508)
				 imgIp1B4 <= imagWorkingBuffer[500];
				 realIp1B4 <= realWorkingBuffer[500];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=0.0;
				 twiddleFactorimgB4 <=-0.9999996829318346;
				 stateIp1B4<=12'd500;
				 stateIp2B4<=12'd508;

				 //(501,509)
				 imgIp1B5 <= imagWorkingBuffer[501];
				 realIp1B5 <= realWorkingBuffer[501];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=-0.38176360539457344;
				 twiddleFactorimgB5 <=-0.9242600010798565;
				 stateIp1B5<=12'd501;
				 stateIp2B5<=12'd509;

				 //(502,510)
				 imgIp1B6 <= imagWorkingBuffer[502];
				 realIp1B6 <= realWorkingBuffer[502];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=-0.7062616448200052;
				 twiddleFactorimgB6 <=-0.7079509086484322;
				 stateIp1B6<=12'd502;
				 stateIp2B6<=12'd510;

				 //(503,511)
				 imgIp1B7 <= imagWorkingBuffer[503];
				 realIp1B7 <= realWorkingBuffer[503];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.9233453387028124;
				 twiddleFactorimgB7 <=-0.38397055290189713;
				 stateIp1B7<=12'd503;
				 stateIp2B7<=12'd511;
			 end
			 8'd129 : begin

				 //(0,16)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[16];
				 realIp2B0 <= realWorkingBuffer[16];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd16;

				 //(1,17)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[17];
				 realIp2B1 <= realWorkingBuffer[17];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd17;

				 //(2,18)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[18];
				 realIp2B2 <= realWorkingBuffer[18];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd18;

				 //(3,19)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[19];
				 realIp2B3 <= realWorkingBuffer[19];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd19;

				 //(4,20)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[20];
				 realIp2B4 <= realWorkingBuffer[20];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd4;
				 stateIp2B4<=12'd20;

				 //(5,21)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[21];
				 realIp2B5 <= realWorkingBuffer[21];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd5;
				 stateIp2B5<=12'd21;

				 //(6,22)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[22];
				 realIp2B6 <= realWorkingBuffer[22];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd6;
				 stateIp2B6<=12'd22;

				 //(7,23)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[23];
				 realIp2B7 <= realWorkingBuffer[23];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd7;
				 stateIp2B7<=12'd23;
			 end
			 8'd130 : begin

				 //(8,24)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[24];
				 realIp2B0 <= realWorkingBuffer[24];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd8;
				 stateIp2B0<=12'd24;

				 //(9,25)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[25];
				 realIp2B1 <= realWorkingBuffer[25];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd9;
				 stateIp2B1<=12'd25;

				 //(10,26)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[26];
				 realIp2B2 <= realWorkingBuffer[26];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd10;
				 stateIp2B2<=12'd26;

				 //(11,27)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[27];
				 realIp2B3 <= realWorkingBuffer[27];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd11;
				 stateIp2B3<=12'd27;

				 //(12,28)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[28];
				 realIp2B4 <= realWorkingBuffer[28];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd12;
				 stateIp2B4<=12'd28;

				 //(13,29)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[29];
				 realIp2B5 <= realWorkingBuffer[29];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd13;
				 stateIp2B5<=12'd29;

				 //(14,30)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd14;
				 stateIp2B6<=12'd30;

				 //(15,31)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd15;
				 stateIp2B7<=12'd31;
			 end
			 8'd131 : begin

				 //(32,48)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[48];
				 realIp2B0 <= realWorkingBuffer[48];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd48;

				 //(33,49)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[49];
				 realIp2B1 <= realWorkingBuffer[49];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd49;

				 //(34,50)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[50];
				 realIp2B2 <= realWorkingBuffer[50];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd34;
				 stateIp2B2<=12'd50;

				 //(35,51)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[51];
				 realIp2B3 <= realWorkingBuffer[51];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd35;
				 stateIp2B3<=12'd51;

				 //(36,52)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[52];
				 realIp2B4 <= realWorkingBuffer[52];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd36;
				 stateIp2B4<=12'd52;

				 //(37,53)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[53];
				 realIp2B5 <= realWorkingBuffer[53];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd37;
				 stateIp2B5<=12'd53;

				 //(38,54)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[54];
				 realIp2B6 <= realWorkingBuffer[54];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd38;
				 stateIp2B6<=12'd54;

				 //(39,55)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[55];
				 realIp2B7 <= realWorkingBuffer[55];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd39;
				 stateIp2B7<=12'd55;
			 end
			 8'd132 : begin

				 //(40,56)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[56];
				 realIp2B0 <= realWorkingBuffer[56];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd40;
				 stateIp2B0<=12'd56;

				 //(41,57)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[57];
				 realIp2B1 <= realWorkingBuffer[57];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd41;
				 stateIp2B1<=12'd57;

				 //(42,58)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[58];
				 realIp2B2 <= realWorkingBuffer[58];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd42;
				 stateIp2B2<=12'd58;

				 //(43,59)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[59];
				 realIp2B3 <= realWorkingBuffer[59];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd43;
				 stateIp2B3<=12'd59;

				 //(44,60)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd44;
				 stateIp2B4<=12'd60;

				 //(45,61)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd45;
				 stateIp2B5<=12'd61;

				 //(46,62)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd46;
				 stateIp2B6<=12'd62;

				 //(47,63)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd47;
				 stateIp2B7<=12'd63;
			 end
			 8'd133 : begin

				 //(64,80)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[80];
				 realIp2B0 <= realWorkingBuffer[80];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd80;

				 //(65,81)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[81];
				 realIp2B1 <= realWorkingBuffer[81];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd81;

				 //(66,82)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[82];
				 realIp2B2 <= realWorkingBuffer[82];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd66;
				 stateIp2B2<=12'd82;

				 //(67,83)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[83];
				 realIp2B3 <= realWorkingBuffer[83];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd67;
				 stateIp2B3<=12'd83;

				 //(68,84)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[84];
				 realIp2B4 <= realWorkingBuffer[84];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd68;
				 stateIp2B4<=12'd84;

				 //(69,85)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[85];
				 realIp2B5 <= realWorkingBuffer[85];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd69;
				 stateIp2B5<=12'd85;

				 //(70,86)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[86];
				 realIp2B6 <= realWorkingBuffer[86];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd70;
				 stateIp2B6<=12'd86;

				 //(71,87)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[87];
				 realIp2B7 <= realWorkingBuffer[87];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd71;
				 stateIp2B7<=12'd87;
			 end
			 8'd134 : begin

				 //(72,88)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[88];
				 realIp2B0 <= realWorkingBuffer[88];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd72;
				 stateIp2B0<=12'd88;

				 //(73,89)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[89];
				 realIp2B1 <= realWorkingBuffer[89];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd73;
				 stateIp2B1<=12'd89;

				 //(74,90)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[90];
				 realIp2B2 <= realWorkingBuffer[90];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd74;
				 stateIp2B2<=12'd90;

				 //(75,91)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[91];
				 realIp2B3 <= realWorkingBuffer[91];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd75;
				 stateIp2B3<=12'd91;

				 //(76,92)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd76;
				 stateIp2B4<=12'd92;

				 //(77,93)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd77;
				 stateIp2B5<=12'd93;

				 //(78,94)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd78;
				 stateIp2B6<=12'd94;

				 //(79,95)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd79;
				 stateIp2B7<=12'd95;
			 end
			 8'd135 : begin

				 //(96,112)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[112];
				 realIp2B0 <= realWorkingBuffer[112];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd112;

				 //(97,113)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[113];
				 realIp2B1 <= realWorkingBuffer[113];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd97;
				 stateIp2B1<=12'd113;

				 //(98,114)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[114];
				 realIp2B2 <= realWorkingBuffer[114];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd98;
				 stateIp2B2<=12'd114;

				 //(99,115)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[115];
				 realIp2B3 <= realWorkingBuffer[115];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd99;
				 stateIp2B3<=12'd115;

				 //(100,116)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[116];
				 realIp2B4 <= realWorkingBuffer[116];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd100;
				 stateIp2B4<=12'd116;

				 //(101,117)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[117];
				 realIp2B5 <= realWorkingBuffer[117];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd101;
				 stateIp2B5<=12'd117;

				 //(102,118)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[118];
				 realIp2B6 <= realWorkingBuffer[118];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd102;
				 stateIp2B6<=12'd118;

				 //(103,119)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[119];
				 realIp2B7 <= realWorkingBuffer[119];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd103;
				 stateIp2B7<=12'd119;
			 end
			 8'd136 : begin

				 //(104,120)
				 imgIp1B0 <= imagWorkingBuffer[104];
				 realIp1B0 <= realWorkingBuffer[104];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd104;
				 stateIp2B0<=12'd120;

				 //(105,121)
				 imgIp1B1 <= imagWorkingBuffer[105];
				 realIp1B1 <= realWorkingBuffer[105];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd105;
				 stateIp2B1<=12'd121;

				 //(106,122)
				 imgIp1B2 <= imagWorkingBuffer[106];
				 realIp1B2 <= realWorkingBuffer[106];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd106;
				 stateIp2B2<=12'd122;

				 //(107,123)
				 imgIp1B3 <= imagWorkingBuffer[107];
				 realIp1B3 <= realWorkingBuffer[107];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd107;
				 stateIp2B3<=12'd123;

				 //(108,124)
				 imgIp1B4 <= imagWorkingBuffer[108];
				 realIp1B4 <= realWorkingBuffer[108];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd108;
				 stateIp2B4<=12'd124;

				 //(109,125)
				 imgIp1B5 <= imagWorkingBuffer[109];
				 realIp1B5 <= realWorkingBuffer[109];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd109;
				 stateIp2B5<=12'd125;

				 //(110,126)
				 imgIp1B6 <= imagWorkingBuffer[110];
				 realIp1B6 <= realWorkingBuffer[110];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd110;
				 stateIp2B6<=12'd126;

				 //(111,127)
				 imgIp1B7 <= imagWorkingBuffer[111];
				 realIp1B7 <= realWorkingBuffer[111];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd111;
				 stateIp2B7<=12'd127;
			 end
			 8'd137 : begin

				 //(128,144)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[144];
				 realIp2B0 <= realWorkingBuffer[144];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd144;

				 //(129,145)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[145];
				 realIp2B1 <= realWorkingBuffer[145];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd145;

				 //(130,146)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[146];
				 realIp2B2 <= realWorkingBuffer[146];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd130;
				 stateIp2B2<=12'd146;

				 //(131,147)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[147];
				 realIp2B3 <= realWorkingBuffer[147];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd131;
				 stateIp2B3<=12'd147;

				 //(132,148)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[148];
				 realIp2B4 <= realWorkingBuffer[148];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd132;
				 stateIp2B4<=12'd148;

				 //(133,149)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[149];
				 realIp2B5 <= realWorkingBuffer[149];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd133;
				 stateIp2B5<=12'd149;

				 //(134,150)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[150];
				 realIp2B6 <= realWorkingBuffer[150];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd134;
				 stateIp2B6<=12'd150;

				 //(135,151)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[151];
				 realIp2B7 <= realWorkingBuffer[151];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd135;
				 stateIp2B7<=12'd151;
			 end
			 8'd138 : begin

				 //(136,152)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[152];
				 realIp2B0 <= realWorkingBuffer[152];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd136;
				 stateIp2B0<=12'd152;

				 //(137,153)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[153];
				 realIp2B1 <= realWorkingBuffer[153];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd137;
				 stateIp2B1<=12'd153;

				 //(138,154)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[154];
				 realIp2B2 <= realWorkingBuffer[154];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd138;
				 stateIp2B2<=12'd154;

				 //(139,155)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[155];
				 realIp2B3 <= realWorkingBuffer[155];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd139;
				 stateIp2B3<=12'd155;

				 //(140,156)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd140;
				 stateIp2B4<=12'd156;

				 //(141,157)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd141;
				 stateIp2B5<=12'd157;

				 //(142,158)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd142;
				 stateIp2B6<=12'd158;

				 //(143,159)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd143;
				 stateIp2B7<=12'd159;
			 end
			 8'd139 : begin

				 //(160,176)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[176];
				 realIp2B0 <= realWorkingBuffer[176];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd176;

				 //(161,177)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[177];
				 realIp2B1 <= realWorkingBuffer[177];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd161;
				 stateIp2B1<=12'd177;

				 //(162,178)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[178];
				 realIp2B2 <= realWorkingBuffer[178];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd162;
				 stateIp2B2<=12'd178;

				 //(163,179)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[179];
				 realIp2B3 <= realWorkingBuffer[179];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd163;
				 stateIp2B3<=12'd179;

				 //(164,180)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[180];
				 realIp2B4 <= realWorkingBuffer[180];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd164;
				 stateIp2B4<=12'd180;

				 //(165,181)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[181];
				 realIp2B5 <= realWorkingBuffer[181];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd165;
				 stateIp2B5<=12'd181;

				 //(166,182)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[182];
				 realIp2B6 <= realWorkingBuffer[182];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd166;
				 stateIp2B6<=12'd182;

				 //(167,183)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[183];
				 realIp2B7 <= realWorkingBuffer[183];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd167;
				 stateIp2B7<=12'd183;
			 end
			 8'd140 : begin

				 //(168,184)
				 imgIp1B0 <= imagWorkingBuffer[168];
				 realIp1B0 <= realWorkingBuffer[168];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd168;
				 stateIp2B0<=12'd184;

				 //(169,185)
				 imgIp1B1 <= imagWorkingBuffer[169];
				 realIp1B1 <= realWorkingBuffer[169];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd169;
				 stateIp2B1<=12'd185;

				 //(170,186)
				 imgIp1B2 <= imagWorkingBuffer[170];
				 realIp1B2 <= realWorkingBuffer[170];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd170;
				 stateIp2B2<=12'd186;

				 //(171,187)
				 imgIp1B3 <= imagWorkingBuffer[171];
				 realIp1B3 <= realWorkingBuffer[171];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd171;
				 stateIp2B3<=12'd187;

				 //(172,188)
				 imgIp1B4 <= imagWorkingBuffer[172];
				 realIp1B4 <= realWorkingBuffer[172];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd172;
				 stateIp2B4<=12'd188;

				 //(173,189)
				 imgIp1B5 <= imagWorkingBuffer[173];
				 realIp1B5 <= realWorkingBuffer[173];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd173;
				 stateIp2B5<=12'd189;

				 //(174,190)
				 imgIp1B6 <= imagWorkingBuffer[174];
				 realIp1B6 <= realWorkingBuffer[174];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd174;
				 stateIp2B6<=12'd190;

				 //(175,191)
				 imgIp1B7 <= imagWorkingBuffer[175];
				 realIp1B7 <= realWorkingBuffer[175];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd175;
				 stateIp2B7<=12'd191;
			 end
			 8'd141 : begin

				 //(192,208)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[208];
				 realIp2B0 <= realWorkingBuffer[208];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd208;

				 //(193,209)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[209];
				 realIp2B1 <= realWorkingBuffer[209];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd193;
				 stateIp2B1<=12'd209;

				 //(194,210)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[210];
				 realIp2B2 <= realWorkingBuffer[210];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd194;
				 stateIp2B2<=12'd210;

				 //(195,211)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[211];
				 realIp2B3 <= realWorkingBuffer[211];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd195;
				 stateIp2B3<=12'd211;

				 //(196,212)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[212];
				 realIp2B4 <= realWorkingBuffer[212];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd196;
				 stateIp2B4<=12'd212;

				 //(197,213)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[213];
				 realIp2B5 <= realWorkingBuffer[213];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd197;
				 stateIp2B5<=12'd213;

				 //(198,214)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[214];
				 realIp2B6 <= realWorkingBuffer[214];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd198;
				 stateIp2B6<=12'd214;

				 //(199,215)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[215];
				 realIp2B7 <= realWorkingBuffer[215];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd199;
				 stateIp2B7<=12'd215;
			 end
			 8'd142 : begin

				 //(200,216)
				 imgIp1B0 <= imagWorkingBuffer[200];
				 realIp1B0 <= realWorkingBuffer[200];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd200;
				 stateIp2B0<=12'd216;

				 //(201,217)
				 imgIp1B1 <= imagWorkingBuffer[201];
				 realIp1B1 <= realWorkingBuffer[201];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd201;
				 stateIp2B1<=12'd217;

				 //(202,218)
				 imgIp1B2 <= imagWorkingBuffer[202];
				 realIp1B2 <= realWorkingBuffer[202];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd202;
				 stateIp2B2<=12'd218;

				 //(203,219)
				 imgIp1B3 <= imagWorkingBuffer[203];
				 realIp1B3 <= realWorkingBuffer[203];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd203;
				 stateIp2B3<=12'd219;

				 //(204,220)
				 imgIp1B4 <= imagWorkingBuffer[204];
				 realIp1B4 <= realWorkingBuffer[204];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd204;
				 stateIp2B4<=12'd220;

				 //(205,221)
				 imgIp1B5 <= imagWorkingBuffer[205];
				 realIp1B5 <= realWorkingBuffer[205];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd205;
				 stateIp2B5<=12'd221;

				 //(206,222)
				 imgIp1B6 <= imagWorkingBuffer[206];
				 realIp1B6 <= realWorkingBuffer[206];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd206;
				 stateIp2B6<=12'd222;

				 //(207,223)
				 imgIp1B7 <= imagWorkingBuffer[207];
				 realIp1B7 <= realWorkingBuffer[207];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd207;
				 stateIp2B7<=12'd223;
			 end
			 8'd143 : begin

				 //(224,240)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd224;
				 stateIp2B0<=12'd240;

				 //(225,241)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd225;
				 stateIp2B1<=12'd241;

				 //(226,242)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd226;
				 stateIp2B2<=12'd242;

				 //(227,243)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd227;
				 stateIp2B3<=12'd243;

				 //(228,244)
				 imgIp1B4 <= imagWorkingBuffer[228];
				 realIp1B4 <= realWorkingBuffer[228];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd228;
				 stateIp2B4<=12'd244;

				 //(229,245)
				 imgIp1B5 <= imagWorkingBuffer[229];
				 realIp1B5 <= realWorkingBuffer[229];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd229;
				 stateIp2B5<=12'd245;

				 //(230,246)
				 imgIp1B6 <= imagWorkingBuffer[230];
				 realIp1B6 <= realWorkingBuffer[230];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd230;
				 stateIp2B6<=12'd246;

				 //(231,247)
				 imgIp1B7 <= imagWorkingBuffer[231];
				 realIp1B7 <= realWorkingBuffer[231];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd231;
				 stateIp2B7<=12'd247;
			 end
			 8'd144 : begin

				 //(232,248)
				 imgIp1B0 <= imagWorkingBuffer[232];
				 realIp1B0 <= realWorkingBuffer[232];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd232;
				 stateIp2B0<=12'd248;

				 //(233,249)
				 imgIp1B1 <= imagWorkingBuffer[233];
				 realIp1B1 <= realWorkingBuffer[233];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd233;
				 stateIp2B1<=12'd249;

				 //(234,250)
				 imgIp1B2 <= imagWorkingBuffer[234];
				 realIp1B2 <= realWorkingBuffer[234];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd234;
				 stateIp2B2<=12'd250;

				 //(235,251)
				 imgIp1B3 <= imagWorkingBuffer[235];
				 realIp1B3 <= realWorkingBuffer[235];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd235;
				 stateIp2B3<=12'd251;

				 //(236,252)
				 imgIp1B4 <= imagWorkingBuffer[236];
				 realIp1B4 <= realWorkingBuffer[236];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd236;
				 stateIp2B4<=12'd252;

				 //(237,253)
				 imgIp1B5 <= imagWorkingBuffer[237];
				 realIp1B5 <= realWorkingBuffer[237];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd237;
				 stateIp2B5<=12'd253;

				 //(238,254)
				 imgIp1B6 <= imagWorkingBuffer[238];
				 realIp1B6 <= realWorkingBuffer[238];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd238;
				 stateIp2B6<=12'd254;

				 //(239,255)
				 imgIp1B7 <= imagWorkingBuffer[239];
				 realIp1B7 <= realWorkingBuffer[239];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd239;
				 stateIp2B7<=12'd255;
			 end
			 8'd145 : begin

				 //(256,272)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[272];
				 realIp2B0 <= realWorkingBuffer[272];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd272;

				 //(257,273)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[273];
				 realIp2B1 <= realWorkingBuffer[273];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd273;

				 //(258,274)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[274];
				 realIp2B2 <= realWorkingBuffer[274];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd258;
				 stateIp2B2<=12'd274;

				 //(259,275)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[275];
				 realIp2B3 <= realWorkingBuffer[275];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd259;
				 stateIp2B3<=12'd275;

				 //(260,276)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[276];
				 realIp2B4 <= realWorkingBuffer[276];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd260;
				 stateIp2B4<=12'd276;

				 //(261,277)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[277];
				 realIp2B5 <= realWorkingBuffer[277];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd261;
				 stateIp2B5<=12'd277;

				 //(262,278)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[278];
				 realIp2B6 <= realWorkingBuffer[278];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd262;
				 stateIp2B6<=12'd278;

				 //(263,279)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[279];
				 realIp2B7 <= realWorkingBuffer[279];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd263;
				 stateIp2B7<=12'd279;
			 end
			 8'd146 : begin

				 //(264,280)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[280];
				 realIp2B0 <= realWorkingBuffer[280];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd264;
				 stateIp2B0<=12'd280;

				 //(265,281)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[281];
				 realIp2B1 <= realWorkingBuffer[281];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd265;
				 stateIp2B1<=12'd281;

				 //(266,282)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[282];
				 realIp2B2 <= realWorkingBuffer[282];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd266;
				 stateIp2B2<=12'd282;

				 //(267,283)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[283];
				 realIp2B3 <= realWorkingBuffer[283];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd267;
				 stateIp2B3<=12'd283;

				 //(268,284)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd268;
				 stateIp2B4<=12'd284;

				 //(269,285)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd269;
				 stateIp2B5<=12'd285;

				 //(270,286)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd270;
				 stateIp2B6<=12'd286;

				 //(271,287)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd271;
				 stateIp2B7<=12'd287;
			 end
			 8'd147 : begin

				 //(288,304)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[304];
				 realIp2B0 <= realWorkingBuffer[304];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd304;

				 //(289,305)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[305];
				 realIp2B1 <= realWorkingBuffer[305];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd289;
				 stateIp2B1<=12'd305;

				 //(290,306)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[306];
				 realIp2B2 <= realWorkingBuffer[306];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd290;
				 stateIp2B2<=12'd306;

				 //(291,307)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[307];
				 realIp2B3 <= realWorkingBuffer[307];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd291;
				 stateIp2B3<=12'd307;

				 //(292,308)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[308];
				 realIp2B4 <= realWorkingBuffer[308];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd292;
				 stateIp2B4<=12'd308;

				 //(293,309)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[309];
				 realIp2B5 <= realWorkingBuffer[309];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd293;
				 stateIp2B5<=12'd309;

				 //(294,310)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[310];
				 realIp2B6 <= realWorkingBuffer[310];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd294;
				 stateIp2B6<=12'd310;

				 //(295,311)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[311];
				 realIp2B7 <= realWorkingBuffer[311];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd295;
				 stateIp2B7<=12'd311;
			 end
			 8'd148 : begin

				 //(296,312)
				 imgIp1B0 <= imagWorkingBuffer[296];
				 realIp1B0 <= realWorkingBuffer[296];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd296;
				 stateIp2B0<=12'd312;

				 //(297,313)
				 imgIp1B1 <= imagWorkingBuffer[297];
				 realIp1B1 <= realWorkingBuffer[297];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd297;
				 stateIp2B1<=12'd313;

				 //(298,314)
				 imgIp1B2 <= imagWorkingBuffer[298];
				 realIp1B2 <= realWorkingBuffer[298];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd298;
				 stateIp2B2<=12'd314;

				 //(299,315)
				 imgIp1B3 <= imagWorkingBuffer[299];
				 realIp1B3 <= realWorkingBuffer[299];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd299;
				 stateIp2B3<=12'd315;

				 //(300,316)
				 imgIp1B4 <= imagWorkingBuffer[300];
				 realIp1B4 <= realWorkingBuffer[300];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd300;
				 stateIp2B4<=12'd316;

				 //(301,317)
				 imgIp1B5 <= imagWorkingBuffer[301];
				 realIp1B5 <= realWorkingBuffer[301];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd301;
				 stateIp2B5<=12'd317;

				 //(302,318)
				 imgIp1B6 <= imagWorkingBuffer[302];
				 realIp1B6 <= realWorkingBuffer[302];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd302;
				 stateIp2B6<=12'd318;

				 //(303,319)
				 imgIp1B7 <= imagWorkingBuffer[303];
				 realIp1B7 <= realWorkingBuffer[303];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd303;
				 stateIp2B7<=12'd319;
			 end
			 8'd149 : begin

				 //(320,336)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[336];
				 realIp2B0 <= realWorkingBuffer[336];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd336;

				 //(321,337)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[337];
				 realIp2B1 <= realWorkingBuffer[337];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd321;
				 stateIp2B1<=12'd337;

				 //(322,338)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[338];
				 realIp2B2 <= realWorkingBuffer[338];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd322;
				 stateIp2B2<=12'd338;

				 //(323,339)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[339];
				 realIp2B3 <= realWorkingBuffer[339];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd323;
				 stateIp2B3<=12'd339;

				 //(324,340)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[340];
				 realIp2B4 <= realWorkingBuffer[340];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd324;
				 stateIp2B4<=12'd340;

				 //(325,341)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[341];
				 realIp2B5 <= realWorkingBuffer[341];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd325;
				 stateIp2B5<=12'd341;

				 //(326,342)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[342];
				 realIp2B6 <= realWorkingBuffer[342];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd326;
				 stateIp2B6<=12'd342;

				 //(327,343)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[343];
				 realIp2B7 <= realWorkingBuffer[343];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd327;
				 stateIp2B7<=12'd343;
			 end
			 8'd150 : begin

				 //(328,344)
				 imgIp1B0 <= imagWorkingBuffer[328];
				 realIp1B0 <= realWorkingBuffer[328];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd328;
				 stateIp2B0<=12'd344;

				 //(329,345)
				 imgIp1B1 <= imagWorkingBuffer[329];
				 realIp1B1 <= realWorkingBuffer[329];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd329;
				 stateIp2B1<=12'd345;

				 //(330,346)
				 imgIp1B2 <= imagWorkingBuffer[330];
				 realIp1B2 <= realWorkingBuffer[330];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd330;
				 stateIp2B2<=12'd346;

				 //(331,347)
				 imgIp1B3 <= imagWorkingBuffer[331];
				 realIp1B3 <= realWorkingBuffer[331];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd331;
				 stateIp2B3<=12'd347;

				 //(332,348)
				 imgIp1B4 <= imagWorkingBuffer[332];
				 realIp1B4 <= realWorkingBuffer[332];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd332;
				 stateIp2B4<=12'd348;

				 //(333,349)
				 imgIp1B5 <= imagWorkingBuffer[333];
				 realIp1B5 <= realWorkingBuffer[333];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd333;
				 stateIp2B5<=12'd349;

				 //(334,350)
				 imgIp1B6 <= imagWorkingBuffer[334];
				 realIp1B6 <= realWorkingBuffer[334];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd334;
				 stateIp2B6<=12'd350;

				 //(335,351)
				 imgIp1B7 <= imagWorkingBuffer[335];
				 realIp1B7 <= realWorkingBuffer[335];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd335;
				 stateIp2B7<=12'd351;
			 end
			 8'd151 : begin

				 //(352,368)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd352;
				 stateIp2B0<=12'd368;

				 //(353,369)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd353;
				 stateIp2B1<=12'd369;

				 //(354,370)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd354;
				 stateIp2B2<=12'd370;

				 //(355,371)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd355;
				 stateIp2B3<=12'd371;

				 //(356,372)
				 imgIp1B4 <= imagWorkingBuffer[356];
				 realIp1B4 <= realWorkingBuffer[356];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd356;
				 stateIp2B4<=12'd372;

				 //(357,373)
				 imgIp1B5 <= imagWorkingBuffer[357];
				 realIp1B5 <= realWorkingBuffer[357];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd357;
				 stateIp2B5<=12'd373;

				 //(358,374)
				 imgIp1B6 <= imagWorkingBuffer[358];
				 realIp1B6 <= realWorkingBuffer[358];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd358;
				 stateIp2B6<=12'd374;

				 //(359,375)
				 imgIp1B7 <= imagWorkingBuffer[359];
				 realIp1B7 <= realWorkingBuffer[359];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd359;
				 stateIp2B7<=12'd375;
			 end
			 8'd152 : begin

				 //(360,376)
				 imgIp1B0 <= imagWorkingBuffer[360];
				 realIp1B0 <= realWorkingBuffer[360];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd360;
				 stateIp2B0<=12'd376;

				 //(361,377)
				 imgIp1B1 <= imagWorkingBuffer[361];
				 realIp1B1 <= realWorkingBuffer[361];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd361;
				 stateIp2B1<=12'd377;

				 //(362,378)
				 imgIp1B2 <= imagWorkingBuffer[362];
				 realIp1B2 <= realWorkingBuffer[362];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd362;
				 stateIp2B2<=12'd378;

				 //(363,379)
				 imgIp1B3 <= imagWorkingBuffer[363];
				 realIp1B3 <= realWorkingBuffer[363];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd363;
				 stateIp2B3<=12'd379;

				 //(364,380)
				 imgIp1B4 <= imagWorkingBuffer[364];
				 realIp1B4 <= realWorkingBuffer[364];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd364;
				 stateIp2B4<=12'd380;

				 //(365,381)
				 imgIp1B5 <= imagWorkingBuffer[365];
				 realIp1B5 <= realWorkingBuffer[365];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd365;
				 stateIp2B5<=12'd381;

				 //(366,382)
				 imgIp1B6 <= imagWorkingBuffer[366];
				 realIp1B6 <= realWorkingBuffer[366];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd366;
				 stateIp2B6<=12'd382;

				 //(367,383)
				 imgIp1B7 <= imagWorkingBuffer[367];
				 realIp1B7 <= realWorkingBuffer[367];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd367;
				 stateIp2B7<=12'd383;
			 end
			 8'd153 : begin

				 //(384,400)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[400];
				 realIp2B0 <= realWorkingBuffer[400];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd400;

				 //(385,401)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[401];
				 realIp2B1 <= realWorkingBuffer[401];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd385;
				 stateIp2B1<=12'd401;

				 //(386,402)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[402];
				 realIp2B2 <= realWorkingBuffer[402];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd386;
				 stateIp2B2<=12'd402;

				 //(387,403)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[403];
				 realIp2B3 <= realWorkingBuffer[403];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd387;
				 stateIp2B3<=12'd403;

				 //(388,404)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[404];
				 realIp2B4 <= realWorkingBuffer[404];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd388;
				 stateIp2B4<=12'd404;

				 //(389,405)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[405];
				 realIp2B5 <= realWorkingBuffer[405];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd389;
				 stateIp2B5<=12'd405;

				 //(390,406)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[406];
				 realIp2B6 <= realWorkingBuffer[406];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd390;
				 stateIp2B6<=12'd406;

				 //(391,407)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[407];
				 realIp2B7 <= realWorkingBuffer[407];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd391;
				 stateIp2B7<=12'd407;
			 end
			 8'd154 : begin

				 //(392,408)
				 imgIp1B0 <= imagWorkingBuffer[392];
				 realIp1B0 <= realWorkingBuffer[392];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd392;
				 stateIp2B0<=12'd408;

				 //(393,409)
				 imgIp1B1 <= imagWorkingBuffer[393];
				 realIp1B1 <= realWorkingBuffer[393];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd393;
				 stateIp2B1<=12'd409;

				 //(394,410)
				 imgIp1B2 <= imagWorkingBuffer[394];
				 realIp1B2 <= realWorkingBuffer[394];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd394;
				 stateIp2B2<=12'd410;

				 //(395,411)
				 imgIp1B3 <= imagWorkingBuffer[395];
				 realIp1B3 <= realWorkingBuffer[395];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd395;
				 stateIp2B3<=12'd411;

				 //(396,412)
				 imgIp1B4 <= imagWorkingBuffer[396];
				 realIp1B4 <= realWorkingBuffer[396];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd396;
				 stateIp2B4<=12'd412;

				 //(397,413)
				 imgIp1B5 <= imagWorkingBuffer[397];
				 realIp1B5 <= realWorkingBuffer[397];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd397;
				 stateIp2B5<=12'd413;

				 //(398,414)
				 imgIp1B6 <= imagWorkingBuffer[398];
				 realIp1B6 <= realWorkingBuffer[398];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd398;
				 stateIp2B6<=12'd414;

				 //(399,415)
				 imgIp1B7 <= imagWorkingBuffer[399];
				 realIp1B7 <= realWorkingBuffer[399];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd399;
				 stateIp2B7<=12'd415;
			 end
			 8'd155 : begin

				 //(416,432)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd416;
				 stateIp2B0<=12'd432;

				 //(417,433)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd417;
				 stateIp2B1<=12'd433;

				 //(418,434)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd418;
				 stateIp2B2<=12'd434;

				 //(419,435)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd419;
				 stateIp2B3<=12'd435;

				 //(420,436)
				 imgIp1B4 <= imagWorkingBuffer[420];
				 realIp1B4 <= realWorkingBuffer[420];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd420;
				 stateIp2B4<=12'd436;

				 //(421,437)
				 imgIp1B5 <= imagWorkingBuffer[421];
				 realIp1B5 <= realWorkingBuffer[421];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd421;
				 stateIp2B5<=12'd437;

				 //(422,438)
				 imgIp1B6 <= imagWorkingBuffer[422];
				 realIp1B6 <= realWorkingBuffer[422];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd422;
				 stateIp2B6<=12'd438;

				 //(423,439)
				 imgIp1B7 <= imagWorkingBuffer[423];
				 realIp1B7 <= realWorkingBuffer[423];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd423;
				 stateIp2B7<=12'd439;
			 end
			 8'd156 : begin

				 //(424,440)
				 imgIp1B0 <= imagWorkingBuffer[424];
				 realIp1B0 <= realWorkingBuffer[424];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd424;
				 stateIp2B0<=12'd440;

				 //(425,441)
				 imgIp1B1 <= imagWorkingBuffer[425];
				 realIp1B1 <= realWorkingBuffer[425];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd425;
				 stateIp2B1<=12'd441;

				 //(426,442)
				 imgIp1B2 <= imagWorkingBuffer[426];
				 realIp1B2 <= realWorkingBuffer[426];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd426;
				 stateIp2B2<=12'd442;

				 //(427,443)
				 imgIp1B3 <= imagWorkingBuffer[427];
				 realIp1B3 <= realWorkingBuffer[427];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd427;
				 stateIp2B3<=12'd443;

				 //(428,444)
				 imgIp1B4 <= imagWorkingBuffer[428];
				 realIp1B4 <= realWorkingBuffer[428];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd428;
				 stateIp2B4<=12'd444;

				 //(429,445)
				 imgIp1B5 <= imagWorkingBuffer[429];
				 realIp1B5 <= realWorkingBuffer[429];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd429;
				 stateIp2B5<=12'd445;

				 //(430,446)
				 imgIp1B6 <= imagWorkingBuffer[430];
				 realIp1B6 <= realWorkingBuffer[430];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd430;
				 stateIp2B6<=12'd446;

				 //(431,447)
				 imgIp1B7 <= imagWorkingBuffer[431];
				 realIp1B7 <= realWorkingBuffer[431];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd431;
				 stateIp2B7<=12'd447;
			 end
			 8'd157 : begin

				 //(448,464)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd448;
				 stateIp2B0<=12'd464;

				 //(449,465)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd449;
				 stateIp2B1<=12'd465;

				 //(450,466)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd450;
				 stateIp2B2<=12'd466;

				 //(451,467)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd451;
				 stateIp2B3<=12'd467;

				 //(452,468)
				 imgIp1B4 <= imagWorkingBuffer[452];
				 realIp1B4 <= realWorkingBuffer[452];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd452;
				 stateIp2B4<=12'd468;

				 //(453,469)
				 imgIp1B5 <= imagWorkingBuffer[453];
				 realIp1B5 <= realWorkingBuffer[453];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd453;
				 stateIp2B5<=12'd469;

				 //(454,470)
				 imgIp1B6 <= imagWorkingBuffer[454];
				 realIp1B6 <= realWorkingBuffer[454];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd454;
				 stateIp2B6<=12'd470;

				 //(455,471)
				 imgIp1B7 <= imagWorkingBuffer[455];
				 realIp1B7 <= realWorkingBuffer[455];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd455;
				 stateIp2B7<=12'd471;
			 end
			 8'd158 : begin

				 //(456,472)
				 imgIp1B0 <= imagWorkingBuffer[456];
				 realIp1B0 <= realWorkingBuffer[456];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd456;
				 stateIp2B0<=12'd472;

				 //(457,473)
				 imgIp1B1 <= imagWorkingBuffer[457];
				 realIp1B1 <= realWorkingBuffer[457];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd457;
				 stateIp2B1<=12'd473;

				 //(458,474)
				 imgIp1B2 <= imagWorkingBuffer[458];
				 realIp1B2 <= realWorkingBuffer[458];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd458;
				 stateIp2B2<=12'd474;

				 //(459,475)
				 imgIp1B3 <= imagWorkingBuffer[459];
				 realIp1B3 <= realWorkingBuffer[459];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd459;
				 stateIp2B3<=12'd475;

				 //(460,476)
				 imgIp1B4 <= imagWorkingBuffer[460];
				 realIp1B4 <= realWorkingBuffer[460];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd460;
				 stateIp2B4<=12'd476;

				 //(461,477)
				 imgIp1B5 <= imagWorkingBuffer[461];
				 realIp1B5 <= realWorkingBuffer[461];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd461;
				 stateIp2B5<=12'd477;

				 //(462,478)
				 imgIp1B6 <= imagWorkingBuffer[462];
				 realIp1B6 <= realWorkingBuffer[462];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd462;
				 stateIp2B6<=12'd478;

				 //(463,479)
				 imgIp1B7 <= imagWorkingBuffer[463];
				 realIp1B7 <= realWorkingBuffer[463];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd463;
				 stateIp2B7<=12'd479;
			 end
			 8'd159 : begin

				 //(480,496)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd480;
				 stateIp2B0<=12'd496;

				 //(481,497)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=0.9808046950005572;
				 twiddleFactorimgB1 <=-0.19499269284992174;
				 stateIp1B1<=12'd481;
				 stateIp2B1<=12'd497;

				 //(482,498)
				 imgIp1B2 <= imagWorkingBuffer[482];
				 realIp1B2 <= realWorkingBuffer[482];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=0.9239556994702721;
				 twiddleFactorimgB2 <=-0.3824994972760097;
				 stateIp1B2<=12'd482;
				 stateIp2B2<=12'd498;

				 //(483,499)
				 imgIp1B3 <= imagWorkingBuffer[483];
				 realIp1B3 <= realWorkingBuffer[483];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=0.8316354810253763;
				 twiddleFactorimgB3 <=-0.5553219126774045;
				 stateIp1B3<=12'd483;
				 stateIp2B3<=12'd499;

				 //(484,500)
				 imgIp1B4 <= imagWorkingBuffer[484];
				 realIp1B4 <= realWorkingBuffer[484];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=0.7073882691671998;
				 twiddleFactorimgB4 <=-0.706825181105366;
				 stateIp1B4<=12'd484;
				 stateIp2B4<=12'd500;

				 //(485,501)
				 imgIp1B5 <= imagWorkingBuffer[485];
				 realIp1B5 <= realWorkingBuffer[485];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=0.5559839901496385;
				 twiddleFactorimgB5 <=-0.8311929996681197;
				 stateIp1B5<=12'd485;
				 stateIp2B5<=12'd501;

				 //(486,502)
				 imgIp1B6 <= imagWorkingBuffer[486];
				 realIp1B6 <= realWorkingBuffer[486];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=0.38323514660061825;
				 twiddleFactorimgB6 <=-0.9236508119468106;
				 stateIp1B6<=12'd486;
				 stateIp2B6<=12'd502;

				 //(487,503)
				 imgIp1B7 <= imagWorkingBuffer[487];
				 realIp1B7 <= realWorkingBuffer[487];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=0.19577367200058793;
				 twiddleFactorimgB7 <=-0.9806491061288978;
				 stateIp1B7<=12'd487;
				 stateIp2B7<=12'd503;
			 end
			 8'd160 : begin

				 //(488,504)
				 imgIp1B0 <= imagWorkingBuffer[488];
				 realIp1B0 <= realWorkingBuffer[488];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd488;
				 stateIp2B0<=12'd504;

				 //(489,505)
				 imgIp1B1 <= imagWorkingBuffer[489];
				 realIp1B1 <= realWorkingBuffer[489];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=-0.19421159004730484;
				 twiddleFactorimgB1 <=-0.9809596619083262;
				 stateIp1B1<=12'd489;
				 stateIp2B1<=12'd505;

				 //(490,506)
				 imgIp1B2 <= imagWorkingBuffer[490];
				 realIp1B2 <= realWorkingBuffer[490];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=-0.38176360539457344;
				 twiddleFactorimgB2 <=-0.9242600010798565;
				 stateIp1B2<=12'd490;
				 stateIp2B2<=12'd506;

				 //(491,507)
				 imgIp1B3 <= imagWorkingBuffer[491];
				 realIp1B3 <= realWorkingBuffer[491];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=-0.5546594830553704;
				 twiddleFactorimgB3 <=-0.8320774350123606;
				 stateIp1B3<=12'd491;
				 stateIp2B3<=12'd507;

				 //(492,508)
				 imgIp1B4 <= imagWorkingBuffer[492];
				 realIp1B4 <= realWorkingBuffer[492];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=-0.7062616448200052;
				 twiddleFactorimgB4 <=-0.7079509086484322;
				 stateIp1B4<=12'd492;
				 stateIp2B4<=12'd508;

				 //(493,509)
				 imgIp1B5 <= imagWorkingBuffer[493];
				 realIp1B5 <= realWorkingBuffer[493];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=-0.8307499912211839;
				 twiddleFactorimgB5 <=-0.556645715052225;
				 stateIp1B5<=12'd493;
				 stateIp2B5<=12'd509;

				 //(494,510)
				 imgIp1B6 <= imagWorkingBuffer[494];
				 realIp1B6 <= realWorkingBuffer[494];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=-0.9233453387028124;
				 twiddleFactorimgB6 <=-0.38397055290189713;
				 stateIp1B6<=12'd494;
				 stateIp2B6<=12'd510;

				 //(495,511)
				 imgIp1B7 <= imagWorkingBuffer[495];
				 realIp1B7 <= realWorkingBuffer[495];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.9804928953920125;
				 twiddleFactorimgB7 <=-0.19655452700405607;
				 stateIp1B7<=12'd495;
				 stateIp2B7<=12'd511;
			 end
			 8'd161 : begin

				 //(0,32)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[32];
				 realIp2B0 <= realWorkingBuffer[32];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd32;

				 //(1,33)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[33];
				 realIp2B1 <= realWorkingBuffer[33];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd33;

				 //(2,34)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[34];
				 realIp2B2 <= realWorkingBuffer[34];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd34;

				 //(3,35)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[35];
				 realIp2B3 <= realWorkingBuffer[35];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd35;

				 //(4,36)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[36];
				 realIp2B4 <= realWorkingBuffer[36];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd4;
				 stateIp2B4<=12'd36;

				 //(5,37)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[37];
				 realIp2B5 <= realWorkingBuffer[37];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd5;
				 stateIp2B5<=12'd37;

				 //(6,38)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[38];
				 realIp2B6 <= realWorkingBuffer[38];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd6;
				 stateIp2B6<=12'd38;

				 //(7,39)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[39];
				 realIp2B7 <= realWorkingBuffer[39];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd7;
				 stateIp2B7<=12'd39;
			 end
			 8'd162 : begin

				 //(8,40)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[40];
				 realIp2B0 <= realWorkingBuffer[40];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd8;
				 stateIp2B0<=12'd40;

				 //(9,41)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[41];
				 realIp2B1 <= realWorkingBuffer[41];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd9;
				 stateIp2B1<=12'd41;

				 //(10,42)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[42];
				 realIp2B2 <= realWorkingBuffer[42];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd10;
				 stateIp2B2<=12'd42;

				 //(11,43)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[43];
				 realIp2B3 <= realWorkingBuffer[43];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd11;
				 stateIp2B3<=12'd43;

				 //(12,44)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[44];
				 realIp2B4 <= realWorkingBuffer[44];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd12;
				 stateIp2B4<=12'd44;

				 //(13,45)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[45];
				 realIp2B5 <= realWorkingBuffer[45];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd13;
				 stateIp2B5<=12'd45;

				 //(14,46)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd14;
				 stateIp2B6<=12'd46;

				 //(15,47)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd15;
				 stateIp2B7<=12'd47;
			 end
			 8'd163 : begin

				 //(16,48)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[48];
				 realIp2B0 <= realWorkingBuffer[48];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd48;

				 //(17,49)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[49];
				 realIp2B1 <= realWorkingBuffer[49];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd49;

				 //(18,50)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[50];
				 realIp2B2 <= realWorkingBuffer[50];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd18;
				 stateIp2B2<=12'd50;

				 //(19,51)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[51];
				 realIp2B3 <= realWorkingBuffer[51];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd19;
				 stateIp2B3<=12'd51;

				 //(20,52)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[52];
				 realIp2B4 <= realWorkingBuffer[52];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd20;
				 stateIp2B4<=12'd52;

				 //(21,53)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[53];
				 realIp2B5 <= realWorkingBuffer[53];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd21;
				 stateIp2B5<=12'd53;

				 //(22,54)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[54];
				 realIp2B6 <= realWorkingBuffer[54];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd22;
				 stateIp2B6<=12'd54;

				 //(23,55)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[55];
				 realIp2B7 <= realWorkingBuffer[55];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd23;
				 stateIp2B7<=12'd55;
			 end
			 8'd164 : begin

				 //(24,56)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[56];
				 realIp2B0 <= realWorkingBuffer[56];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd24;
				 stateIp2B0<=12'd56;

				 //(25,57)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[57];
				 realIp2B1 <= realWorkingBuffer[57];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd25;
				 stateIp2B1<=12'd57;

				 //(26,58)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[58];
				 realIp2B2 <= realWorkingBuffer[58];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd26;
				 stateIp2B2<=12'd58;

				 //(27,59)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[59];
				 realIp2B3 <= realWorkingBuffer[59];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd27;
				 stateIp2B3<=12'd59;

				 //(28,60)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd28;
				 stateIp2B4<=12'd60;

				 //(29,61)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd29;
				 stateIp2B5<=12'd61;

				 //(30,62)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd30;
				 stateIp2B6<=12'd62;

				 //(31,63)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd31;
				 stateIp2B7<=12'd63;
			 end
			 8'd165 : begin

				 //(64,96)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[96];
				 realIp2B0 <= realWorkingBuffer[96];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd96;

				 //(65,97)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[97];
				 realIp2B1 <= realWorkingBuffer[97];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd97;

				 //(66,98)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[98];
				 realIp2B2 <= realWorkingBuffer[98];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd66;
				 stateIp2B2<=12'd98;

				 //(67,99)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[99];
				 realIp2B3 <= realWorkingBuffer[99];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd67;
				 stateIp2B3<=12'd99;

				 //(68,100)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[100];
				 realIp2B4 <= realWorkingBuffer[100];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd68;
				 stateIp2B4<=12'd100;

				 //(69,101)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[101];
				 realIp2B5 <= realWorkingBuffer[101];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd69;
				 stateIp2B5<=12'd101;

				 //(70,102)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[102];
				 realIp2B6 <= realWorkingBuffer[102];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd70;
				 stateIp2B6<=12'd102;

				 //(71,103)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[103];
				 realIp2B7 <= realWorkingBuffer[103];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd71;
				 stateIp2B7<=12'd103;
			 end
			 8'd166 : begin

				 //(72,104)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[104];
				 realIp2B0 <= realWorkingBuffer[104];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd72;
				 stateIp2B0<=12'd104;

				 //(73,105)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[105];
				 realIp2B1 <= realWorkingBuffer[105];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd73;
				 stateIp2B1<=12'd105;

				 //(74,106)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[106];
				 realIp2B2 <= realWorkingBuffer[106];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd74;
				 stateIp2B2<=12'd106;

				 //(75,107)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[107];
				 realIp2B3 <= realWorkingBuffer[107];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd75;
				 stateIp2B3<=12'd107;

				 //(76,108)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd76;
				 stateIp2B4<=12'd108;

				 //(77,109)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd77;
				 stateIp2B5<=12'd109;

				 //(78,110)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd78;
				 stateIp2B6<=12'd110;

				 //(79,111)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd79;
				 stateIp2B7<=12'd111;
			 end
			 8'd167 : begin

				 //(80,112)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[112];
				 realIp2B0 <= realWorkingBuffer[112];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd112;

				 //(81,113)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[113];
				 realIp2B1 <= realWorkingBuffer[113];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd81;
				 stateIp2B1<=12'd113;

				 //(82,114)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[114];
				 realIp2B2 <= realWorkingBuffer[114];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd82;
				 stateIp2B2<=12'd114;

				 //(83,115)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[115];
				 realIp2B3 <= realWorkingBuffer[115];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd83;
				 stateIp2B3<=12'd115;

				 //(84,116)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[116];
				 realIp2B4 <= realWorkingBuffer[116];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd84;
				 stateIp2B4<=12'd116;

				 //(85,117)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[117];
				 realIp2B5 <= realWorkingBuffer[117];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd85;
				 stateIp2B5<=12'd117;

				 //(86,118)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[118];
				 realIp2B6 <= realWorkingBuffer[118];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd86;
				 stateIp2B6<=12'd118;

				 //(87,119)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[119];
				 realIp2B7 <= realWorkingBuffer[119];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd87;
				 stateIp2B7<=12'd119;
			 end
			 8'd168 : begin

				 //(88,120)
				 imgIp1B0 <= imagWorkingBuffer[88];
				 realIp1B0 <= realWorkingBuffer[88];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd88;
				 stateIp2B0<=12'd120;

				 //(89,121)
				 imgIp1B1 <= imagWorkingBuffer[89];
				 realIp1B1 <= realWorkingBuffer[89];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd89;
				 stateIp2B1<=12'd121;

				 //(90,122)
				 imgIp1B2 <= imagWorkingBuffer[90];
				 realIp1B2 <= realWorkingBuffer[90];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd90;
				 stateIp2B2<=12'd122;

				 //(91,123)
				 imgIp1B3 <= imagWorkingBuffer[91];
				 realIp1B3 <= realWorkingBuffer[91];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd91;
				 stateIp2B3<=12'd123;

				 //(92,124)
				 imgIp1B4 <= imagWorkingBuffer[92];
				 realIp1B4 <= realWorkingBuffer[92];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd92;
				 stateIp2B4<=12'd124;

				 //(93,125)
				 imgIp1B5 <= imagWorkingBuffer[93];
				 realIp1B5 <= realWorkingBuffer[93];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd93;
				 stateIp2B5<=12'd125;

				 //(94,126)
				 imgIp1B6 <= imagWorkingBuffer[94];
				 realIp1B6 <= realWorkingBuffer[94];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd94;
				 stateIp2B6<=12'd126;

				 //(95,127)
				 imgIp1B7 <= imagWorkingBuffer[95];
				 realIp1B7 <= realWorkingBuffer[95];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd95;
				 stateIp2B7<=12'd127;
			 end
			 8'd169 : begin

				 //(128,160)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[160];
				 realIp2B0 <= realWorkingBuffer[160];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd160;

				 //(129,161)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[161];
				 realIp2B1 <= realWorkingBuffer[161];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd161;

				 //(130,162)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[162];
				 realIp2B2 <= realWorkingBuffer[162];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd130;
				 stateIp2B2<=12'd162;

				 //(131,163)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[163];
				 realIp2B3 <= realWorkingBuffer[163];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd131;
				 stateIp2B3<=12'd163;

				 //(132,164)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[164];
				 realIp2B4 <= realWorkingBuffer[164];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd132;
				 stateIp2B4<=12'd164;

				 //(133,165)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[165];
				 realIp2B5 <= realWorkingBuffer[165];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd133;
				 stateIp2B5<=12'd165;

				 //(134,166)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[166];
				 realIp2B6 <= realWorkingBuffer[166];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd134;
				 stateIp2B6<=12'd166;

				 //(135,167)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[167];
				 realIp2B7 <= realWorkingBuffer[167];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd135;
				 stateIp2B7<=12'd167;
			 end
			 8'd170 : begin

				 //(136,168)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[168];
				 realIp2B0 <= realWorkingBuffer[168];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd136;
				 stateIp2B0<=12'd168;

				 //(137,169)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[169];
				 realIp2B1 <= realWorkingBuffer[169];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd137;
				 stateIp2B1<=12'd169;

				 //(138,170)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[170];
				 realIp2B2 <= realWorkingBuffer[170];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd138;
				 stateIp2B2<=12'd170;

				 //(139,171)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[171];
				 realIp2B3 <= realWorkingBuffer[171];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd139;
				 stateIp2B3<=12'd171;

				 //(140,172)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd140;
				 stateIp2B4<=12'd172;

				 //(141,173)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd141;
				 stateIp2B5<=12'd173;

				 //(142,174)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd142;
				 stateIp2B6<=12'd174;

				 //(143,175)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd143;
				 stateIp2B7<=12'd175;
			 end
			 8'd171 : begin

				 //(144,176)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[176];
				 realIp2B0 <= realWorkingBuffer[176];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd176;

				 //(145,177)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[177];
				 realIp2B1 <= realWorkingBuffer[177];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd145;
				 stateIp2B1<=12'd177;

				 //(146,178)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[178];
				 realIp2B2 <= realWorkingBuffer[178];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd146;
				 stateIp2B2<=12'd178;

				 //(147,179)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[179];
				 realIp2B3 <= realWorkingBuffer[179];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd147;
				 stateIp2B3<=12'd179;

				 //(148,180)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[180];
				 realIp2B4 <= realWorkingBuffer[180];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd148;
				 stateIp2B4<=12'd180;

				 //(149,181)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[181];
				 realIp2B5 <= realWorkingBuffer[181];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd149;
				 stateIp2B5<=12'd181;

				 //(150,182)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[182];
				 realIp2B6 <= realWorkingBuffer[182];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd150;
				 stateIp2B6<=12'd182;

				 //(151,183)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[183];
				 realIp2B7 <= realWorkingBuffer[183];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd151;
				 stateIp2B7<=12'd183;
			 end
			 8'd172 : begin

				 //(152,184)
				 imgIp1B0 <= imagWorkingBuffer[152];
				 realIp1B0 <= realWorkingBuffer[152];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd152;
				 stateIp2B0<=12'd184;

				 //(153,185)
				 imgIp1B1 <= imagWorkingBuffer[153];
				 realIp1B1 <= realWorkingBuffer[153];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd153;
				 stateIp2B1<=12'd185;

				 //(154,186)
				 imgIp1B2 <= imagWorkingBuffer[154];
				 realIp1B2 <= realWorkingBuffer[154];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd154;
				 stateIp2B2<=12'd186;

				 //(155,187)
				 imgIp1B3 <= imagWorkingBuffer[155];
				 realIp1B3 <= realWorkingBuffer[155];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd155;
				 stateIp2B3<=12'd187;

				 //(156,188)
				 imgIp1B4 <= imagWorkingBuffer[156];
				 realIp1B4 <= realWorkingBuffer[156];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd156;
				 stateIp2B4<=12'd188;

				 //(157,189)
				 imgIp1B5 <= imagWorkingBuffer[157];
				 realIp1B5 <= realWorkingBuffer[157];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd157;
				 stateIp2B5<=12'd189;

				 //(158,190)
				 imgIp1B6 <= imagWorkingBuffer[158];
				 realIp1B6 <= realWorkingBuffer[158];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd158;
				 stateIp2B6<=12'd190;

				 //(159,191)
				 imgIp1B7 <= imagWorkingBuffer[159];
				 realIp1B7 <= realWorkingBuffer[159];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd159;
				 stateIp2B7<=12'd191;
			 end
			 8'd173 : begin

				 //(192,224)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[224];
				 realIp2B0 <= realWorkingBuffer[224];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd224;

				 //(193,225)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[225];
				 realIp2B1 <= realWorkingBuffer[225];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd193;
				 stateIp2B1<=12'd225;

				 //(194,226)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[226];
				 realIp2B2 <= realWorkingBuffer[226];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd194;
				 stateIp2B2<=12'd226;

				 //(195,227)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[227];
				 realIp2B3 <= realWorkingBuffer[227];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd195;
				 stateIp2B3<=12'd227;

				 //(196,228)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[228];
				 realIp2B4 <= realWorkingBuffer[228];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd196;
				 stateIp2B4<=12'd228;

				 //(197,229)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[229];
				 realIp2B5 <= realWorkingBuffer[229];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd197;
				 stateIp2B5<=12'd229;

				 //(198,230)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[230];
				 realIp2B6 <= realWorkingBuffer[230];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd198;
				 stateIp2B6<=12'd230;

				 //(199,231)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[231];
				 realIp2B7 <= realWorkingBuffer[231];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd199;
				 stateIp2B7<=12'd231;
			 end
			 8'd174 : begin

				 //(200,232)
				 imgIp1B0 <= imagWorkingBuffer[200];
				 realIp1B0 <= realWorkingBuffer[200];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd200;
				 stateIp2B0<=12'd232;

				 //(201,233)
				 imgIp1B1 <= imagWorkingBuffer[201];
				 realIp1B1 <= realWorkingBuffer[201];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd201;
				 stateIp2B1<=12'd233;

				 //(202,234)
				 imgIp1B2 <= imagWorkingBuffer[202];
				 realIp1B2 <= realWorkingBuffer[202];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd202;
				 stateIp2B2<=12'd234;

				 //(203,235)
				 imgIp1B3 <= imagWorkingBuffer[203];
				 realIp1B3 <= realWorkingBuffer[203];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd203;
				 stateIp2B3<=12'd235;

				 //(204,236)
				 imgIp1B4 <= imagWorkingBuffer[204];
				 realIp1B4 <= realWorkingBuffer[204];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd204;
				 stateIp2B4<=12'd236;

				 //(205,237)
				 imgIp1B5 <= imagWorkingBuffer[205];
				 realIp1B5 <= realWorkingBuffer[205];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd205;
				 stateIp2B5<=12'd237;

				 //(206,238)
				 imgIp1B6 <= imagWorkingBuffer[206];
				 realIp1B6 <= realWorkingBuffer[206];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd206;
				 stateIp2B6<=12'd238;

				 //(207,239)
				 imgIp1B7 <= imagWorkingBuffer[207];
				 realIp1B7 <= realWorkingBuffer[207];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd207;
				 stateIp2B7<=12'd239;
			 end
			 8'd175 : begin

				 //(208,240)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd208;
				 stateIp2B0<=12'd240;

				 //(209,241)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd209;
				 stateIp2B1<=12'd241;

				 //(210,242)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd210;
				 stateIp2B2<=12'd242;

				 //(211,243)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd211;
				 stateIp2B3<=12'd243;

				 //(212,244)
				 imgIp1B4 <= imagWorkingBuffer[212];
				 realIp1B4 <= realWorkingBuffer[212];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd212;
				 stateIp2B4<=12'd244;

				 //(213,245)
				 imgIp1B5 <= imagWorkingBuffer[213];
				 realIp1B5 <= realWorkingBuffer[213];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd213;
				 stateIp2B5<=12'd245;

				 //(214,246)
				 imgIp1B6 <= imagWorkingBuffer[214];
				 realIp1B6 <= realWorkingBuffer[214];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd214;
				 stateIp2B6<=12'd246;

				 //(215,247)
				 imgIp1B7 <= imagWorkingBuffer[215];
				 realIp1B7 <= realWorkingBuffer[215];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd215;
				 stateIp2B7<=12'd247;
			 end
			 8'd176 : begin

				 //(216,248)
				 imgIp1B0 <= imagWorkingBuffer[216];
				 realIp1B0 <= realWorkingBuffer[216];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd216;
				 stateIp2B0<=12'd248;

				 //(217,249)
				 imgIp1B1 <= imagWorkingBuffer[217];
				 realIp1B1 <= realWorkingBuffer[217];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd217;
				 stateIp2B1<=12'd249;

				 //(218,250)
				 imgIp1B2 <= imagWorkingBuffer[218];
				 realIp1B2 <= realWorkingBuffer[218];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd218;
				 stateIp2B2<=12'd250;

				 //(219,251)
				 imgIp1B3 <= imagWorkingBuffer[219];
				 realIp1B3 <= realWorkingBuffer[219];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd219;
				 stateIp2B3<=12'd251;

				 //(220,252)
				 imgIp1B4 <= imagWorkingBuffer[220];
				 realIp1B4 <= realWorkingBuffer[220];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd220;
				 stateIp2B4<=12'd252;

				 //(221,253)
				 imgIp1B5 <= imagWorkingBuffer[221];
				 realIp1B5 <= realWorkingBuffer[221];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd221;
				 stateIp2B5<=12'd253;

				 //(222,254)
				 imgIp1B6 <= imagWorkingBuffer[222];
				 realIp1B6 <= realWorkingBuffer[222];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd222;
				 stateIp2B6<=12'd254;

				 //(223,255)
				 imgIp1B7 <= imagWorkingBuffer[223];
				 realIp1B7 <= realWorkingBuffer[223];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd223;
				 stateIp2B7<=12'd255;
			 end
			 8'd177 : begin

				 //(256,288)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[288];
				 realIp2B0 <= realWorkingBuffer[288];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd288;

				 //(257,289)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[289];
				 realIp2B1 <= realWorkingBuffer[289];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd289;

				 //(258,290)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[290];
				 realIp2B2 <= realWorkingBuffer[290];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd258;
				 stateIp2B2<=12'd290;

				 //(259,291)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[291];
				 realIp2B3 <= realWorkingBuffer[291];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd259;
				 stateIp2B3<=12'd291;

				 //(260,292)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[292];
				 realIp2B4 <= realWorkingBuffer[292];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd260;
				 stateIp2B4<=12'd292;

				 //(261,293)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[293];
				 realIp2B5 <= realWorkingBuffer[293];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd261;
				 stateIp2B5<=12'd293;

				 //(262,294)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[294];
				 realIp2B6 <= realWorkingBuffer[294];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd262;
				 stateIp2B6<=12'd294;

				 //(263,295)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[295];
				 realIp2B7 <= realWorkingBuffer[295];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd263;
				 stateIp2B7<=12'd295;
			 end
			 8'd178 : begin

				 //(264,296)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[296];
				 realIp2B0 <= realWorkingBuffer[296];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd264;
				 stateIp2B0<=12'd296;

				 //(265,297)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[297];
				 realIp2B1 <= realWorkingBuffer[297];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd265;
				 stateIp2B1<=12'd297;

				 //(266,298)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[298];
				 realIp2B2 <= realWorkingBuffer[298];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd266;
				 stateIp2B2<=12'd298;

				 //(267,299)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[299];
				 realIp2B3 <= realWorkingBuffer[299];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd267;
				 stateIp2B3<=12'd299;

				 //(268,300)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd268;
				 stateIp2B4<=12'd300;

				 //(269,301)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd269;
				 stateIp2B5<=12'd301;

				 //(270,302)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd270;
				 stateIp2B6<=12'd302;

				 //(271,303)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd271;
				 stateIp2B7<=12'd303;
			 end
			 8'd179 : begin

				 //(272,304)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[304];
				 realIp2B0 <= realWorkingBuffer[304];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd304;

				 //(273,305)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[305];
				 realIp2B1 <= realWorkingBuffer[305];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd273;
				 stateIp2B1<=12'd305;

				 //(274,306)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[306];
				 realIp2B2 <= realWorkingBuffer[306];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd274;
				 stateIp2B2<=12'd306;

				 //(275,307)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[307];
				 realIp2B3 <= realWorkingBuffer[307];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd275;
				 stateIp2B3<=12'd307;

				 //(276,308)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[308];
				 realIp2B4 <= realWorkingBuffer[308];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd276;
				 stateIp2B4<=12'd308;

				 //(277,309)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[309];
				 realIp2B5 <= realWorkingBuffer[309];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd277;
				 stateIp2B5<=12'd309;

				 //(278,310)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[310];
				 realIp2B6 <= realWorkingBuffer[310];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd278;
				 stateIp2B6<=12'd310;

				 //(279,311)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[311];
				 realIp2B7 <= realWorkingBuffer[311];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd279;
				 stateIp2B7<=12'd311;
			 end
			 8'd180 : begin

				 //(280,312)
				 imgIp1B0 <= imagWorkingBuffer[280];
				 realIp1B0 <= realWorkingBuffer[280];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd280;
				 stateIp2B0<=12'd312;

				 //(281,313)
				 imgIp1B1 <= imagWorkingBuffer[281];
				 realIp1B1 <= realWorkingBuffer[281];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd281;
				 stateIp2B1<=12'd313;

				 //(282,314)
				 imgIp1B2 <= imagWorkingBuffer[282];
				 realIp1B2 <= realWorkingBuffer[282];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd282;
				 stateIp2B2<=12'd314;

				 //(283,315)
				 imgIp1B3 <= imagWorkingBuffer[283];
				 realIp1B3 <= realWorkingBuffer[283];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd283;
				 stateIp2B3<=12'd315;

				 //(284,316)
				 imgIp1B4 <= imagWorkingBuffer[284];
				 realIp1B4 <= realWorkingBuffer[284];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd284;
				 stateIp2B4<=12'd316;

				 //(285,317)
				 imgIp1B5 <= imagWorkingBuffer[285];
				 realIp1B5 <= realWorkingBuffer[285];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd285;
				 stateIp2B5<=12'd317;

				 //(286,318)
				 imgIp1B6 <= imagWorkingBuffer[286];
				 realIp1B6 <= realWorkingBuffer[286];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd286;
				 stateIp2B6<=12'd318;

				 //(287,319)
				 imgIp1B7 <= imagWorkingBuffer[287];
				 realIp1B7 <= realWorkingBuffer[287];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd287;
				 stateIp2B7<=12'd319;
			 end
			 8'd181 : begin

				 //(320,352)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[352];
				 realIp2B0 <= realWorkingBuffer[352];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd352;

				 //(321,353)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[353];
				 realIp2B1 <= realWorkingBuffer[353];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd321;
				 stateIp2B1<=12'd353;

				 //(322,354)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[354];
				 realIp2B2 <= realWorkingBuffer[354];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd322;
				 stateIp2B2<=12'd354;

				 //(323,355)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[355];
				 realIp2B3 <= realWorkingBuffer[355];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd323;
				 stateIp2B3<=12'd355;

				 //(324,356)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[356];
				 realIp2B4 <= realWorkingBuffer[356];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd324;
				 stateIp2B4<=12'd356;

				 //(325,357)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[357];
				 realIp2B5 <= realWorkingBuffer[357];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd325;
				 stateIp2B5<=12'd357;

				 //(326,358)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[358];
				 realIp2B6 <= realWorkingBuffer[358];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd326;
				 stateIp2B6<=12'd358;

				 //(327,359)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[359];
				 realIp2B7 <= realWorkingBuffer[359];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd327;
				 stateIp2B7<=12'd359;
			 end
			 8'd182 : begin

				 //(328,360)
				 imgIp1B0 <= imagWorkingBuffer[328];
				 realIp1B0 <= realWorkingBuffer[328];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd328;
				 stateIp2B0<=12'd360;

				 //(329,361)
				 imgIp1B1 <= imagWorkingBuffer[329];
				 realIp1B1 <= realWorkingBuffer[329];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd329;
				 stateIp2B1<=12'd361;

				 //(330,362)
				 imgIp1B2 <= imagWorkingBuffer[330];
				 realIp1B2 <= realWorkingBuffer[330];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd330;
				 stateIp2B2<=12'd362;

				 //(331,363)
				 imgIp1B3 <= imagWorkingBuffer[331];
				 realIp1B3 <= realWorkingBuffer[331];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd331;
				 stateIp2B3<=12'd363;

				 //(332,364)
				 imgIp1B4 <= imagWorkingBuffer[332];
				 realIp1B4 <= realWorkingBuffer[332];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd332;
				 stateIp2B4<=12'd364;

				 //(333,365)
				 imgIp1B5 <= imagWorkingBuffer[333];
				 realIp1B5 <= realWorkingBuffer[333];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd333;
				 stateIp2B5<=12'd365;

				 //(334,366)
				 imgIp1B6 <= imagWorkingBuffer[334];
				 realIp1B6 <= realWorkingBuffer[334];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd334;
				 stateIp2B6<=12'd366;

				 //(335,367)
				 imgIp1B7 <= imagWorkingBuffer[335];
				 realIp1B7 <= realWorkingBuffer[335];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd335;
				 stateIp2B7<=12'd367;
			 end
			 8'd183 : begin

				 //(336,368)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd336;
				 stateIp2B0<=12'd368;

				 //(337,369)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd337;
				 stateIp2B1<=12'd369;

				 //(338,370)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd338;
				 stateIp2B2<=12'd370;

				 //(339,371)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd339;
				 stateIp2B3<=12'd371;

				 //(340,372)
				 imgIp1B4 <= imagWorkingBuffer[340];
				 realIp1B4 <= realWorkingBuffer[340];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd340;
				 stateIp2B4<=12'd372;

				 //(341,373)
				 imgIp1B5 <= imagWorkingBuffer[341];
				 realIp1B5 <= realWorkingBuffer[341];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd341;
				 stateIp2B5<=12'd373;

				 //(342,374)
				 imgIp1B6 <= imagWorkingBuffer[342];
				 realIp1B6 <= realWorkingBuffer[342];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd342;
				 stateIp2B6<=12'd374;

				 //(343,375)
				 imgIp1B7 <= imagWorkingBuffer[343];
				 realIp1B7 <= realWorkingBuffer[343];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd343;
				 stateIp2B7<=12'd375;
			 end
			 8'd184 : begin

				 //(344,376)
				 imgIp1B0 <= imagWorkingBuffer[344];
				 realIp1B0 <= realWorkingBuffer[344];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd344;
				 stateIp2B0<=12'd376;

				 //(345,377)
				 imgIp1B1 <= imagWorkingBuffer[345];
				 realIp1B1 <= realWorkingBuffer[345];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd345;
				 stateIp2B1<=12'd377;

				 //(346,378)
				 imgIp1B2 <= imagWorkingBuffer[346];
				 realIp1B2 <= realWorkingBuffer[346];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd346;
				 stateIp2B2<=12'd378;

				 //(347,379)
				 imgIp1B3 <= imagWorkingBuffer[347];
				 realIp1B3 <= realWorkingBuffer[347];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd347;
				 stateIp2B3<=12'd379;

				 //(348,380)
				 imgIp1B4 <= imagWorkingBuffer[348];
				 realIp1B4 <= realWorkingBuffer[348];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd348;
				 stateIp2B4<=12'd380;

				 //(349,381)
				 imgIp1B5 <= imagWorkingBuffer[349];
				 realIp1B5 <= realWorkingBuffer[349];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd349;
				 stateIp2B5<=12'd381;

				 //(350,382)
				 imgIp1B6 <= imagWorkingBuffer[350];
				 realIp1B6 <= realWorkingBuffer[350];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd350;
				 stateIp2B6<=12'd382;

				 //(351,383)
				 imgIp1B7 <= imagWorkingBuffer[351];
				 realIp1B7 <= realWorkingBuffer[351];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd351;
				 stateIp2B7<=12'd383;
			 end
			 8'd185 : begin

				 //(384,416)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[416];
				 realIp2B0 <= realWorkingBuffer[416];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd416;

				 //(385,417)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[417];
				 realIp2B1 <= realWorkingBuffer[417];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd385;
				 stateIp2B1<=12'd417;

				 //(386,418)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[418];
				 realIp2B2 <= realWorkingBuffer[418];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd386;
				 stateIp2B2<=12'd418;

				 //(387,419)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[419];
				 realIp2B3 <= realWorkingBuffer[419];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd387;
				 stateIp2B3<=12'd419;

				 //(388,420)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[420];
				 realIp2B4 <= realWorkingBuffer[420];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd388;
				 stateIp2B4<=12'd420;

				 //(389,421)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[421];
				 realIp2B5 <= realWorkingBuffer[421];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd389;
				 stateIp2B5<=12'd421;

				 //(390,422)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[422];
				 realIp2B6 <= realWorkingBuffer[422];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd390;
				 stateIp2B6<=12'd422;

				 //(391,423)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[423];
				 realIp2B7 <= realWorkingBuffer[423];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd391;
				 stateIp2B7<=12'd423;
			 end
			 8'd186 : begin

				 //(392,424)
				 imgIp1B0 <= imagWorkingBuffer[392];
				 realIp1B0 <= realWorkingBuffer[392];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd392;
				 stateIp2B0<=12'd424;

				 //(393,425)
				 imgIp1B1 <= imagWorkingBuffer[393];
				 realIp1B1 <= realWorkingBuffer[393];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd393;
				 stateIp2B1<=12'd425;

				 //(394,426)
				 imgIp1B2 <= imagWorkingBuffer[394];
				 realIp1B2 <= realWorkingBuffer[394];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd394;
				 stateIp2B2<=12'd426;

				 //(395,427)
				 imgIp1B3 <= imagWorkingBuffer[395];
				 realIp1B3 <= realWorkingBuffer[395];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd395;
				 stateIp2B3<=12'd427;

				 //(396,428)
				 imgIp1B4 <= imagWorkingBuffer[396];
				 realIp1B4 <= realWorkingBuffer[396];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd396;
				 stateIp2B4<=12'd428;

				 //(397,429)
				 imgIp1B5 <= imagWorkingBuffer[397];
				 realIp1B5 <= realWorkingBuffer[397];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd397;
				 stateIp2B5<=12'd429;

				 //(398,430)
				 imgIp1B6 <= imagWorkingBuffer[398];
				 realIp1B6 <= realWorkingBuffer[398];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd398;
				 stateIp2B6<=12'd430;

				 //(399,431)
				 imgIp1B7 <= imagWorkingBuffer[399];
				 realIp1B7 <= realWorkingBuffer[399];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd399;
				 stateIp2B7<=12'd431;
			 end
			 8'd187 : begin

				 //(400,432)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd400;
				 stateIp2B0<=12'd432;

				 //(401,433)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd401;
				 stateIp2B1<=12'd433;

				 //(402,434)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd402;
				 stateIp2B2<=12'd434;

				 //(403,435)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd403;
				 stateIp2B3<=12'd435;

				 //(404,436)
				 imgIp1B4 <= imagWorkingBuffer[404];
				 realIp1B4 <= realWorkingBuffer[404];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd404;
				 stateIp2B4<=12'd436;

				 //(405,437)
				 imgIp1B5 <= imagWorkingBuffer[405];
				 realIp1B5 <= realWorkingBuffer[405];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd405;
				 stateIp2B5<=12'd437;

				 //(406,438)
				 imgIp1B6 <= imagWorkingBuffer[406];
				 realIp1B6 <= realWorkingBuffer[406];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd406;
				 stateIp2B6<=12'd438;

				 //(407,439)
				 imgIp1B7 <= imagWorkingBuffer[407];
				 realIp1B7 <= realWorkingBuffer[407];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd407;
				 stateIp2B7<=12'd439;
			 end
			 8'd188 : begin

				 //(408,440)
				 imgIp1B0 <= imagWorkingBuffer[408];
				 realIp1B0 <= realWorkingBuffer[408];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd408;
				 stateIp2B0<=12'd440;

				 //(409,441)
				 imgIp1B1 <= imagWorkingBuffer[409];
				 realIp1B1 <= realWorkingBuffer[409];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd409;
				 stateIp2B1<=12'd441;

				 //(410,442)
				 imgIp1B2 <= imagWorkingBuffer[410];
				 realIp1B2 <= realWorkingBuffer[410];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd410;
				 stateIp2B2<=12'd442;

				 //(411,443)
				 imgIp1B3 <= imagWorkingBuffer[411];
				 realIp1B3 <= realWorkingBuffer[411];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd411;
				 stateIp2B3<=12'd443;

				 //(412,444)
				 imgIp1B4 <= imagWorkingBuffer[412];
				 realIp1B4 <= realWorkingBuffer[412];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd412;
				 stateIp2B4<=12'd444;

				 //(413,445)
				 imgIp1B5 <= imagWorkingBuffer[413];
				 realIp1B5 <= realWorkingBuffer[413];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd413;
				 stateIp2B5<=12'd445;

				 //(414,446)
				 imgIp1B6 <= imagWorkingBuffer[414];
				 realIp1B6 <= realWorkingBuffer[414];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd414;
				 stateIp2B6<=12'd446;

				 //(415,447)
				 imgIp1B7 <= imagWorkingBuffer[415];
				 realIp1B7 <= realWorkingBuffer[415];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd415;
				 stateIp2B7<=12'd447;
			 end
			 8'd189 : begin

				 //(448,480)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd448;
				 stateIp2B0<=12'd480;

				 //(449,481)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=0.9951896037943114;
				 twiddleFactorimgB1 <=-0.0979676094416996;
				 stateIp1B1<=12'd449;
				 stateIp2B1<=12'd481;

				 //(450,482)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=0.9808046950005572;
				 twiddleFactorimgB2 <=-0.19499269284992174;
				 stateIp1B2<=12'd450;
				 stateIp2B2<=12'd482;

				 //(451,483)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=0.9569836678400986;
				 twiddleFactorimgB3 <=-0.2901417920384994;
				 stateIp1B3<=12'd451;
				 stateIp2B3<=12'd483;

				 //(452,484)
				 imgIp1B4 <= imagWorkingBuffer[452];
				 realIp1B4 <= realWorkingBuffer[452];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=0.9239556994702721;
				 twiddleFactorimgB4 <=-0.3824994972760097;
				 stateIp1B4<=12'd452;
				 stateIp2B4<=12'd484;

				 //(453,485)
				 imgIp1B5 <= imagWorkingBuffer[453];
				 realIp1B5 <= realWorkingBuffer[453];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=0.8820385451185335;
				 twiddleFactorimgB5 <=-0.4711772542527714;
				 stateIp1B5<=12'd453;
				 stateIp2B5<=12'd485;

				 //(454,486)
				 imgIp1B6 <= imagWorkingBuffer[454];
				 realIp1B6 <= realWorkingBuffer[454];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=0.8316354810253763;
				 twiddleFactorimgB6 <=-0.5553219126774045;
				 stateIp1B6<=12'd454;
				 stateIp2B6<=12'd486;

				 //(455,487)
				 imgIp1B7 <= imagWorkingBuffer[455];
				 realIp1B7 <= realWorkingBuffer[455];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=0.7732314246073383;
				 twiddleFactorimgB7 <=-0.6341239342586794;
				 stateIp1B7<=12'd455;
				 stateIp2B7<=12'd487;
			 end
			 8'd190 : begin

				 //(456,488)
				 imgIp1B0 <= imagWorkingBuffer[456];
				 realIp1B0 <= realWorkingBuffer[456];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd456;
				 stateIp2B0<=12'd488;

				 //(457,489)
				 imgIp1B1 <= imagWorkingBuffer[457];
				 realIp1B1 <= realWorkingBuffer[457];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=0.6347394780351602;
				 twiddleFactorimgB1 <=-0.7727262096135037;
				 stateIp1B1<=12'd457;
				 stateIp2B1<=12'd489;

				 //(458,490)
				 imgIp1B2 <= imagWorkingBuffer[458];
				 realIp1B2 <= realWorkingBuffer[458];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=0.5559839901496385;
				 twiddleFactorimgB2 <=-0.8311929996681197;
				 stateIp1B2<=12'd458;
				 stateIp2B2<=12'd490;

				 //(459,491)
				 imgIp1B3 <= imagWorkingBuffer[459];
				 realIp1B3 <= realWorkingBuffer[459];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=0.47187949571083804;
				 twiddleFactorimgB3 <=-0.8816630544191387;
				 stateIp1B3<=12'd459;
				 stateIp2B3<=12'd491;

				 //(460,492)
				 imgIp1B4 <= imagWorkingBuffer[460];
				 realIp1B4 <= realWorkingBuffer[460];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=0.38323514660061825;
				 twiddleFactorimgB4 <=-0.9236508119468106;
				 stateIp1B4<=12'd460;
				 stateIp2B4<=12'd492;

				 //(461,493)
				 imgIp1B5 <= imagWorkingBuffer[461];
				 realIp1B5 <= realWorkingBuffer[461];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=0.29090377170021026;
				 twiddleFactorimgB5 <=-0.9567523167521425;
				 stateIp1B5<=12'd461;
				 stateIp2B5<=12'd493;

				 //(462,494)
				 imgIp1B6 <= imagWorkingBuffer[462];
				 realIp1B6 <= realWorkingBuffer[462];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=0.19577367200058793;
				 twiddleFactorimgB6 <=-0.9806491061288978;
				 stateIp1B6<=12'd462;
				 stateIp2B6<=12'd494;

				 //(463,495)
				 imgIp1B7 <= imagWorkingBuffer[463];
				 realIp1B7 <= realWorkingBuffer[463];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=0.09876007444303489;
				 twiddleFactorimgB7 <=-0.9951112740271845;
				 stateIp1B7<=12'd463;
				 stateIp2B7<=12'd495;
			 end
			 8'd191 : begin

				 //(464,496)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd464;
				 stateIp2B0<=12'd496;

				 //(465,497)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=-0.09717508231554396;
				 twiddleFactorimgB1 <=-0.9952673024755547;
				 stateIp1B1<=12'd465;
				 stateIp2B1<=12'd497;

				 //(466,498)
				 imgIp1B2 <= imagWorkingBuffer[466];
				 realIp1B2 <= realWorkingBuffer[466];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=-0.19421159004730484;
				 twiddleFactorimgB2 <=-0.9809596619083262;
				 stateIp1B2<=12'd466;
				 stateIp2B2<=12'd498;

				 //(467,499)
				 imgIp1B3 <= imagWorkingBuffer[467];
				 realIp1B3 <= realWorkingBuffer[467];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=-0.28937962838733716;
				 twiddleFactorimgB3 <=-0.9572144120699431;
				 stateIp1B3<=12'd467;
				 stateIp2B3<=12'd499;

				 //(468,500)
				 imgIp1B4 <= imagWorkingBuffer[468];
				 realIp1B4 <= realWorkingBuffer[468];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=-0.38176360539457344;
				 twiddleFactorimgB4 <=-0.9242600010798565;
				 stateIp1B4<=12'd468;
				 stateIp2B4<=12'd500;

				 //(469,501)
				 imgIp1B5 <= imagWorkingBuffer[469];
				 realIp1B5 <= realWorkingBuffer[469];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=-0.47047471400408947;
				 twiddleFactorimgB5 <=-0.8824134764852417;
				 stateIp1B5<=12'd469;
				 stateIp2B5<=12'd501;

				 //(470,502)
				 imgIp1B6 <= imagWorkingBuffer[470];
				 realIp1B6 <= realWorkingBuffer[470];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=-0.5546594830553704;
				 twiddleFactorimgB6 <=-0.8320774350123606;
				 stateIp1B6<=12'd470;
				 stateIp2B6<=12'd502;

				 //(471,503)
				 imgIp1B7 <= imagWorkingBuffer[471];
				 realIp1B7 <= realWorkingBuffer[471];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=-0.6335079883611737;
				 twiddleFactorimgB7 <=-0.7737361492670347;
				 stateIp1B7<=12'd471;
				 stateIp2B7<=12'd503;
			 end
			 8'd192 : begin

				 //(472,504)
				 imgIp1B0 <= imagWorkingBuffer[472];
				 realIp1B0 <= realWorkingBuffer[472];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd472;
				 stateIp2B0<=12'd504;

				 //(473,505)
				 imgIp1B1 <= imagWorkingBuffer[473];
				 realIp1B1 <= realWorkingBuffer[473];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=-0.7722205046059057;
				 twiddleFactorimgB1 <=-0.6353546193002774;
				 stateIp1B1<=12'd473;
				 stateIp2B1<=12'd505;

				 //(474,506)
				 imgIp1B2 <= imagWorkingBuffer[474];
				 realIp1B2 <= realWorkingBuffer[474];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=-0.8307499912211839;
				 twiddleFactorimgB2 <=-0.556645715052225;
				 stateIp1B2<=12'd474;
				 stateIp2B2<=12'd506;

				 //(475,507)
				 imgIp1B3 <= imagWorkingBuffer[475];
				 realIp1B3 <= realWorkingBuffer[475];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=-0.8812870046251697;
				 twiddleFactorimgB3 <=-0.4725814379329727;
				 stateIp1B3<=12'd475;
				 stateIp2B3<=12'd507;

				 //(476,508)
				 imgIp1B4 <= imagWorkingBuffer[476];
				 realIp1B4 <= realWorkingBuffer[476];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=-0.9233453387028124;
				 twiddleFactorimgB4 <=-0.38397055290189713;
				 stateIp1B4<=12'd476;
				 stateIp2B4<=12'd508;

				 //(477,509)
				 imgIp1B5 <= imagWorkingBuffer[477];
				 realIp1B5 <= realWorkingBuffer[477];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=-0.9565203589527828;
				 twiddleFactorimgB5 <=-0.29166556688927076;
				 stateIp1B5<=12'd477;
				 stateIp2B5<=12'd509;

				 //(478,510)
				 imgIp1B6 <= imagWorkingBuffer[478];
				 realIp1B6 <= realWorkingBuffer[478];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=-0.9804928953920125;
				 twiddleFactorimgB6 <=-0.19655452700405607;
				 stateIp1B6<=12'd478;
				 stateIp2B6<=12'd510;

				 //(479,511)
				 imgIp1B7 <= imagWorkingBuffer[479];
				 realIp1B7 <= realWorkingBuffer[479];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.9950323132238454;
				 twiddleFactorimgB7 <=-0.09955247681701893;
				 stateIp1B7<=12'd479;
				 stateIp2B7<=12'd511;
			 end
			 8'd193 : begin

				 //(0,64)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[64];
				 realIp2B0 <= realWorkingBuffer[64];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd64;

				 //(1,65)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[65];
				 realIp2B1 <= realWorkingBuffer[65];
				 twiddleFactorRealB1 <=0.9987966769554031;
				 twiddleFactorimgB1 <=-0.04904281907521501;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd65;

				 //(2,66)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[66];
				 realIp2B2 <= realWorkingBuffer[66];
				 twiddleFactorRealB2 <=0.9951896037943114;
				 twiddleFactorimgB2 <=-0.0979676094416996;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd66;

				 //(3,67)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[67];
				 realIp2B3 <= realWorkingBuffer[67];
				 twiddleFactorRealB3 <=0.9891874614652418;
				 twiddleFactorimgB3 <=-0.14665662644405364;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd67;

				 //(4,68)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[68];
				 realIp2B4 <= realWorkingBuffer[68];
				 twiddleFactorRealB4 <=0.9808046950005572;
				 twiddleFactorimgB4 <=-0.19499269284992174;
				 stateIp1B4<=12'd4;
				 stateIp2B4<=12'd68;

				 //(5,69)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[69];
				 realIp2B5 <= realWorkingBuffer[69];
				 twiddleFactorRealB5 <=0.9700614787523865;
				 twiddleFactorimgB5 <=-0.24285948085412118;
				 stateIp1B5<=12'd5;
				 stateIp2B5<=12'd69;

				 //(6,70)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[70];
				 realIp2B6 <= realWorkingBuffer[70];
				 twiddleFactorRealB6 <=0.9569836678400986;
				 twiddleFactorimgB6 <=-0.2901417920384994;
				 stateIp1B6<=12'd6;
				 stateIp2B6<=12'd70;

				 //(7,71)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[71];
				 realIp2B7 <= realWorkingBuffer[71];
				 twiddleFactorRealB7 <=0.9416027359261809;
				 twiddleFactorimgB7 <=-0.3367258346137564;
				 stateIp1B7<=12'd7;
				 stateIp2B7<=12'd71;
			 end
			 8'd194 : begin

				 //(8,72)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[72];
				 realIp2B0 <= realWorkingBuffer[72];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd8;
				 stateIp2B0<=12'd72;

				 //(9,73)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[73];
				 realIp2B1 <= realWorkingBuffer[73];
				 twiddleFactorRealB1 <=0.9040850286436448;
				 twiddleFactorimgB1 <=-0.427352619019025;
				 stateIp1B1<=12'd9;
				 stateIp2B1<=12'd73;

				 //(10,74)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[74];
				 realIp2B2 <= realWorkingBuffer[74];
				 twiddleFactorRealB2 <=0.8820385451185335;
				 twiddleFactorimgB2 <=-0.4711772542527714;
				 stateIp1B2<=12'd10;
				 stateIp2B2<=12'd74;

				 //(11,75)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[75];
				 realIp2B3 <= realWorkingBuffer[75];
				 twiddleFactorRealB3 <=0.8578693069782943;
				 twiddleFactorimgB3 <=-0.5138679325902532;
				 stateIp1B3<=12'd11;
				 stateIp2B3<=12'd75;

				 //(12,76)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[76];
				 realIp2B4 <= realWorkingBuffer[76];
				 twiddleFactorRealB4 <=0.8316354810253763;
				 twiddleFactorimgB4 <=-0.5553219126774045;
				 stateIp1B4<=12'd12;
				 stateIp2B4<=12'd76;

				 //(13,77)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[77];
				 realIp2B5 <= realWorkingBuffer[77];
				 twiddleFactorRealB5 <=0.8034002027944137;
				 twiddleFactorimgB5 <=-0.595439429455167;
				 stateIp1B5<=12'd13;
				 stateIp2B5<=12'd77;

				 //(14,78)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=0.7732314246073383;
				 twiddleFactorimgB6 <=-0.6341239342586794;
				 stateIp1B6<=12'd14;
				 stateIp2B6<=12'd78;

				 //(15,79)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=0.7412017520361899;
				 twiddleFactorimgB7 <=-0.671282327175744;
				 stateIp1B7<=12'd15;
				 stateIp2B7<=12'd79;
			 end
			 8'd195 : begin

				 //(16,80)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[80];
				 realIp2B0 <= realWorkingBuffer[80];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd80;

				 //(17,81)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[81];
				 realIp2B1 <= realWorkingBuffer[81];
				 twiddleFactorRealB1 <=0.6718723530866767;
				 twiddleFactorimgB1 <=-0.7406669569771369;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd81;

				 //(18,82)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[82];
				 realIp2B2 <= realWorkingBuffer[82];
				 twiddleFactorRealB2 <=0.6347394780351602;
				 twiddleFactorimgB2 <=-0.7727262096135037;
				 stateIp1B2<=12'd18;
				 stateIp2B2<=12'd82;

				 //(19,83)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[83];
				 realIp2B3 <= realWorkingBuffer[83];
				 twiddleFactorRealB3 <=0.5960790097011732;
				 twiddleFactorimgB3 <=-0.8029257837394864;
				 stateIp1B3<=12'd19;
				 stateIp2B3<=12'd83;

				 //(20,84)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[84];
				 realIp2B4 <= realWorkingBuffer[84];
				 twiddleFactorRealB4 <=0.5559839901496385;
				 twiddleFactorimgB4 <=-0.8311929996681197;
				 stateIp1B4<=12'd20;
				 stateIp2B4<=12'd84;

				 //(21,85)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[85];
				 realIp2B5 <= realWorkingBuffer[85];
				 twiddleFactorRealB5 <=0.5145509139025557;
				 twiddleFactorimgB5 <=-0.8574598282147361;
				 stateIp1B5<=12'd21;
				 stateIp2B5<=12'd85;

				 //(22,86)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[86];
				 realIp2B6 <= realWorkingBuffer[86];
				 twiddleFactorRealB6 <=0.47187949571083804;
				 twiddleFactorimgB6 <=-0.8816630544191387;
				 stateIp1B6<=12'd22;
				 stateIp2B6<=12'd86;

				 //(23,87)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[87];
				 realIp2B7 <= realWorkingBuffer[87];
				 twiddleFactorRealB7 <=0.42807243057619715;
				 twiddleFactorimgB7 <=-0.9037444296816367;
				 stateIp1B7<=12'd23;
				 stateIp2B7<=12'd87;
			 end
			 8'd196 : begin

				 //(24,88)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[88];
				 realIp2B0 <= realWorkingBuffer[88];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd24;
				 stateIp2B0<=12'd88;

				 //(25,89)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[89];
				 realIp2B1 <= realWorkingBuffer[89];
				 twiddleFactorRealB1 <=0.33747555125823137;
				 twiddleFactorimgB1 <=-0.941334293597632;
				 stateIp1B1<=12'd25;
				 stateIp2B1<=12'd89;

				 //(26,90)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[90];
				 realIp2B2 <= realWorkingBuffer[90];
				 twiddleFactorRealB2 <=0.29090377170021026;
				 twiddleFactorimgB2 <=-0.9567523167521425;
				 stateIp1B2<=12'd26;
				 stateIp2B2<=12'd90;

				 //(27,91)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[91];
				 realIp2B3 <= realWorkingBuffer[91];
				 twiddleFactorRealB3 <=0.24363188971769512;
				 twiddleFactorimgB3 <=-0.9698677756852141;
				 stateIp1B3<=12'd27;
				 stateIp2B3<=12'd91;

				 //(28,92)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=0.19577367200058793;
				 twiddleFactorimgB4 <=-0.9806491061288978;
				 stateIp1B4<=12'd28;
				 stateIp2B4<=12'd92;

				 //(29,93)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=0.1474442963413934;
				 twiddleFactorimgB5 <=-0.9890703612364448;
				 stateIp1B5<=12'd29;
				 stateIp2B5<=12'd93;

				 //(30,94)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=0.09876007444303489;
				 twiddleFactorimgB6 <=-0.9951112740271845;
				 stateIp1B6<=12'd30;
				 stateIp2B6<=12'd94;

				 //(31,95)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=0.04983817199774956;
				 twiddleFactorimgB7 <=-0.9987573061619738;
				 stateIp1B7<=12'd31;
				 stateIp2B7<=12'd95;
			 end
			 8'd197 : begin

				 //(32,96)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[96];
				 realIp2B0 <= realWorkingBuffer[96];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd96;

				 //(33,97)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[97];
				 realIp2B1 <= realWorkingBuffer[97];
				 twiddleFactorRealB1 <=-0.048247435052847135;
				 twiddleFactorimgB1 <=-0.9988354143755723;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd97;

				 //(34,98)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[98];
				 realIp2B2 <= realWorkingBuffer[98];
				 twiddleFactorRealB2 <=-0.09717508231554396;
				 twiddleFactorimgB2 <=-0.9952673024755547;
				 stateIp1B2<=12'd34;
				 stateIp2B2<=12'd98;

				 //(35,99)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[99];
				 realIp2B3 <= realWorkingBuffer[99];
				 twiddleFactorRealB3 <=-0.14586886354641898;
				 twiddleFactorimgB3 <=-0.9893039344143316;
				 stateIp1B3<=12'd35;
				 stateIp2B3<=12'd99;

				 //(36,100)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[100];
				 realIp2B4 <= realWorkingBuffer[100];
				 twiddleFactorRealB4 <=-0.19421159004730484;
				 twiddleFactorimgB4 <=-0.9809596619083262;
				 stateIp1B4<=12'd36;
				 stateIp2B4<=12'd100;

				 //(37,101)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[101];
				 realIp2B5 <= realWorkingBuffer[101];
				 twiddleFactorRealB5 <=-0.24208691798452725;
				 twiddleFactorimgB5 <=-0.970254566668332;
				 stateIp1B5<=12'd37;
				 stateIp2B5<=12'd101;

				 //(38,102)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[102];
				 realIp2B6 <= realWorkingBuffer[102];
				 twiddleFactorRealB6 <=-0.28937962838733716;
				 twiddleFactorimgB6 <=-0.9572144120699431;
				 stateIp1B6<=12'd38;
				 stateIp2B6<=12'd102;

				 //(39,103)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[103];
				 realIp2B7 <= realWorkingBuffer[103];
				 twiddleFactorRealB7 <=-0.3359759044391963;
				 twiddleFactorimgB7 <=-0.9418705811502258;
				 stateIp1B7<=12'd39;
				 stateIp2B7<=12'd103;
			 end
			 8'd198 : begin

				 //(40,104)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[104];
				 realIp2B0 <= realWorkingBuffer[104];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd40;
				 stateIp2B0<=12'd104;

				 //(41,105)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[105];
				 realIp2B1 <= realWorkingBuffer[105];
				 twiddleFactorRealB1 <=-0.4266325364620312;
				 twiddleFactorimgB1 <=-0.9044250542924901;
				 stateIp1B1<=12'd41;
				 stateIp2B1<=12'd105;

				 //(42,106)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[106];
				 realIp2B2 <= realWorkingBuffer[106];
				 twiddleFactorRealB2 <=-0.47047471400408947;
				 twiddleFactorimgB2 <=-0.8824134764852417;
				 stateIp1B2<=12'd42;
				 stateIp2B2<=12'd106;

				 //(43,107)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[107];
				 realIp2B3 <= realWorkingBuffer[107];
				 twiddleFactorRealB3 <=-0.5131846254156256;
				 twiddleFactorimgB3 <=-0.858278241735758;
				 stateIp1B3<=12'd43;
				 stateIp2B3<=12'd107;

				 //(44,108)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=-0.5546594830553704;
				 twiddleFactorimgB4 <=-0.8320774350123606;
				 stateIp1B4<=12'd44;
				 stateIp2B4<=12'd108;

				 //(45,109)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=-0.594799471619386;
				 twiddleFactorimgB5 <=-0.8038741123840842;
				 stateIp1B5<=12'd45;
				 stateIp2B5<=12'd109;

				 //(46,110)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=-0.6335079883611737;
				 twiddleFactorimgB6 <=-0.7737361492670347;
				 stateIp1B6<=12'd46;
				 stateIp2B6<=12'd110;

				 //(47,111)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=-0.6706918755802994;
				 twiddleFactorimgB7 <=-0.7417360770722833;
				 stateIp1B7<=12'd47;
				 stateIp2B7<=12'd111;
			 end
			 8'd199 : begin

				 //(48,112)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[112];
				 realIp2B0 <= realWorkingBuffer[112];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd112;

				 //(49,113)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[113];
				 realIp2B1 <= realWorkingBuffer[113];
				 twiddleFactorRealB1 <=-0.7401316922342577;
				 twiddleFactorimgB1 <=-0.6724619529389407;
				 stateIp1B1<=12'd49;
				 stateIp2B1<=12'd113;

				 //(50,114)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[114];
				 realIp2B2 <= realWorkingBuffer[114];
				 twiddleFactorRealB2 <=-0.7722205046059057;
				 twiddleFactorimgB2 <=-0.6353546193002774;
				 stateIp1B2<=12'd50;
				 stateIp2B2<=12'd114;

				 //(51,115)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[115];
				 realIp2B3 <= realWorkingBuffer[115];
				 twiddleFactorRealB3 <=-0.8024508555201488;
				 twiddleFactorimgB3 <=-0.5967182119518234;
				 stateIp1B3<=12'd51;
				 stateIp2B3<=12'd115;

				 //(52,116)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[116];
				 realIp2B4 <= realWorkingBuffer[116];
				 twiddleFactorRealB4 <=-0.8307499912211839;
				 twiddleFactorimgB4 <=-0.556645715052225;
				 stateIp1B4<=12'd52;
				 stateIp2B4<=12'd116;

				 //(53,117)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[117];
				 realIp2B5 <= realWorkingBuffer[117];
				 twiddleFactorRealB5 <=-0.8570498057047488;
				 twiddleFactorimgB5 <=-0.5152335689194294;
				 stateIp1B5<=12'd53;
				 stateIp2B5<=12'd117;

				 //(54,118)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[118];
				 realIp2B6 <= realWorkingBuffer[118];
				 twiddleFactorRealB6 <=-0.8812870046251697;
				 twiddleFactorimgB6 <=-0.4725814379329727;
				 stateIp1B6<=12'd54;
				 stateIp2B6<=12'd118;

				 //(55,119)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[119];
				 realIp2B7 <= realWorkingBuffer[119];
				 twiddleFactorRealB7 <=-0.9034032576224522;
				 twiddleFactorimgB7 <=-0.42879197067708863;
				 stateIp1B7<=12'd55;
				 stateIp2B7<=12'd119;
			 end
			 8'd200 : begin

				 //(56,120)
				 imgIp1B0 <= imagWorkingBuffer[56];
				 realIp1B0 <= realWorkingBuffer[56];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd56;
				 stateIp2B0<=12'd120;

				 //(57,121)
				 imgIp1B1 <= imagWorkingBuffer[57];
				 realIp1B1 <= realWorkingBuffer[57];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=-0.9410652543348083;
				 twiddleFactorimgB1 <=-0.3382250538971983;
				 stateIp1B1<=12'd57;
				 stateIp2B1<=12'd121;

				 //(58,122)
				 imgIp1B2 <= imagWorkingBuffer[58];
				 realIp1B2 <= realWorkingBuffer[58];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=-0.9565203589527828;
				 twiddleFactorimgB2 <=-0.29166556688927076;
				 stateIp1B2<=12'd58;
				 stateIp2B2<=12'd122;

				 //(59,123)
				 imgIp1B3 <= imagWorkingBuffer[59];
				 realIp1B3 <= realWorkingBuffer[59];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=-0.9696734575896493;
				 twiddleFactorimgB3 <=-0.2444041440854362;
				 stateIp1B3<=12'd59;
				 stateIp2B3<=12'd123;

				 //(60,124)
				 imgIp1B4 <= imagWorkingBuffer[60];
				 realIp1B4 <= realWorkingBuffer[60];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=-0.9804928953920125;
				 twiddleFactorimgB4 <=-0.19655452700405607;
				 stateIp1B4<=12'd60;
				 stateIp2B4<=12'd124;

				 //(61,125)
				 imgIp1B5 <= imagWorkingBuffer[61];
				 realIp1B5 <= realWorkingBuffer[61];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=-0.988952633802198;
				 twiddleFactorimgB5 <=-0.1482318727389478;
				 stateIp1B5<=12'd61;
				 stateIp2B5<=12'd125;

				 //(62,126)
				 imgIp1B6 <= imagWorkingBuffer[62];
				 realIp1B6 <= realWorkingBuffer[62];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=-0.9950323132238454;
				 twiddleFactorimgB6 <=-0.09955247681701893;
				 stateIp1B6<=12'd62;
				 stateIp2B6<=12'd126;

				 //(63,127)
				 imgIp1B7 <= imagWorkingBuffer[63];
				 realIp1B7 <= realWorkingBuffer[63];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=-0.9987173020202512;
				 twiddleFactorimgB7 <=-0.05063349331608835;
				 stateIp1B7<=12'd63;
				 stateIp2B7<=12'd127;
			 end
			 8'd201 : begin

				 //(128,192)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[192];
				 realIp2B0 <= realWorkingBuffer[192];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd192;

				 //(129,193)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[193];
				 realIp2B1 <= realWorkingBuffer[193];
				 twiddleFactorRealB1 <=0.9987966769554031;
				 twiddleFactorimgB1 <=-0.04904281907521501;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd193;

				 //(130,194)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[194];
				 realIp2B2 <= realWorkingBuffer[194];
				 twiddleFactorRealB2 <=0.9951896037943114;
				 twiddleFactorimgB2 <=-0.0979676094416996;
				 stateIp1B2<=12'd130;
				 stateIp2B2<=12'd194;

				 //(131,195)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[195];
				 realIp2B3 <= realWorkingBuffer[195];
				 twiddleFactorRealB3 <=0.9891874614652418;
				 twiddleFactorimgB3 <=-0.14665662644405364;
				 stateIp1B3<=12'd131;
				 stateIp2B3<=12'd195;

				 //(132,196)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[196];
				 realIp2B4 <= realWorkingBuffer[196];
				 twiddleFactorRealB4 <=0.9808046950005572;
				 twiddleFactorimgB4 <=-0.19499269284992174;
				 stateIp1B4<=12'd132;
				 stateIp2B4<=12'd196;

				 //(133,197)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[197];
				 realIp2B5 <= realWorkingBuffer[197];
				 twiddleFactorRealB5 <=0.9700614787523865;
				 twiddleFactorimgB5 <=-0.24285948085412118;
				 stateIp1B5<=12'd133;
				 stateIp2B5<=12'd197;

				 //(134,198)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[198];
				 realIp2B6 <= realWorkingBuffer[198];
				 twiddleFactorRealB6 <=0.9569836678400986;
				 twiddleFactorimgB6 <=-0.2901417920384994;
				 stateIp1B6<=12'd134;
				 stateIp2B6<=12'd198;

				 //(135,199)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[199];
				 realIp2B7 <= realWorkingBuffer[199];
				 twiddleFactorRealB7 <=0.9416027359261809;
				 twiddleFactorimgB7 <=-0.3367258346137564;
				 stateIp1B7<=12'd135;
				 stateIp2B7<=12'd199;
			 end
			 8'd202 : begin

				 //(136,200)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[200];
				 realIp2B0 <= realWorkingBuffer[200];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd136;
				 stateIp2B0<=12'd200;

				 //(137,201)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[201];
				 realIp2B1 <= realWorkingBuffer[201];
				 twiddleFactorRealB1 <=0.9040850286436448;
				 twiddleFactorimgB1 <=-0.427352619019025;
				 stateIp1B1<=12'd137;
				 stateIp2B1<=12'd201;

				 //(138,202)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[202];
				 realIp2B2 <= realWorkingBuffer[202];
				 twiddleFactorRealB2 <=0.8820385451185335;
				 twiddleFactorimgB2 <=-0.4711772542527714;
				 stateIp1B2<=12'd138;
				 stateIp2B2<=12'd202;

				 //(139,203)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[203];
				 realIp2B3 <= realWorkingBuffer[203];
				 twiddleFactorRealB3 <=0.8578693069782943;
				 twiddleFactorimgB3 <=-0.5138679325902532;
				 stateIp1B3<=12'd139;
				 stateIp2B3<=12'd203;

				 //(140,204)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=0.8316354810253763;
				 twiddleFactorimgB4 <=-0.5553219126774045;
				 stateIp1B4<=12'd140;
				 stateIp2B4<=12'd204;

				 //(141,205)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=0.8034002027944137;
				 twiddleFactorimgB5 <=-0.595439429455167;
				 stateIp1B5<=12'd141;
				 stateIp2B5<=12'd205;

				 //(142,206)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=0.7732314246073383;
				 twiddleFactorimgB6 <=-0.6341239342586794;
				 stateIp1B6<=12'd142;
				 stateIp2B6<=12'd206;

				 //(143,207)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=0.7412017520361899;
				 twiddleFactorimgB7 <=-0.671282327175744;
				 stateIp1B7<=12'd143;
				 stateIp2B7<=12'd207;
			 end
			 8'd203 : begin

				 //(144,208)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[208];
				 realIp2B0 <= realWorkingBuffer[208];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd208;

				 //(145,209)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[209];
				 realIp2B1 <= realWorkingBuffer[209];
				 twiddleFactorRealB1 <=0.6718723530866767;
				 twiddleFactorimgB1 <=-0.7406669569771369;
				 stateIp1B1<=12'd145;
				 stateIp2B1<=12'd209;

				 //(146,210)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[210];
				 realIp2B2 <= realWorkingBuffer[210];
				 twiddleFactorRealB2 <=0.6347394780351602;
				 twiddleFactorimgB2 <=-0.7727262096135037;
				 stateIp1B2<=12'd146;
				 stateIp2B2<=12'd210;

				 //(147,211)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[211];
				 realIp2B3 <= realWorkingBuffer[211];
				 twiddleFactorRealB3 <=0.5960790097011732;
				 twiddleFactorimgB3 <=-0.8029257837394864;
				 stateIp1B3<=12'd147;
				 stateIp2B3<=12'd211;

				 //(148,212)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[212];
				 realIp2B4 <= realWorkingBuffer[212];
				 twiddleFactorRealB4 <=0.5559839901496385;
				 twiddleFactorimgB4 <=-0.8311929996681197;
				 stateIp1B4<=12'd148;
				 stateIp2B4<=12'd212;

				 //(149,213)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[213];
				 realIp2B5 <= realWorkingBuffer[213];
				 twiddleFactorRealB5 <=0.5145509139025557;
				 twiddleFactorimgB5 <=-0.8574598282147361;
				 stateIp1B5<=12'd149;
				 stateIp2B5<=12'd213;

				 //(150,214)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[214];
				 realIp2B6 <= realWorkingBuffer[214];
				 twiddleFactorRealB6 <=0.47187949571083804;
				 twiddleFactorimgB6 <=-0.8816630544191387;
				 stateIp1B6<=12'd150;
				 stateIp2B6<=12'd214;

				 //(151,215)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[215];
				 realIp2B7 <= realWorkingBuffer[215];
				 twiddleFactorRealB7 <=0.42807243057619715;
				 twiddleFactorimgB7 <=-0.9037444296816367;
				 stateIp1B7<=12'd151;
				 stateIp2B7<=12'd215;
			 end
			 8'd204 : begin

				 //(152,216)
				 imgIp1B0 <= imagWorkingBuffer[152];
				 realIp1B0 <= realWorkingBuffer[152];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd152;
				 stateIp2B0<=12'd216;

				 //(153,217)
				 imgIp1B1 <= imagWorkingBuffer[153];
				 realIp1B1 <= realWorkingBuffer[153];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=0.33747555125823137;
				 twiddleFactorimgB1 <=-0.941334293597632;
				 stateIp1B1<=12'd153;
				 stateIp2B1<=12'd217;

				 //(154,218)
				 imgIp1B2 <= imagWorkingBuffer[154];
				 realIp1B2 <= realWorkingBuffer[154];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=0.29090377170021026;
				 twiddleFactorimgB2 <=-0.9567523167521425;
				 stateIp1B2<=12'd154;
				 stateIp2B2<=12'd218;

				 //(155,219)
				 imgIp1B3 <= imagWorkingBuffer[155];
				 realIp1B3 <= realWorkingBuffer[155];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=0.24363188971769512;
				 twiddleFactorimgB3 <=-0.9698677756852141;
				 stateIp1B3<=12'd155;
				 stateIp2B3<=12'd219;

				 //(156,220)
				 imgIp1B4 <= imagWorkingBuffer[156];
				 realIp1B4 <= realWorkingBuffer[156];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=0.19577367200058793;
				 twiddleFactorimgB4 <=-0.9806491061288978;
				 stateIp1B4<=12'd156;
				 stateIp2B4<=12'd220;

				 //(157,221)
				 imgIp1B5 <= imagWorkingBuffer[157];
				 realIp1B5 <= realWorkingBuffer[157];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=0.1474442963413934;
				 twiddleFactorimgB5 <=-0.9890703612364448;
				 stateIp1B5<=12'd157;
				 stateIp2B5<=12'd221;

				 //(158,222)
				 imgIp1B6 <= imagWorkingBuffer[158];
				 realIp1B6 <= realWorkingBuffer[158];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=0.09876007444303489;
				 twiddleFactorimgB6 <=-0.9951112740271845;
				 stateIp1B6<=12'd158;
				 stateIp2B6<=12'd222;

				 //(159,223)
				 imgIp1B7 <= imagWorkingBuffer[159];
				 realIp1B7 <= realWorkingBuffer[159];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=0.04983817199774956;
				 twiddleFactorimgB7 <=-0.9987573061619738;
				 stateIp1B7<=12'd159;
				 stateIp2B7<=12'd223;
			 end
			 8'd205 : begin

				 //(160,224)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[224];
				 realIp2B0 <= realWorkingBuffer[224];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd224;

				 //(161,225)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[225];
				 realIp2B1 <= realWorkingBuffer[225];
				 twiddleFactorRealB1 <=-0.048247435052847135;
				 twiddleFactorimgB1 <=-0.9988354143755723;
				 stateIp1B1<=12'd161;
				 stateIp2B1<=12'd225;

				 //(162,226)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[226];
				 realIp2B2 <= realWorkingBuffer[226];
				 twiddleFactorRealB2 <=-0.09717508231554396;
				 twiddleFactorimgB2 <=-0.9952673024755547;
				 stateIp1B2<=12'd162;
				 stateIp2B2<=12'd226;

				 //(163,227)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[227];
				 realIp2B3 <= realWorkingBuffer[227];
				 twiddleFactorRealB3 <=-0.14586886354641898;
				 twiddleFactorimgB3 <=-0.9893039344143316;
				 stateIp1B3<=12'd163;
				 stateIp2B3<=12'd227;

				 //(164,228)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[228];
				 realIp2B4 <= realWorkingBuffer[228];
				 twiddleFactorRealB4 <=-0.19421159004730484;
				 twiddleFactorimgB4 <=-0.9809596619083262;
				 stateIp1B4<=12'd164;
				 stateIp2B4<=12'd228;

				 //(165,229)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[229];
				 realIp2B5 <= realWorkingBuffer[229];
				 twiddleFactorRealB5 <=-0.24208691798452725;
				 twiddleFactorimgB5 <=-0.970254566668332;
				 stateIp1B5<=12'd165;
				 stateIp2B5<=12'd229;

				 //(166,230)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[230];
				 realIp2B6 <= realWorkingBuffer[230];
				 twiddleFactorRealB6 <=-0.28937962838733716;
				 twiddleFactorimgB6 <=-0.9572144120699431;
				 stateIp1B6<=12'd166;
				 stateIp2B6<=12'd230;

				 //(167,231)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[231];
				 realIp2B7 <= realWorkingBuffer[231];
				 twiddleFactorRealB7 <=-0.3359759044391963;
				 twiddleFactorimgB7 <=-0.9418705811502258;
				 stateIp1B7<=12'd167;
				 stateIp2B7<=12'd231;
			 end
			 8'd206 : begin

				 //(168,232)
				 imgIp1B0 <= imagWorkingBuffer[168];
				 realIp1B0 <= realWorkingBuffer[168];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd168;
				 stateIp2B0<=12'd232;

				 //(169,233)
				 imgIp1B1 <= imagWorkingBuffer[169];
				 realIp1B1 <= realWorkingBuffer[169];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=-0.4266325364620312;
				 twiddleFactorimgB1 <=-0.9044250542924901;
				 stateIp1B1<=12'd169;
				 stateIp2B1<=12'd233;

				 //(170,234)
				 imgIp1B2 <= imagWorkingBuffer[170];
				 realIp1B2 <= realWorkingBuffer[170];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=-0.47047471400408947;
				 twiddleFactorimgB2 <=-0.8824134764852417;
				 stateIp1B2<=12'd170;
				 stateIp2B2<=12'd234;

				 //(171,235)
				 imgIp1B3 <= imagWorkingBuffer[171];
				 realIp1B3 <= realWorkingBuffer[171];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=-0.5131846254156256;
				 twiddleFactorimgB3 <=-0.858278241735758;
				 stateIp1B3<=12'd171;
				 stateIp2B3<=12'd235;

				 //(172,236)
				 imgIp1B4 <= imagWorkingBuffer[172];
				 realIp1B4 <= realWorkingBuffer[172];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=-0.5546594830553704;
				 twiddleFactorimgB4 <=-0.8320774350123606;
				 stateIp1B4<=12'd172;
				 stateIp2B4<=12'd236;

				 //(173,237)
				 imgIp1B5 <= imagWorkingBuffer[173];
				 realIp1B5 <= realWorkingBuffer[173];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=-0.594799471619386;
				 twiddleFactorimgB5 <=-0.8038741123840842;
				 stateIp1B5<=12'd173;
				 stateIp2B5<=12'd237;

				 //(174,238)
				 imgIp1B6 <= imagWorkingBuffer[174];
				 realIp1B6 <= realWorkingBuffer[174];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=-0.6335079883611737;
				 twiddleFactorimgB6 <=-0.7737361492670347;
				 stateIp1B6<=12'd174;
				 stateIp2B6<=12'd238;

				 //(175,239)
				 imgIp1B7 <= imagWorkingBuffer[175];
				 realIp1B7 <= realWorkingBuffer[175];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=-0.6706918755802994;
				 twiddleFactorimgB7 <=-0.7417360770722833;
				 stateIp1B7<=12'd175;
				 stateIp2B7<=12'd239;
			 end
			 8'd207 : begin

				 //(176,240)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd176;
				 stateIp2B0<=12'd240;

				 //(177,241)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=-0.7401316922342577;
				 twiddleFactorimgB1 <=-0.6724619529389407;
				 stateIp1B1<=12'd177;
				 stateIp2B1<=12'd241;

				 //(178,242)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=-0.7722205046059057;
				 twiddleFactorimgB2 <=-0.6353546193002774;
				 stateIp1B2<=12'd178;
				 stateIp2B2<=12'd242;

				 //(179,243)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=-0.8024508555201488;
				 twiddleFactorimgB3 <=-0.5967182119518234;
				 stateIp1B3<=12'd179;
				 stateIp2B3<=12'd243;

				 //(180,244)
				 imgIp1B4 <= imagWorkingBuffer[180];
				 realIp1B4 <= realWorkingBuffer[180];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=-0.8307499912211839;
				 twiddleFactorimgB4 <=-0.556645715052225;
				 stateIp1B4<=12'd180;
				 stateIp2B4<=12'd244;

				 //(181,245)
				 imgIp1B5 <= imagWorkingBuffer[181];
				 realIp1B5 <= realWorkingBuffer[181];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=-0.8570498057047488;
				 twiddleFactorimgB5 <=-0.5152335689194294;
				 stateIp1B5<=12'd181;
				 stateIp2B5<=12'd245;

				 //(182,246)
				 imgIp1B6 <= imagWorkingBuffer[182];
				 realIp1B6 <= realWorkingBuffer[182];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=-0.8812870046251697;
				 twiddleFactorimgB6 <=-0.4725814379329727;
				 stateIp1B6<=12'd182;
				 stateIp2B6<=12'd246;

				 //(183,247)
				 imgIp1B7 <= imagWorkingBuffer[183];
				 realIp1B7 <= realWorkingBuffer[183];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=-0.9034032576224522;
				 twiddleFactorimgB7 <=-0.42879197067708863;
				 stateIp1B7<=12'd183;
				 stateIp2B7<=12'd247;
			 end
			 8'd208 : begin

				 //(184,248)
				 imgIp1B0 <= imagWorkingBuffer[184];
				 realIp1B0 <= realWorkingBuffer[184];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd184;
				 stateIp2B0<=12'd248;

				 //(185,249)
				 imgIp1B1 <= imagWorkingBuffer[185];
				 realIp1B1 <= realWorkingBuffer[185];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=-0.9410652543348083;
				 twiddleFactorimgB1 <=-0.3382250538971983;
				 stateIp1B1<=12'd185;
				 stateIp2B1<=12'd249;

				 //(186,250)
				 imgIp1B2 <= imagWorkingBuffer[186];
				 realIp1B2 <= realWorkingBuffer[186];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=-0.9565203589527828;
				 twiddleFactorimgB2 <=-0.29166556688927076;
				 stateIp1B2<=12'd186;
				 stateIp2B2<=12'd250;

				 //(187,251)
				 imgIp1B3 <= imagWorkingBuffer[187];
				 realIp1B3 <= realWorkingBuffer[187];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=-0.9696734575896493;
				 twiddleFactorimgB3 <=-0.2444041440854362;
				 stateIp1B3<=12'd187;
				 stateIp2B3<=12'd251;

				 //(188,252)
				 imgIp1B4 <= imagWorkingBuffer[188];
				 realIp1B4 <= realWorkingBuffer[188];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=-0.9804928953920125;
				 twiddleFactorimgB4 <=-0.19655452700405607;
				 stateIp1B4<=12'd188;
				 stateIp2B4<=12'd252;

				 //(189,253)
				 imgIp1B5 <= imagWorkingBuffer[189];
				 realIp1B5 <= realWorkingBuffer[189];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=-0.988952633802198;
				 twiddleFactorimgB5 <=-0.1482318727389478;
				 stateIp1B5<=12'd189;
				 stateIp2B5<=12'd253;

				 //(190,254)
				 imgIp1B6 <= imagWorkingBuffer[190];
				 realIp1B6 <= realWorkingBuffer[190];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=-0.9950323132238454;
				 twiddleFactorimgB6 <=-0.09955247681701893;
				 stateIp1B6<=12'd190;
				 stateIp2B6<=12'd254;

				 //(191,255)
				 imgIp1B7 <= imagWorkingBuffer[191];
				 realIp1B7 <= realWorkingBuffer[191];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=-0.9987173020202512;
				 twiddleFactorimgB7 <=-0.05063349331608835;
				 stateIp1B7<=12'd191;
				 stateIp2B7<=12'd255;
			 end
			 8'd209 : begin

				 //(256,320)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[320];
				 realIp2B0 <= realWorkingBuffer[320];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd320;

				 //(257,321)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[321];
				 realIp2B1 <= realWorkingBuffer[321];
				 twiddleFactorRealB1 <=0.9987966769554031;
				 twiddleFactorimgB1 <=-0.04904281907521501;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd321;

				 //(258,322)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[322];
				 realIp2B2 <= realWorkingBuffer[322];
				 twiddleFactorRealB2 <=0.9951896037943114;
				 twiddleFactorimgB2 <=-0.0979676094416996;
				 stateIp1B2<=12'd258;
				 stateIp2B2<=12'd322;

				 //(259,323)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[323];
				 realIp2B3 <= realWorkingBuffer[323];
				 twiddleFactorRealB3 <=0.9891874614652418;
				 twiddleFactorimgB3 <=-0.14665662644405364;
				 stateIp1B3<=12'd259;
				 stateIp2B3<=12'd323;

				 //(260,324)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[324];
				 realIp2B4 <= realWorkingBuffer[324];
				 twiddleFactorRealB4 <=0.9808046950005572;
				 twiddleFactorimgB4 <=-0.19499269284992174;
				 stateIp1B4<=12'd260;
				 stateIp2B4<=12'd324;

				 //(261,325)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[325];
				 realIp2B5 <= realWorkingBuffer[325];
				 twiddleFactorRealB5 <=0.9700614787523865;
				 twiddleFactorimgB5 <=-0.24285948085412118;
				 stateIp1B5<=12'd261;
				 stateIp2B5<=12'd325;

				 //(262,326)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[326];
				 realIp2B6 <= realWorkingBuffer[326];
				 twiddleFactorRealB6 <=0.9569836678400986;
				 twiddleFactorimgB6 <=-0.2901417920384994;
				 stateIp1B6<=12'd262;
				 stateIp2B6<=12'd326;

				 //(263,327)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[327];
				 realIp2B7 <= realWorkingBuffer[327];
				 twiddleFactorRealB7 <=0.9416027359261809;
				 twiddleFactorimgB7 <=-0.3367258346137564;
				 stateIp1B7<=12'd263;
				 stateIp2B7<=12'd327;
			 end
			 8'd210 : begin

				 //(264,328)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[328];
				 realIp2B0 <= realWorkingBuffer[328];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd264;
				 stateIp2B0<=12'd328;

				 //(265,329)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[329];
				 realIp2B1 <= realWorkingBuffer[329];
				 twiddleFactorRealB1 <=0.9040850286436448;
				 twiddleFactorimgB1 <=-0.427352619019025;
				 stateIp1B1<=12'd265;
				 stateIp2B1<=12'd329;

				 //(266,330)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[330];
				 realIp2B2 <= realWorkingBuffer[330];
				 twiddleFactorRealB2 <=0.8820385451185335;
				 twiddleFactorimgB2 <=-0.4711772542527714;
				 stateIp1B2<=12'd266;
				 stateIp2B2<=12'd330;

				 //(267,331)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[331];
				 realIp2B3 <= realWorkingBuffer[331];
				 twiddleFactorRealB3 <=0.8578693069782943;
				 twiddleFactorimgB3 <=-0.5138679325902532;
				 stateIp1B3<=12'd267;
				 stateIp2B3<=12'd331;

				 //(268,332)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=0.8316354810253763;
				 twiddleFactorimgB4 <=-0.5553219126774045;
				 stateIp1B4<=12'd268;
				 stateIp2B4<=12'd332;

				 //(269,333)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=0.8034002027944137;
				 twiddleFactorimgB5 <=-0.595439429455167;
				 stateIp1B5<=12'd269;
				 stateIp2B5<=12'd333;

				 //(270,334)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=0.7732314246073383;
				 twiddleFactorimgB6 <=-0.6341239342586794;
				 stateIp1B6<=12'd270;
				 stateIp2B6<=12'd334;

				 //(271,335)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=0.7412017520361899;
				 twiddleFactorimgB7 <=-0.671282327175744;
				 stateIp1B7<=12'd271;
				 stateIp2B7<=12'd335;
			 end
			 8'd211 : begin

				 //(272,336)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[336];
				 realIp2B0 <= realWorkingBuffer[336];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd336;

				 //(273,337)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[337];
				 realIp2B1 <= realWorkingBuffer[337];
				 twiddleFactorRealB1 <=0.6718723530866767;
				 twiddleFactorimgB1 <=-0.7406669569771369;
				 stateIp1B1<=12'd273;
				 stateIp2B1<=12'd337;

				 //(274,338)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[338];
				 realIp2B2 <= realWorkingBuffer[338];
				 twiddleFactorRealB2 <=0.6347394780351602;
				 twiddleFactorimgB2 <=-0.7727262096135037;
				 stateIp1B2<=12'd274;
				 stateIp2B2<=12'd338;

				 //(275,339)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[339];
				 realIp2B3 <= realWorkingBuffer[339];
				 twiddleFactorRealB3 <=0.5960790097011732;
				 twiddleFactorimgB3 <=-0.8029257837394864;
				 stateIp1B3<=12'd275;
				 stateIp2B3<=12'd339;

				 //(276,340)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[340];
				 realIp2B4 <= realWorkingBuffer[340];
				 twiddleFactorRealB4 <=0.5559839901496385;
				 twiddleFactorimgB4 <=-0.8311929996681197;
				 stateIp1B4<=12'd276;
				 stateIp2B4<=12'd340;

				 //(277,341)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[341];
				 realIp2B5 <= realWorkingBuffer[341];
				 twiddleFactorRealB5 <=0.5145509139025557;
				 twiddleFactorimgB5 <=-0.8574598282147361;
				 stateIp1B5<=12'd277;
				 stateIp2B5<=12'd341;

				 //(278,342)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[342];
				 realIp2B6 <= realWorkingBuffer[342];
				 twiddleFactorRealB6 <=0.47187949571083804;
				 twiddleFactorimgB6 <=-0.8816630544191387;
				 stateIp1B6<=12'd278;
				 stateIp2B6<=12'd342;

				 //(279,343)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[343];
				 realIp2B7 <= realWorkingBuffer[343];
				 twiddleFactorRealB7 <=0.42807243057619715;
				 twiddleFactorimgB7 <=-0.9037444296816367;
				 stateIp1B7<=12'd279;
				 stateIp2B7<=12'd343;
			 end
			 8'd212 : begin

				 //(280,344)
				 imgIp1B0 <= imagWorkingBuffer[280];
				 realIp1B0 <= realWorkingBuffer[280];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd280;
				 stateIp2B0<=12'd344;

				 //(281,345)
				 imgIp1B1 <= imagWorkingBuffer[281];
				 realIp1B1 <= realWorkingBuffer[281];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=0.33747555125823137;
				 twiddleFactorimgB1 <=-0.941334293597632;
				 stateIp1B1<=12'd281;
				 stateIp2B1<=12'd345;

				 //(282,346)
				 imgIp1B2 <= imagWorkingBuffer[282];
				 realIp1B2 <= realWorkingBuffer[282];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=0.29090377170021026;
				 twiddleFactorimgB2 <=-0.9567523167521425;
				 stateIp1B2<=12'd282;
				 stateIp2B2<=12'd346;

				 //(283,347)
				 imgIp1B3 <= imagWorkingBuffer[283];
				 realIp1B3 <= realWorkingBuffer[283];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=0.24363188971769512;
				 twiddleFactorimgB3 <=-0.9698677756852141;
				 stateIp1B3<=12'd283;
				 stateIp2B3<=12'd347;

				 //(284,348)
				 imgIp1B4 <= imagWorkingBuffer[284];
				 realIp1B4 <= realWorkingBuffer[284];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=0.19577367200058793;
				 twiddleFactorimgB4 <=-0.9806491061288978;
				 stateIp1B4<=12'd284;
				 stateIp2B4<=12'd348;

				 //(285,349)
				 imgIp1B5 <= imagWorkingBuffer[285];
				 realIp1B5 <= realWorkingBuffer[285];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=0.1474442963413934;
				 twiddleFactorimgB5 <=-0.9890703612364448;
				 stateIp1B5<=12'd285;
				 stateIp2B5<=12'd349;

				 //(286,350)
				 imgIp1B6 <= imagWorkingBuffer[286];
				 realIp1B6 <= realWorkingBuffer[286];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=0.09876007444303489;
				 twiddleFactorimgB6 <=-0.9951112740271845;
				 stateIp1B6<=12'd286;
				 stateIp2B6<=12'd350;

				 //(287,351)
				 imgIp1B7 <= imagWorkingBuffer[287];
				 realIp1B7 <= realWorkingBuffer[287];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=0.04983817199774956;
				 twiddleFactorimgB7 <=-0.9987573061619738;
				 stateIp1B7<=12'd287;
				 stateIp2B7<=12'd351;
			 end
			 8'd213 : begin

				 //(288,352)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[352];
				 realIp2B0 <= realWorkingBuffer[352];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd352;

				 //(289,353)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[353];
				 realIp2B1 <= realWorkingBuffer[353];
				 twiddleFactorRealB1 <=-0.048247435052847135;
				 twiddleFactorimgB1 <=-0.9988354143755723;
				 stateIp1B1<=12'd289;
				 stateIp2B1<=12'd353;

				 //(290,354)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[354];
				 realIp2B2 <= realWorkingBuffer[354];
				 twiddleFactorRealB2 <=-0.09717508231554396;
				 twiddleFactorimgB2 <=-0.9952673024755547;
				 stateIp1B2<=12'd290;
				 stateIp2B2<=12'd354;

				 //(291,355)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[355];
				 realIp2B3 <= realWorkingBuffer[355];
				 twiddleFactorRealB3 <=-0.14586886354641898;
				 twiddleFactorimgB3 <=-0.9893039344143316;
				 stateIp1B3<=12'd291;
				 stateIp2B3<=12'd355;

				 //(292,356)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[356];
				 realIp2B4 <= realWorkingBuffer[356];
				 twiddleFactorRealB4 <=-0.19421159004730484;
				 twiddleFactorimgB4 <=-0.9809596619083262;
				 stateIp1B4<=12'd292;
				 stateIp2B4<=12'd356;

				 //(293,357)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[357];
				 realIp2B5 <= realWorkingBuffer[357];
				 twiddleFactorRealB5 <=-0.24208691798452725;
				 twiddleFactorimgB5 <=-0.970254566668332;
				 stateIp1B5<=12'd293;
				 stateIp2B5<=12'd357;

				 //(294,358)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[358];
				 realIp2B6 <= realWorkingBuffer[358];
				 twiddleFactorRealB6 <=-0.28937962838733716;
				 twiddleFactorimgB6 <=-0.9572144120699431;
				 stateIp1B6<=12'd294;
				 stateIp2B6<=12'd358;

				 //(295,359)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[359];
				 realIp2B7 <= realWorkingBuffer[359];
				 twiddleFactorRealB7 <=-0.3359759044391963;
				 twiddleFactorimgB7 <=-0.9418705811502258;
				 stateIp1B7<=12'd295;
				 stateIp2B7<=12'd359;
			 end
			 8'd214 : begin

				 //(296,360)
				 imgIp1B0 <= imagWorkingBuffer[296];
				 realIp1B0 <= realWorkingBuffer[296];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd296;
				 stateIp2B0<=12'd360;

				 //(297,361)
				 imgIp1B1 <= imagWorkingBuffer[297];
				 realIp1B1 <= realWorkingBuffer[297];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=-0.4266325364620312;
				 twiddleFactorimgB1 <=-0.9044250542924901;
				 stateIp1B1<=12'd297;
				 stateIp2B1<=12'd361;

				 //(298,362)
				 imgIp1B2 <= imagWorkingBuffer[298];
				 realIp1B2 <= realWorkingBuffer[298];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=-0.47047471400408947;
				 twiddleFactorimgB2 <=-0.8824134764852417;
				 stateIp1B2<=12'd298;
				 stateIp2B2<=12'd362;

				 //(299,363)
				 imgIp1B3 <= imagWorkingBuffer[299];
				 realIp1B3 <= realWorkingBuffer[299];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=-0.5131846254156256;
				 twiddleFactorimgB3 <=-0.858278241735758;
				 stateIp1B3<=12'd299;
				 stateIp2B3<=12'd363;

				 //(300,364)
				 imgIp1B4 <= imagWorkingBuffer[300];
				 realIp1B4 <= realWorkingBuffer[300];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=-0.5546594830553704;
				 twiddleFactorimgB4 <=-0.8320774350123606;
				 stateIp1B4<=12'd300;
				 stateIp2B4<=12'd364;

				 //(301,365)
				 imgIp1B5 <= imagWorkingBuffer[301];
				 realIp1B5 <= realWorkingBuffer[301];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=-0.594799471619386;
				 twiddleFactorimgB5 <=-0.8038741123840842;
				 stateIp1B5<=12'd301;
				 stateIp2B5<=12'd365;

				 //(302,366)
				 imgIp1B6 <= imagWorkingBuffer[302];
				 realIp1B6 <= realWorkingBuffer[302];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=-0.6335079883611737;
				 twiddleFactorimgB6 <=-0.7737361492670347;
				 stateIp1B6<=12'd302;
				 stateIp2B6<=12'd366;

				 //(303,367)
				 imgIp1B7 <= imagWorkingBuffer[303];
				 realIp1B7 <= realWorkingBuffer[303];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=-0.6706918755802994;
				 twiddleFactorimgB7 <=-0.7417360770722833;
				 stateIp1B7<=12'd303;
				 stateIp2B7<=12'd367;
			 end
			 8'd215 : begin

				 //(304,368)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd304;
				 stateIp2B0<=12'd368;

				 //(305,369)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=-0.7401316922342577;
				 twiddleFactorimgB1 <=-0.6724619529389407;
				 stateIp1B1<=12'd305;
				 stateIp2B1<=12'd369;

				 //(306,370)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=-0.7722205046059057;
				 twiddleFactorimgB2 <=-0.6353546193002774;
				 stateIp1B2<=12'd306;
				 stateIp2B2<=12'd370;

				 //(307,371)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=-0.8024508555201488;
				 twiddleFactorimgB3 <=-0.5967182119518234;
				 stateIp1B3<=12'd307;
				 stateIp2B3<=12'd371;

				 //(308,372)
				 imgIp1B4 <= imagWorkingBuffer[308];
				 realIp1B4 <= realWorkingBuffer[308];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=-0.8307499912211839;
				 twiddleFactorimgB4 <=-0.556645715052225;
				 stateIp1B4<=12'd308;
				 stateIp2B4<=12'd372;

				 //(309,373)
				 imgIp1B5 <= imagWorkingBuffer[309];
				 realIp1B5 <= realWorkingBuffer[309];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=-0.8570498057047488;
				 twiddleFactorimgB5 <=-0.5152335689194294;
				 stateIp1B5<=12'd309;
				 stateIp2B5<=12'd373;

				 //(310,374)
				 imgIp1B6 <= imagWorkingBuffer[310];
				 realIp1B6 <= realWorkingBuffer[310];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=-0.8812870046251697;
				 twiddleFactorimgB6 <=-0.4725814379329727;
				 stateIp1B6<=12'd310;
				 stateIp2B6<=12'd374;

				 //(311,375)
				 imgIp1B7 <= imagWorkingBuffer[311];
				 realIp1B7 <= realWorkingBuffer[311];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=-0.9034032576224522;
				 twiddleFactorimgB7 <=-0.42879197067708863;
				 stateIp1B7<=12'd311;
				 stateIp2B7<=12'd375;
			 end
			 8'd216 : begin

				 //(312,376)
				 imgIp1B0 <= imagWorkingBuffer[312];
				 realIp1B0 <= realWorkingBuffer[312];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd312;
				 stateIp2B0<=12'd376;

				 //(313,377)
				 imgIp1B1 <= imagWorkingBuffer[313];
				 realIp1B1 <= realWorkingBuffer[313];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=-0.9410652543348083;
				 twiddleFactorimgB1 <=-0.3382250538971983;
				 stateIp1B1<=12'd313;
				 stateIp2B1<=12'd377;

				 //(314,378)
				 imgIp1B2 <= imagWorkingBuffer[314];
				 realIp1B2 <= realWorkingBuffer[314];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=-0.9565203589527828;
				 twiddleFactorimgB2 <=-0.29166556688927076;
				 stateIp1B2<=12'd314;
				 stateIp2B2<=12'd378;

				 //(315,379)
				 imgIp1B3 <= imagWorkingBuffer[315];
				 realIp1B3 <= realWorkingBuffer[315];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=-0.9696734575896493;
				 twiddleFactorimgB3 <=-0.2444041440854362;
				 stateIp1B3<=12'd315;
				 stateIp2B3<=12'd379;

				 //(316,380)
				 imgIp1B4 <= imagWorkingBuffer[316];
				 realIp1B4 <= realWorkingBuffer[316];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=-0.9804928953920125;
				 twiddleFactorimgB4 <=-0.19655452700405607;
				 stateIp1B4<=12'd316;
				 stateIp2B4<=12'd380;

				 //(317,381)
				 imgIp1B5 <= imagWorkingBuffer[317];
				 realIp1B5 <= realWorkingBuffer[317];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=-0.988952633802198;
				 twiddleFactorimgB5 <=-0.1482318727389478;
				 stateIp1B5<=12'd317;
				 stateIp2B5<=12'd381;

				 //(318,382)
				 imgIp1B6 <= imagWorkingBuffer[318];
				 realIp1B6 <= realWorkingBuffer[318];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=-0.9950323132238454;
				 twiddleFactorimgB6 <=-0.09955247681701893;
				 stateIp1B6<=12'd318;
				 stateIp2B6<=12'd382;

				 //(319,383)
				 imgIp1B7 <= imagWorkingBuffer[319];
				 realIp1B7 <= realWorkingBuffer[319];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=-0.9987173020202512;
				 twiddleFactorimgB7 <=-0.05063349331608835;
				 stateIp1B7<=12'd319;
				 stateIp2B7<=12'd383;
			 end
			 8'd217 : begin

				 //(384,448)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[448];
				 realIp2B0 <= realWorkingBuffer[448];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd384;
				 stateIp2B0<=12'd448;

				 //(385,449)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[449];
				 realIp2B1 <= realWorkingBuffer[449];
				 twiddleFactorRealB1 <=0.9987966769554031;
				 twiddleFactorimgB1 <=-0.04904281907521501;
				 stateIp1B1<=12'd385;
				 stateIp2B1<=12'd449;

				 //(386,450)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[450];
				 realIp2B2 <= realWorkingBuffer[450];
				 twiddleFactorRealB2 <=0.9951896037943114;
				 twiddleFactorimgB2 <=-0.0979676094416996;
				 stateIp1B2<=12'd386;
				 stateIp2B2<=12'd450;

				 //(387,451)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[451];
				 realIp2B3 <= realWorkingBuffer[451];
				 twiddleFactorRealB3 <=0.9891874614652418;
				 twiddleFactorimgB3 <=-0.14665662644405364;
				 stateIp1B3<=12'd387;
				 stateIp2B3<=12'd451;

				 //(388,452)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[452];
				 realIp2B4 <= realWorkingBuffer[452];
				 twiddleFactorRealB4 <=0.9808046950005572;
				 twiddleFactorimgB4 <=-0.19499269284992174;
				 stateIp1B4<=12'd388;
				 stateIp2B4<=12'd452;

				 //(389,453)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[453];
				 realIp2B5 <= realWorkingBuffer[453];
				 twiddleFactorRealB5 <=0.9700614787523865;
				 twiddleFactorimgB5 <=-0.24285948085412118;
				 stateIp1B5<=12'd389;
				 stateIp2B5<=12'd453;

				 //(390,454)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[454];
				 realIp2B6 <= realWorkingBuffer[454];
				 twiddleFactorRealB6 <=0.9569836678400986;
				 twiddleFactorimgB6 <=-0.2901417920384994;
				 stateIp1B6<=12'd390;
				 stateIp2B6<=12'd454;

				 //(391,455)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[455];
				 realIp2B7 <= realWorkingBuffer[455];
				 twiddleFactorRealB7 <=0.9416027359261809;
				 twiddleFactorimgB7 <=-0.3367258346137564;
				 stateIp1B7<=12'd391;
				 stateIp2B7<=12'd455;
			 end
			 8'd218 : begin

				 //(392,456)
				 imgIp1B0 <= imagWorkingBuffer[392];
				 realIp1B0 <= realWorkingBuffer[392];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd392;
				 stateIp2B0<=12'd456;

				 //(393,457)
				 imgIp1B1 <= imagWorkingBuffer[393];
				 realIp1B1 <= realWorkingBuffer[393];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=0.9040850286436448;
				 twiddleFactorimgB1 <=-0.427352619019025;
				 stateIp1B1<=12'd393;
				 stateIp2B1<=12'd457;

				 //(394,458)
				 imgIp1B2 <= imagWorkingBuffer[394];
				 realIp1B2 <= realWorkingBuffer[394];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=0.8820385451185335;
				 twiddleFactorimgB2 <=-0.4711772542527714;
				 stateIp1B2<=12'd394;
				 stateIp2B2<=12'd458;

				 //(395,459)
				 imgIp1B3 <= imagWorkingBuffer[395];
				 realIp1B3 <= realWorkingBuffer[395];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=0.8578693069782943;
				 twiddleFactorimgB3 <=-0.5138679325902532;
				 stateIp1B3<=12'd395;
				 stateIp2B3<=12'd459;

				 //(396,460)
				 imgIp1B4 <= imagWorkingBuffer[396];
				 realIp1B4 <= realWorkingBuffer[396];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=0.8316354810253763;
				 twiddleFactorimgB4 <=-0.5553219126774045;
				 stateIp1B4<=12'd396;
				 stateIp2B4<=12'd460;

				 //(397,461)
				 imgIp1B5 <= imagWorkingBuffer[397];
				 realIp1B5 <= realWorkingBuffer[397];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=0.8034002027944137;
				 twiddleFactorimgB5 <=-0.595439429455167;
				 stateIp1B5<=12'd397;
				 stateIp2B5<=12'd461;

				 //(398,462)
				 imgIp1B6 <= imagWorkingBuffer[398];
				 realIp1B6 <= realWorkingBuffer[398];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=0.7732314246073383;
				 twiddleFactorimgB6 <=-0.6341239342586794;
				 stateIp1B6<=12'd398;
				 stateIp2B6<=12'd462;

				 //(399,463)
				 imgIp1B7 <= imagWorkingBuffer[399];
				 realIp1B7 <= realWorkingBuffer[399];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=0.7412017520361899;
				 twiddleFactorimgB7 <=-0.671282327175744;
				 stateIp1B7<=12'd399;
				 stateIp2B7<=12'd463;
			 end
			 8'd219 : begin

				 //(400,464)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd400;
				 stateIp2B0<=12'd464;

				 //(401,465)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=0.6718723530866767;
				 twiddleFactorimgB1 <=-0.7406669569771369;
				 stateIp1B1<=12'd401;
				 stateIp2B1<=12'd465;

				 //(402,466)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=0.6347394780351602;
				 twiddleFactorimgB2 <=-0.7727262096135037;
				 stateIp1B2<=12'd402;
				 stateIp2B2<=12'd466;

				 //(403,467)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=0.5960790097011732;
				 twiddleFactorimgB3 <=-0.8029257837394864;
				 stateIp1B3<=12'd403;
				 stateIp2B3<=12'd467;

				 //(404,468)
				 imgIp1B4 <= imagWorkingBuffer[404];
				 realIp1B4 <= realWorkingBuffer[404];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=0.5559839901496385;
				 twiddleFactorimgB4 <=-0.8311929996681197;
				 stateIp1B4<=12'd404;
				 stateIp2B4<=12'd468;

				 //(405,469)
				 imgIp1B5 <= imagWorkingBuffer[405];
				 realIp1B5 <= realWorkingBuffer[405];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=0.5145509139025557;
				 twiddleFactorimgB5 <=-0.8574598282147361;
				 stateIp1B5<=12'd405;
				 stateIp2B5<=12'd469;

				 //(406,470)
				 imgIp1B6 <= imagWorkingBuffer[406];
				 realIp1B6 <= realWorkingBuffer[406];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=0.47187949571083804;
				 twiddleFactorimgB6 <=-0.8816630544191387;
				 stateIp1B6<=12'd406;
				 stateIp2B6<=12'd470;

				 //(407,471)
				 imgIp1B7 <= imagWorkingBuffer[407];
				 realIp1B7 <= realWorkingBuffer[407];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=0.42807243057619715;
				 twiddleFactorimgB7 <=-0.9037444296816367;
				 stateIp1B7<=12'd407;
				 stateIp2B7<=12'd471;
			 end
			 8'd220 : begin

				 //(408,472)
				 imgIp1B0 <= imagWorkingBuffer[408];
				 realIp1B0 <= realWorkingBuffer[408];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd408;
				 stateIp2B0<=12'd472;

				 //(409,473)
				 imgIp1B1 <= imagWorkingBuffer[409];
				 realIp1B1 <= realWorkingBuffer[409];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=0.33747555125823137;
				 twiddleFactorimgB1 <=-0.941334293597632;
				 stateIp1B1<=12'd409;
				 stateIp2B1<=12'd473;

				 //(410,474)
				 imgIp1B2 <= imagWorkingBuffer[410];
				 realIp1B2 <= realWorkingBuffer[410];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=0.29090377170021026;
				 twiddleFactorimgB2 <=-0.9567523167521425;
				 stateIp1B2<=12'd410;
				 stateIp2B2<=12'd474;

				 //(411,475)
				 imgIp1B3 <= imagWorkingBuffer[411];
				 realIp1B3 <= realWorkingBuffer[411];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=0.24363188971769512;
				 twiddleFactorimgB3 <=-0.9698677756852141;
				 stateIp1B3<=12'd411;
				 stateIp2B3<=12'd475;

				 //(412,476)
				 imgIp1B4 <= imagWorkingBuffer[412];
				 realIp1B4 <= realWorkingBuffer[412];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=0.19577367200058793;
				 twiddleFactorimgB4 <=-0.9806491061288978;
				 stateIp1B4<=12'd412;
				 stateIp2B4<=12'd476;

				 //(413,477)
				 imgIp1B5 <= imagWorkingBuffer[413];
				 realIp1B5 <= realWorkingBuffer[413];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=0.1474442963413934;
				 twiddleFactorimgB5 <=-0.9890703612364448;
				 stateIp1B5<=12'd413;
				 stateIp2B5<=12'd477;

				 //(414,478)
				 imgIp1B6 <= imagWorkingBuffer[414];
				 realIp1B6 <= realWorkingBuffer[414];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=0.09876007444303489;
				 twiddleFactorimgB6 <=-0.9951112740271845;
				 stateIp1B6<=12'd414;
				 stateIp2B6<=12'd478;

				 //(415,479)
				 imgIp1B7 <= imagWorkingBuffer[415];
				 realIp1B7 <= realWorkingBuffer[415];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=0.04983817199774956;
				 twiddleFactorimgB7 <=-0.9987573061619738;
				 stateIp1B7<=12'd415;
				 stateIp2B7<=12'd479;
			 end
			 8'd221 : begin

				 //(416,480)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd416;
				 stateIp2B0<=12'd480;

				 //(417,481)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=-0.048247435052847135;
				 twiddleFactorimgB1 <=-0.9988354143755723;
				 stateIp1B1<=12'd417;
				 stateIp2B1<=12'd481;

				 //(418,482)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=-0.09717508231554396;
				 twiddleFactorimgB2 <=-0.9952673024755547;
				 stateIp1B2<=12'd418;
				 stateIp2B2<=12'd482;

				 //(419,483)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=-0.14586886354641898;
				 twiddleFactorimgB3 <=-0.9893039344143316;
				 stateIp1B3<=12'd419;
				 stateIp2B3<=12'd483;

				 //(420,484)
				 imgIp1B4 <= imagWorkingBuffer[420];
				 realIp1B4 <= realWorkingBuffer[420];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=-0.19421159004730484;
				 twiddleFactorimgB4 <=-0.9809596619083262;
				 stateIp1B4<=12'd420;
				 stateIp2B4<=12'd484;

				 //(421,485)
				 imgIp1B5 <= imagWorkingBuffer[421];
				 realIp1B5 <= realWorkingBuffer[421];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=-0.24208691798452725;
				 twiddleFactorimgB5 <=-0.970254566668332;
				 stateIp1B5<=12'd421;
				 stateIp2B5<=12'd485;

				 //(422,486)
				 imgIp1B6 <= imagWorkingBuffer[422];
				 realIp1B6 <= realWorkingBuffer[422];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=-0.28937962838733716;
				 twiddleFactorimgB6 <=-0.9572144120699431;
				 stateIp1B6<=12'd422;
				 stateIp2B6<=12'd486;

				 //(423,487)
				 imgIp1B7 <= imagWorkingBuffer[423];
				 realIp1B7 <= realWorkingBuffer[423];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=-0.3359759044391963;
				 twiddleFactorimgB7 <=-0.9418705811502258;
				 stateIp1B7<=12'd423;
				 stateIp2B7<=12'd487;
			 end
			 8'd222 : begin

				 //(424,488)
				 imgIp1B0 <= imagWorkingBuffer[424];
				 realIp1B0 <= realWorkingBuffer[424];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd424;
				 stateIp2B0<=12'd488;

				 //(425,489)
				 imgIp1B1 <= imagWorkingBuffer[425];
				 realIp1B1 <= realWorkingBuffer[425];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=-0.4266325364620312;
				 twiddleFactorimgB1 <=-0.9044250542924901;
				 stateIp1B1<=12'd425;
				 stateIp2B1<=12'd489;

				 //(426,490)
				 imgIp1B2 <= imagWorkingBuffer[426];
				 realIp1B2 <= realWorkingBuffer[426];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=-0.47047471400408947;
				 twiddleFactorimgB2 <=-0.8824134764852417;
				 stateIp1B2<=12'd426;
				 stateIp2B2<=12'd490;

				 //(427,491)
				 imgIp1B3 <= imagWorkingBuffer[427];
				 realIp1B3 <= realWorkingBuffer[427];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=-0.5131846254156256;
				 twiddleFactorimgB3 <=-0.858278241735758;
				 stateIp1B3<=12'd427;
				 stateIp2B3<=12'd491;

				 //(428,492)
				 imgIp1B4 <= imagWorkingBuffer[428];
				 realIp1B4 <= realWorkingBuffer[428];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=-0.5546594830553704;
				 twiddleFactorimgB4 <=-0.8320774350123606;
				 stateIp1B4<=12'd428;
				 stateIp2B4<=12'd492;

				 //(429,493)
				 imgIp1B5 <= imagWorkingBuffer[429];
				 realIp1B5 <= realWorkingBuffer[429];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=-0.594799471619386;
				 twiddleFactorimgB5 <=-0.8038741123840842;
				 stateIp1B5<=12'd429;
				 stateIp2B5<=12'd493;

				 //(430,494)
				 imgIp1B6 <= imagWorkingBuffer[430];
				 realIp1B6 <= realWorkingBuffer[430];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=-0.6335079883611737;
				 twiddleFactorimgB6 <=-0.7737361492670347;
				 stateIp1B6<=12'd430;
				 stateIp2B6<=12'd494;

				 //(431,495)
				 imgIp1B7 <= imagWorkingBuffer[431];
				 realIp1B7 <= realWorkingBuffer[431];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=-0.6706918755802994;
				 twiddleFactorimgB7 <=-0.7417360770722833;
				 stateIp1B7<=12'd431;
				 stateIp2B7<=12'd495;
			 end
			 8'd223 : begin

				 //(432,496)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd432;
				 stateIp2B0<=12'd496;

				 //(433,497)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=-0.7401316922342577;
				 twiddleFactorimgB1 <=-0.6724619529389407;
				 stateIp1B1<=12'd433;
				 stateIp2B1<=12'd497;

				 //(434,498)
				 imgIp1B2 <= imagWorkingBuffer[434];
				 realIp1B2 <= realWorkingBuffer[434];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=-0.7722205046059057;
				 twiddleFactorimgB2 <=-0.6353546193002774;
				 stateIp1B2<=12'd434;
				 stateIp2B2<=12'd498;

				 //(435,499)
				 imgIp1B3 <= imagWorkingBuffer[435];
				 realIp1B3 <= realWorkingBuffer[435];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=-0.8024508555201488;
				 twiddleFactorimgB3 <=-0.5967182119518234;
				 stateIp1B3<=12'd435;
				 stateIp2B3<=12'd499;

				 //(436,500)
				 imgIp1B4 <= imagWorkingBuffer[436];
				 realIp1B4 <= realWorkingBuffer[436];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=-0.8307499912211839;
				 twiddleFactorimgB4 <=-0.556645715052225;
				 stateIp1B4<=12'd436;
				 stateIp2B4<=12'd500;

				 //(437,501)
				 imgIp1B5 <= imagWorkingBuffer[437];
				 realIp1B5 <= realWorkingBuffer[437];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=-0.8570498057047488;
				 twiddleFactorimgB5 <=-0.5152335689194294;
				 stateIp1B5<=12'd437;
				 stateIp2B5<=12'd501;

				 //(438,502)
				 imgIp1B6 <= imagWorkingBuffer[438];
				 realIp1B6 <= realWorkingBuffer[438];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=-0.8812870046251697;
				 twiddleFactorimgB6 <=-0.4725814379329727;
				 stateIp1B6<=12'd438;
				 stateIp2B6<=12'd502;

				 //(439,503)
				 imgIp1B7 <= imagWorkingBuffer[439];
				 realIp1B7 <= realWorkingBuffer[439];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=-0.9034032576224522;
				 twiddleFactorimgB7 <=-0.42879197067708863;
				 stateIp1B7<=12'd439;
				 stateIp2B7<=12'd503;
			 end
			 8'd224 : begin

				 //(440,504)
				 imgIp1B0 <= imagWorkingBuffer[440];
				 realIp1B0 <= realWorkingBuffer[440];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd440;
				 stateIp2B0<=12'd504;

				 //(441,505)
				 imgIp1B1 <= imagWorkingBuffer[441];
				 realIp1B1 <= realWorkingBuffer[441];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=-0.9410652543348083;
				 twiddleFactorimgB1 <=-0.3382250538971983;
				 stateIp1B1<=12'd441;
				 stateIp2B1<=12'd505;

				 //(442,506)
				 imgIp1B2 <= imagWorkingBuffer[442];
				 realIp1B2 <= realWorkingBuffer[442];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=-0.9565203589527828;
				 twiddleFactorimgB2 <=-0.29166556688927076;
				 stateIp1B2<=12'd442;
				 stateIp2B2<=12'd506;

				 //(443,507)
				 imgIp1B3 <= imagWorkingBuffer[443];
				 realIp1B3 <= realWorkingBuffer[443];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=-0.9696734575896493;
				 twiddleFactorimgB3 <=-0.2444041440854362;
				 stateIp1B3<=12'd443;
				 stateIp2B3<=12'd507;

				 //(444,508)
				 imgIp1B4 <= imagWorkingBuffer[444];
				 realIp1B4 <= realWorkingBuffer[444];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=-0.9804928953920125;
				 twiddleFactorimgB4 <=-0.19655452700405607;
				 stateIp1B4<=12'd444;
				 stateIp2B4<=12'd508;

				 //(445,509)
				 imgIp1B5 <= imagWorkingBuffer[445];
				 realIp1B5 <= realWorkingBuffer[445];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=-0.988952633802198;
				 twiddleFactorimgB5 <=-0.1482318727389478;
				 stateIp1B5<=12'd445;
				 stateIp2B5<=12'd509;

				 //(446,510)
				 imgIp1B6 <= imagWorkingBuffer[446];
				 realIp1B6 <= realWorkingBuffer[446];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=-0.9950323132238454;
				 twiddleFactorimgB6 <=-0.09955247681701893;
				 stateIp1B6<=12'd446;
				 stateIp2B6<=12'd510;

				 //(447,511)
				 imgIp1B7 <= imagWorkingBuffer[447];
				 realIp1B7 <= realWorkingBuffer[447];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.9987173020202512;
				 twiddleFactorimgB7 <=-0.05063349331608835;
				 stateIp1B7<=12'd447;
				 stateIp2B7<=12'd511;
			 end
			 8'd225 : begin

				 //(0,128)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[128];
				 realIp2B0 <= realWorkingBuffer[128];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd128;

				 //(1,129)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[129];
				 realIp2B1 <= realWorkingBuffer[129];
				 twiddleFactorRealB1 <=0.9996991239756597;
				 twiddleFactorimgB1 <=-0.024528789662322983;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd129;

				 //(2,130)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[130];
				 realIp2B2 <= realWorkingBuffer[130];
				 twiddleFactorRealB2 <=0.9987966769554031;
				 twiddleFactorimgB2 <=-0.04904281907521501;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd130;

				 //(3,131)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[131];
				 realIp2B3 <= realWorkingBuffer[131];
				 twiddleFactorRealB3 <=0.9972932019885731;
				 twiddleFactorimgB3 <=-0.07352733687125546;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd131;

				 //(4,132)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[132];
				 realIp2B4 <= realWorkingBuffer[132];
				 twiddleFactorRealB4 <=0.9951896037943114;
				 twiddleFactorimgB4 <=-0.0979676094416996;
				 stateIp1B4<=12'd4;
				 stateIp2B4<=12'd132;

				 //(5,133)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[133];
				 realIp2B5 <= realWorkingBuffer[133];
				 twiddleFactorRealB5 <=0.992487148217141;
				 twiddleFactorimgB5 <=-0.12234892980245789;
				 stateIp1B5<=12'd5;
				 stateIp2B5<=12'd133;

				 //(6,134)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[134];
				 realIp2B6 <= realWorkingBuffer[134];
				 twiddleFactorRealB6 <=0.9891874614652418;
				 twiddleFactorimgB6 <=-0.14665662644405364;
				 stateIp1B6<=12'd6;
				 stateIp2B6<=12'd134;

				 //(7,135)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[135];
				 realIp2B7 <= realWorkingBuffer[135];
				 twiddleFactorRealB7 <=0.9852925291318769;
				 twiddleFactorimgB7 <=-0.17087607216023415;
				 stateIp1B7<=12'd7;
				 stateIp2B7<=12'd135;
			 end
			 8'd226 : begin

				 //(8,136)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[136];
				 realIp2B0 <= realWorkingBuffer[136];
				 twiddleFactorRealB0 <=0.9808046950005572;
				 twiddleFactorimgB0 <=-0.19499269284992174;
				 stateIp1B0<=12'd8;
				 stateIp2B0<=12'd136;

				 //(9,137)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[137];
				 realIp2B1 <= realWorkingBuffer[137];
				 twiddleFactorRealB1 <=0.9757266596346655;
				 twiddleFactorimgB1 <=-0.21899197628720918;
				 stateIp1B1<=12'd9;
				 stateIp2B1<=12'd137;

				 //(10,138)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[138];
				 realIp2B2 <= realWorkingBuffer[138];
				 twiddleFactorRealB2 <=0.9700614787523865;
				 twiddleFactorimgB2 <=-0.24285948085412118;
				 stateIp1B2<=12'd10;
				 stateIp2B2<=12'd138;

				 //(11,139)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[139];
				 realIp2B3 <= realWorkingBuffer[139];
				 twiddleFactorRealB3 <=0.9638125613879222;
				 twiddleFactorimgB3 <=-0.26658084423088774;
				 stateIp1B3<=12'd11;
				 stateIp2B3<=12'd139;

				 //(12,140)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[140];
				 realIp2B4 <= realWorkingBuffer[140];
				 twiddleFactorRealB4 <=0.9569836678400986;
				 twiddleFactorimgB4 <=-0.2901417920384994;
				 stateIp1B4<=12'd12;
				 stateIp2B4<=12'd140;

				 //(13,141)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[141];
				 realIp2B5 <= realWorkingBuffer[141];
				 twiddleFactorRealB5 <=0.9495789074095985;
				 twiddleFactorimgB5 <=-0.31352814642834403;
				 stateIp1B5<=12'd13;
				 stateIp2B5<=12'd141;

				 //(14,142)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=0.9416027359261809;
				 twiddleFactorimgB6 <=-0.3367258346137564;
				 stateIp1B6<=12'd14;
				 stateIp2B6<=12'd142;

				 //(15,143)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=0.9330599530673765;
				 twiddleFactorimgB7 <=-0.3597208973383463;
				 stateIp1B7<=12'd15;
				 stateIp2B7<=12'd143;
			 end
			 8'd227 : begin

				 //(16,144)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[144];
				 realIp2B0 <= realWorkingBuffer[144];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd144;

				 //(17,145)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[145];
				 realIp2B1 <= realWorkingBuffer[145];
				 twiddleFactorRealB1 <=0.9142954536381215;
				 twiddleFactorimgB1 <=-0.40504792735756795;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd145;

				 //(18,146)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[146];
				 realIp2B2 <= realWorkingBuffer[146];
				 twiddleFactorRealB2 <=0.9040850286436448;
				 twiddleFactorimgB2 <=-0.427352619019025;
				 stateIp1B2<=12'd18;
				 stateIp2B2<=12'd146;

				 //(19,147)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[147];
				 realIp2B3 <= realWorkingBuffer[147];
				 twiddleFactorRealB3 <=0.8933305686310005;
				 twiddleFactorimgB3 <=-0.44940015036647835;
				 stateIp1B3<=12'd19;
				 stateIp2B3<=12'd147;

				 //(20,148)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[148];
				 realIp2B4 <= realWorkingBuffer[148];
				 twiddleFactorRealB4 <=0.8820385451185335;
				 twiddleFactorimgB4 <=-0.4711772542527714;
				 stateIp1B4<=12'd20;
				 stateIp2B4<=12'd148;

				 //(21,149)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[149];
				 realIp2B5 <= realWorkingBuffer[149];
				 twiddleFactorRealB5 <=0.8702157531045263;
				 twiddleFactorimgB5 <=-0.4926708262610261;
				 stateIp1B5<=12'd21;
				 stateIp2B5<=12'd149;

				 //(22,150)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[150];
				 realIp2B6 <= realWorkingBuffer[150];
				 twiddleFactorRealB6 <=0.8578693069782943;
				 twiddleFactorimgB6 <=-0.5138679325902532;
				 stateIp1B6<=12'd22;
				 stateIp2B6<=12'd150;

				 //(23,151)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[151];
				 realIp2B7 <= realWorkingBuffer[151];
				 twiddleFactorRealB7 <=0.8450066362390881;
				 twiddleFactorimgB7 <=-0.5347558178382928;
				 stateIp1B7<=12'd23;
				 stateIp2B7<=12'd151;
			 end
			 8'd228 : begin

				 //(24,152)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[152];
				 realIp2B0 <= realWorkingBuffer[152];
				 twiddleFactorRealB0 <=0.8316354810253763;
				 twiddleFactorimgB0 <=-0.5553219126774045;
				 stateIp1B0<=12'd24;
				 stateIp2B0<=12'd152;

				 //(25,153)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[153];
				 realIp2B1 <= realWorkingBuffer[153];
				 twiddleFactorRealB1 <=0.8177638874572022;
				 twiddleFactorimgB1 <=-0.5755538414178853;
				 stateIp1B1<=12'd25;
				 stateIp2B1<=12'd153;

				 //(26,154)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[154];
				 realIp2B2 <= realWorkingBuffer[154];
				 twiddleFactorRealB2 <=0.8034002027944137;
				 twiddleFactorimgB2 <=-0.595439429455167;
				 stateIp1B2<=12'd26;
				 stateIp2B2<=12'd154;

				 //(27,155)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[155];
				 realIp2B3 <= realWorkingBuffer[155];
				 twiddleFactorRealB3 <=0.7885530704136834;
				 twiddleFactorimgB3 <=-0.6149667105959089;
				 stateIp1B3<=12'd27;
				 stateIp2B3<=12'd155;

				 //(28,156)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=0.7732314246073383;
				 twiddleFactorimgB4 <=-0.6341239342586794;
				 stateIp1B4<=12'd28;
				 stateIp2B4<=12'd156;

				 //(29,157)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=0.7574444852071317;
				 twiddleFactorimgB5 <=-0.6528995725448925;
				 stateIp1B5<=12'd29;
				 stateIp2B5<=12'd157;

				 //(30,158)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=0.7412017520361899;
				 twiddleFactorimgB6 <=-0.671282327175744;
				 stateIp1B6<=12'd30;
				 stateIp2B6<=12'd158;

				 //(31,159)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=0.7245129991924747;
				 twiddleFactorimgB7 <=-0.6892611362909744;
				 stateIp1B7<=12'd31;
				 stateIp2B7<=12'd159;
			 end
			 8'd229 : begin

				 //(32,160)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[160];
				 realIp2B0 <= realWorkingBuffer[160];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd160;

				 //(33,161)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[161];
				 realIp2B1 <= realWorkingBuffer[161];
				 twiddleFactorRealB1 <=0.6898378668017409;
				 twiddleFactorimgB1 <=-0.7239638924189684;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd161;

				 //(34,162)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[162];
				 realIp2B2 <= realWorkingBuffer[162];
				 twiddleFactorRealB2 <=0.6718723530866767;
				 twiddleFactorimgB2 <=-0.7406669569771369;
				 stateIp1B2<=12'd34;
				 stateIp2B2<=12'd162;

				 //(35,163)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[163];
				 realIp2B3 <= realWorkingBuffer[163];
				 twiddleFactorRealB3 <=0.6535025388066908;
				 twiddleFactorimgB3 <=-0.7569243236765545;
				 stateIp1B3<=12'd35;
				 stateIp2B3<=12'd163;

				 //(36,164)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[164];
				 realIp2B4 <= realWorkingBuffer[164];
				 twiddleFactorRealB4 <=0.6347394780351602;
				 twiddleFactorimgB4 <=-0.7727262096135037;
				 stateIp1B4<=12'd36;
				 stateIp2B4<=12'd164;

				 //(37,165)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[165];
				 realIp2B5 <= realWorkingBuffer[165];
				 twiddleFactorRealB5 <=0.6155944614823434;
				 twiddleFactorimgB5 <=-0.7880631059707488;
				 stateIp1B5<=12'd37;
				 stateIp2B5<=12'd165;

				 //(38,166)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[166];
				 realIp2B6 <= realWorkingBuffer[166];
				 twiddleFactorRealB6 <=0.5960790097011732;
				 twiddleFactorimgB6 <=-0.8029257837394864;
				 stateIp1B6<=12'd38;
				 stateIp2B6<=12'd166;

				 //(39,167)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[167];
				 realIp2B7 <= realWorkingBuffer[167];
				 twiddleFactorRealB7 <=0.57620486615474;
				 twiddleFactorimgB7 <=-0.8173052992729205;
				 stateIp1B7<=12'd39;
				 stateIp2B7<=12'd167;
			 end
			 8'd230 : begin

				 //(40,168)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[168];
				 realIp2B0 <= realWorkingBuffer[168];
				 twiddleFactorRealB0 <=0.5559839901496385;
				 twiddleFactorimgB0 <=-0.8311929996681197;
				 stateIp1B0<=12'd40;
				 stateIp2B0<=12'd168;

				 //(41,169)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[169];
				 realIp2B1 <= realWorkingBuffer[169];
				 twiddleFactorRealB1 <=0.5354285496394308;
				 twiddleFactorimgB1 <=-0.8445805279729196;
				 stateIp1B1<=12'd41;
				 stateIp2B1<=12'd169;

				 //(42,170)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[170];
				 realIp2B2 <= realWorkingBuffer[170];
				 twiddleFactorRealB2 <=0.5145509139025557;
				 twiddleFactorimgB2 <=-0.8574598282147361;
				 stateIp1B2<=12'd42;
				 stateIp2B2<=12'd170;

				 //(43,171)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[171];
				 realIp2B3 <= realWorkingBuffer[171];
				 twiddleFactorRealB3 <=0.49336364609908906;
				 twiddleFactorimgB3 <=-0.8698231502482633;
				 stateIp1B3<=12'd43;
				 stateIp2B3<=12'd171;

				 //(44,172)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=0.47187949571083804;
				 twiddleFactorimgB4 <=-0.8816630544191387;
				 stateIp1B4<=12'd44;
				 stateIp2B4<=12'd172;

				 //(45,173)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=0.4501113908693125;
				 twiddleFactorimgB5 <=-0.8929724160407716;
				 stateIp1B5<=12'd45;
				 stateIp2B5<=12'd173;

				 //(46,174)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=0.42807243057619715;
				 twiddleFactorimgB6 <=-0.9037444296816367;
				 stateIp1B6<=12'd46;
				 stateIp2B6<=12'd174;

				 //(47,175)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=0.4057758768209987;
				 twiddleFactorimgB7 <=-0.9139726132604574;
				 stateIp1B7<=12'd47;
				 stateIp2B7<=12'd175;
			 end
			 8'd231 : begin

				 //(48,176)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[176];
				 realIp2B0 <= realWorkingBuffer[176];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd176;

				 //(49,177)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[177];
				 realIp2B1 <= realWorkingBuffer[177];
				 twiddleFactorRealB1 <=0.36046380384564436;
				 twiddleFactorimgB1 <=-0.9327732018648096;
				 stateIp1B1<=12'd49;
				 stateIp2B1<=12'd177;

				 //(50,178)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[178];
				 realIp2B2 <= realWorkingBuffer[178];
				 twiddleFactorRealB2 <=0.33747555125823137;
				 twiddleFactorimgB2 <=-0.941334293597632;
				 stateIp1B2<=12'd50;
				 stateIp2B2<=12'd178;

				 //(51,179)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[179];
				 realIp2B3 <= realWorkingBuffer[179];
				 twiddleFactorRealB3 <=0.31428422206646894;
				 twiddleFactorimgB3 <=-0.9493289354907889;
				 stateIp1B3<=12'd51;
				 stateIp2B3<=12'd179;

				 //(52,180)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[180];
				 realIp2B4 <= realWorkingBuffer[180];
				 twiddleFactorRealB4 <=0.29090377170021026;
				 twiddleFactorimgB4 <=-0.9567523167521425;
				 stateIp1B4<=12'd52;
				 stateIp2B4<=12'd180;

				 //(53,181)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[181];
				 realIp2B5 <= realWorkingBuffer[181];
				 twiddleFactorRealB5 <=0.2673482693933619;
				 twiddleFactorimgB5 <=-0.9635999703468107;
				 stateIp1B5<=12'd53;
				 stateIp2B5<=12'd181;

				 //(54,182)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[182];
				 realIp2B6 <= realWorkingBuffer[182];
				 twiddleFactorRealB6 <=0.24363188971769512;
				 twiddleFactorimgB6 <=-0.9698677756852141;
				 stateIp1B6<=12'd54;
				 stateIp2B6<=12'd182;

				 //(55,183)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[183];
				 realIp2B7 <= realWorkingBuffer[183];
				 twiddleFactorRealB7 <=0.21976890405326657;
				 twiddleFactorimgB7 <=-0.9755519611026499;
				 stateIp1B7<=12'd55;
				 stateIp2B7<=12'd183;
			 end
			 8'd232 : begin

				 //(56,184)
				 imgIp1B0 <= imagWorkingBuffer[56];
				 realIp1B0 <= realWorkingBuffer[56];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=0.19577367200058793;
				 twiddleFactorimgB0 <=-0.9806491061288978;
				 stateIp1B0<=12'd56;
				 stateIp2B0<=12'd184;

				 //(57,185)
				 imgIp1B1 <= imagWorkingBuffer[57];
				 realIp1B1 <= realWorkingBuffer[57];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=0.171660632739705;
				 twiddleFactorimgB1 <=-0.9851561435464959;
				 stateIp1B1<=12'd57;
				 stateIp2B1<=12'd185;

				 //(58,186)
				 imgIp1B2 <= imagWorkingBuffer[58];
				 realIp1B2 <= realWorkingBuffer[58];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=0.1474442963413934;
				 twiddleFactorimgB2 <=-0.9890703612364448;
				 stateIp1B2<=12'd58;
				 stateIp2B2<=12'd186;

				 //(59,187)
				 imgIp1B3 <= imagWorkingBuffer[59];
				 realIp1B3 <= realWorkingBuffer[59];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=0.12313923503569187;
				 twiddleFactorimgB3 <=-0.9923894038102304;
				 stateIp1B3<=12'd59;
				 stateIp2B3<=12'd187;

				 //(60,188)
				 imgIp1B4 <= imagWorkingBuffer[60];
				 realIp1B4 <= realWorkingBuffer[60];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=0.09876007444303489;
				 twiddleFactorimgB4 <=-0.9951112740271845;
				 stateIp1B4<=12'd60;
				 stateIp2B4<=12'd188;

				 //(61,189)
				 imgIp1B5 <= imagWorkingBuffer[61];
				 realIp1B5 <= realWorkingBuffer[61];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=0.07432148477325375;
				 twiddleFactorimgB5 <=-0.9972343339963275;
				 stateIp1B5<=12'd61;
				 stateIp2B5<=12'd189;

				 //(62,190)
				 imgIp1B6 <= imagWorkingBuffer[62];
				 realIp1B6 <= realWorkingBuffer[62];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=0.04983817199774956;
				 twiddleFactorimgB6 <=-0.9987573061619738;
				 stateIp1B6<=12'd62;
				 stateIp2B6<=12'd190;

				 //(63,191)
				 imgIp1B7 <= imagWorkingBuffer[63];
				 realIp1B7 <= realWorkingBuffer[63];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=0.025324869000143;
				 twiddleFactorimgB7 <=-0.9996792740725026;
				 stateIp1B7<=12'd63;
				 stateIp2B7<=12'd191;
			 end
			 8'd233 : begin

				 //(64,192)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[192];
				 realIp2B0 <= realWorkingBuffer[192];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd192;

				 //(65,193)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[193];
				 realIp2B1 <= realWorkingBuffer[193];
				 twiddleFactorRealB1 <=-0.023732694769906075;
				 twiddleFactorimgB1 <=-0.9997183399332826;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd193;

				 //(66,194)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[194];
				 realIp2B2 <= realWorkingBuffer[194];
				 twiddleFactorRealB2 <=-0.048247435052847135;
				 twiddleFactorimgB2 <=-0.9988354143755723;
				 stateIp1B2<=12'd66;
				 stateIp2B2<=12'd194;

				 //(67,195)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[195];
				 realIp2B3 <= realWorkingBuffer[195];
				 twiddleFactorRealB3 <=-0.07273314234290135;
				 twiddleFactorimgB3 <=-0.9973514375609669;
				 stateIp1B3<=12'd67;
				 stateIp2B3<=12'd195;

				 //(68,196)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[196];
				 realIp2B4 <= realWorkingBuffer[196];
				 twiddleFactorRealB4 <=-0.09717508231554396;
				 twiddleFactorimgB4 <=-0.9952673024755547;
				 stateIp1B4<=12'd68;
				 stateIp2B4<=12'd196;

				 //(69,197)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[197];
				 realIp2B5 <= realWorkingBuffer[197];
				 twiddleFactorRealB5 <=-0.12155854698332229;
				 twiddleFactorimgB5 <=-0.9925842632518931;
				 stateIp1B5<=12'd69;
				 stateIp2B5<=12'd197;

				 //(70,198)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[198];
				 realIp2B6 <= realWorkingBuffer[198];
				 twiddleFactorRealB6 <=-0.14586886354641898;
				 twiddleFactorimgB6 <=-0.9893039344143316;
				 stateIp1B6<=12'd70;
				 stateIp2B6<=12'd198;

				 //(71,199)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[199];
				 realIp2B7 <= realWorkingBuffer[199];
				 twiddleFactorRealB7 <=-0.17009140322203772;
				 twiddleFactorimgB7 <=-0.9854282899074687;
				 stateIp1B7<=12'd71;
				 stateIp2B7<=12'd199;
			 end
			 8'd234 : begin

				 //(72,200)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[200];
				 realIp2B0 <= realWorkingBuffer[200];
				 twiddleFactorRealB0 <=-0.19421159004730484;
				 twiddleFactorimgB0 <=-0.9809596619083262;
				 stateIp1B0<=12'd72;
				 stateIp2B0<=12'd200;

				 //(73,201)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[201];
				 realIp2B1 <= realWorkingBuffer[201];
				 twiddleFactorRealB1 <=-0.21821490965038332;
				 twiddleFactorimgB1 <=-0.9759007394229574;
				 stateIp1B1<=12'd73;
				 stateIp2B1<=12'd201;

				 //(74,202)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[202];
				 realIp2B2 <= realWorkingBuffer[202];
				 twiddleFactorRealB2 <=-0.24208691798452725;
				 twiddleFactorimgB2 <=-0.970254566668332;
				 stateIp1B2<=12'd74;
				 stateIp2B2<=12'd202;

				 //(75,203)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[203];
				 realIp2B3 <= realWorkingBuffer[203];
				 twiddleFactorRealB3 <=-0.26581325001981504;
				 twiddleFactorimgB3 <=-0.9640245412404724;
				 stateIp1B3<=12'd75;
				 stateIp2B3<=12'd203;

				 //(76,204)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=-0.28937962838733716;
				 twiddleFactorimgB4 <=-0.9572144120699431;
				 stateIp1B4<=12'd76;
				 stateIp2B4<=12'd204;

				 //(77,205)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=-0.3127718719706306;
				 twiddleFactorimgB5 <=-0.9498282771659241;
				 stateIp1B5<=12'd77;
				 stateIp2B5<=12'd205;

				 //(78,206)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=-0.3359759044391963;
				 twiddleFactorimgB6 <=-0.9418705811502258;
				 stateIp1B6<=12'd78;
				 stateIp2B6<=12'd206;

				 //(79,207)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=-0.3589777627189582;
				 twiddleFactorimgB7 <=-0.9333461125827285;
				 stateIp1B7<=12'd79;
				 stateIp2B7<=12'd207;
			 end
			 8'd235 : begin

				 //(80,208)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[208];
				 realIp2B0 <= realWorkingBuffer[208];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd208;

				 //(81,209)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[209];
				 realIp2B1 <= realWorkingBuffer[209];
				 twiddleFactorRealB1 <=-0.40431972103853064;
				 twiddleFactorimgB1 <=-0.9146177142278213;
				 stateIp1B1<=12'd81;
				 stateIp2B1<=12'd209;

				 //(82,210)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[210];
				 realIp2B2 <= realWorkingBuffer[210];
				 twiddleFactorRealB2 <=-0.4266325364620312;
				 twiddleFactorimgB2 <=-0.9044250542924901;
				 stateIp1B2<=12'd82;
				 stateIp2B2<=12'd210;

				 //(83,211)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[211];
				 realIp2B3 <= realWorkingBuffer[211];
				 twiddleFactorRealB3 <=-0.44868862488268174;
				 twiddleFactorimgB3 <=-0.8936881547278603;
				 stateIp1B3<=12'd83;
				 stateIp2B3<=12'd211;

				 //(84,212)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[212];
				 realIp2B4 <= realWorkingBuffer[212];
				 twiddleFactorRealB4 <=-0.47047471400408947;
				 twiddleFactorimgB4 <=-0.8824134764852417;
				 stateIp1B4<=12'd84;
				 stateIp2B4<=12'd212;

				 //(85,213)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[213];
				 realIp2B5 <= realWorkingBuffer[213];
				 twiddleFactorRealB5 <=-0.49197769400249325;
				 twiddleFactorimgB5 <=-0.8706078041253645;
				 stateIp1B5<=12'd85;
				 stateIp2B5<=12'd213;

				 //(86,214)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[214];
				 realIp2B6 <= realWorkingBuffer[214];
				 twiddleFactorRealB6 <=-0.5131846254156256;
				 twiddleFactorimgB6 <=-0.858278241735758;
				 stateIp1B6<=12'd86;
				 stateIp2B6<=12'd214;

				 //(87,215)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[215];
				 realIp2B7 <= realWorkingBuffer[215];
				 twiddleFactorRealB7 <=-0.5340827469290627;
				 twiddleFactorimgB7 <=-0.8454322086558489;
				 stateIp1B7<=12'd87;
				 stateIp2B7<=12'd215;
			 end
			 8'd236 : begin

				 //(88,216)
				 imgIp1B0 <= imagWorkingBuffer[88];
				 realIp1B0 <= realWorkingBuffer[88];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=-0.5546594830553704;
				 twiddleFactorimgB0 <=-0.8320774350123606;
				 stateIp1B0<=12'd88;
				 stateIp2B0<=12'd216;

				 //(89,217)
				 imgIp1B1 <= imagWorkingBuffer[89];
				 realIp1B1 <= realWorkingBuffer[89];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=-0.5749024517014297;
				 twiddleFactorimgB1 <=-0.8182219570676927;
				 stateIp1B1<=12'd89;
				 stateIp2B1<=12'd217;

				 //(90,218)
				 imgIp1B2 <= imagWorkingBuffer[90];
				 realIp1B2 <= realWorkingBuffer[90];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=-0.594799471619386;
				 twiddleFactorimgB2 <=-0.8038741123840842;
				 stateIp1B2<=12'd90;
				 stateIp2B2<=12'd218;

				 //(91,219)
				 imgIp1B3 <= imagWorkingBuffer[91];
				 realIp1B3 <= realWorkingBuffer[91];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=-0.6143385697367412;
				 twiddleFactorimgB3 <=-0.7890425348064674;
				 stateIp1B3<=12'd91;
				 stateIp2B3<=12'd219;

				 //(92,220)
				 imgIp1B4 <= imagWorkingBuffer[92];
				 realIp1B4 <= realWorkingBuffer[92];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=-0.6335079883611737;
				 twiddleFactorimgB4 <=-0.7737361492670347;
				 stateIp1B4<=12'd92;
				 stateIp2B4<=12'd220;

				 //(93,221)
				 imgIp1B5 <= imagWorkingBuffer[93];
				 realIp1B5 <= realWorkingBuffer[93];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=-0.652296192255755;
				 twiddleFactorimgB5 <=-0.757964166414642;
				 stateIp1B5<=12'd93;
				 stateIp2B5<=12'd221;

				 //(94,222)
				 imgIp1B6 <= imagWorkingBuffer[94];
				 realIp1B6 <= realWorkingBuffer[94];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=-0.6706918755802994;
				 twiddleFactorimgB6 <=-0.7417360770722833;
				 stateIp1B6<=12'd94;
				 stateIp2B6<=12'd222;

				 //(95,223)
				 imgIp1B7 <= imagWorkingBuffer[95];
				 realIp1B7 <= realWorkingBuffer[95];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=-0.6886839686946801;
				 twiddleFactorimgB7 <=-0.725061646525966;
				 stateIp1B7<=12'd95;
				 stateIp2B7<=12'd223;
			 end
			 8'd237 : begin

				 //(96,224)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[224];
				 realIp2B0 <= realWorkingBuffer[224];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd224;

				 //(97,225)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[225];
				 realIp2B1 <= realWorkingBuffer[225];
				 twiddleFactorRealB1 <=-0.7234143265536556;
				 twiddleFactorimgB1 <=-0.6904141598612539;
				 stateIp1B1<=12'd97;
				 stateIp2B1<=12'd225;

				 //(98,226)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[226];
				 realIp2B2 <= realWorkingBuffer[226];
				 twiddleFactorRealB2 <=-0.7401316922342577;
				 twiddleFactorimgB2 <=-0.6724619529389407;
				 stateIp1B2<=12'd98;
				 stateIp2B2<=12'd226;

				 //(99,227)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[227];
				 realIp2B3 <= realWorkingBuffer[227];
				 twiddleFactorRealB3 <=-0.7564036821527641;
				 twiddleFactorimgB3 <=-0.6541050906587872;
				 stateIp1B3<=12'd99;
				 stateIp2B3<=12'd227;

				 //(100,228)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[228];
				 realIp2B4 <= realWorkingBuffer[228];
				 twiddleFactorRealB4 <=-0.7722205046059057;
				 twiddleFactorimgB4 <=-0.6353546193002774;
				 stateIp1B4<=12'd100;
				 stateIp2B4<=12'd228;

				 //(101,229)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[229];
				 realIp2B5 <= realWorkingBuffer[229];
				 twiddleFactorRealB5 <=-0.7875726417883676;
				 twiddleFactorimgB5 <=-0.6162218219979649;
				 stateIp1B5<=12'd101;
				 stateIp2B5<=12'd229;

				 //(102,230)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[230];
				 realIp2B6 <= realWorkingBuffer[230];
				 twiddleFactorRealB6 <=-0.8024508555201488;
				 twiddleFactorimgB6 <=-0.5967182119518234;
				 stateIp1B6<=12'd102;
				 stateIp2B6<=12'd230;

				 //(103,231)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[231];
				 realIp2B7 <= realWorkingBuffer[231];
				 twiddleFactorRealB7 <=-0.8168461928056552;
				 twiddleFactorimgB7 <=-0.5768555254991551;
				 stateIp1B7<=12'd103;
				 stateIp2B7<=12'd231;
			 end
			 8'd238 : begin

				 //(104,232)
				 imgIp1B0 <= imagWorkingBuffer[104];
				 realIp1B0 <= realWorkingBuffer[104];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=-0.8307499912211839;
				 twiddleFactorimgB0 <=-0.556645715052225;
				 stateIp1B0<=12'd104;
				 stateIp2B0<=12'd232;

				 //(105,233)
				 imgIp1B1 <= imagWorkingBuffer[105];
				 realIp1B1 <= realWorkingBuffer[105];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=-0.8441538841275539;
				 twiddleFactorimgB1 <=-0.5361009419058731;
				 stateIp1B1<=12'd105;
				 stateIp2B1<=12'd233;

				 //(106,234)
				 imgIp1B2 <= imagWorkingBuffer[106];
				 realIp1B2 <= realWorkingBuffer[106];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=-0.8570498057047488;
				 twiddleFactorimgB2 <=-0.5152335689194294;
				 stateIp1B2<=12'd106;
				 stateIp2B2<=12'd234;

				 //(107,235)
				 imgIp1B3 <= imagWorkingBuffer[107];
				 realIp1B3 <= realWorkingBuffer[107];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=-0.8694299958055394;
				 twiddleFactorimgB3 <=-0.4940561530773398;
				 stateIp1B3<=12'd107;
				 stateIp2B3<=12'd235;

				 //(108,236)
				 imgIp1B4 <= imagWorkingBuffer[108];
				 realIp1B4 <= realWorkingBuffer[108];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=-0.8812870046251697;
				 twiddleFactorimgB4 <=-0.4725814379329727;
				 stateIp1B4<=12'd108;
				 stateIp2B4<=12'd236;

				 //(109,237)
				 imgIp1B5 <= imagWorkingBuffer[109];
				 realIp1B5 <= realWorkingBuffer[109];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=-0.8926136971842913;
				 twiddleFactorimgB5 <=-0.4508223459401611;
				 stateIp1B5<=12'd109;
				 stateIp2B5<=12'd237;

				 //(110,238)
				 imgIp1B6 <= imagWorkingBuffer[110];
				 realIp1B6 <= realWorkingBuffer[110];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=-0.9034032576224522;
				 twiddleFactorimgB6 <=-0.42879197067708863;
				 stateIp1B6<=12'd110;
				 stateIp2B6<=12'd238;

				 //(111,239)
				 imgIp1B7 <= imagWorkingBuffer[111];
				 realIp1B7 <= realWorkingBuffer[111];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=-0.913649193299554;
				 twiddleFactorimgB7 <=-0.40650356896720385;
				 stateIp1B7<=12'd111;
				 stateIp2B7<=12'd239;
			 end
			 8'd239 : begin

				 //(112,240)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd112;
				 stateIp2B0<=12'd240;

				 //(113,241)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=-0.9324858591568669;
				 twiddleFactorimgB1 <=-0.36120648176974873;
				 stateIp1B1<=12'd113;
				 stateIp2B1<=12'd241;

				 //(114,242)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=-0.9410652543348083;
				 twiddleFactorimgB2 <=-0.3382250538971983;
				 stateIp1B2<=12'd114;
				 stateIp2B2<=12'd242;

				 //(115,243)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=-0.9490783615680114;
				 twiddleFactorimgB3 <=-0.31504009840555053;
				 stateIp1B3<=12'd115;
				 stateIp2B3<=12'd243;

				 //(116,244)
				 imgIp1B4 <= imagWorkingBuffer[116];
				 realIp1B4 <= realWorkingBuffer[116];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=-0.9565203589527828;
				 twiddleFactorimgB4 <=-0.29166556688927076;
				 stateIp1B4<=12'd116;
				 stateIp2B4<=12'd244;

				 //(117,245)
				 imgIp1B5 <= imagWorkingBuffer[117];
				 realIp1B5 <= realWorkingBuffer[117];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=-0.9633867682519496;
				 twiddleFactorimgB5 <=-0.2681155250205858;
				 stateIp1B5<=12'd117;
				 stateIp2B5<=12'd245;

				 //(118,246)
				 imgIp1B6 <= imagWorkingBuffer[118];
				 realIp1B6 <= realWorkingBuffer[118];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=-0.9696734575896493;
				 twiddleFactorimgB6 <=-0.2444041440854362;
				 stateIp1B6<=12'd118;
				 stateIp2B6<=12'd246;

				 //(119,247)
				 imgIp1B7 <= imagWorkingBuffer[119];
				 realIp1B7 <= realWorkingBuffer[119];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=-0.9753766439376932;
				 twiddleFactorimgB7 <=-0.22054569245587763;
				 stateIp1B7<=12'd119;
				 stateIp2B7<=12'd247;
			 end
			 8'd240 : begin

				 //(120,248)
				 imgIp1B0 <= imagWorkingBuffer[120];
				 realIp1B0 <= realWorkingBuffer[120];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=-0.9804928953920125;
				 twiddleFactorimgB0 <=-0.19655452700405607;
				 stateIp1B0<=12'd120;
				 stateIp2B0<=12'd248;

				 //(121,249)
				 imgIp1B1 <= imagWorkingBuffer[121];
				 realIp1B1 <= realWorkingBuffer[121];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=-0.9850191332378129;
				 twiddleFactorimgB1 <=-0.17244508446293239;
				 stateIp1B1<=12'd121;
				 stateIp2B1<=12'd249;

				 //(122,250)
				 imgIp1B2 <= imagWorkingBuffer[122];
				 realIp1B2 <= realWorkingBuffer[122];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=-0.988952633802198;
				 twiddleFactorimgB2 <=-0.1482318727389478;
				 stateIp1B2<=12'd122;
				 stateIp2B2<=12'd250;

				 //(123,251)
				 imgIp1B3 <= imagWorkingBuffer[123];
				 realIp1B3 <= realWorkingBuffer[123];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=-0.9922910300931447;
				 twiddleFactorimgB3 <=-0.12392946218186328;
				 stateIp1B3<=12'd123;
				 stateIp2B3<=12'd251;

				 //(124,252)
				 imgIp1B4 <= imagWorkingBuffer[124];
				 realIp1B4 <= realWorkingBuffer[124];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=-0.9950323132238454;
				 twiddleFactorimgB4 <=-0.09955247681701893;
				 stateIp1B4<=12'd124;
				 stateIp2B4<=12'd252;

				 //(125,253)
				 imgIp1B5 <= imagWorkingBuffer[125];
				 realIp1B5 <= realWorkingBuffer[125];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=-0.9971748336215606;
				 twiddleFactorimgB5 <=-0.07511558554529872;
				 stateIp1B5<=12'd125;
				 stateIp2B5<=12'd253;

				 //(126,254)
				 imgIp1B6 <= imagWorkingBuffer[126];
				 realIp1B6 <= realWorkingBuffer[126];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=-0.9987173020202512;
				 twiddleFactorimgB6 <=-0.05063349331608835;
				 stateIp1B6<=12'd126;
				 stateIp2B6<=12'd254;

				 //(127,255)
				 imgIp1B7 <= imagWorkingBuffer[127];
				 realIp1B7 <= realWorkingBuffer[127];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=-0.9996587902363985;
				 twiddleFactorimgB7 <=-0.026120932278543618;
				 stateIp1B7<=12'd127;
				 stateIp2B7<=12'd255;
			 end
			 8'd241 : begin

				 //(256,384)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[384];
				 realIp2B0 <= realWorkingBuffer[384];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd256;
				 stateIp2B0<=12'd384;

				 //(257,385)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[385];
				 realIp2B1 <= realWorkingBuffer[385];
				 twiddleFactorRealB1 <=0.9996991239756597;
				 twiddleFactorimgB1 <=-0.024528789662322983;
				 stateIp1B1<=12'd257;
				 stateIp2B1<=12'd385;

				 //(258,386)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[386];
				 realIp2B2 <= realWorkingBuffer[386];
				 twiddleFactorRealB2 <=0.9987966769554031;
				 twiddleFactorimgB2 <=-0.04904281907521501;
				 stateIp1B2<=12'd258;
				 stateIp2B2<=12'd386;

				 //(259,387)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[387];
				 realIp2B3 <= realWorkingBuffer[387];
				 twiddleFactorRealB3 <=0.9972932019885731;
				 twiddleFactorimgB3 <=-0.07352733687125546;
				 stateIp1B3<=12'd259;
				 stateIp2B3<=12'd387;

				 //(260,388)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[388];
				 realIp2B4 <= realWorkingBuffer[388];
				 twiddleFactorRealB4 <=0.9951896037943114;
				 twiddleFactorimgB4 <=-0.0979676094416996;
				 stateIp1B4<=12'd260;
				 stateIp2B4<=12'd388;

				 //(261,389)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[389];
				 realIp2B5 <= realWorkingBuffer[389];
				 twiddleFactorRealB5 <=0.992487148217141;
				 twiddleFactorimgB5 <=-0.12234892980245789;
				 stateIp1B5<=12'd261;
				 stateIp2B5<=12'd389;

				 //(262,390)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[390];
				 realIp2B6 <= realWorkingBuffer[390];
				 twiddleFactorRealB6 <=0.9891874614652418;
				 twiddleFactorimgB6 <=-0.14665662644405364;
				 stateIp1B6<=12'd262;
				 stateIp2B6<=12'd390;

				 //(263,391)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[391];
				 realIp2B7 <= realWorkingBuffer[391];
				 twiddleFactorRealB7 <=0.9852925291318769;
				 twiddleFactorimgB7 <=-0.17087607216023415;
				 stateIp1B7<=12'd263;
				 stateIp2B7<=12'd391;
			 end
			 8'd242 : begin

				 //(264,392)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[392];
				 realIp2B0 <= realWorkingBuffer[392];
				 twiddleFactorRealB0 <=0.9808046950005572;
				 twiddleFactorimgB0 <=-0.19499269284992174;
				 stateIp1B0<=12'd264;
				 stateIp2B0<=12'd392;

				 //(265,393)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[393];
				 realIp2B1 <= realWorkingBuffer[393];
				 twiddleFactorRealB1 <=0.9757266596346655;
				 twiddleFactorimgB1 <=-0.21899197628720918;
				 stateIp1B1<=12'd265;
				 stateIp2B1<=12'd393;

				 //(266,394)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[394];
				 realIp2B2 <= realWorkingBuffer[394];
				 twiddleFactorRealB2 <=0.9700614787523865;
				 twiddleFactorimgB2 <=-0.24285948085412118;
				 stateIp1B2<=12'd266;
				 stateIp2B2<=12'd394;

				 //(267,395)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[395];
				 realIp2B3 <= realWorkingBuffer[395];
				 twiddleFactorRealB3 <=0.9638125613879222;
				 twiddleFactorimgB3 <=-0.26658084423088774;
				 stateIp1B3<=12'd267;
				 stateIp2B3<=12'd395;

				 //(268,396)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=0.9569836678400986;
				 twiddleFactorimgB4 <=-0.2901417920384994;
				 stateIp1B4<=12'd268;
				 stateIp2B4<=12'd396;

				 //(269,397)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=0.9495789074095985;
				 twiddleFactorimgB5 <=-0.31352814642834403;
				 stateIp1B5<=12'd269;
				 stateIp2B5<=12'd397;

				 //(270,398)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=0.9416027359261809;
				 twiddleFactorimgB6 <=-0.3367258346137564;
				 stateIp1B6<=12'd270;
				 stateIp2B6<=12'd398;

				 //(271,399)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=0.9330599530673765;
				 twiddleFactorimgB7 <=-0.3597208973383463;
				 stateIp1B7<=12'd271;
				 stateIp2B7<=12'd399;
			 end
			 8'd243 : begin

				 //(272,400)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[400];
				 realIp2B0 <= realWorkingBuffer[400];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd272;
				 stateIp2B0<=12'd400;

				 //(273,401)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[401];
				 realIp2B1 <= realWorkingBuffer[401];
				 twiddleFactorRealB1 <=0.9142954536381215;
				 twiddleFactorimgB1 <=-0.40504792735756795;
				 stateIp1B1<=12'd273;
				 stateIp2B1<=12'd401;

				 //(274,402)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[402];
				 realIp2B2 <= realWorkingBuffer[402];
				 twiddleFactorRealB2 <=0.9040850286436448;
				 twiddleFactorimgB2 <=-0.427352619019025;
				 stateIp1B2<=12'd274;
				 stateIp2B2<=12'd402;

				 //(275,403)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[403];
				 realIp2B3 <= realWorkingBuffer[403];
				 twiddleFactorRealB3 <=0.8933305686310005;
				 twiddleFactorimgB3 <=-0.44940015036647835;
				 stateIp1B3<=12'd275;
				 stateIp2B3<=12'd403;

				 //(276,404)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[404];
				 realIp2B4 <= realWorkingBuffer[404];
				 twiddleFactorRealB4 <=0.8820385451185335;
				 twiddleFactorimgB4 <=-0.4711772542527714;
				 stateIp1B4<=12'd276;
				 stateIp2B4<=12'd404;

				 //(277,405)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[405];
				 realIp2B5 <= realWorkingBuffer[405];
				 twiddleFactorRealB5 <=0.8702157531045263;
				 twiddleFactorimgB5 <=-0.4926708262610261;
				 stateIp1B5<=12'd277;
				 stateIp2B5<=12'd405;

				 //(278,406)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[406];
				 realIp2B6 <= realWorkingBuffer[406];
				 twiddleFactorRealB6 <=0.8578693069782943;
				 twiddleFactorimgB6 <=-0.5138679325902532;
				 stateIp1B6<=12'd278;
				 stateIp2B6<=12'd406;

				 //(279,407)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[407];
				 realIp2B7 <= realWorkingBuffer[407];
				 twiddleFactorRealB7 <=0.8450066362390881;
				 twiddleFactorimgB7 <=-0.5347558178382928;
				 stateIp1B7<=12'd279;
				 stateIp2B7<=12'd407;
			 end
			 8'd244 : begin

				 //(280,408)
				 imgIp1B0 <= imagWorkingBuffer[280];
				 realIp1B0 <= realWorkingBuffer[280];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=0.8316354810253763;
				 twiddleFactorimgB0 <=-0.5553219126774045;
				 stateIp1B0<=12'd280;
				 stateIp2B0<=12'd408;

				 //(281,409)
				 imgIp1B1 <= imagWorkingBuffer[281];
				 realIp1B1 <= realWorkingBuffer[281];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=0.8177638874572022;
				 twiddleFactorimgB1 <=-0.5755538414178853;
				 stateIp1B1<=12'd281;
				 stateIp2B1<=12'd409;

				 //(282,410)
				 imgIp1B2 <= imagWorkingBuffer[282];
				 realIp1B2 <= realWorkingBuffer[282];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=0.8034002027944137;
				 twiddleFactorimgB2 <=-0.595439429455167;
				 stateIp1B2<=12'd282;
				 stateIp2B2<=12'd410;

				 //(283,411)
				 imgIp1B3 <= imagWorkingBuffer[283];
				 realIp1B3 <= realWorkingBuffer[283];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=0.7885530704136834;
				 twiddleFactorimgB3 <=-0.6149667105959089;
				 stateIp1B3<=12'd283;
				 stateIp2B3<=12'd411;

				 //(284,412)
				 imgIp1B4 <= imagWorkingBuffer[284];
				 realIp1B4 <= realWorkingBuffer[284];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=0.7732314246073383;
				 twiddleFactorimgB4 <=-0.6341239342586794;
				 stateIp1B4<=12'd284;
				 stateIp2B4<=12'd412;

				 //(285,413)
				 imgIp1B5 <= imagWorkingBuffer[285];
				 realIp1B5 <= realWorkingBuffer[285];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=0.7574444852071317;
				 twiddleFactorimgB5 <=-0.6528995725448925;
				 stateIp1B5<=12'd285;
				 stateIp2B5<=12'd413;

				 //(286,414)
				 imgIp1B6 <= imagWorkingBuffer[286];
				 realIp1B6 <= realWorkingBuffer[286];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=0.7412017520361899;
				 twiddleFactorimgB6 <=-0.671282327175744;
				 stateIp1B6<=12'd286;
				 stateIp2B6<=12'd414;

				 //(287,415)
				 imgIp1B7 <= imagWorkingBuffer[287];
				 realIp1B7 <= realWorkingBuffer[287];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=0.7245129991924747;
				 twiddleFactorimgB7 <=-0.6892611362909744;
				 stateIp1B7<=12'd287;
				 stateIp2B7<=12'd415;
			 end
			 8'd245 : begin

				 //(288,416)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[416];
				 realIp2B0 <= realWorkingBuffer[416];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd288;
				 stateIp2B0<=12'd416;

				 //(289,417)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[417];
				 realIp2B1 <= realWorkingBuffer[417];
				 twiddleFactorRealB1 <=0.6898378668017409;
				 twiddleFactorimgB1 <=-0.7239638924189684;
				 stateIp1B1<=12'd289;
				 stateIp2B1<=12'd417;

				 //(290,418)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[418];
				 realIp2B2 <= realWorkingBuffer[418];
				 twiddleFactorRealB2 <=0.6718723530866767;
				 twiddleFactorimgB2 <=-0.7406669569771369;
				 stateIp1B2<=12'd290;
				 stateIp2B2<=12'd418;

				 //(291,419)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[419];
				 realIp2B3 <= realWorkingBuffer[419];
				 twiddleFactorRealB3 <=0.6535025388066908;
				 twiddleFactorimgB3 <=-0.7569243236765545;
				 stateIp1B3<=12'd291;
				 stateIp2B3<=12'd419;

				 //(292,420)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[420];
				 realIp2B4 <= realWorkingBuffer[420];
				 twiddleFactorRealB4 <=0.6347394780351602;
				 twiddleFactorimgB4 <=-0.7727262096135037;
				 stateIp1B4<=12'd292;
				 stateIp2B4<=12'd420;

				 //(293,421)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[421];
				 realIp2B5 <= realWorkingBuffer[421];
				 twiddleFactorRealB5 <=0.6155944614823434;
				 twiddleFactorimgB5 <=-0.7880631059707488;
				 stateIp1B5<=12'd293;
				 stateIp2B5<=12'd421;

				 //(294,422)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[422];
				 realIp2B6 <= realWorkingBuffer[422];
				 twiddleFactorRealB6 <=0.5960790097011732;
				 twiddleFactorimgB6 <=-0.8029257837394864;
				 stateIp1B6<=12'd294;
				 stateIp2B6<=12'd422;

				 //(295,423)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[423];
				 realIp2B7 <= realWorkingBuffer[423];
				 twiddleFactorRealB7 <=0.57620486615474;
				 twiddleFactorimgB7 <=-0.8173052992729205;
				 stateIp1B7<=12'd295;
				 stateIp2B7<=12'd423;
			 end
			 8'd246 : begin

				 //(296,424)
				 imgIp1B0 <= imagWorkingBuffer[296];
				 realIp1B0 <= realWorkingBuffer[296];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=0.5559839901496385;
				 twiddleFactorimgB0 <=-0.8311929996681197;
				 stateIp1B0<=12'd296;
				 stateIp2B0<=12'd424;

				 //(297,425)
				 imgIp1B1 <= imagWorkingBuffer[297];
				 realIp1B1 <= realWorkingBuffer[297];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=0.5354285496394308;
				 twiddleFactorimgB1 <=-0.8445805279729196;
				 stateIp1B1<=12'd297;
				 stateIp2B1<=12'd425;

				 //(298,426)
				 imgIp1B2 <= imagWorkingBuffer[298];
				 realIp1B2 <= realWorkingBuffer[298];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=0.5145509139025557;
				 twiddleFactorimgB2 <=-0.8574598282147361;
				 stateIp1B2<=12'd298;
				 stateIp2B2<=12'd426;

				 //(299,427)
				 imgIp1B3 <= imagWorkingBuffer[299];
				 realIp1B3 <= realWorkingBuffer[299];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=0.49336364609908906;
				 twiddleFactorimgB3 <=-0.8698231502482633;
				 stateIp1B3<=12'd299;
				 stateIp2B3<=12'd427;

				 //(300,428)
				 imgIp1B4 <= imagWorkingBuffer[300];
				 realIp1B4 <= realWorkingBuffer[300];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=0.47187949571083804;
				 twiddleFactorimgB4 <=-0.8816630544191387;
				 stateIp1B4<=12'd300;
				 stateIp2B4<=12'd428;

				 //(301,429)
				 imgIp1B5 <= imagWorkingBuffer[301];
				 realIp1B5 <= realWorkingBuffer[301];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=0.4501113908693125;
				 twiddleFactorimgB5 <=-0.8929724160407716;
				 stateIp1B5<=12'd301;
				 stateIp2B5<=12'd429;

				 //(302,430)
				 imgIp1B6 <= imagWorkingBuffer[302];
				 realIp1B6 <= realWorkingBuffer[302];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=0.42807243057619715;
				 twiddleFactorimgB6 <=-0.9037444296816367;
				 stateIp1B6<=12'd302;
				 stateIp2B6<=12'd430;

				 //(303,431)
				 imgIp1B7 <= imagWorkingBuffer[303];
				 realIp1B7 <= realWorkingBuffer[303];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=0.4057758768209987;
				 twiddleFactorimgB7 <=-0.9139726132604574;
				 stateIp1B7<=12'd303;
				 stateIp2B7<=12'd431;
			 end
			 8'd247 : begin

				 //(304,432)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd304;
				 stateIp2B0<=12'd432;

				 //(305,433)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=0.36046380384564436;
				 twiddleFactorimgB1 <=-0.9327732018648096;
				 stateIp1B1<=12'd305;
				 stateIp2B1<=12'd433;

				 //(306,434)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=0.33747555125823137;
				 twiddleFactorimgB2 <=-0.941334293597632;
				 stateIp1B2<=12'd306;
				 stateIp2B2<=12'd434;

				 //(307,435)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=0.31428422206646894;
				 twiddleFactorimgB3 <=-0.9493289354907889;
				 stateIp1B3<=12'd307;
				 stateIp2B3<=12'd435;

				 //(308,436)
				 imgIp1B4 <= imagWorkingBuffer[308];
				 realIp1B4 <= realWorkingBuffer[308];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=0.29090377170021026;
				 twiddleFactorimgB4 <=-0.9567523167521425;
				 stateIp1B4<=12'd308;
				 stateIp2B4<=12'd436;

				 //(309,437)
				 imgIp1B5 <= imagWorkingBuffer[309];
				 realIp1B5 <= realWorkingBuffer[309];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=0.2673482693933619;
				 twiddleFactorimgB5 <=-0.9635999703468107;
				 stateIp1B5<=12'd309;
				 stateIp2B5<=12'd437;

				 //(310,438)
				 imgIp1B6 <= imagWorkingBuffer[310];
				 realIp1B6 <= realWorkingBuffer[310];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=0.24363188971769512;
				 twiddleFactorimgB6 <=-0.9698677756852141;
				 stateIp1B6<=12'd310;
				 stateIp2B6<=12'd438;

				 //(311,439)
				 imgIp1B7 <= imagWorkingBuffer[311];
				 realIp1B7 <= realWorkingBuffer[311];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=0.21976890405326657;
				 twiddleFactorimgB7 <=-0.9755519611026499;
				 stateIp1B7<=12'd311;
				 stateIp2B7<=12'd439;
			 end
			 8'd248 : begin

				 //(312,440)
				 imgIp1B0 <= imagWorkingBuffer[312];
				 realIp1B0 <= realWorkingBuffer[312];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=0.19577367200058793;
				 twiddleFactorimgB0 <=-0.9806491061288978;
				 stateIp1B0<=12'd312;
				 stateIp2B0<=12'd440;

				 //(313,441)
				 imgIp1B1 <= imagWorkingBuffer[313];
				 realIp1B1 <= realWorkingBuffer[313];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=0.171660632739705;
				 twiddleFactorimgB1 <=-0.9851561435464959;
				 stateIp1B1<=12'd313;
				 stateIp2B1<=12'd441;

				 //(314,442)
				 imgIp1B2 <= imagWorkingBuffer[314];
				 realIp1B2 <= realWorkingBuffer[314];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=0.1474442963413934;
				 twiddleFactorimgB2 <=-0.9890703612364448;
				 stateIp1B2<=12'd314;
				 stateIp2B2<=12'd442;

				 //(315,443)
				 imgIp1B3 <= imagWorkingBuffer[315];
				 realIp1B3 <= realWorkingBuffer[315];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=0.12313923503569187;
				 twiddleFactorimgB3 <=-0.9923894038102304;
				 stateIp1B3<=12'd315;
				 stateIp2B3<=12'd443;

				 //(316,444)
				 imgIp1B4 <= imagWorkingBuffer[316];
				 realIp1B4 <= realWorkingBuffer[316];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=0.09876007444303489;
				 twiddleFactorimgB4 <=-0.9951112740271845;
				 stateIp1B4<=12'd316;
				 stateIp2B4<=12'd444;

				 //(317,445)
				 imgIp1B5 <= imagWorkingBuffer[317];
				 realIp1B5 <= realWorkingBuffer[317];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=0.07432148477325375;
				 twiddleFactorimgB5 <=-0.9972343339963275;
				 stateIp1B5<=12'd317;
				 stateIp2B5<=12'd445;

				 //(318,446)
				 imgIp1B6 <= imagWorkingBuffer[318];
				 realIp1B6 <= realWorkingBuffer[318];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=0.04983817199774956;
				 twiddleFactorimgB6 <=-0.9987573061619738;
				 stateIp1B6<=12'd318;
				 stateIp2B6<=12'd446;

				 //(319,447)
				 imgIp1B7 <= imagWorkingBuffer[319];
				 realIp1B7 <= realWorkingBuffer[319];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=0.025324869000143;
				 twiddleFactorimgB7 <=-0.9996792740725026;
				 stateIp1B7<=12'd319;
				 stateIp2B7<=12'd447;
			 end
			 8'd249 : begin

				 //(320,448)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[448];
				 realIp2B0 <= realWorkingBuffer[448];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd320;
				 stateIp2B0<=12'd448;

				 //(321,449)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[449];
				 realIp2B1 <= realWorkingBuffer[449];
				 twiddleFactorRealB1 <=-0.023732694769906075;
				 twiddleFactorimgB1 <=-0.9997183399332826;
				 stateIp1B1<=12'd321;
				 stateIp2B1<=12'd449;

				 //(322,450)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[450];
				 realIp2B2 <= realWorkingBuffer[450];
				 twiddleFactorRealB2 <=-0.048247435052847135;
				 twiddleFactorimgB2 <=-0.9988354143755723;
				 stateIp1B2<=12'd322;
				 stateIp2B2<=12'd450;

				 //(323,451)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[451];
				 realIp2B3 <= realWorkingBuffer[451];
				 twiddleFactorRealB3 <=-0.07273314234290135;
				 twiddleFactorimgB3 <=-0.9973514375609669;
				 stateIp1B3<=12'd323;
				 stateIp2B3<=12'd451;

				 //(324,452)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[452];
				 realIp2B4 <= realWorkingBuffer[452];
				 twiddleFactorRealB4 <=-0.09717508231554396;
				 twiddleFactorimgB4 <=-0.9952673024755547;
				 stateIp1B4<=12'd324;
				 stateIp2B4<=12'd452;

				 //(325,453)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[453];
				 realIp2B5 <= realWorkingBuffer[453];
				 twiddleFactorRealB5 <=-0.12155854698332229;
				 twiddleFactorimgB5 <=-0.9925842632518931;
				 stateIp1B5<=12'd325;
				 stateIp2B5<=12'd453;

				 //(326,454)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[454];
				 realIp2B6 <= realWorkingBuffer[454];
				 twiddleFactorRealB6 <=-0.14586886354641898;
				 twiddleFactorimgB6 <=-0.9893039344143316;
				 stateIp1B6<=12'd326;
				 stateIp2B6<=12'd454;

				 //(327,455)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[455];
				 realIp2B7 <= realWorkingBuffer[455];
				 twiddleFactorRealB7 <=-0.17009140322203772;
				 twiddleFactorimgB7 <=-0.9854282899074687;
				 stateIp1B7<=12'd327;
				 stateIp2B7<=12'd455;
			 end
			 8'd250 : begin

				 //(328,456)
				 imgIp1B0 <= imagWorkingBuffer[328];
				 realIp1B0 <= realWorkingBuffer[328];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=-0.19421159004730484;
				 twiddleFactorimgB0 <=-0.9809596619083262;
				 stateIp1B0<=12'd328;
				 stateIp2B0<=12'd456;

				 //(329,457)
				 imgIp1B1 <= imagWorkingBuffer[329];
				 realIp1B1 <= realWorkingBuffer[329];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=-0.21821490965038332;
				 twiddleFactorimgB1 <=-0.9759007394229574;
				 stateIp1B1<=12'd329;
				 stateIp2B1<=12'd457;

				 //(330,458)
				 imgIp1B2 <= imagWorkingBuffer[330];
				 realIp1B2 <= realWorkingBuffer[330];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=-0.24208691798452725;
				 twiddleFactorimgB2 <=-0.970254566668332;
				 stateIp1B2<=12'd330;
				 stateIp2B2<=12'd458;

				 //(331,459)
				 imgIp1B3 <= imagWorkingBuffer[331];
				 realIp1B3 <= realWorkingBuffer[331];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=-0.26581325001981504;
				 twiddleFactorimgB3 <=-0.9640245412404724;
				 stateIp1B3<=12'd331;
				 stateIp2B3<=12'd459;

				 //(332,460)
				 imgIp1B4 <= imagWorkingBuffer[332];
				 realIp1B4 <= realWorkingBuffer[332];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=-0.28937962838733716;
				 twiddleFactorimgB4 <=-0.9572144120699431;
				 stateIp1B4<=12'd332;
				 stateIp2B4<=12'd460;

				 //(333,461)
				 imgIp1B5 <= imagWorkingBuffer[333];
				 realIp1B5 <= realWorkingBuffer[333];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=-0.3127718719706306;
				 twiddleFactorimgB5 <=-0.9498282771659241;
				 stateIp1B5<=12'd333;
				 stateIp2B5<=12'd461;

				 //(334,462)
				 imgIp1B6 <= imagWorkingBuffer[334];
				 realIp1B6 <= realWorkingBuffer[334];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=-0.3359759044391963;
				 twiddleFactorimgB6 <=-0.9418705811502258;
				 stateIp1B6<=12'd334;
				 stateIp2B6<=12'd462;

				 //(335,463)
				 imgIp1B7 <= imagWorkingBuffer[335];
				 realIp1B7 <= realWorkingBuffer[335];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=-0.3589777627189582;
				 twiddleFactorimgB7 <=-0.9333461125827285;
				 stateIp1B7<=12'd335;
				 stateIp2B7<=12'd463;
			 end
			 8'd251 : begin

				 //(336,464)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd336;
				 stateIp2B0<=12'd464;

				 //(337,465)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=-0.40431972103853064;
				 twiddleFactorimgB1 <=-0.9146177142278213;
				 stateIp1B1<=12'd337;
				 stateIp2B1<=12'd465;

				 //(338,466)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=-0.4266325364620312;
				 twiddleFactorimgB2 <=-0.9044250542924901;
				 stateIp1B2<=12'd338;
				 stateIp2B2<=12'd466;

				 //(339,467)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=-0.44868862488268174;
				 twiddleFactorimgB3 <=-0.8936881547278603;
				 stateIp1B3<=12'd339;
				 stateIp2B3<=12'd467;

				 //(340,468)
				 imgIp1B4 <= imagWorkingBuffer[340];
				 realIp1B4 <= realWorkingBuffer[340];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=-0.47047471400408947;
				 twiddleFactorimgB4 <=-0.8824134764852417;
				 stateIp1B4<=12'd340;
				 stateIp2B4<=12'd468;

				 //(341,469)
				 imgIp1B5 <= imagWorkingBuffer[341];
				 realIp1B5 <= realWorkingBuffer[341];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=-0.49197769400249325;
				 twiddleFactorimgB5 <=-0.8706078041253645;
				 stateIp1B5<=12'd341;
				 stateIp2B5<=12'd469;

				 //(342,470)
				 imgIp1B6 <= imagWorkingBuffer[342];
				 realIp1B6 <= realWorkingBuffer[342];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=-0.5131846254156256;
				 twiddleFactorimgB6 <=-0.858278241735758;
				 stateIp1B6<=12'd342;
				 stateIp2B6<=12'd470;

				 //(343,471)
				 imgIp1B7 <= imagWorkingBuffer[343];
				 realIp1B7 <= realWorkingBuffer[343];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=-0.5340827469290627;
				 twiddleFactorimgB7 <=-0.8454322086558489;
				 stateIp1B7<=12'd343;
				 stateIp2B7<=12'd471;
			 end
			 8'd252 : begin

				 //(344,472)
				 imgIp1B0 <= imagWorkingBuffer[344];
				 realIp1B0 <= realWorkingBuffer[344];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=-0.5546594830553704;
				 twiddleFactorimgB0 <=-0.8320774350123606;
				 stateIp1B0<=12'd344;
				 stateIp2B0<=12'd472;

				 //(345,473)
				 imgIp1B1 <= imagWorkingBuffer[345];
				 realIp1B1 <= realWorkingBuffer[345];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=-0.5749024517014297;
				 twiddleFactorimgB1 <=-0.8182219570676927;
				 stateIp1B1<=12'd345;
				 stateIp2B1<=12'd473;

				 //(346,474)
				 imgIp1B2 <= imagWorkingBuffer[346];
				 realIp1B2 <= realWorkingBuffer[346];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=-0.594799471619386;
				 twiddleFactorimgB2 <=-0.8038741123840842;
				 stateIp1B2<=12'd346;
				 stateIp2B2<=12'd474;

				 //(347,475)
				 imgIp1B3 <= imagWorkingBuffer[347];
				 realIp1B3 <= realWorkingBuffer[347];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=-0.6143385697367412;
				 twiddleFactorimgB3 <=-0.7890425348064674;
				 stateIp1B3<=12'd347;
				 stateIp2B3<=12'd475;

				 //(348,476)
				 imgIp1B4 <= imagWorkingBuffer[348];
				 realIp1B4 <= realWorkingBuffer[348];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=-0.6335079883611737;
				 twiddleFactorimgB4 <=-0.7737361492670347;
				 stateIp1B4<=12'd348;
				 stateIp2B4<=12'd476;

				 //(349,477)
				 imgIp1B5 <= imagWorkingBuffer[349];
				 realIp1B5 <= realWorkingBuffer[349];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=-0.652296192255755;
				 twiddleFactorimgB5 <=-0.757964166414642;
				 stateIp1B5<=12'd349;
				 stateIp2B5<=12'd477;

				 //(350,478)
				 imgIp1B6 <= imagWorkingBuffer[350];
				 realIp1B6 <= realWorkingBuffer[350];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=-0.6706918755802994;
				 twiddleFactorimgB6 <=-0.7417360770722833;
				 stateIp1B6<=12'd350;
				 stateIp2B6<=12'd478;

				 //(351,479)
				 imgIp1B7 <= imagWorkingBuffer[351];
				 realIp1B7 <= realWorkingBuffer[351];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=-0.6886839686946801;
				 twiddleFactorimgB7 <=-0.725061646525966;
				 stateIp1B7<=12'd351;
				 stateIp2B7<=12'd479;
			 end
			 8'd253 : begin

				 //(352,480)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd352;
				 stateIp2B0<=12'd480;

				 //(353,481)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=-0.7234143265536556;
				 twiddleFactorimgB1 <=-0.6904141598612539;
				 stateIp1B1<=12'd353;
				 stateIp2B1<=12'd481;

				 //(354,482)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=-0.7401316922342577;
				 twiddleFactorimgB2 <=-0.6724619529389407;
				 stateIp1B2<=12'd354;
				 stateIp2B2<=12'd482;

				 //(355,483)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=-0.7564036821527641;
				 twiddleFactorimgB3 <=-0.6541050906587872;
				 stateIp1B3<=12'd355;
				 stateIp2B3<=12'd483;

				 //(356,484)
				 imgIp1B4 <= imagWorkingBuffer[356];
				 realIp1B4 <= realWorkingBuffer[356];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=-0.7722205046059057;
				 twiddleFactorimgB4 <=-0.6353546193002774;
				 stateIp1B4<=12'd356;
				 stateIp2B4<=12'd484;

				 //(357,485)
				 imgIp1B5 <= imagWorkingBuffer[357];
				 realIp1B5 <= realWorkingBuffer[357];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=-0.7875726417883676;
				 twiddleFactorimgB5 <=-0.6162218219979649;
				 stateIp1B5<=12'd357;
				 stateIp2B5<=12'd485;

				 //(358,486)
				 imgIp1B6 <= imagWorkingBuffer[358];
				 realIp1B6 <= realWorkingBuffer[358];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=-0.8024508555201488;
				 twiddleFactorimgB6 <=-0.5967182119518234;
				 stateIp1B6<=12'd358;
				 stateIp2B6<=12'd486;

				 //(359,487)
				 imgIp1B7 <= imagWorkingBuffer[359];
				 realIp1B7 <= realWorkingBuffer[359];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=-0.8168461928056552;
				 twiddleFactorimgB7 <=-0.5768555254991551;
				 stateIp1B7<=12'd359;
				 stateIp2B7<=12'd487;
			 end
			 8'd254 : begin

				 //(360,488)
				 imgIp1B0 <= imagWorkingBuffer[360];
				 realIp1B0 <= realWorkingBuffer[360];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=-0.8307499912211839;
				 twiddleFactorimgB0 <=-0.556645715052225;
				 stateIp1B0<=12'd360;
				 stateIp2B0<=12'd488;

				 //(361,489)
				 imgIp1B1 <= imagWorkingBuffer[361];
				 realIp1B1 <= realWorkingBuffer[361];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=-0.8441538841275539;
				 twiddleFactorimgB1 <=-0.5361009419058731;
				 stateIp1B1<=12'd361;
				 stateIp2B1<=12'd489;

				 //(362,490)
				 imgIp1B2 <= imagWorkingBuffer[362];
				 realIp1B2 <= realWorkingBuffer[362];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=-0.8570498057047488;
				 twiddleFactorimgB2 <=-0.5152335689194294;
				 stateIp1B2<=12'd362;
				 stateIp2B2<=12'd490;

				 //(363,491)
				 imgIp1B3 <= imagWorkingBuffer[363];
				 realIp1B3 <= realWorkingBuffer[363];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=-0.8694299958055394;
				 twiddleFactorimgB3 <=-0.4940561530773398;
				 stateIp1B3<=12'd363;
				 stateIp2B3<=12'd491;

				 //(364,492)
				 imgIp1B4 <= imagWorkingBuffer[364];
				 realIp1B4 <= realWorkingBuffer[364];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=-0.8812870046251697;
				 twiddleFactorimgB4 <=-0.4725814379329727;
				 stateIp1B4<=12'd364;
				 stateIp2B4<=12'd492;

				 //(365,493)
				 imgIp1B5 <= imagWorkingBuffer[365];
				 realIp1B5 <= realWorkingBuffer[365];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=-0.8926136971842913;
				 twiddleFactorimgB5 <=-0.4508223459401611;
				 stateIp1B5<=12'd365;
				 stateIp2B5<=12'd493;

				 //(366,494)
				 imgIp1B6 <= imagWorkingBuffer[366];
				 realIp1B6 <= realWorkingBuffer[366];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=-0.9034032576224522;
				 twiddleFactorimgB6 <=-0.42879197067708863;
				 stateIp1B6<=12'd366;
				 stateIp2B6<=12'd494;

				 //(367,495)
				 imgIp1B7 <= imagWorkingBuffer[367];
				 realIp1B7 <= realWorkingBuffer[367];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=-0.913649193299554;
				 twiddleFactorimgB7 <=-0.40650356896720385;
				 stateIp1B7<=12'd367;
				 stateIp2B7<=12'd495;
			 end
			 8'd255 : begin

				 //(368,496)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd368;
				 stateIp2B0<=12'd496;

				 //(369,497)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=-0.9324858591568669;
				 twiddleFactorimgB1 <=-0.36120648176974873;
				 stateIp1B1<=12'd369;
				 stateIp2B1<=12'd497;

				 //(370,498)
				 imgIp1B2 <= imagWorkingBuffer[370];
				 realIp1B2 <= realWorkingBuffer[370];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=-0.9410652543348083;
				 twiddleFactorimgB2 <=-0.3382250538971983;
				 stateIp1B2<=12'd370;
				 stateIp2B2<=12'd498;

				 //(371,499)
				 imgIp1B3 <= imagWorkingBuffer[371];
				 realIp1B3 <= realWorkingBuffer[371];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=-0.9490783615680114;
				 twiddleFactorimgB3 <=-0.31504009840555053;
				 stateIp1B3<=12'd371;
				 stateIp2B3<=12'd499;

				 //(372,500)
				 imgIp1B4 <= imagWorkingBuffer[372];
				 realIp1B4 <= realWorkingBuffer[372];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=-0.9565203589527828;
				 twiddleFactorimgB4 <=-0.29166556688927076;
				 stateIp1B4<=12'd372;
				 stateIp2B4<=12'd500;

				 //(373,501)
				 imgIp1B5 <= imagWorkingBuffer[373];
				 realIp1B5 <= realWorkingBuffer[373];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=-0.9633867682519496;
				 twiddleFactorimgB5 <=-0.2681155250205858;
				 stateIp1B5<=12'd373;
				 stateIp2B5<=12'd501;

				 //(374,502)
				 imgIp1B6 <= imagWorkingBuffer[374];
				 realIp1B6 <= realWorkingBuffer[374];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=-0.9696734575896493;
				 twiddleFactorimgB6 <=-0.2444041440854362;
				 stateIp1B6<=12'd374;
				 stateIp2B6<=12'd502;

				 //(375,503)
				 imgIp1B7 <= imagWorkingBuffer[375];
				 realIp1B7 <= realWorkingBuffer[375];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=-0.9753766439376932;
				 twiddleFactorimgB7 <=-0.22054569245587763;
				 stateIp1B7<=12'd375;
				 stateIp2B7<=12'd503;
			 end
			 8'd256 : begin

				 //(376,504)
				 imgIp1B0 <= imagWorkingBuffer[376];
				 realIp1B0 <= realWorkingBuffer[376];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=-0.9804928953920125;
				 twiddleFactorimgB0 <=-0.19655452700405607;
				 stateIp1B0<=12'd376;
				 stateIp2B0<=12'd504;

				 //(377,505)
				 imgIp1B1 <= imagWorkingBuffer[377];
				 realIp1B1 <= realWorkingBuffer[377];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=-0.9850191332378129;
				 twiddleFactorimgB1 <=-0.17244508446293239;
				 stateIp1B1<=12'd377;
				 stateIp2B1<=12'd505;

				 //(378,506)
				 imgIp1B2 <= imagWorkingBuffer[378];
				 realIp1B2 <= realWorkingBuffer[378];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=-0.988952633802198;
				 twiddleFactorimgB2 <=-0.1482318727389478;
				 stateIp1B2<=12'd378;
				 stateIp2B2<=12'd506;

				 //(379,507)
				 imgIp1B3 <= imagWorkingBuffer[379];
				 realIp1B3 <= realWorkingBuffer[379];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=-0.9922910300931447;
				 twiddleFactorimgB3 <=-0.12392946218186328;
				 stateIp1B3<=12'd379;
				 stateIp2B3<=12'd507;

				 //(380,508)
				 imgIp1B4 <= imagWorkingBuffer[380];
				 realIp1B4 <= realWorkingBuffer[380];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=-0.9950323132238454;
				 twiddleFactorimgB4 <=-0.09955247681701893;
				 stateIp1B4<=12'd380;
				 stateIp2B4<=12'd508;

				 //(381,509)
				 imgIp1B5 <= imagWorkingBuffer[381];
				 realIp1B5 <= realWorkingBuffer[381];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=-0.9971748336215606;
				 twiddleFactorimgB5 <=-0.07511558554529872;
				 stateIp1B5<=12'd381;
				 stateIp2B5<=12'd509;

				 //(382,510)
				 imgIp1B6 <= imagWorkingBuffer[382];
				 realIp1B6 <= realWorkingBuffer[382];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=-0.9987173020202512;
				 twiddleFactorimgB6 <=-0.05063349331608835;
				 stateIp1B6<=12'd382;
				 stateIp2B6<=12'd510;

				 //(383,511)
				 imgIp1B7 <= imagWorkingBuffer[383];
				 realIp1B7 <= realWorkingBuffer[383];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.9996587902363985;
				 twiddleFactorimgB7 <=-0.026120932278543618;
				 stateIp1B7<=12'd383;
				 stateIp2B7<=12'd511;
			 end
			 8'd257 : begin

				 //(0,256)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[256];
				 realIp2B0 <= realWorkingBuffer[256];
				 twiddleFactorRealB0 <=1.0;
				 twiddleFactorimgB0 <=-0.0;
				 stateIp1B0<=12'd0;
				 stateIp2B0<=12'd256;

				 lastStageFlag<=1'b1;

				 //(1,257)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[257];
				 realIp2B1 <= realWorkingBuffer[257];
				 twiddleFactorRealB1 <=0.9999247781647527;
				 twiddleFactorimgB1 <=-0.012265317450850034;
				 stateIp1B1<=12'd1;
				 stateIp2B1<=12'd257;

				 //(2,258)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[258];
				 realIp2B2 <= realWorkingBuffer[258];
				 twiddleFactorRealB2 <=0.9996991239756597;
				 twiddleFactorimgB2 <=-0.024528789662322983;
				 stateIp1B2<=12'd2;
				 stateIp2B2<=12'd258;

				 //(3,259)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[259];
				 realIp2B3 <= realWorkingBuffer[259];
				 twiddleFactorRealB3 <=0.9993230713809657;
				 twiddleFactorimgB3 <=-0.036788571672646334;
				 stateIp1B3<=12'd3;
				 stateIp2B3<=12'd259;

				 //(4,260)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[260];
				 realIp2B4 <= realWorkingBuffer[260];
				 twiddleFactorRealB4 <=0.9987966769554031;
				 twiddleFactorimgB4 <=-0.04904281907521501;
				 stateIp1B4<=12'd4;
				 stateIp2B4<=12'd260;

				 //(5,261)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[261];
				 realIp2B5 <= realWorkingBuffer[261];
				 twiddleFactorRealB5 <=0.9981200198916814;
				 twiddleFactorimgB5 <=-0.0612896882960706;
				 stateIp1B5<=12'd5;
				 stateIp2B5<=12'd261;

				 //(6,262)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[262];
				 realIp2B6 <= realWorkingBuffer[262];
				 twiddleFactorRealB6 <=0.9972932019885731;
				 twiddleFactorimgB6 <=-0.07352733687125546;
				 stateIp1B6<=12'd6;
				 stateIp2B6<=12'd262;

				 //(7,263)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[263];
				 realIp2B7 <= realWorkingBuffer[263];
				 twiddleFactorRealB7 <=0.9963163476355983;
				 twiddleFactorimgB7 <=-0.0857539237239997;
				 stateIp1B7<=12'd7;
				 stateIp2B7<=12'd263;
			 end
			 8'd258 : begin

				 //(8,264)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[264];
				 realIp2B0 <= realWorkingBuffer[264];
				 twiddleFactorRealB0 <=0.9951896037943114;
				 twiddleFactorimgB0 <=-0.0979676094416996;
				 stateIp1B0<=12'd8;
				 stateIp2B0<=12'd264;

				 //(9,265)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[265];
				 realIp2B1 <= realWorkingBuffer[265];
				 twiddleFactorRealB1 <=0.9939131399761917;
				 twiddleFactorimgB1 <=-0.11016655655264551;
				 stateIp1B1<=12'd9;
				 stateIp2B1<=12'd265;

				 //(10,266)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[266];
				 realIp2B2 <= realWorkingBuffer[266];
				 twiddleFactorRealB2 <=0.992487148217141;
				 twiddleFactorimgB2 <=-0.12234892980245789;
				 stateIp1B2<=12'd10;
				 stateIp2B2<=12'd266;

				 //(11,267)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[267];
				 realIp2B3 <= realWorkingBuffer[267];
				 twiddleFactorRealB3 <=0.9909118430485938;
				 twiddleFactorimgB3 <=-0.13451289643018965;
				 stateIp1B3<=12'd11;
				 stateIp2B3<=12'd267;

				 //(12,268)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[268];
				 realIp2B4 <= realWorkingBuffer[268];
				 twiddleFactorRealB4 <=0.9891874614652418;
				 twiddleFactorimgB4 <=-0.14665662644405364;
				 stateIp1B4<=12'd12;
				 stateIp2B4<=12'd268;

				 //(13,269)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[269];
				 realIp2B5 <= realWorkingBuffer[269];
				 twiddleFactorRealB5 <=0.9873142628893797;
				 twiddleFactorimgB5 <=-0.15877829289673304;
				 stateIp1B5<=12'd13;
				 stateIp2B5<=12'd269;

				 //(14,270)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=0.9852925291318769;
				 twiddleFactorimgB6 <=-0.17087607216023415;
				 stateIp1B6<=12'd14;
				 stateIp2B6<=12'd270;

				 //(15,271)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=0.9831225643497805;
				 twiddleFactorimgB7 <=-0.18294814420023978;
				 stateIp1B7<=12'd15;
				 stateIp2B7<=12'd271;
			 end
			 8'd259 : begin

				 //(16,272)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[272];
				 realIp2B0 <= realWorkingBuffer[272];
				 twiddleFactorRealB0 <=0.9808046950005572;
				 twiddleFactorimgB0 <=-0.19499269284992174;
				 stateIp1B0<=12'd16;
				 stateIp2B0<=12'd272;

				 //(17,273)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[273];
				 realIp2B1 <= realWorkingBuffer[273];
				 twiddleFactorRealB1 <=0.9783392697929797;
				 twiddleFactorimgB1 <=-0.20700790608317174;
				 stateIp1B1<=12'd17;
				 stateIp2B1<=12'd273;

				 //(18,274)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[274];
				 realIp2B2 <= realWorkingBuffer[274];
				 twiddleFactorRealB2 <=0.9757266596346655;
				 twiddleFactorimgB2 <=-0.21899197628720918;
				 stateIp1B2<=12'd18;
				 stateIp2B2<=12'd274;

				 //(19,275)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[275];
				 realIp2B3 <= realWorkingBuffer[275];
				 twiddleFactorRealB3 <=0.9729672575762764;
				 twiddleFactorimgB3 <=-0.2309431005345251;
				 stateIp1B3<=12'd19;
				 stateIp2B3<=12'd275;

				 //(20,276)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[276];
				 realIp2B4 <= realWorkingBuffer[276];
				 twiddleFactorRealB4 <=0.9700614787523865;
				 twiddleFactorimgB4 <=-0.24285948085412118;
				 stateIp1B4<=12'd20;
				 stateIp2B4<=12'd276;

				 //(21,277)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[277];
				 realIp2B5 <= realWorkingBuffer[277];
				 twiddleFactorRealB5 <=0.9670097603190275;
				 twiddleFactorimgB5 <=-0.25473932450200315;
				 stateIp1B5<=12'd21;
				 stateIp2B5<=12'd277;

				 //(22,278)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[278];
				 realIp2B6 <= realWorkingBuffer[278];
				 twiddleFactorRealB6 <=0.9638125613879222;
				 twiddleFactorimgB6 <=-0.26658084423088774;
				 stateIp1B6<=12'd22;
				 stateIp2B6<=12'd278;

				 //(23,279)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[279];
				 realIp2B7 <= realWorkingBuffer[279];
				 twiddleFactorRealB7 <=0.9604703629574127;
				 twiddleFactorimgB7 <=-0.27838225855908266;
				 stateIp1B7<=12'd23;
				 stateIp2B7<=12'd279;
			 end
			 8'd260 : begin

				 //(24,280)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[280];
				 realIp2B0 <= realWorkingBuffer[280];
				 twiddleFactorRealB0 <=0.9569836678400986;
				 twiddleFactorimgB0 <=-0.2901417920384994;
				 stateIp1B0<=12'd24;
				 stateIp2B0<=12'd280;

				 //(25,281)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[281];
				 realIp2B1 <= realWorkingBuffer[281];
				 twiddleFactorRealB1 <=0.9533530005871913;
				 twiddleFactorimgB1 <=-0.3018576755217579;
				 stateIp1B1<=12'd25;
				 stateIp2B1<=12'd281;

				 //(26,282)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[282];
				 realIp2B2 <= realWorkingBuffer[282];
				 twiddleFactorRealB2 <=0.9495789074095985;
				 twiddleFactorimgB2 <=-0.31352814642834403;
				 stateIp1B2<=12'd26;
				 stateIp2B2<=12'd282;

				 //(27,283)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[283];
				 realIp2B3 <= realWorkingBuffer[283];
				 twiddleFactorRealB3 <=0.9456619560957508;
				 twiddleFactorimgB3 <=-0.32515144900977805;
				 stateIp1B3<=12'd27;
				 stateIp2B3<=12'd283;

				 //(28,284)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=0.9416027359261809;
				 twiddleFactorimgB4 <=-0.3367258346137564;
				 stateIp1B4<=12'd28;
				 stateIp2B4<=12'd284;

				 //(29,285)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=0.9374018575848705;
				 twiddleFactorimgB5 <=-0.3482495619472251;
				 stateIp1B5<=12'd29;
				 stateIp2B5<=12'd285;

				 //(30,286)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=0.9330599530673765;
				 twiddleFactorimgB6 <=-0.3597208973383463;
				 stateIp1B6<=12'd30;
				 stateIp2B6<=12'd286;

				 //(31,287)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=0.9285776755857515;
				 twiddleFactorimgB7 <=-0.3711381149973183;
				 stateIp1B7<=12'd31;
				 stateIp2B7<=12'd287;
			 end
			 8'd261 : begin

				 //(32,288)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[288];
				 realIp2B0 <= realWorkingBuffer[288];
				 twiddleFactorRealB0 <=0.9239556994702721;
				 twiddleFactorimgB0 <=-0.3824994972760097;
				 stateIp1B0<=12'd32;
				 stateIp2B0<=12'd288;

				 //(33,289)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[289];
				 realIp2B1 <= realWorkingBuffer[289];
				 twiddleFactorRealB1 <=0.91919472006799;
				 twiddleFactorimgB1 <=-0.3938033349263685;
				 stateIp1B1<=12'd33;
				 stateIp2B1<=12'd289;

				 //(34,290)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[290];
				 realIp2B2 <= realWorkingBuffer[290];
				 twiddleFactorRealB2 <=0.9142954536381215;
				 twiddleFactorimgB2 <=-0.40504792735756795;
				 stateIp1B2<=12'd34;
				 stateIp2B2<=12'd290;

				 //(35,291)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[291];
				 realIp2B3 <= realWorkingBuffer[291];
				 twiddleFactorRealB3 <=0.9092586372442911;
				 twiddleFactorimgB3 <=-0.41623158289184947;
				 stateIp1B3<=12'd35;
				 stateIp2B3<=12'd291;

				 //(36,292)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[292];
				 realIp2B4 <= realWorkingBuffer[292];
				 twiddleFactorRealB4 <=0.9040850286436448;
				 twiddleFactorimgB4 <=-0.427352619019025;
				 stateIp1B4<=12'd36;
				 stateIp2B4<=12'd292;

				 //(37,293)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[293];
				 realIp2B5 <= realWorkingBuffer[293];
				 twiddleFactorRealB5 <=0.8987754061728501;
				 twiddleFactorimgB5 <=-0.4384093626495998;
				 stateIp1B5<=12'd37;
				 stateIp2B5<=12'd293;

				 //(38,294)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[294];
				 realIp2B6 <= realWorkingBuffer[294];
				 twiddleFactorRealB6 <=0.8933305686310005;
				 twiddleFactorimgB6 <=-0.44940015036647835;
				 stateIp1B6<=12'd38;
				 stateIp2B6<=12'd294;

				 //(39,295)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[295];
				 realIp2B7 <= realWorkingBuffer[295];
				 twiddleFactorRealB7 <=0.8877513351594409;
				 twiddleFactorimgB7 <=-0.46032332867521497;
				 stateIp1B7<=12'd39;
				 stateIp2B7<=12'd295;
			 end
			 8'd262 : begin

				 //(40,296)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[296];
				 realIp2B0 <= realWorkingBuffer[296];
				 twiddleFactorRealB0 <=0.8820385451185335;
				 twiddleFactorimgB0 <=-0.4711772542527714;
				 stateIp1B0<=12'd40;
				 stateIp2B0<=12'd296;

				 //(41,297)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[297];
				 realIp2B1 <= realWorkingBuffer[297];
				 twiddleFactorRealB1 <=0.8761930579613807;
				 twiddleFactorimgB1 <=-0.48196029419474445;
				 stateIp1B1<=12'd41;
				 stateIp2B1<=12'd297;

				 //(42,298)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[298];
				 realIp2B2 <= realWorkingBuffer[298];
				 twiddleFactorRealB2 <=0.8702157531045263;
				 twiddleFactorimgB2 <=-0.4926708262610261;
				 stateIp1B2<=12'd42;
				 stateIp2B2<=12'd298;

				 //(43,299)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[299];
				 realIp2B3 <= realWorkingBuffer[299];
				 twiddleFactorRealB3 <=0.8641075297956525;
				 twiddleFactorimgB3 <=-0.5033072391198595;
				 stateIp1B3<=12'd43;
				 stateIp2B3<=12'd299;

				 //(44,300)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=0.8578693069782943;
				 twiddleFactorimgB4 <=-0.5138679325902532;
				 stateIp1B4<=12'd44;
				 stateIp2B4<=12'd300;

				 //(45,301)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=0.8515020231535896;
				 twiddleFactorimgB5 <=-0.5243513178827185;
				 stateIp1B5<=12'd45;
				 stateIp2B5<=12'd301;

				 //(46,302)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=0.8450066362390881;
				 twiddleFactorimgB6 <=-0.5347558178382928;
				 stateIp1B6<=12'd46;
				 stateIp2B6<=12'd302;

				 //(47,303)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=0.8383841234246384;
				 twiddleFactorimgB7 <=-0.5450798671658132;
				 stateIp1B7<=12'd47;
				 stateIp2B7<=12'd303;
			 end
			 8'd263 : begin

				 //(48,304)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[304];
				 realIp2B0 <= realWorkingBuffer[304];
				 twiddleFactorRealB0 <=0.8316354810253763;
				 twiddleFactorimgB0 <=-0.5553219126774045;
				 stateIp1B0<=12'd48;
				 stateIp2B0<=12'd304;

				 //(49,305)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[305];
				 realIp2B1 <= realWorkingBuffer[305];
				 twiddleFactorRealB1 <=0.8247617243318353;
				 twiddleFactorimgB1 <=-0.5654804135221465;
				 stateIp1B1<=12'd49;
				 stateIp2B1<=12'd305;

				 //(50,306)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[306];
				 realIp2B2 <= realWorkingBuffer[306];
				 twiddleFactorRealB2 <=0.8177638874572022;
				 twiddleFactorimgB2 <=-0.5755538414178853;
				 stateIp1B2<=12'd50;
				 stateIp2B2<=12'd306;

				 //(51,307)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[307];
				 realIp2B3 <= realWorkingBuffer[307];
				 twiddleFactorRealB3 <=0.8106430231817421;
				 twiddleFactorimgB3 <=-0.5855406808811541;
				 stateIp1B3<=12'd51;
				 stateIp2B3<=12'd307;

				 //(52,308)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[308];
				 realIp2B4 <= realWorkingBuffer[308];
				 twiddleFactorRealB4 <=0.8034002027944137;
				 twiddleFactorimgB4 <=-0.595439429455167;
				 stateIp1B4<=12'd52;
				 stateIp2B4<=12'd308;

				 //(53,309)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[309];
				 realIp2B5 <= realWorkingBuffer[309];
				 twiddleFactorRealB5 <=0.7960365159317008;
				 twiddleFactorimgB5 <=-0.6052485979358556;
				 stateIp1B5<=12'd53;
				 stateIp2B5<=12'd309;

				 //(54,310)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[310];
				 realIp2B6 <= realWorkingBuffer[310];
				 twiddleFactorRealB6 <=0.7885530704136834;
				 twiddleFactorimgB6 <=-0.6149667105959089;
				 stateIp1B6<=12'd54;
				 stateIp2B6<=12'd310;

				 //(55,311)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[311];
				 realIp2B7 <= realWorkingBuffer[311];
				 twiddleFactorRealB7 <=0.7809509920773731;
				 twiddleFactorimgB7 <=-0.6245923054067883;
				 stateIp1B7<=12'd55;
				 stateIp2B7<=12'd311;
			 end
			 8'd264 : begin

				 //(56,312)
				 imgIp1B0 <= imagWorkingBuffer[56];
				 realIp1B0 <= realWorkingBuffer[56];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=0.7732314246073383;
				 twiddleFactorimgB0 <=-0.6341239342586794;
				 stateIp1B0<=12'd56;
				 stateIp2B0<=12'd312;

				 //(57,313)
				 imgIp1B1 <= imagWorkingBuffer[57];
				 realIp1B1 <= realWorkingBuffer[57];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=0.7653955293636437;
				 twiddleFactorimgB1 <=-0.6435601631783523;
				 stateIp1B1<=12'd57;
				 stateIp2B1<=12'd313;

				 //(58,314)
				 imgIp1B2 <= imagWorkingBuffer[58];
				 realIp1B2 <= realWorkingBuffer[58];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=0.7574444852071317;
				 twiddleFactorimgB2 <=-0.6528995725448925;
				 stateIp1B2<=12'd58;
				 stateIp2B2<=12'd314;

				 //(59,315)
				 imgIp1B3 <= imagWorkingBuffer[59];
				 realIp1B3 <= realWorkingBuffer[59];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=0.749379488322069;
				 twiddleFactorimgB3 <=-0.6621407573032747;
				 stateIp1B3<=12'd59;
				 stateIp2B3<=12'd315;

				 //(60,316)
				 imgIp1B4 <= imagWorkingBuffer[60];
				 realIp1B4 <= realWorkingBuffer[60];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=0.7412017520361899;
				 twiddleFactorimgB4 <=-0.671282327175744;
				 stateIp1B4<=12'd60;
				 stateIp2B4<=12'd316;

				 //(61,317)
				 imgIp1B5 <= imagWorkingBuffer[61];
				 realIp1B5 <= realWorkingBuffer[61];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=0.7329125066381572;
				 twiddleFactorimgB5 <=-0.6803229068709749;
				 stateIp1B5<=12'd61;
				 stateIp2B5<=12'd317;

				 //(62,318)
				 imgIp1B6 <= imagWorkingBuffer[62];
				 realIp1B6 <= realWorkingBuffer[62];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=0.7245129991924747;
				 twiddleFactorimgB6 <=-0.6892611362909744;
				 stateIp1B6<=12'd62;
				 stateIp2B6<=12'd318;

				 //(63,319)
				 imgIp1B7 <= imagWorkingBuffer[63];
				 realIp1B7 <= realWorkingBuffer[63];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=0.7160044933518724;
				 twiddleFactorimgB7 <=-0.6980956707357012;
				 stateIp1B7<=12'd63;
				 stateIp2B7<=12'd319;
			 end
			 8'd265 : begin

				 //(64,320)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[320];
				 realIp2B0 <= realWorkingBuffer[320];
				 twiddleFactorRealB0 <=0.7073882691671998;
				 twiddleFactorimgB0 <=-0.706825181105366;
				 stateIp1B0<=12'd64;
				 stateIp2B0<=12'd320;

				 //(65,321)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[321];
				 realIp2B1 <= realWorkingBuffer[321];
				 twiddleFactorRealB1 <=0.6986656228948487;
				 twiddleFactorimgB1 <=-0.7154483541003872;
				 stateIp1B1<=12'd65;
				 stateIp2B1<=12'd321;

				 //(66,322)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[322];
				 realIp2B2 <= realWorkingBuffer[322];
				 twiddleFactorRealB2 <=0.6898378668017409;
				 twiddleFactorimgB2 <=-0.7239638924189684;
				 stateIp1B2<=12'd66;
				 stateIp2B2<=12'd322;

				 //(67,323)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[323];
				 realIp2B3 <= realWorkingBuffer[323];
				 twiddleFactorRealB3 <=0.6809063289679054;
				 twiddleFactorimgB3 <=-0.7323705149522683;
				 stateIp1B3<=12'd67;
				 stateIp2B3<=12'd323;

				 //(68,324)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[324];
				 realIp2B4 <= realWorkingBuffer[324];
				 twiddleFactorRealB4 <=0.6718723530866767;
				 twiddleFactorimgB4 <=-0.7406669569771369;
				 stateIp1B4<=12'd68;
				 stateIp2B4<=12'd324;

				 //(69,325)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[325];
				 realIp2B5 <= realWorkingBuffer[325];
				 twiddleFactorRealB5 <=0.662737298262546;
				 twiddleFactorimgB5 <=-0.7488519703463837;
				 stateIp1B5<=12'd69;
				 stateIp2B5<=12'd325;

				 //(70,326)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[326];
				 realIp2B6 <= realWorkingBuffer[326];
				 twiddleFactorRealB6 <=0.6535025388066908;
				 twiddleFactorimgB6 <=-0.7569243236765545;
				 stateIp1B6<=12'd70;
				 stateIp2B6<=12'd326;

				 //(71,327)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[327];
				 realIp2B7 <= realWorkingBuffer[327];
				 twiddleFactorRealB7 <=0.6441694640302202;
				 twiddleFactorimgB7 <=-0.7648828025331847;
				 stateIp1B7<=12'd71;
				 stateIp2B7<=12'd327;
			 end
			 8'd266 : begin

				 //(72,328)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[328];
				 realIp2B0 <= realWorkingBuffer[328];
				 twiddleFactorRealB0 <=0.6347394780351602;
				 twiddleFactorimgB0 <=-0.7727262096135037;
				 stateIp1B0<=12'd72;
				 stateIp2B0<=12'd328;

				 //(73,329)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[329];
				 realIp2B1 <= realWorkingBuffer[329];
				 twiddleFactorRealB1 <=0.6252139995032168;
				 twiddleFactorimgB1 <=-0.7804533649265609;
				 stateIp1B1<=12'd73;
				 stateIp2B1<=12'd329;

				 //(74,330)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[330];
				 realIp2B2 <= realWorkingBuffer[330];
				 twiddleFactorRealB2 <=0.6155944614823434;
				 twiddleFactorimgB2 <=-0.7880631059707488;
				 stateIp1B2<=12'd74;
				 stateIp2B2<=12'd330;

				 //(75,331)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[331];
				 realIp2B3 <= realWorkingBuffer[331];
				 twiddleFactorRealB3 <=0.6058823111711485;
				 twiddleFactorimgB3 <=-0.795554287908693;
				 stateIp1B3<=12'd75;
				 stateIp2B3<=12'd331;

				 //(76,332)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=0.5960790097011732;
				 twiddleFactorimgB4 <=-0.8029257837394864;
				 stateIp1B4<=12'd76;
				 stateIp2B4<=12'd332;

				 //(77,333)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=0.5861860319170739;
				 twiddleFactorimgB5 <=-0.8101764844682393;
				 stateIp1B5<=12'd77;
				 stateIp2B5<=12'd333;

				 //(78,334)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=0.57620486615474;
				 twiddleFactorimgB6 <=-0.8173052992729205;
				 stateIp1B6<=12'd78;
				 stateIp2B6<=12'd334;

				 //(79,335)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=0.5661370140173851;
				 twiddleFactorimgB7 <=-0.8243111556684642;
				 stateIp1B7<=12'd79;
				 stateIp2B7<=12'd335;
			 end
			 8'd267 : begin

				 //(80,336)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[336];
				 realIp2B0 <= realWorkingBuffer[336];
				 twiddleFactorRealB0 <=0.5559839901496385;
				 twiddleFactorimgB0 <=-0.8311929996681197;
				 stateIp1B0<=12'd80;
				 stateIp2B0<=12'd336;

				 //(81,337)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[337];
				 realIp2B1 <= realWorkingBuffer[337];
				 twiddleFactorRealB1 <=0.5457473220096776;
				 twiddleFactorimgB1 <=-0.8379497959420155;
				 stateIp1B1<=12'd81;
				 stateIp2B1<=12'd337;

				 //(82,338)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[338];
				 realIp2B2 <= realWorkingBuffer[338];
				 twiddleFactorRealB2 <=0.5354285496394308;
				 twiddleFactorimgB2 <=-0.8445805279729196;
				 stateIp1B2<=12'd82;
				 stateIp2B2<=12'd338;

				 //(83,339)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[339];
				 realIp2B3 <= realWorkingBuffer[339];
				 twiddleFactorRealB3 <=0.5250292254328888;
				 twiddleFactorimgB3 <=-0.8510841982091671;
				 stateIp1B3<=12'd83;
				 stateIp2B3<=12'd339;

				 //(84,340)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[340];
				 realIp2B4 <= realWorkingBuffer[340];
				 twiddleFactorRealB4 <=0.5145509139025557;
				 twiddleFactorimgB4 <=-0.8574598282147361;
				 stateIp1B4<=12'd84;
				 stateIp2B4<=12'd340;

				 //(85,341)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[341];
				 realIp2B5 <= realWorkingBuffer[341];
				 twiddleFactorRealB5 <=0.5039951914440786;
				 twiddleFactorimgB5 <=-0.8637064588164469;
				 stateIp1B5<=12'd85;
				 stateIp2B5<=12'd341;

				 //(86,342)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[342];
				 realIp2B6 <= realWorkingBuffer[342];
				 twiddleFactorRealB6 <=0.49336364609908906;
				 twiddleFactorimgB6 <=-0.8698231502482633;
				 stateIp1B6<=12'd86;
				 stateIp2B6<=12'd342;

				 //(87,343)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[343];
				 realIp2B7 <= realWorkingBuffer[343];
				 twiddleFactorRealB7 <=0.4826578773162919;
				 twiddleFactorimgB7 <=-0.8758089822926751;
				 stateIp1B7<=12'd87;
				 stateIp2B7<=12'd343;
			 end
			 8'd268 : begin

				 //(88,344)
				 imgIp1B0 <= imagWorkingBuffer[88];
				 realIp1B0 <= realWorkingBuffer[88];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=0.47187949571083804;
				 twiddleFactorimgB0 <=-0.8816630544191387;
				 stateIp1B0<=12'd88;
				 stateIp2B0<=12'd344;

				 //(89,345)
				 imgIp1B1 <= imagWorkingBuffer[89];
				 realIp1B1 <= realWorkingBuffer[89];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=0.46103012282201816;
				 twiddleFactorimgB1 <=-0.8873844859195561;
				 stateIp1B1<=12'd89;
				 stateIp2B1<=12'd345;

				 //(90,346)
				 imgIp1B2 <= imagWorkingBuffer[90];
				 realIp1B2 <= realWorkingBuffer[90];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=0.4501113908693125;
				 twiddleFactorimgB2 <=-0.8929724160407716;
				 stateIp1B2<=12'd90;
				 stateIp2B2<=12'd346;

				 //(91,347)
				 imgIp1B3 <= imagWorkingBuffer[91];
				 realIp1B3 <= realWorkingBuffer[91];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=0.43912494250683304;
				 twiddleFactorimgB3 <=-0.8984260041140676;
				 stateIp1B3<=12'd91;
				 stateIp2B3<=12'd347;

				 //(92,348)
				 imgIp1B4 <= imagWorkingBuffer[92];
				 realIp1B4 <= realWorkingBuffer[92];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=0.42807243057619715;
				 twiddleFactorimgB4 <=-0.9037444296816367;
				 stateIp1B4<=12'd92;
				 stateIp2B4<=12'd348;

				 //(93,349)
				 imgIp1B5 <= imagWorkingBuffer[93];
				 realIp1B5 <= realWorkingBuffer[93];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=0.41695551785786755;
				 twiddleFactorimgB5 <=-0.9089268926200157;
				 stateIp1B5<=12'd93;
				 stateIp2B5<=12'd349;

				 //(94,350)
				 imgIp1B6 <= imagWorkingBuffer[94];
				 realIp1B6 <= realWorkingBuffer[94];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=0.4057758768209987;
				 twiddleFactorimgB6 <=-0.9139726132604574;
				 stateIp1B6<=12'd94;
				 stateIp2B6<=12'd350;

				 //(95,351)
				 imgIp1B7 <= imagWorkingBuffer[95];
				 realIp1B7 <= realWorkingBuffer[95];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=0.3945351893718227;
				 twiddleFactorimgB7 <=-0.9188808325062288;
				 stateIp1B7<=12'd95;
				 stateIp2B7<=12'd351;
			 end
			 8'd269 : begin

				 //(96,352)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[352];
				 realIp2B0 <= realWorkingBuffer[352];
				 twiddleFactorRealB0 <=0.38323514660061825;
				 twiddleFactorimgB0 <=-0.9236508119468106;
				 stateIp1B0<=12'd96;
				 stateIp2B0<=12'd352;

				 //(97,353)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[353];
				 realIp2B1 <= realWorkingBuffer[353];
				 twiddleFactorRealB1 <=0.37187744852729676;
				 twiddleFactorimgB1 <=-0.928281833968988;
				 stateIp1B1<=12'd97;
				 stateIp2B1<=12'd353;

				 //(98,354)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[354];
				 realIp2B2 <= realWorkingBuffer[354];
				 twiddleFactorRealB2 <=0.36046380384564436;
				 twiddleFactorimgB2 <=-0.9327732018648096;
				 stateIp1B2<=12'd98;
				 stateIp2B2<=12'd354;

				 //(99,355)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[355];
				 realIp2B3 <= realWorkingBuffer[355];
				 twiddleFactorRealB3 <=0.3489959296662612;
				 twiddleFactorimgB3 <=-0.9371242399364036;
				 stateIp1B3<=12'd99;
				 stateIp2B3<=12'd355;

				 //(100,356)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[356];
				 realIp2B4 <= realWorkingBuffer[356];
				 twiddleFactorRealB4 <=0.33747555125823137;
				 twiddleFactorimgB4 <=-0.941334293597632;
				 stateIp1B4<=12'd100;
				 stateIp2B4<=12'd356;

				 //(101,357)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[357];
				 realIp2B5 <= realWorkingBuffer[357];
				 twiddleFactorRealB5 <=0.32590440178956803;
				 twiddleFactorimgB5 <=-0.9454027294725692;
				 stateIp1B5<=12'd101;
				 stateIp2B5<=12'd357;

				 //(102,358)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[358];
				 realIp2B6 <= realWorkingBuffer[358];
				 twiddleFactorRealB6 <=0.31428422206646894;
				 twiddleFactorimgB6 <=-0.9493289354907889;
				 stateIp1B6<=12'd102;
				 stateIp2B6<=12'd358;

				 //(103,359)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[359];
				 realIp2B7 <= realWorkingBuffer[359];
				 twiddleFactorRealB7 <=0.3026167602714238;
				 twiddleFactorimgB7 <=-0.9531123209794465;
				 stateIp1B7<=12'd103;
				 stateIp2B7<=12'd359;
			 end
			 8'd270 : begin

				 //(104,360)
				 imgIp1B0 <= imagWorkingBuffer[104];
				 realIp1B0 <= realWorkingBuffer[104];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=0.29090377170021026;
				 twiddleFactorimgB0 <=-0.9567523167521425;
				 stateIp1B0<=12'd104;
				 stateIp2B0<=12'd360;

				 //(105,361)
				 imgIp1B1 <= imagWorkingBuffer[105];
				 realIp1B1 <= realWorkingBuffer[105];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=0.2791470184978214;
				 twiddleFactorimgB1 <=-0.9602483751945519;
				 stateIp1B1<=12'd105;
				 stateIp2B1<=12'd361;

				 //(106,362)
				 imgIp1B2 <= imagWorkingBuffer[106];
				 realIp1B2 <= realWorkingBuffer[106];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=0.2673482693933619;
				 twiddleFactorimgB2 <=-0.9635999703468107;
				 stateIp1B2<=12'd106;
				 stateIp2B2<=12'd362;

				 //(107,363)
				 imgIp1B3 <= imagWorkingBuffer[107];
				 realIp1B3 <= realWorkingBuffer[107];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=0.2555092994339547;
				 twiddleFactorimgB3 <=-0.9668065979826419;
				 stateIp1B3<=12'd107;
				 stateIp2B3<=12'd363;

				 //(108,364)
				 imgIp1B4 <= imagWorkingBuffer[108];
				 realIp1B4 <= realWorkingBuffer[108];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=0.24363188971769512;
				 twiddleFactorimgB4 <=-0.9698677756852141;
				 stateIp1B4<=12'd108;
				 stateIp2B4<=12'd364;

				 //(109,365)
				 imgIp1B5 <= imagWorkingBuffer[109];
				 realIp1B5 <= realWorkingBuffer[109];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=0.23171782712569686;
				 twiddleFactorimgB5 <=-0.9727830429197178;
				 stateIp1B5<=12'd109;
				 stateIp2B5<=12'd365;

				 //(110,366)
				 imgIp1B6 <= imagWorkingBuffer[110];
				 realIp1B6 <= realWorkingBuffer[110];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=0.21976890405326657;
				 twiddleFactorimgB6 <=-0.9755519611026499;
				 stateIp1B6<=12'd110;
				 stateIp2B6<=12'd366;

				 //(111,367)
				 imgIp1B7 <= imagWorkingBuffer[111];
				 realIp1B7 <= realWorkingBuffer[111];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=0.20778691814025013;
				 twiddleFactorimgB7 <=-0.9781741136677954;
				 stateIp1B7<=12'd111;
				 stateIp2B7<=12'd367;
			 end
			 8'd271 : begin

				 //(112,368)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=0.19577367200058793;
				 twiddleFactorimgB0 <=-0.9806491061288978;
				 stateIp1B0<=12'd112;
				 stateIp2B0<=12'd368;

				 //(113,369)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=0.18373097295112373;
				 twiddleFactorimgB1 <=-0.982976566139007;
				 stateIp1B1<=12'd113;
				 stateIp2B1<=12'd369;

				 //(114,370)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=0.171660632739705;
				 twiddleFactorimgB2 <=-0.9851561435464959;
				 stateIp1B2<=12'd114;
				 stateIp2B2<=12'd370;

				 //(115,371)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=0.1595644672726177;
				 twiddleFactorimgB3 <=-0.9871875104477394;
				 stateIp1B3<=12'd115;
				 stateIp2B3<=12'd371;

				 //(116,372)
				 imgIp1B4 <= imagWorkingBuffer[116];
				 realIp1B4 <= realWorkingBuffer[116];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=0.1474442963413934;
				 twiddleFactorimgB4 <=-0.9890703612364448;
				 stateIp1B4<=12'd116;
				 stateIp2B4<=12'd372;

				 //(117,373)
				 imgIp1B5 <= imagWorkingBuffer[117];
				 realIp1B5 <= realWorkingBuffer[117];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=0.13530194334903398;
				 twiddleFactorimgB5 <=-0.9908044126496283;
				 stateIp1B5<=12'd117;
				 stateIp2B5<=12'd373;

				 //(118,374)
				 imgIp1B6 <= imagWorkingBuffer[118];
				 realIp1B6 <= realWorkingBuffer[118];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=0.12313923503569187;
				 twiddleFactorimgB6 <=-0.9923894038102304;
				 stateIp1B6<=12'd118;
				 stateIp2B6<=12'd374;

				 //(119,375)
				 imgIp1B7 <= imagWorkingBuffer[119];
				 realIp1B7 <= realWorkingBuffer[119];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=0.1109580012038493;
				 twiddleFactorimgB7 <=-0.9938250962663634;
				 stateIp1B7<=12'd119;
				 stateIp2B7<=12'd375;
			 end
			 8'd272 : begin

				 //(120,376)
				 imgIp1B0 <= imagWorkingBuffer[120];
				 realIp1B0 <= realWorkingBuffer[120];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=0.09876007444303489;
				 twiddleFactorimgB0 <=-0.9951112740271845;
				 stateIp1B0<=12'd120;
				 stateIp2B0<=12'd376;

				 //(121,377)
				 imgIp1B1 <= imagWorkingBuffer[121];
				 realIp1B1 <= realWorkingBuffer[121];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=0.08654728985412294;
				 twiddleFactorimgB1 <=-0.9962477435953903;
				 stateIp1B1<=12'd121;
				 stateIp2B1<=12'd377;

				 //(122,378)
				 imgIp1B2 <= imagWorkingBuffer[122];
				 realIp1B2 <= realWorkingBuffer[122];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=0.07432148477325375;
				 twiddleFactorimgB2 <=-0.9972343339963275;
				 stateIp1B2<=12'd122;
				 stateIp2B2<=12'd378;

				 //(123,379)
				 imgIp1B3 <= imagWorkingBuffer[123];
				 realIp1B3 <= realWorkingBuffer[123];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=0.06208449849541889;
				 twiddleFactorimgB3 <=-0.9980708968037152;
				 stateIp1B3<=12'd123;
				 stateIp2B3<=12'd379;

				 //(124,380)
				 imgIp1B4 <= imagWorkingBuffer[124];
				 realIp1B4 <= realWorkingBuffer[124];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=0.04983817199774956;
				 twiddleFactorimgB4 <=-0.9987573061619738;
				 stateIp1B4<=12'd124;
				 stateIp2B4<=12'd380;

				 //(125,381)
				 imgIp1B5 <= imagWorkingBuffer[125];
				 realIp1B5 <= realWorkingBuffer[125];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=0.03758434766255414;
				 twiddleFactorimgB5 <=-0.9992934588051601;
				 stateIp1B5<=12'd125;
				 stateIp2B5<=12'd381;

				 //(126,382)
				 imgIp1B6 <= imagWorkingBuffer[126];
				 realIp1B6 <= realWorkingBuffer[126];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=0.025324869000143;
				 twiddleFactorimgB6 <=-0.9996792740725026;
				 stateIp1B6<=12'd126;
				 stateIp2B6<=12'd382;

				 //(127,383)
				 imgIp1B7 <= imagWorkingBuffer[127];
				 realIp1B7 <= realWorkingBuffer[127];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=0.013061580371484905;
				 twiddleFactorimgB7 <=-0.999914693920536;
				 stateIp1B7<=12'd127;
				 stateIp2B7<=12'd383;
			 end
			 8'd273 : begin

				 //(128,384)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[384];
				 realIp2B0 <= realWorkingBuffer[384];
				 twiddleFactorRealB0 <=0.0;
				 twiddleFactorimgB0 <=-0.9999996829318346;
				 stateIp1B0<=12'd128;
				 stateIp2B0<=12'd384;

				 //(129,385)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[385];
				 realIp2B1 <= realWorkingBuffer[385];
				 twiddleFactorRealB1 <=-0.011469046752331654;
				 twiddleFactorimgB1 <=-0.9999342283203395;
				 stateIp1B1<=12'd129;
				 stateIp2B1<=12'd385;

				 //(130,386)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[386];
				 realIp2B2 <= realWorkingBuffer[386];
				 twiddleFactorRealB2 <=-0.023732694769906075;
				 twiddleFactorimgB2 <=-0.9997183399332826;
				 stateIp1B2<=12'd130;
				 stateIp2B2<=12'd386;

				 //(131,387)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[387];
				 realIp2B3 <= realWorkingBuffer[387];
				 twiddleFactorRealB3 <=-0.035992772353768805;
				 twiddleFactorimgB3 <=-0.9993520502497054;
				 stateIp1B3<=12'd131;
				 stateIp2B3<=12'd387;

				 //(132,388)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[388];
				 realIp2B4 <= realWorkingBuffer[388];
				 twiddleFactorRealB4 <=-0.048247435052847135;
				 twiddleFactorimgB4 <=-0.9988354143755723;
				 stateIp1B4<=12'd132;
				 stateIp2B4<=12'd388;

				 //(133,389)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[389];
				 realIp2B5 <= realWorkingBuffer[389];
				 twiddleFactorRealB5 <=-0.060494839230704166;
				 twiddleFactorimgB5 <=-0.9981685100354806;
				 stateIp1B5<=12'd133;
				 stateIp2B5<=12'd389;

				 //(134,390)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[390];
				 realIp2B6 <= realWorkingBuffer[390];
				 twiddleFactorRealB6 <=-0.07273314234290135;
				 twiddleFactorimgB6 <=-0.9973514375609669;
				 stateIp1B6<=12'd134;
				 stateIp2B6<=12'd390;

				 //(135,391)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[391];
				 realIp2B7 <= realWorkingBuffer[391];
				 twiddleFactorRealB7 <=-0.08496050321419807;
				 twiddleFactorimgB7 <=-0.9963843198754134;
				 stateIp1B7<=12'd135;
				 stateIp2B7<=12'd391;
			 end
			 8'd274 : begin

				 //(136,392)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[392];
				 realIp2B0 <= realWorkingBuffer[392];
				 twiddleFactorRealB0 <=-0.09717508231554396;
				 twiddleFactorimgB0 <=-0.9952673024755547;
				 stateIp1B0<=12'd136;
				 stateIp2B0<=12'd392;

				 //(137,393)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[393];
				 realIp2B1 <= realWorkingBuffer[393];
				 twiddleFactorRealB1 <=-0.10937504204082568;
				 twiddleFactorimgB1 <=-0.9940005534095882;
				 stateIp1B1<=12'd137;
				 stateIp2B1<=12'd393;

				 //(138,394)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[394];
				 realIp2B2 <= realWorkingBuffer[394];
				 twiddleFactorRealB2 <=-0.12155854698332229;
				 twiddleFactorimgB2 <=-0.9925842632518931;
				 stateIp1B2<=12'd138;
				 stateIp2B2<=12'd394;

				 //(139,395)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[395];
				 realIp2B3 <= realWorkingBuffer[395];
				 twiddleFactorRealB3 <=-0.13372376421183094;
				 twiddleFactorimgB3 <=-0.9910186450743591;
				 stateIp1B3<=12'd139;
				 stateIp2B3<=12'd395;

				 //(140,396)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=-0.14586886354641898;
				 twiddleFactorimgB4 <=-0.9893039344143316;
				 stateIp1B4<=12'd140;
				 stateIp2B4<=12'd396;

				 //(141,397)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=-0.15799201783376424;
				 twiddleFactorimgB5 <=-0.9874403892391761;
				 stateIp1B5<=12'd141;
				 stateIp2B5<=12'd397;

				 //(142,398)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=-0.17009140322203772;
				 twiddleFactorimgB6 <=-0.9854282899074687;
				 stateIp1B6<=12'd142;
				 stateIp2B6<=12'd398;

				 //(143,399)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=-0.1821651994352911;
				 twiddleFactorimgB7 <=-0.9832679391268184;
				 stateIp1B7<=12'd143;
				 stateIp2B7<=12'd399;
			 end
			 8'd275 : begin

				 //(144,400)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[400];
				 realIp2B0 <= realWorkingBuffer[400];
				 twiddleFactorRealB0 <=-0.19421159004730484;
				 twiddleFactorimgB0 <=-0.9809596619083262;
				 stateIp1B0<=12'd144;
				 stateIp2B0<=12'd400;

				 //(145,401)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[401];
				 realIp2B1 <= realWorkingBuffer[401];
				 twiddleFactorRealB1 <=-0.2062287627548593;
				 twiddleFactorimgB1 <=-0.9785038055176893;
				 stateIp1B1<=12'd145;
				 stateIp2B1<=12'd401;

				 //(146,402)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[402];
				 realIp2B2 <= realWorkingBuffer[402];
				 twiddleFactorRealB2 <=-0.21821490965038332;
				 twiddleFactorimgB2 <=-0.9759007394229574;
				 stateIp1B2<=12'd146;
				 stateIp2B2<=12'd402;

				 //(147,403)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[403];
				 realIp2B3 <= realWorkingBuffer[403];
				 twiddleFactorRealB3 <=-0.2301682274939431;
				 twiddleFactorimgB3 <=-0.9731508552389483;
				 stateIp1B3<=12'd147;
				 stateIp2B3<=12'd403;

				 //(148,404)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[404];
				 realIp2B4 <= realWorkingBuffer[404];
				 twiddleFactorRealB4 <=-0.24208691798452725;
				 twiddleFactorimgB4 <=-0.970254566668332;
				 stateIp1B4<=12'd148;
				 stateIp2B4<=12'd404;

				 //(149,405)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[405];
				 realIp2B5 <= realWorkingBuffer[405];
				 twiddleFactorRealB5 <=-0.25396918803059104;
				 twiddleFactorimgB5 <=-0.9672123094393921;
				 stateIp1B5<=12'd149;
				 stateIp2B5<=12'd405;

				 //(150,406)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[406];
				 realIp2B6 <= realWorkingBuffer[406];
				 twiddleFactorRealB6 <=-0.26581325001981504;
				 twiddleFactorimgB6 <=-0.9640245412404724;
				 stateIp1B6<=12'd150;
				 stateIp2B6<=12'd406;

				 //(151,407)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[407];
				 realIp2B7 <= realWorkingBuffer[407];
				 twiddleFactorRealB7 <=-0.27761732208804013;
				 twiddleFactorimgB7 <=-0.9606917416511216;
				 stateIp1B7<=12'd151;
				 stateIp2B7<=12'd407;
			 end
			 8'd276 : begin

				 //(152,408)
				 imgIp1B0 <= imagWorkingBuffer[152];
				 realIp1B0 <= realWorkingBuffer[152];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=-0.28937962838733716;
				 twiddleFactorimgB0 <=-0.9572144120699431;
				 stateIp1B0<=12'd152;
				 stateIp2B0<=12'd408;

				 //(153,409)
				 imgIp1B1 <= imagWorkingBuffer[153];
				 realIp1B1 <= realWorkingBuffer[153];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=-0.30109839935317323;
				 twiddleFactorimgB1 <=-0.9535930756391622;
				 stateIp1B1<=12'd153;
				 stateIp2B1<=12'd409;

				 //(154,410)
				 imgIp1B2 <= imagWorkingBuffer[154];
				 realIp1B2 <= realWorkingBuffer[154];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=-0.3127718719706306;
				 twiddleFactorimgB2 <=-0.9498282771659241;
				 stateIp1B2<=12'd154;
				 stateIp2B2<=12'd410;

				 //(155,411)
				 imgIp1B3 <= imagWorkingBuffer[155];
				 realIp1B3 <= realWorkingBuffer[155];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=-0.32439829003964143;
				 twiddleFactorimgB3 <=-0.9459205830403293;
				 stateIp1B3<=12'd155;
				 stateIp2B3<=12'd411;

				 //(156,412)
				 imgIp1B4 <= imagWorkingBuffer[156];
				 realIp1B4 <= realWorkingBuffer[156];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=-0.3359759044391963;
				 twiddleFactorimgB4 <=-0.9418705811502258;
				 stateIp1B4<=12'd156;
				 stateIp2B4<=12'd412;

				 //(157,413)
				 imgIp1B5 <= imagWorkingBuffer[157];
				 realIp1B5 <= realWorkingBuffer[157];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=-0.3475029733904896;
				 twiddleFactorimgB5 <=-0.9376788807927631;
				 stateIp1B5<=12'd157;
				 stateIp2B5<=12'd413;

				 //(158,414)
				 imgIp1B6 <= imagWorkingBuffer[158];
				 realIp1B6 <= realWorkingBuffer[158];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=-0.3589777627189582;
				 twiddleFactorimgB6 <=-0.9333461125827285;
				 stateIp1B6<=12'd158;
				 stateIp2B6<=12'd414;

				 //(159,415)
				 imgIp1B7 <= imagWorkingBuffer[159];
				 realIp1B7 <= realWorkingBuffer[159];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=-0.37039854611517764;
				 twiddleFactorimgB7 <=-0.9288729283576751;
				 stateIp1B7<=12'd159;
				 stateIp2B7<=12'd415;
			 end
			 8'd277 : begin

				 //(160,416)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[416];
				 realIp2B0 <= realWorkingBuffer[416];
				 twiddleFactorRealB0 <=-0.38176360539457344;
				 twiddleFactorimgB0 <=-0.9242600010798565;
				 stateIp1B0<=12'd160;
				 stateIp2B0<=12'd416;

				 //(161,417)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[417];
				 realIp2B1 <= realWorkingBuffer[417];
				 twiddleFactorRealB1 <=-0.39307123075591244;
				 twiddleFactorimgB1 <=-0.9195080247349842;
				 stateIp1B1<=12'd161;
				 stateIp2B1<=12'd417;

				 //(162,418)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[418];
				 realIp2B2 <= realWorkingBuffer[418];
				 twiddleFactorRealB2 <=-0.40431972103853064;
				 twiddleFactorimgB2 <=-0.9146177142278213;
				 stateIp1B2<=12'd162;
				 stateIp2B2<=12'd418;

				 //(163,419)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[419];
				 realIp2B3 <= realWorkingBuffer[419];
				 twiddleFactorRealB3 <=-0.4155073839782625;
				 twiddleFactorimgB3 <=-0.9095898052746307;
				 stateIp1B3<=12'd163;
				 stateIp2B3<=12'd419;

				 //(164,420)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[420];
				 realIp2B4 <= realWorkingBuffer[420];
				 twiddleFactorRealB4 <=-0.4266325364620312;
				 twiddleFactorimgB4 <=-0.9044250542924901;
				 stateIp1B4<=12'd164;
				 stateIp2B4<=12'd420;

				 //(165,421)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[421];
				 realIp2B5 <= realWorkingBuffer[421];
				 twiddleFactorRealB5 <=-0.4376935047810619;
				 twiddleFactorimgB5 <=-0.8991242382854944;
				 stateIp1B5<=12'd165;
				 stateIp2B5<=12'd421;

				 //(166,422)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[422];
				 realIp2B6 <= realWorkingBuffer[422];
				 twiddleFactorRealB6 <=-0.44868862488268174;
				 twiddleFactorimgB6 <=-0.8936881547278603;
				 stateIp1B6<=12'd166;
				 stateIp2B6<=12'd422;

				 //(167,423)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[423];
				 realIp2B7 <= realWorkingBuffer[423];
				 twiddleFactorRealB7 <=-0.45961624262066497;
				 twiddleFactorimgB7 <=-0.8881176214439516;
				 stateIp1B7<=12'd167;
				 stateIp2B7<=12'd423;
			 end
			 8'd278 : begin

				 //(168,424)
				 imgIp1B0 <= imagWorkingBuffer[168];
				 realIp1B0 <= realWorkingBuffer[168];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=-0.47047471400408947;
				 twiddleFactorimgB0 <=-0.8824134764852417;
				 stateIp1B0<=12'd168;
				 stateIp2B0<=12'd424;

				 //(169,425)
				 imgIp1B1 <= imagWorkingBuffer[169];
				 realIp1B1 <= realWorkingBuffer[169];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=-0.48126240544466425;
				 twiddleFactorimgB1 <=-0.8765765780042355;
				 stateIp1B1<=12'd169;
				 stateIp2B1<=12'd425;

				 //(170,426)
				 imgIp1B2 <= imagWorkingBuffer[170];
				 realIp1B2 <= realWorkingBuffer[170];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=-0.49197769400249325;
				 twiddleFactorimgB2 <=-0.8706078041253645;
				 stateIp1B2<=12'd170;
				 stateIp2B2<=12'd426;

				 //(171,427)
				 imgIp1B3 <= imagWorkingBuffer[171];
				 realIp1B3 <= realWorkingBuffer[171];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=-0.5026189676302347;
				 twiddleFactorimgB3 <=-0.8645080528128799;
				 stateIp1B3<=12'd171;
				 stateIp2B3<=12'd427;

				 //(172,428)
				 imgIp1B4 <= imagWorkingBuffer[172];
				 realIp1B4 <= realWorkingBuffer[172];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=-0.5131846254156256;
				 twiddleFactorimgB4 <=-0.858278241735758;
				 stateIp1B4<=12'd172;
				 stateIp2B4<=12'd428;

				 //(173,429)
				 imgIp1B5 <= imagWorkingBuffer[173];
				 realIp1B5 <= realWorkingBuffer[173];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=-0.5236730778223275;
				 twiddleFactorimgB5 <=-0.8519193081296436;
				 stateIp1B5<=12'd173;
				 stateIp2B5<=12'd429;

				 //(174,430)
				 imgIp1B6 <= imagWorkingBuffer[174];
				 realIp1B6 <= realWorkingBuffer[174];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=-0.5340827469290627;
				 twiddleFactorimgB6 <=-0.8454322086558489;
				 stateIp1B6<=12'd174;
				 stateIp2B6<=12'd430;

				 //(175,431)
				 imgIp1B7 <= imagWorkingBuffer[175];
				 realIp1B7 <= realWorkingBuffer[175];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=-0.544412066667002;
				 twiddleFactorimgB7 <=-0.8388179192574297;
				 stateIp1B7<=12'd175;
				 stateIp2B7<=12'd431;
			 end
			 8'd279 : begin

				 //(176,432)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=-0.5546594830553704;
				 twiddleFactorimgB0 <=-0.8320774350123606;
				 stateIp1B0<=12'd176;
				 stateIp2B0<=12'd432;

				 //(177,433)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=-0.5648234544352332;
				 twiddleFactorimgB1 <=-0.8252117699838327;
				 stateIp1B1<=12'd177;
				 stateIp2B1<=12'd433;

				 //(178,434)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=-0.5749024517014297;
				 twiddleFactorimgB2 <=-0.8182219570676927;
				 stateIp1B2<=12'd178;
				 stateIp2B2<=12'd434;

				 //(179,435)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=-0.5848949585326155;
				 twiddleFactorimgB3 <=-0.8111090478370525;
				 stateIp1B3<=12'd179;
				 stateIp2B3<=12'd435;

				 //(180,436)
				 imgIp1B4 <= imagWorkingBuffer[180];
				 realIp1B4 <= realWorkingBuffer[180];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=-0.594799471619386;
				 twiddleFactorimgB4 <=-0.8038741123840842;
				 stateIp1B4<=12'd180;
				 stateIp2B4<=12'd436;

				 //(181,437)
				 imgIp1B5 <= imagWorkingBuffer[181];
				 realIp1B5 <= realWorkingBuffer[181];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=-0.6046145008904377;
				 twiddleFactorimgB5 <=-0.7965182391590333;
				 stateIp1B5<=12'd181;
				 stateIp2B5<=12'd437;

				 //(182,438)
				 imgIp1B6 <= imagWorkingBuffer[182];
				 realIp1B6 <= realWorkingBuffer[182];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=-0.6143385697367412;
				 twiddleFactorimgB6 <=-0.7890425348064674;
				 stateIp1B6<=12'd182;
				 stateIp2B6<=12'd438;

				 //(183,439)
				 imgIp1B7 <= imagWorkingBuffer[183];
				 realIp1B7 <= realWorkingBuffer[183];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=-0.623970215233687;
				 twiddleFactorimgB7 <=-0.7814481239987888;
				 stateIp1B7<=12'd183;
				 stateIp2B7<=12'd439;
			 end
			 8'd280 : begin

				 //(184,440)
				 imgIp1B0 <= imagWorkingBuffer[184];
				 realIp1B0 <= realWorkingBuffer[184];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=-0.6335079883611737;
				 twiddleFactorimgB0 <=-0.7737361492670347;
				 stateIp1B0<=12'd184;
				 stateIp2B0<=12'd440;

				 //(185,441)
				 imgIp1B1 <= imagWorkingBuffer[185];
				 realIp1B1 <= realWorkingBuffer[185];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=-0.6429504542216038;
				 twiddleFactorimgB1 <=-0.7659077708289904;
				 stateIp1B1<=12'd185;
				 stateIp2B1<=12'd441;

				 //(186,442)
				 imgIp1B2 <= imagWorkingBuffer[186];
				 realIp1B2 <= realWorkingBuffer[186];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=-0.652296192255755;
				 twiddleFactorimgB2 <=-0.757964166414642;
				 stateIp1B2<=12'd186;
				 stateIp2B2<=12'd442;

				 //(187,443)
				 imgIp1B3 <= imagWorkingBuffer[187];
				 realIp1B3 <= realWorkingBuffer[187];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=-0.6615437964564931;
				 twiddleFactorimgB3 <=-0.7499065310889951;
				 stateIp1B3<=12'd187;
				 stateIp2B3<=12'd443;

				 //(188,444)
				 imgIp1B4 <= imagWorkingBuffer[188];
				 realIp1B4 <= realWorkingBuffer[188];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=-0.6706918755802994;
				 twiddleFactorimgB4 <=-0.7417360770722833;
				 stateIp1B4<=12'd188;
				 stateIp2B4<=12'd444;

				 //(189,445)
				 imgIp1B5 <= imagWorkingBuffer[189];
				 realIp1B5 <= realWorkingBuffer[189];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=-0.6797390533565725;
				 twiddleFactorimgB5 <=-0.7334540335575984;
				 stateIp1B5<=12'd189;
				 stateIp2B5<=12'd445;

				 //(190,446)
				 imgIp1B6 <= imagWorkingBuffer[190];
				 realIp1B6 <= realWorkingBuffer[190];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=-0.6886839686946801;
				 twiddleFactorimgB6 <=-0.725061646525966;
				 stateIp1B6<=12'd190;
				 stateIp2B6<=12'd446;

				 //(191,447)
				 imgIp1B7 <= imagWorkingBuffer[191];
				 realIp1B7 <= realWorkingBuffer[191];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=-0.6975252758887264;
				 twiddleFactorimgB7 <=-0.7165601785588954;
				 stateIp1B7<=12'd191;
				 stateIp2B7<=12'd447;
			 end
			 8'd281 : begin

				 //(192,448)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[448];
				 realIp2B0 <= realWorkingBuffer[448];
				 twiddleFactorRealB0 <=-0.7062616448200052;
				 twiddleFactorimgB0 <=-0.7079509086484322;
				 stateIp1B0<=12'd192;
				 stateIp2B0<=12'd448;

				 //(193,449)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[449];
				 realIp2B1 <= realWorkingBuffer[449];
				 twiddleFactorRealB1 <=-0.7148917611571077;
				 twiddleFactorimgB1 <=-0.6992351320047419;
				 stateIp1B1<=12'd193;
				 stateIp2B1<=12'd449;

				 //(194,450)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[450];
				 realIp2B2 <= realWorkingBuffer[450];
				 twiddleFactorRealB2 <=-0.7234143265536556;
				 twiddleFactorimgB2 <=-0.6904141598612539;
				 stateIp1B2<=12'd194;
				 stateIp2B2<=12'd450;

				 //(195,451)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[451];
				 realIp2B3 <= realWorkingBuffer[451];
				 twiddleFactorRealB3 <=-0.7318280588436284;
				 twiddleFactorimgB3 <=-0.6814893192773946;
				 stateIp1B3<=12'd195;
				 stateIp2B3<=12'd451;

				 //(196,452)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[452];
				 realIp2B4 <= realWorkingBuffer[452];
				 twiddleFactorRealB4 <=-0.7401316922342577;
				 twiddleFactorimgB4 <=-0.6724619529389407;
				 stateIp1B4<=12'd196;
				 stateIp2B4<=12'd452;

				 //(197,453)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[453];
				 realIp2B5 <= realWorkingBuffer[453];
				 twiddleFactorRealB5 <=-0.7483239774964577;
				 twiddleFactorimgB5 <=-0.6633334189560187;
				 stateIp1B5<=12'd197;
				 stateIp2B5<=12'd453;

				 //(198,454)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[454];
				 realIp2B6 <= realWorkingBuffer[454];
				 twiddleFactorRealB6 <=-0.7564036821527641;
				 twiddleFactorimgB6 <=-0.6541050906587872;
				 stateIp1B6<=12'd198;
				 stateIp2B6<=12'd454;

				 //(199,455)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[455];
				 realIp2B7 <= realWorkingBuffer[455];
				 twiddleFactorRealB7 <=-0.7643695906627518;
				 twiddleFactorimgB7 <=-0.6447783563908277;
				 stateIp1B7<=12'd199;
				 stateIp2B7<=12'd455;
			 end
			 8'd282 : begin

				 //(200,456)
				 imgIp1B0 <= imagWorkingBuffer[200];
				 realIp1B0 <= realWorkingBuffer[200];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=-0.7722205046059057;
				 twiddleFactorimgB0 <=-0.6353546193002774;
				 stateIp1B0<=12'd200;
				 stateIp2B0<=12'd456;

				 //(201,457)
				 imgIp1B1 <= imagWorkingBuffer[201];
				 realIp1B1 <= realWorkingBuffer[201];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=-0.7799552428619154;
				 twiddleFactorimgB1 <=-0.6258352971287338;
				 stateIp1B1<=12'd201;
				 stateIp2B1<=12'd457;

				 //(202,458)
				 imgIp1B2 <= imagWorkingBuffer[202];
				 realIp1B2 <= realWorkingBuffer[202];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=-0.7875726417883676;
				 twiddleFactorimgB2 <=-0.6162218219979649;
				 stateIp1B2<=12'd202;
				 stateIp2B2<=12'd458;

				 //(203,459)
				 imgIp1B3 <= imagWorkingBuffer[203];
				 realIp1B3 <= realWorkingBuffer[203];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=-0.7950715553958082;
				 twiddleFactorimgB3 <=-0.6065156401944556;
				 stateIp1B3<=12'd203;
				 stateIp2B3<=12'd459;

				 //(204,460)
				 imgIp1B4 <= imagWorkingBuffer[204];
				 realIp1B4 <= realWorkingBuffer[204];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=-0.8024508555201488;
				 twiddleFactorimgB4 <=-0.5967182119518234;
				 stateIp1B4<=12'd204;
				 stateIp2B4<=12'd460;

				 //(205,461)
				 imgIp1B5 <= imagWorkingBuffer[205];
				 realIp1B5 <= realWorkingBuffer[205];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=-0.8097094319923935;
				 twiddleFactorimgB5 <=-0.586831011231134;
				 stateIp1B5<=12'd205;
				 stateIp2B5<=12'd461;

				 //(206,462)
				 imgIp1B6 <= imagWorkingBuffer[206];
				 realIp1B6 <= realWorkingBuffer[206];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=-0.8168461928056552;
				 twiddleFactorimgB6 <=-0.5768555254991551;
				 stateIp1B6<=12'd206;
				 stateIp2B6<=12'd462;

				 //(207,463)
				 imgIp1B7 <= imagWorkingBuffer[207];
				 realIp1B7 <= realWorkingBuffer[207];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=-0.8238600642794416;
				 twiddleFactorimgB7 <=-0.5667932555045749;
				 stateIp1B7<=12'd207;
				 stateIp2B7<=12'd463;
			 end
			 8'd283 : begin

				 //(208,464)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=-0.8307499912211839;
				 twiddleFactorimgB0 <=-0.556645715052225;
				 stateIp1B0<=12'd208;
				 stateIp2B0<=12'd464;

				 //(209,465)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=-0.8375149370849835;
				 twiddleFactorimgB1 <=-0.5464144307753376;
				 stateIp1B1<=12'd209;
				 stateIp2B1<=12'd465;

				 //(210,466)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=-0.8441538841275539;
				 twiddleFactorimgB2 <=-0.5361009419058731;
				 stateIp1B2<=12'd210;
				 stateIp2B2<=12'd466;

				 //(211,467)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=-0.8506658335613341;
				 twiddleFactorimgB3 <=-0.5257068000429522;
				 stateIp1B3<=12'd211;
				 stateIp2B3<=12'd467;

				 //(212,468)
				 imgIp1B4 <= imagWorkingBuffer[212];
				 realIp1B4 <= realWorkingBuffer[212];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=-0.8570498057047488;
				 twiddleFactorimgB4 <=-0.5152335689194294;
				 stateIp1B4<=12'd212;
				 stateIp2B4<=12'd468;

				 //(213,469)
				 imgIp1B5 <= imagWorkingBuffer[213];
				 realIp1B5 <= realWorkingBuffer[213];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=-0.8633048401295965;
				 twiddleFactorimgB5 <=-0.5046828241666362;
				 stateIp1B5<=12'd213;
				 stateIp2B5<=12'd469;

				 //(214,470)
				 imgIp1B6 <= imagWorkingBuffer[214];
				 realIp1B6 <= realWorkingBuffer[214];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=-0.8694299958055394;
				 twiddleFactorimgB6 <=-0.4940561530773398;
				 stateIp1B6<=12'd214;
				 stateIp2B6<=12'd470;

				 //(215,471)
				 imgIp1B7 <= imagWorkingBuffer[215];
				 realIp1B7 <= realWorkingBuffer[215];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=-0.8754243512416752;
				 twiddleFactorimgB7 <=-0.483355154366944;
				 stateIp1B7<=12'd215;
				 stateIp2B7<=12'd471;
			 end
			 8'd284 : begin

				 //(216,472)
				 imgIp1B0 <= imagWorkingBuffer[216];
				 realIp1B0 <= realWorkingBuffer[216];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=-0.8812870046251697;
				 twiddleFactorimgB0 <=-0.4725814379329727;
				 stateIp1B0<=12'd216;
				 stateIp2B0<=12'd472;

				 //(217,473)
				 imgIp1B1 <= imagWorkingBuffer[217];
				 realIp1B1 <= realWorkingBuffer[217];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=-0.8870170739569293;
				 twiddleFactorimgB1 <=-0.4617366246128712;
				 stateIp1B1<=12'd217;
				 stateIp2B1<=12'd473;

				 //(218,474)
				 imgIp1B2 <= imagWorkingBuffer[218];
				 realIp1B2 <= realWorkingBuffer[218];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=-0.8926136971842913;
				 twiddleFactorimgB2 <=-0.4508223459401611;
				 stateIp1B2<=12'd218;
				 stateIp2B2<=12'd474;

				 //(219,475)
				 imgIp1B3 <= imagWorkingBuffer[219];
				 realIp1B3 <= realWorkingBuffer[219];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=-0.8980760323307154;
				 twiddleFactorimgB3 <=-0.43984024389898635;
				 stateIp1B3<=12'd219;
				 stateIp2B3<=12'd475;

				 //(220,476)
				 imgIp1B4 <= imagWorkingBuffer[220];
				 realIp1B4 <= realWorkingBuffer[220];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=-0.9034032576224522;
				 twiddleFactorimgB4 <=-0.42879197067708863;
				 stateIp1B4<=12'd220;
				 stateIp2B4<=12'd476;

				 //(221,477)
				 imgIp1B5 <= imagWorkingBuffer[221];
				 realIp1B5 <= realWorkingBuffer[221];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=-0.9085945716121755;
				 twiddleFactorimgB5 <=-0.4176791884172436;
				 stateIp1B5<=12'd221;
				 stateIp2B5<=12'd477;

				 //(222,478)
				 imgIp1B6 <= imagWorkingBuffer[222];
				 realIp1B6 <= realWorkingBuffer[222];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=-0.913649193299554;
				 twiddleFactorimgB6 <=-0.40650356896720385;
				 stateIp1B6<=12'd222;
				 stateIp2B6<=12'd478;

				 //(223,479)
				 imgIp1B7 <= imagWorkingBuffer[223];
				 realIp1B7 <= realWorkingBuffer[223];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=-0.918566362248748;
				 twiddleFactorimgB7 <=-0.3952667936281795;
				 stateIp1B7<=12'd223;
				 stateIp2B7<=12'd479;
			 end
			 8'd285 : begin

				 //(224,480)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=-0.9233453387028124;
				 twiddleFactorimgB0 <=-0.38397055290189713;
				 stateIp1B0<=12'd224;
				 stateIp2B0<=12'd480;

				 //(225,481)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=-0.9279854036949883;
				 twiddleFactorimgB1 <=-0.3726165462362743;
				 stateIp1B1<=12'd225;
				 stateIp2B1<=12'd481;

				 //(226,482)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=-0.9324858591568669;
				 twiddleFactorimgB2 <=-0.36120648176974873;
				 stateIp1B2<=12'd226;
				 stateIp2B2<=12'd482;

				 //(227,483)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=-0.9368460280234095;
				 twiddleFactorimgB3 <=-0.34974207607429925;
				 stateIp1B3<=12'd227;
				 stateIp2B3<=12'd483;

				 //(228,484)
				 imgIp1B4 <= imagWorkingBuffer[228];
				 realIp1B4 <= realWorkingBuffer[228];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=-0.9410652543348083;
				 twiddleFactorimgB4 <=-0.3382250538971983;
				 stateIp1B4<=12'd228;
				 stateIp2B4<=12'd484;

				 //(229,485)
				 imgIp1B5 <= imagWorkingBuffer[229];
				 realIp1B5 <= realWorkingBuffer[229];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=-0.9451429033351697;
				 twiddleFactorimgB5 <=-0.3266571479015362;
				 stateIp1B5<=12'd229;
				 stateIp2B5<=12'd485;

				 //(230,486)
				 imgIp1B6 <= imagWorkingBuffer[230];
				 realIp1B6 <= realWorkingBuffer[230];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=-0.9490783615680114;
				 twiddleFactorimgB6 <=-0.31504009840555053;
				 stateIp1B6<=12'd230;
				 stateIp2B6<=12'd486;

				 //(231,487)
				 imgIp1B7 <= imagWorkingBuffer[231];
				 realIp1B7 <= realWorkingBuffer[231];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=-0.9528710369685519;
				 twiddleFactorimgB7 <=-0.3033756531208077;
				 stateIp1B7<=12'd231;
				 stateIp2B7<=12'd487;
			 end
			 8'd286 : begin

				 //(232,488)
				 imgIp1B0 <= imagWorkingBuffer[232];
				 realIp1B0 <= realWorkingBuffer[232];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=-0.9565203589527828;
				 twiddleFactorimgB0 <=-0.29166556688927076;
				 stateIp1B0<=12'd232;
				 stateIp2B0<=12'd488;

				 //(233,489)
				 imgIp1B1 <= imagWorkingBuffer[233];
				 realIp1B1 <= realWorkingBuffer[233];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=-0.96002577850331;
				 twiddleFactorimgB1 <=-0.27991160141929405;
				 stateIp1B1<=12'd233;
				 stateIp2B1<=12'd489;

				 //(234,490)
				 imgIp1B2 <= imagWorkingBuffer[234];
				 realIp1B2 <= realWorkingBuffer[234];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=-0.9633867682519496;
				 twiddleFactorimgB2 <=-0.2681155250205858;
				 stateIp1B2<=12'd234;
				 stateIp2B2<=12'd490;

				 //(235,491)
				 imgIp1B3 <= imagWorkingBuffer[235];
				 realIp1B3 <= realWorkingBuffer[235];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=-0.9666028225590675;
				 twiddleFactorimgB3 <=-0.25627911233817685;
				 stateIp1B3<=12'd235;
				 stateIp2B3<=12'd491;

				 //(236,492)
				 imgIp1B4 <= imagWorkingBuffer[236];
				 realIp1B4 <= realWorkingBuffer[236];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=-0.9696734575896493;
				 twiddleFactorimgB4 <=-0.2444041440854362;
				 stateIp1B4<=12'd236;
				 stateIp2B4<=12'd492;

				 //(237,493)
				 imgIp1B5 <= imagWorkingBuffer[237];
				 realIp1B5 <= realWorkingBuffer[237];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=-0.9725982113860899;
				 twiddleFactorimgB5 <=-0.23249240677617566;
				 stateIp1B5<=12'd237;
				 stateIp2B5<=12'd493;

				 //(238,494)
				 imgIp1B6 <= imagWorkingBuffer[238];
				 realIp1B6 <= realWorkingBuffer[238];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=-0.9753766439376932;
				 twiddleFactorimgB6 <=-0.22054569245587763;
				 stateIp1B6<=12'd238;
				 stateIp2B6<=12'd494;

				 //(239,495)
				 imgIp1B7 <= imagWorkingBuffer[239];
				 realIp1B7 <= realWorkingBuffer[239];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=-0.9780083372468676;
				 twiddleFactorimgB7 <=-0.20856579843209472;
				 stateIp1B7<=12'd239;
				 stateIp2B7<=12'd495;
			 end
			 8'd287 : begin

				 //(240,496)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=-0.9804928953920125;
				 twiddleFactorimgB0 <=-0.19655452700405607;
				 stateIp1B0<=12'd240;
				 stateIp2B0<=12'd496;

				 //(241,497)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=-0.9828299445870805;
				 twiddleFactorimgB1 <=-0.18451368519152256;
				 stateIp1B1<=12'd241;
				 stateIp2B1<=12'd497;

				 //(242,498)
				 imgIp1B2 <= imagWorkingBuffer[242];
				 realIp1B2 <= realWorkingBuffer[242];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=-0.9850191332378129;
				 twiddleFactorimgB2 <=-0.17244508446293239;
				 stateIp1B2<=12'd242;
				 stateIp2B2<=12'd498;

				 //(243,499)
				 imgIp1B3 <= imagWorkingBuffer[243];
				 realIp1B3 <= realWorkingBuffer[243];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=-0.9870601319946335;
				 twiddleFactorimgB3 <=-0.16035054046287683;
				 stateIp1B3<=12'd243;
				 stateIp2B3<=12'd499;

				 //(244,500)
				 imgIp1B4 <= imagWorkingBuffer[244];
				 realIp1B4 <= realWorkingBuffer[244];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=-0.988952633802198;
				 twiddleFactorimgB4 <=-0.1482318727389478;
				 stateIp1B4<=12'd244;
				 stateIp2B4<=12'd500;

				 //(245,501)
				 imgIp1B5 <= imagWorkingBuffer[245];
				 realIp1B5 <= realWorkingBuffer[245];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=-0.990696353945588;
				 twiddleFactorimgB5 <=-0.1360909044680001;
				 stateIp1B5<=12'd245;
				 stateIp2B5<=12'd501;

				 //(246,502)
				 imgIp1B6 <= imagWorkingBuffer[246];
				 realIp1B6 <= realWorkingBuffer[246];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=-0.9922910300931447;
				 twiddleFactorimgB6 <=-0.12392946218186328;
				 stateIp1B6<=12'd246;
				 stateIp2B6<=12'd502;

				 //(247,503)
				 imgIp1B7 <= imagWorkingBuffer[247];
				 realIp1B7 <= realWorkingBuffer[247];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=-0.9937364223359353;
				 twiddleFactorimgB7 <=-0.11174937549255338;
				 stateIp1B7<=12'd247;
				 stateIp2B7<=12'd503;
			 end
			 8'd288 : begin

				 //(248,504)
				 imgIp1B0 <= imagWorkingBuffer[248];
				 realIp1B0 <= realWorkingBuffer[248];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=-0.9950323132238454;
				 twiddleFactorimgB0 <=-0.09955247681701893;
				 stateIp1B0<=12'd248;
				 stateIp2B0<=12'd504;

				 //(249,505)
				 imgIp1B1 <= imagWorkingBuffer[249];
				 realIp1B1 <= realWorkingBuffer[249];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=-0.9961785077982935;
				 twiddleFactorimgB1 <=-0.08734060110146528;
				 stateIp1B1<=12'd249;
				 stateIp2B1<=12'd505;

				 //(250,506)
				 imgIp1B2 <= imagWorkingBuffer[250];
				 realIp1B2 <= realWorkingBuffer[250];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=-0.9971748336215606;
				 twiddleFactorimgB2 <=-0.07511558554529872;
				 stateIp1B2<=12'd250;
				 stateIp2B2<=12'd506;

				 //(251,507)
				 imgIp1B3 <= imagWorkingBuffer[251];
				 realIp1B3 <= realWorkingBuffer[251];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=-0.9980211408027326;
				 twiddleFactorimgB3 <=-0.06287926932473137;
				 stateIp1B3<=12'd251;
				 stateIp2B3<=12'd507;

				 //(252,508)
				 imgIp1B4 <= imagWorkingBuffer[252];
				 realIp1B4 <= realWorkingBuffer[252];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=-0.9987173020202512;
				 twiddleFactorimgB4 <=-0.05063349331608835;
				 stateIp1B4<=12'd252;
				 stateIp2B4<=12'd508;

				 //(253,509)
				 imgIp1B5 <= imagWorkingBuffer[253];
				 realIp1B5 <= realWorkingBuffer[253];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=-0.9992632125410673;
				 twiddleFactorimgB5 <=-0.038380099818861334;
				 stateIp1B5<=12'd253;
				 stateIp2B5<=12'd509;

				 //(254,510)
				 imgIp1B6 <= imagWorkingBuffer[254];
				 realIp1B6 <= realWorkingBuffer[254];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=-0.9996587902363985;
				 twiddleFactorimgB6 <=-0.026120932278543618;
				 stateIp1B6<=12'd254;
				 stateIp2B6<=12'd510;

				 //(255,511)
				 imgIp1B7 <= imagWorkingBuffer[255];
				 realIp1B7 <= realWorkingBuffer[255];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=-0.9999039755940843;
				 twiddleFactorimgB7 <=-0.013857835009297178;
				 stateIp1B7<=12'd255;
				 stateIp2B7<=12'd511;
			 end
		endcase
	end
end
endmodule
