`include "Butterfly.v"
module fftCalculator(
input clock,reset,
input real realInput,imagInput,
input startIn,
output reg outputFlag,
output real realOutput,imagOutput);


wire lastStageFlagOp;
integer state;
integer i;
reg [8:0] outputAddress;
reg writeBack,lastStageFlag,computationAvailbleFlag;
reg[8:0] inputAddressCounter,reversedAddress;
reg inputDataStartFLag;
wire startFlagDetected;
reg inputBufferFlag;
reg computationFlag,OutputMemoryRightEnable;
 
reg pushinB0;
wire pushoutB0;
real realIp1B0,realIp2B0,imgIp1B0,imgIp2B0;
real twiddleFactorRealB0,twiddleFactorimgB0;
reg [8:0] stateIp1B0,stateIp2B0;
real  ReOp1B0,ReOp2B0,imgOp1B0,imgOp2B0;
wire [8:0] stateOp1B0,stateOp2B0;
 
reg pushinB1;
wire pushoutB1;
real realIp1B1,realIp2B1,imgIp1B1,imgIp2B1;
real twiddleFactorRealB1,twiddleFactorimgB1;
reg [8:0] stateIp1B1,stateIp2B1;
real  ReOp1B1,ReOp2B1,imgOp1B1,imgOp2B1;
wire [8:0] stateOp1B1,stateOp2B1;
 
reg pushinB2;
wire pushoutB2;
real realIp1B2,realIp2B2,imgIp1B2,imgIp2B2;
real twiddleFactorRealB2,twiddleFactorimgB2;
reg [8:0] stateIp1B2,stateIp2B2;
real  ReOp1B2,ReOp2B2,imgOp1B2,imgOp2B2;
wire [8:0] stateOp1B2,stateOp2B2;
 
reg pushinB3;
wire pushoutB3;
real realIp1B3,realIp2B3,imgIp1B3,imgIp2B3;
real twiddleFactorRealB3,twiddleFactorimgB3;
reg [8:0] stateIp1B3,stateIp2B3;
real  ReOp1B3,ReOp2B3,imgOp1B3,imgOp2B3;
wire [8:0] stateOp1B3,stateOp2B3;
 
reg pushinB4;
wire pushoutB4;
real realIp1B4,realIp2B4,imgIp1B4,imgIp2B4;
real twiddleFactorRealB4,twiddleFactorimgB4;
reg [8:0] stateIp1B4,stateIp2B4;
real  ReOp1B4,ReOp2B4,imgOp1B4,imgOp2B4;
wire [8:0] stateOp1B4,stateOp2B4;
 
reg pushinB5;
wire pushoutB5;
real realIp1B5,realIp2B5,imgIp1B5,imgIp2B5;
real twiddleFactorRealB5,twiddleFactorimgB5;
reg [8:0] stateIp1B5,stateIp2B5;
real  ReOp1B5,ReOp2B5,imgOp1B5,imgOp2B5;
wire [8:0] stateOp1B5,stateOp2B5;
 
reg pushinB6;
wire pushoutB6;
real realIp1B6,realIp2B6,imgIp1B6,imgIp2B6;
real twiddleFactorRealB6,twiddleFactorimgB6;
reg [8:0] stateIp1B6,stateIp2B6;
real  ReOp1B6,ReOp2B6,imgOp1B6,imgOp2B6;
wire [8:0] stateOp1B6,stateOp2B6;
 
reg pushinB7;
wire pushoutB7;
real realIp1B7,realIp2B7,imgIp1B7,imgIp2B7;
real twiddleFactorRealB7,twiddleFactorimgB7;
reg [8:0] stateIp1B7,stateIp2B7;
real  ReOp1B7,ReOp2B7,imgOp1B7,imgOp2B7;
wire [8:0] stateOp1B7,stateOp2B7;
real imagInputBuffer [0:511] , imagWorkingBuffer[0:511],imagOuptutBuff[0:511];
real realInputBuffer [0:511] , realWorkingBuffer[0:511],realOutputBuff[0:511];
real testImaInp, testImaw,testImao;
real testRealInp, testRealw,testRealo;
Butterfly buff1(lastStageFlag,clock,reset,pushinB0,pushoutB0,realIp1B0,realIp2B0,imgIp1B0,imgIp2B0,twiddleFactorRealB0,twiddleFactorimgB0,stateIp1B0,stateIp2B0,ReOp1B0,ReOp2B0,imgOp1B0,imgOp2B0,stateOp1B0,stateOp2B0,lastStageFlagOp);

Butterfly buff2(lastStageFlag,clock,reset,pushinB1,pushoutB1,realIp1B1,realIp2B1,imgIp1B1,imgIp2B1,twiddleFactorRealB1,twiddleFactorimgB1,stateIp1B1,stateIp2B1,ReOp1B1,ReOp2B1,imgOp1B1,imgOp2B1,stateOp1B1,stateOp2B1,lastStageFlagOp);

Butterfly buff3(lastStageFlag,clock,reset,pushinB2,pushoutB2,realIp1B2,realIp2B2,imgIp1B2,imgIp2B2,twiddleFactorRealB2,twiddleFactorimgB2,stateIp1B2,stateIp2B2,ReOp1B2,ReOp2B2,imgOp1B2,imgOp2B2,stateOp1B2,stateOp2B2,lastStageFlagOp);

Butterfly buff4(lastStageFlag,clock,reset,pushinB3,pushoutB3,realIp1B3,realIp2B3,imgIp1B3,imgIp2B3,twiddleFactorRealB3,twiddleFactorimgB3,stateIp1B3,stateIp2B3,ReOp1B3,ReOp2B3,imgOp1B3,imgOp2B3,stateOp1B3,stateOp2B3,lastStageFlagOp);

Butterfly buff5(lastStageFlag,clock,reset,pushinB4,pushoutB4,realIp1B4,realIp2B4,imgIp1B4,imgIp2B4,twiddleFactorRealB4,twiddleFactorimgB4,stateIp1B4,stateIp2B4,ReOp1B4,ReOp2B4,imgOp1B4,imgOp2B4,stateOp1B4,stateOp2B4,lastStageFlagOp);

Butterfly buff6(lastStageFlag,clock,reset,pushinB5,pushoutB5,realIp1B5,realIp2B5,imgIp1B5,imgIp2B5,twiddleFactorRealB5,twiddleFactorimgB5,stateIp1B5,stateIp2B5,ReOp1B5,ReOp2B5,imgOp1B5,imgOp2B5,stateOp1B5,stateOp2B5,lastStageFlagOp);

Butterfly buff7(lastStageFlag,clock,reset,pushinB6,pushoutB6,realIp1B6,realIp2B6,imgIp1B6,imgIp2B6,twiddleFactorRealB6,twiddleFactorimgB6,stateIp1B6,stateIp2B6,ReOp1B6,ReOp2B6,imgOp1B6,imgOp2B6,stateOp1B6,stateOp2B6,lastStageFlagOp);

Butterfly buff8(lastStageFlag,clock,reset,pushinB7,pushoutB7,realIp1B7,realIp2B7,imgIp1B7,imgIp2B7,twiddleFactorRealB7,twiddleFactorimgB7,stateIp1B7,stateIp2B7,ReOp1B7,ReOp2B7,imgOp1B7,imgOp2B7,stateOp1B7,stateOp2B7,lastStageFlagOp);

//assign complexOutput=complxMem[outputAddress];
//assign realOutput=realMem[outputAddress];
always @(*) begin
	if(reset) begin
		realOutput= 0;
		imagOutput= 0;
	end
	else begin
		if(inputDataStartFLag) begin
			reversedAddress= ({inputAddressCounter[0],inputAddressCounter[1],inputAddressCounter[2],inputAddressCounter[3],inputAddressCounter[4],inputAddressCounter[5],inputAddressCounter[6],inputAddressCounter[7],inputAddressCounter[8]});
		end
		else 
			 reversedAddress=0;
		realOutput<=#1  realOutputBuff[(outputAddress)];
		imagOutput<=#1  imagOuptutBuff[(outputAddress)];
		testRealInp <=#1  realInputBuffer[128];
	end
end

always @(posedge clock or posedge reset ) begin

	if(reset) begin
		for(i=0;i<512;i=i+1) begin
			realWorkingBuffer[i]<=#1  0.0;
			imagWorkingBuffer[i]<=#1  0.0;
			realInputBuffer[i]<=#1  0.0;
			imagInputBuffer[i]<=#1  0.0;
			realOutputBuff[i]<=#1  0.0;
			imagOuptutBuff[i]<=#1  0.0;
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
		inputDataStartFLag<=#1 0;
	end
	else begin
		if(startIn) begin
			inputAddressCounter <= #1 1;
			realInputBuffer[0] <= #1 realInput;
			imagInputBuffer[0] <= #1 imagInput;
			inputDataStartFLag<=#1 1;
		end
		else if(inputDataStartFLag) begin
			inputAddressCounter <= #1 (inputAddressCounter+1)%512;
			realInputBuffer[reversedAddress] <= #1 realInput;
			imagInputBuffer[reversedAddress] <= #1 imagInput;
			if(inputAddressCounter==511) begin
				inputBufferFlag<= #1 1;
				inputDataStartFLag<=#1 0;
				end
			end
			else if(inputBufferFlag) begin
				for(i=0;i<512;i=i+1) begin
					realWorkingBuffer[i] <= #1 realInputBuffer[i];
					imagWorkingBuffer[i] <= #1 imagInputBuffer[i];
				end
				inputBufferFlag<=#1 0;
				computationFlag<=#1 1;
				//computationAvailbleFlag<=#1 computationFlag?1:0;
				state<=#1 1;
			end
			else if(computationFlag) begin
				if(state==0)
					state<=#1 1;
				else if(state==288) begin
					state<=#1 0;
					computationFlag<=#1 0;
					lastStageFlag<=#1 0;
				end
				else
					state<=#1 (state+1);
				pushinB0<=#1 1;
				pushinB1<=#1 1;
				pushinB2<=#1 1;
				pushinB3<=#1 1;
				pushinB4<=#1 1;
				pushinB5<=#1 1;
				pushinB6<=#1 1;
				pushinB7<=#1 1;
			end
			else begin
				state<=#1 0;
				pushinB0<=#1 0;
				pushinB1<=#1 0;
				pushinB2<=#1 0;
				pushinB3<=#1 0;
				pushinB4<=#1 0;
				pushinB5<=#1 0;
				pushinB6<=#1 0;
				pushinB7<=#1 0;
				if(stateOp2B7==511) begin
					computationFlag<=#1 0;
					writeBack<=#1 1;
					outputAddress<=#1 0;
					computationFlag<=#1 0;
					outputFlag<=#1 1;
				end
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
			if(writeBack) begin
				outputAddress<=#1 outputAddress+1;
				if(outputAddress==511) begin
					outputAddress<=#1 0;
					writeBack<=#1 1'b0;
					outputFlag<=#1 1'b0;
				end
			end
		case (state)
			 default: begin
				 pushinB0 <=#1 1'b0;
				 imgIp1B0 <=#1 0.0;
				 realIp1B0 <=#1 0.0;
				 imgIp2B0 <=#1 0.0;
				 realIp2B0 <=#1 0.0;
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 0;

				 pushinB1 <=#1 1'b0;
				 imgIp1B1 <=#1 0.0;
				 realIp1B1 <=#1 0.0;
				 imgIp2B1 <=#1 0.0;
				 realIp2B1 <=#1 0.0;
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 0;
				 stateIp2B1<=#1 0;

				 pushinB2 <=#1 1'b0;
				 imgIp1B2 <=#1 0.0;
				 realIp1B2 <=#1 0.0;
				 imgIp2B2 <=#1 0.0;
				 realIp2B2 <=#1 0.0;
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 0;
				 stateIp2B2<=#1 0;

				 pushinB3 <=#1 1'b0;
				 imgIp1B3 <=#1 0.0;
				 realIp1B3 <=#1 0.0;
				 imgIp2B3 <=#1 0.0;
				 realIp2B3 <=#1 0.0;
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 0;
				 stateIp2B3<=#1 0;

				 pushinB4 <=#1 1'b0;
				 imgIp1B4 <=#1 0.0;
				 realIp1B4 <=#1 0.0;
				 imgIp2B4 <=#1 0.0;
				 realIp2B4 <=#1 0.0;
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 0;
				 stateIp2B4<=#1 0;

				 pushinB5 <=#1 1'b0;
				 imgIp1B5 <=#1 0.0;
				 realIp1B5 <=#1 0.0;
				 imgIp2B5 <=#1 0.0;
				 realIp2B5 <=#1 0.0;
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 0;
				 stateIp2B5<=#1 0;

				 pushinB6 <=#1 1'b0;
				 imgIp1B6 <=#1 0.0;
				 realIp1B6 <=#1 0.0;
				 imgIp2B6 <=#1 0.0;
				 realIp2B6 <=#1 0.0;
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 0;
				 stateIp2B6<=#1 0;

				 pushinB7 <=#1 1'b0;
				 imgIp1B7 <=#1 0.0;
				 realIp1B7 <=#1 0.0;
				 imgIp2B7 <=#1 0.0;
				 realIp2B7 <=#1 0.0;
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 0;
				 stateIp2B7<=#1 0;

			 end
			 1 : begin

				 lastStageFlag<=1'b0;

				 //(0,1)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[1];
				 realIp2B0 <= realWorkingBuffer[1];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 1;

				 //(2,3)
				 imgIp1B1 <= imagWorkingBuffer[2];
				 realIp1B1 <= realWorkingBuffer[2];
				 imgIp2B1 <= imagWorkingBuffer[3];
				 realIp2B1 <= realWorkingBuffer[3];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 2;
				 stateIp2B1<=#1 3;

				 //(4,5)
				 imgIp1B2 <= imagWorkingBuffer[4];
				 realIp1B2 <= realWorkingBuffer[4];
				 imgIp2B2 <= imagWorkingBuffer[5];
				 realIp2B2 <= realWorkingBuffer[5];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 4;
				 stateIp2B2<=#1 5;

				 //(6,7)
				 imgIp1B3 <= imagWorkingBuffer[6];
				 realIp1B3 <= realWorkingBuffer[6];
				 imgIp2B3 <= imagWorkingBuffer[7];
				 realIp2B3 <= realWorkingBuffer[7];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 6;
				 stateIp2B3<=#1 7;

				 //(8,9)
				 imgIp1B4 <= imagWorkingBuffer[8];
				 realIp1B4 <= realWorkingBuffer[8];
				 imgIp2B4 <= imagWorkingBuffer[9];
				 realIp2B4 <= realWorkingBuffer[9];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 8;
				 stateIp2B4<=#1 9;

				 //(10,11)
				 imgIp1B5 <= imagWorkingBuffer[10];
				 realIp1B5 <= realWorkingBuffer[10];
				 imgIp2B5 <= imagWorkingBuffer[11];
				 realIp2B5 <= realWorkingBuffer[11];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 10;
				 stateIp2B5<=#1 11;

				 //(12,13)
				 imgIp1B6 <= imagWorkingBuffer[12];
				 realIp1B6 <= realWorkingBuffer[12];
				 imgIp2B6 <= imagWorkingBuffer[13];
				 realIp2B6 <= realWorkingBuffer[13];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 12;
				 stateIp2B6<=#1 13;

				 //(14,15)
				 imgIp1B7 <= imagWorkingBuffer[14];
				 realIp1B7 <= realWorkingBuffer[14];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 14;
				 stateIp2B7<=#1 15;
			 end
			 2 : begin

				 //(16,17)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[17];
				 realIp2B0 <= realWorkingBuffer[17];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 17;

				 //(18,19)
				 imgIp1B1 <= imagWorkingBuffer[18];
				 realIp1B1 <= realWorkingBuffer[18];
				 imgIp2B1 <= imagWorkingBuffer[19];
				 realIp2B1 <= realWorkingBuffer[19];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 18;
				 stateIp2B1<=#1 19;

				 //(20,21)
				 imgIp1B2 <= imagWorkingBuffer[20];
				 realIp1B2 <= realWorkingBuffer[20];
				 imgIp2B2 <= imagWorkingBuffer[21];
				 realIp2B2 <= realWorkingBuffer[21];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 20;
				 stateIp2B2<=#1 21;

				 //(22,23)
				 imgIp1B3 <= imagWorkingBuffer[22];
				 realIp1B3 <= realWorkingBuffer[22];
				 imgIp2B3 <= imagWorkingBuffer[23];
				 realIp2B3 <= realWorkingBuffer[23];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 22;
				 stateIp2B3<=#1 23;

				 //(24,25)
				 imgIp1B4 <= imagWorkingBuffer[24];
				 realIp1B4 <= realWorkingBuffer[24];
				 imgIp2B4 <= imagWorkingBuffer[25];
				 realIp2B4 <= realWorkingBuffer[25];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 24;
				 stateIp2B4<=#1 25;

				 //(26,27)
				 imgIp1B5 <= imagWorkingBuffer[26];
				 realIp1B5 <= realWorkingBuffer[26];
				 imgIp2B5 <= imagWorkingBuffer[27];
				 realIp2B5 <= realWorkingBuffer[27];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 26;
				 stateIp2B5<=#1 27;

				 //(28,29)
				 imgIp1B6 <= imagWorkingBuffer[28];
				 realIp1B6 <= realWorkingBuffer[28];
				 imgIp2B6 <= imagWorkingBuffer[29];
				 realIp2B6 <= realWorkingBuffer[29];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 28;
				 stateIp2B6<=#1 29;

				 //(30,31)
				 imgIp1B7 <= imagWorkingBuffer[30];
				 realIp1B7 <= realWorkingBuffer[30];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 30;
				 stateIp2B7<=#1 31;
			 end
			 3 : begin

				 //(32,33)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[33];
				 realIp2B0 <= realWorkingBuffer[33];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 33;

				 //(34,35)
				 imgIp1B1 <= imagWorkingBuffer[34];
				 realIp1B1 <= realWorkingBuffer[34];
				 imgIp2B1 <= imagWorkingBuffer[35];
				 realIp2B1 <= realWorkingBuffer[35];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 34;
				 stateIp2B1<=#1 35;

				 //(36,37)
				 imgIp1B2 <= imagWorkingBuffer[36];
				 realIp1B2 <= realWorkingBuffer[36];
				 imgIp2B2 <= imagWorkingBuffer[37];
				 realIp2B2 <= realWorkingBuffer[37];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 36;
				 stateIp2B2<=#1 37;

				 //(38,39)
				 imgIp1B3 <= imagWorkingBuffer[38];
				 realIp1B3 <= realWorkingBuffer[38];
				 imgIp2B3 <= imagWorkingBuffer[39];
				 realIp2B3 <= realWorkingBuffer[39];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 38;
				 stateIp2B3<=#1 39;

				 //(40,41)
				 imgIp1B4 <= imagWorkingBuffer[40];
				 realIp1B4 <= realWorkingBuffer[40];
				 imgIp2B4 <= imagWorkingBuffer[41];
				 realIp2B4 <= realWorkingBuffer[41];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 40;
				 stateIp2B4<=#1 41;

				 //(42,43)
				 imgIp1B5 <= imagWorkingBuffer[42];
				 realIp1B5 <= realWorkingBuffer[42];
				 imgIp2B5 <= imagWorkingBuffer[43];
				 realIp2B5 <= realWorkingBuffer[43];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 42;
				 stateIp2B5<=#1 43;

				 //(44,45)
				 imgIp1B6 <= imagWorkingBuffer[44];
				 realIp1B6 <= realWorkingBuffer[44];
				 imgIp2B6 <= imagWorkingBuffer[45];
				 realIp2B6 <= realWorkingBuffer[45];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 44;
				 stateIp2B6<=#1 45;

				 //(46,47)
				 imgIp1B7 <= imagWorkingBuffer[46];
				 realIp1B7 <= realWorkingBuffer[46];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 46;
				 stateIp2B7<=#1 47;
			 end
			 4 : begin

				 //(48,49)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[49];
				 realIp2B0 <= realWorkingBuffer[49];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 49;

				 //(50,51)
				 imgIp1B1 <= imagWorkingBuffer[50];
				 realIp1B1 <= realWorkingBuffer[50];
				 imgIp2B1 <= imagWorkingBuffer[51];
				 realIp2B1 <= realWorkingBuffer[51];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 50;
				 stateIp2B1<=#1 51;

				 //(52,53)
				 imgIp1B2 <= imagWorkingBuffer[52];
				 realIp1B2 <= realWorkingBuffer[52];
				 imgIp2B2 <= imagWorkingBuffer[53];
				 realIp2B2 <= realWorkingBuffer[53];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 52;
				 stateIp2B2<=#1 53;

				 //(54,55)
				 imgIp1B3 <= imagWorkingBuffer[54];
				 realIp1B3 <= realWorkingBuffer[54];
				 imgIp2B3 <= imagWorkingBuffer[55];
				 realIp2B3 <= realWorkingBuffer[55];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 54;
				 stateIp2B3<=#1 55;

				 //(56,57)
				 imgIp1B4 <= imagWorkingBuffer[56];
				 realIp1B4 <= realWorkingBuffer[56];
				 imgIp2B4 <= imagWorkingBuffer[57];
				 realIp2B4 <= realWorkingBuffer[57];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 56;
				 stateIp2B4<=#1 57;

				 //(58,59)
				 imgIp1B5 <= imagWorkingBuffer[58];
				 realIp1B5 <= realWorkingBuffer[58];
				 imgIp2B5 <= imagWorkingBuffer[59];
				 realIp2B5 <= realWorkingBuffer[59];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 58;
				 stateIp2B5<=#1 59;

				 //(60,61)
				 imgIp1B6 <= imagWorkingBuffer[60];
				 realIp1B6 <= realWorkingBuffer[60];
				 imgIp2B6 <= imagWorkingBuffer[61];
				 realIp2B6 <= realWorkingBuffer[61];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 60;
				 stateIp2B6<=#1 61;

				 //(62,63)
				 imgIp1B7 <= imagWorkingBuffer[62];
				 realIp1B7 <= realWorkingBuffer[62];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 62;
				 stateIp2B7<=#1 63;
			 end
			 5 : begin

				 //(64,65)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[65];
				 realIp2B0 <= realWorkingBuffer[65];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 65;

				 //(66,67)
				 imgIp1B1 <= imagWorkingBuffer[66];
				 realIp1B1 <= realWorkingBuffer[66];
				 imgIp2B1 <= imagWorkingBuffer[67];
				 realIp2B1 <= realWorkingBuffer[67];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 66;
				 stateIp2B1<=#1 67;

				 //(68,69)
				 imgIp1B2 <= imagWorkingBuffer[68];
				 realIp1B2 <= realWorkingBuffer[68];
				 imgIp2B2 <= imagWorkingBuffer[69];
				 realIp2B2 <= realWorkingBuffer[69];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 68;
				 stateIp2B2<=#1 69;

				 //(70,71)
				 imgIp1B3 <= imagWorkingBuffer[70];
				 realIp1B3 <= realWorkingBuffer[70];
				 imgIp2B3 <= imagWorkingBuffer[71];
				 realIp2B3 <= realWorkingBuffer[71];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 70;
				 stateIp2B3<=#1 71;

				 //(72,73)
				 imgIp1B4 <= imagWorkingBuffer[72];
				 realIp1B4 <= realWorkingBuffer[72];
				 imgIp2B4 <= imagWorkingBuffer[73];
				 realIp2B4 <= realWorkingBuffer[73];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 72;
				 stateIp2B4<=#1 73;

				 //(74,75)
				 imgIp1B5 <= imagWorkingBuffer[74];
				 realIp1B5 <= realWorkingBuffer[74];
				 imgIp2B5 <= imagWorkingBuffer[75];
				 realIp2B5 <= realWorkingBuffer[75];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 74;
				 stateIp2B5<=#1 75;

				 //(76,77)
				 imgIp1B6 <= imagWorkingBuffer[76];
				 realIp1B6 <= realWorkingBuffer[76];
				 imgIp2B6 <= imagWorkingBuffer[77];
				 realIp2B6 <= realWorkingBuffer[77];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 76;
				 stateIp2B6<=#1 77;

				 //(78,79)
				 imgIp1B7 <= imagWorkingBuffer[78];
				 realIp1B7 <= realWorkingBuffer[78];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 78;
				 stateIp2B7<=#1 79;
			 end
			 6 : begin

				 //(80,81)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[81];
				 realIp2B0 <= realWorkingBuffer[81];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 81;

				 //(82,83)
				 imgIp1B1 <= imagWorkingBuffer[82];
				 realIp1B1 <= realWorkingBuffer[82];
				 imgIp2B1 <= imagWorkingBuffer[83];
				 realIp2B1 <= realWorkingBuffer[83];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 82;
				 stateIp2B1<=#1 83;

				 //(84,85)
				 imgIp1B2 <= imagWorkingBuffer[84];
				 realIp1B2 <= realWorkingBuffer[84];
				 imgIp2B2 <= imagWorkingBuffer[85];
				 realIp2B2 <= realWorkingBuffer[85];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 84;
				 stateIp2B2<=#1 85;

				 //(86,87)
				 imgIp1B3 <= imagWorkingBuffer[86];
				 realIp1B3 <= realWorkingBuffer[86];
				 imgIp2B3 <= imagWorkingBuffer[87];
				 realIp2B3 <= realWorkingBuffer[87];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 86;
				 stateIp2B3<=#1 87;

				 //(88,89)
				 imgIp1B4 <= imagWorkingBuffer[88];
				 realIp1B4 <= realWorkingBuffer[88];
				 imgIp2B4 <= imagWorkingBuffer[89];
				 realIp2B4 <= realWorkingBuffer[89];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 88;
				 stateIp2B4<=#1 89;

				 //(90,91)
				 imgIp1B5 <= imagWorkingBuffer[90];
				 realIp1B5 <= realWorkingBuffer[90];
				 imgIp2B5 <= imagWorkingBuffer[91];
				 realIp2B5 <= realWorkingBuffer[91];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 90;
				 stateIp2B5<=#1 91;

				 //(92,93)
				 imgIp1B6 <= imagWorkingBuffer[92];
				 realIp1B6 <= realWorkingBuffer[92];
				 imgIp2B6 <= imagWorkingBuffer[93];
				 realIp2B6 <= realWorkingBuffer[93];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 92;
				 stateIp2B6<=#1 93;

				 //(94,95)
				 imgIp1B7 <= imagWorkingBuffer[94];
				 realIp1B7 <= realWorkingBuffer[94];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 94;
				 stateIp2B7<=#1 95;
			 end
			 7 : begin

				 //(96,97)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[97];
				 realIp2B0 <= realWorkingBuffer[97];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 97;

				 //(98,99)
				 imgIp1B1 <= imagWorkingBuffer[98];
				 realIp1B1 <= realWorkingBuffer[98];
				 imgIp2B1 <= imagWorkingBuffer[99];
				 realIp2B1 <= realWorkingBuffer[99];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 98;
				 stateIp2B1<=#1 99;

				 //(100,101)
				 imgIp1B2 <= imagWorkingBuffer[100];
				 realIp1B2 <= realWorkingBuffer[100];
				 imgIp2B2 <= imagWorkingBuffer[101];
				 realIp2B2 <= realWorkingBuffer[101];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 100;
				 stateIp2B2<=#1 101;

				 //(102,103)
				 imgIp1B3 <= imagWorkingBuffer[102];
				 realIp1B3 <= realWorkingBuffer[102];
				 imgIp2B3 <= imagWorkingBuffer[103];
				 realIp2B3 <= realWorkingBuffer[103];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 102;
				 stateIp2B3<=#1 103;

				 //(104,105)
				 imgIp1B4 <= imagWorkingBuffer[104];
				 realIp1B4 <= realWorkingBuffer[104];
				 imgIp2B4 <= imagWorkingBuffer[105];
				 realIp2B4 <= realWorkingBuffer[105];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 104;
				 stateIp2B4<=#1 105;

				 //(106,107)
				 imgIp1B5 <= imagWorkingBuffer[106];
				 realIp1B5 <= realWorkingBuffer[106];
				 imgIp2B5 <= imagWorkingBuffer[107];
				 realIp2B5 <= realWorkingBuffer[107];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 106;
				 stateIp2B5<=#1 107;

				 //(108,109)
				 imgIp1B6 <= imagWorkingBuffer[108];
				 realIp1B6 <= realWorkingBuffer[108];
				 imgIp2B6 <= imagWorkingBuffer[109];
				 realIp2B6 <= realWorkingBuffer[109];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 108;
				 stateIp2B6<=#1 109;

				 //(110,111)
				 imgIp1B7 <= imagWorkingBuffer[110];
				 realIp1B7 <= realWorkingBuffer[110];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 110;
				 stateIp2B7<=#1 111;
			 end
			 8 : begin

				 //(112,113)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[113];
				 realIp2B0 <= realWorkingBuffer[113];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 112;
				 stateIp2B0<=#1 113;

				 //(114,115)
				 imgIp1B1 <= imagWorkingBuffer[114];
				 realIp1B1 <= realWorkingBuffer[114];
				 imgIp2B1 <= imagWorkingBuffer[115];
				 realIp2B1 <= realWorkingBuffer[115];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 114;
				 stateIp2B1<=#1 115;

				 //(116,117)
				 imgIp1B2 <= imagWorkingBuffer[116];
				 realIp1B2 <= realWorkingBuffer[116];
				 imgIp2B2 <= imagWorkingBuffer[117];
				 realIp2B2 <= realWorkingBuffer[117];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 116;
				 stateIp2B2<=#1 117;

				 //(118,119)
				 imgIp1B3 <= imagWorkingBuffer[118];
				 realIp1B3 <= realWorkingBuffer[118];
				 imgIp2B3 <= imagWorkingBuffer[119];
				 realIp2B3 <= realWorkingBuffer[119];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 118;
				 stateIp2B3<=#1 119;

				 //(120,121)
				 imgIp1B4 <= imagWorkingBuffer[120];
				 realIp1B4 <= realWorkingBuffer[120];
				 imgIp2B4 <= imagWorkingBuffer[121];
				 realIp2B4 <= realWorkingBuffer[121];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 120;
				 stateIp2B4<=#1 121;

				 //(122,123)
				 imgIp1B5 <= imagWorkingBuffer[122];
				 realIp1B5 <= realWorkingBuffer[122];
				 imgIp2B5 <= imagWorkingBuffer[123];
				 realIp2B5 <= realWorkingBuffer[123];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 122;
				 stateIp2B5<=#1 123;

				 //(124,125)
				 imgIp1B6 <= imagWorkingBuffer[124];
				 realIp1B6 <= realWorkingBuffer[124];
				 imgIp2B6 <= imagWorkingBuffer[125];
				 realIp2B6 <= realWorkingBuffer[125];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 124;
				 stateIp2B6<=#1 125;

				 //(126,127)
				 imgIp1B7 <= imagWorkingBuffer[126];
				 realIp1B7 <= realWorkingBuffer[126];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 126;
				 stateIp2B7<=#1 127;
			 end
			 9 : begin

				 //(128,129)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[129];
				 realIp2B0 <= realWorkingBuffer[129];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 129;

				 //(130,131)
				 imgIp1B1 <= imagWorkingBuffer[130];
				 realIp1B1 <= realWorkingBuffer[130];
				 imgIp2B1 <= imagWorkingBuffer[131];
				 realIp2B1 <= realWorkingBuffer[131];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 130;
				 stateIp2B1<=#1 131;

				 //(132,133)
				 imgIp1B2 <= imagWorkingBuffer[132];
				 realIp1B2 <= realWorkingBuffer[132];
				 imgIp2B2 <= imagWorkingBuffer[133];
				 realIp2B2 <= realWorkingBuffer[133];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 132;
				 stateIp2B2<=#1 133;

				 //(134,135)
				 imgIp1B3 <= imagWorkingBuffer[134];
				 realIp1B3 <= realWorkingBuffer[134];
				 imgIp2B3 <= imagWorkingBuffer[135];
				 realIp2B3 <= realWorkingBuffer[135];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 134;
				 stateIp2B3<=#1 135;

				 //(136,137)
				 imgIp1B4 <= imagWorkingBuffer[136];
				 realIp1B4 <= realWorkingBuffer[136];
				 imgIp2B4 <= imagWorkingBuffer[137];
				 realIp2B4 <= realWorkingBuffer[137];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 136;
				 stateIp2B4<=#1 137;

				 //(138,139)
				 imgIp1B5 <= imagWorkingBuffer[138];
				 realIp1B5 <= realWorkingBuffer[138];
				 imgIp2B5 <= imagWorkingBuffer[139];
				 realIp2B5 <= realWorkingBuffer[139];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 138;
				 stateIp2B5<=#1 139;

				 //(140,141)
				 imgIp1B6 <= imagWorkingBuffer[140];
				 realIp1B6 <= realWorkingBuffer[140];
				 imgIp2B6 <= imagWorkingBuffer[141];
				 realIp2B6 <= realWorkingBuffer[141];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 140;
				 stateIp2B6<=#1 141;

				 //(142,143)
				 imgIp1B7 <= imagWorkingBuffer[142];
				 realIp1B7 <= realWorkingBuffer[142];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 142;
				 stateIp2B7<=#1 143;
			 end
			 10 : begin

				 //(144,145)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[145];
				 realIp2B0 <= realWorkingBuffer[145];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 145;

				 //(146,147)
				 imgIp1B1 <= imagWorkingBuffer[146];
				 realIp1B1 <= realWorkingBuffer[146];
				 imgIp2B1 <= imagWorkingBuffer[147];
				 realIp2B1 <= realWorkingBuffer[147];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 146;
				 stateIp2B1<=#1 147;

				 //(148,149)
				 imgIp1B2 <= imagWorkingBuffer[148];
				 realIp1B2 <= realWorkingBuffer[148];
				 imgIp2B2 <= imagWorkingBuffer[149];
				 realIp2B2 <= realWorkingBuffer[149];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 148;
				 stateIp2B2<=#1 149;

				 //(150,151)
				 imgIp1B3 <= imagWorkingBuffer[150];
				 realIp1B3 <= realWorkingBuffer[150];
				 imgIp2B3 <= imagWorkingBuffer[151];
				 realIp2B3 <= realWorkingBuffer[151];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 150;
				 stateIp2B3<=#1 151;

				 //(152,153)
				 imgIp1B4 <= imagWorkingBuffer[152];
				 realIp1B4 <= realWorkingBuffer[152];
				 imgIp2B4 <= imagWorkingBuffer[153];
				 realIp2B4 <= realWorkingBuffer[153];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 152;
				 stateIp2B4<=#1 153;

				 //(154,155)
				 imgIp1B5 <= imagWorkingBuffer[154];
				 realIp1B5 <= realWorkingBuffer[154];
				 imgIp2B5 <= imagWorkingBuffer[155];
				 realIp2B5 <= realWorkingBuffer[155];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 154;
				 stateIp2B5<=#1 155;

				 //(156,157)
				 imgIp1B6 <= imagWorkingBuffer[156];
				 realIp1B6 <= realWorkingBuffer[156];
				 imgIp2B6 <= imagWorkingBuffer[157];
				 realIp2B6 <= realWorkingBuffer[157];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 156;
				 stateIp2B6<=#1 157;

				 //(158,159)
				 imgIp1B7 <= imagWorkingBuffer[158];
				 realIp1B7 <= realWorkingBuffer[158];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 158;
				 stateIp2B7<=#1 159;
			 end
			 11 : begin

				 //(160,161)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[161];
				 realIp2B0 <= realWorkingBuffer[161];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 161;

				 //(162,163)
				 imgIp1B1 <= imagWorkingBuffer[162];
				 realIp1B1 <= realWorkingBuffer[162];
				 imgIp2B1 <= imagWorkingBuffer[163];
				 realIp2B1 <= realWorkingBuffer[163];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 162;
				 stateIp2B1<=#1 163;

				 //(164,165)
				 imgIp1B2 <= imagWorkingBuffer[164];
				 realIp1B2 <= realWorkingBuffer[164];
				 imgIp2B2 <= imagWorkingBuffer[165];
				 realIp2B2 <= realWorkingBuffer[165];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 164;
				 stateIp2B2<=#1 165;

				 //(166,167)
				 imgIp1B3 <= imagWorkingBuffer[166];
				 realIp1B3 <= realWorkingBuffer[166];
				 imgIp2B3 <= imagWorkingBuffer[167];
				 realIp2B3 <= realWorkingBuffer[167];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 166;
				 stateIp2B3<=#1 167;

				 //(168,169)
				 imgIp1B4 <= imagWorkingBuffer[168];
				 realIp1B4 <= realWorkingBuffer[168];
				 imgIp2B4 <= imagWorkingBuffer[169];
				 realIp2B4 <= realWorkingBuffer[169];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 168;
				 stateIp2B4<=#1 169;

				 //(170,171)
				 imgIp1B5 <= imagWorkingBuffer[170];
				 realIp1B5 <= realWorkingBuffer[170];
				 imgIp2B5 <= imagWorkingBuffer[171];
				 realIp2B5 <= realWorkingBuffer[171];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 170;
				 stateIp2B5<=#1 171;

				 //(172,173)
				 imgIp1B6 <= imagWorkingBuffer[172];
				 realIp1B6 <= realWorkingBuffer[172];
				 imgIp2B6 <= imagWorkingBuffer[173];
				 realIp2B6 <= realWorkingBuffer[173];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 172;
				 stateIp2B6<=#1 173;

				 //(174,175)
				 imgIp1B7 <= imagWorkingBuffer[174];
				 realIp1B7 <= realWorkingBuffer[174];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 174;
				 stateIp2B7<=#1 175;
			 end
			 12 : begin

				 //(176,177)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[177];
				 realIp2B0 <= realWorkingBuffer[177];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 176;
				 stateIp2B0<=#1 177;

				 //(178,179)
				 imgIp1B1 <= imagWorkingBuffer[178];
				 realIp1B1 <= realWorkingBuffer[178];
				 imgIp2B1 <= imagWorkingBuffer[179];
				 realIp2B1 <= realWorkingBuffer[179];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 178;
				 stateIp2B1<=#1 179;

				 //(180,181)
				 imgIp1B2 <= imagWorkingBuffer[180];
				 realIp1B2 <= realWorkingBuffer[180];
				 imgIp2B2 <= imagWorkingBuffer[181];
				 realIp2B2 <= realWorkingBuffer[181];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 180;
				 stateIp2B2<=#1 181;

				 //(182,183)
				 imgIp1B3 <= imagWorkingBuffer[182];
				 realIp1B3 <= realWorkingBuffer[182];
				 imgIp2B3 <= imagWorkingBuffer[183];
				 realIp2B3 <= realWorkingBuffer[183];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 182;
				 stateIp2B3<=#1 183;

				 //(184,185)
				 imgIp1B4 <= imagWorkingBuffer[184];
				 realIp1B4 <= realWorkingBuffer[184];
				 imgIp2B4 <= imagWorkingBuffer[185];
				 realIp2B4 <= realWorkingBuffer[185];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 184;
				 stateIp2B4<=#1 185;

				 //(186,187)
				 imgIp1B5 <= imagWorkingBuffer[186];
				 realIp1B5 <= realWorkingBuffer[186];
				 imgIp2B5 <= imagWorkingBuffer[187];
				 realIp2B5 <= realWorkingBuffer[187];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 186;
				 stateIp2B5<=#1 187;

				 //(188,189)
				 imgIp1B6 <= imagWorkingBuffer[188];
				 realIp1B6 <= realWorkingBuffer[188];
				 imgIp2B6 <= imagWorkingBuffer[189];
				 realIp2B6 <= realWorkingBuffer[189];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 188;
				 stateIp2B6<=#1 189;

				 //(190,191)
				 imgIp1B7 <= imagWorkingBuffer[190];
				 realIp1B7 <= realWorkingBuffer[190];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 190;
				 stateIp2B7<=#1 191;
			 end
			 13 : begin

				 //(192,193)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[193];
				 realIp2B0 <= realWorkingBuffer[193];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 193;

				 //(194,195)
				 imgIp1B1 <= imagWorkingBuffer[194];
				 realIp1B1 <= realWorkingBuffer[194];
				 imgIp2B1 <= imagWorkingBuffer[195];
				 realIp2B1 <= realWorkingBuffer[195];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 194;
				 stateIp2B1<=#1 195;

				 //(196,197)
				 imgIp1B2 <= imagWorkingBuffer[196];
				 realIp1B2 <= realWorkingBuffer[196];
				 imgIp2B2 <= imagWorkingBuffer[197];
				 realIp2B2 <= realWorkingBuffer[197];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 196;
				 stateIp2B2<=#1 197;

				 //(198,199)
				 imgIp1B3 <= imagWorkingBuffer[198];
				 realIp1B3 <= realWorkingBuffer[198];
				 imgIp2B3 <= imagWorkingBuffer[199];
				 realIp2B3 <= realWorkingBuffer[199];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 198;
				 stateIp2B3<=#1 199;

				 //(200,201)
				 imgIp1B4 <= imagWorkingBuffer[200];
				 realIp1B4 <= realWorkingBuffer[200];
				 imgIp2B4 <= imagWorkingBuffer[201];
				 realIp2B4 <= realWorkingBuffer[201];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 200;
				 stateIp2B4<=#1 201;

				 //(202,203)
				 imgIp1B5 <= imagWorkingBuffer[202];
				 realIp1B5 <= realWorkingBuffer[202];
				 imgIp2B5 <= imagWorkingBuffer[203];
				 realIp2B5 <= realWorkingBuffer[203];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 202;
				 stateIp2B5<=#1 203;

				 //(204,205)
				 imgIp1B6 <= imagWorkingBuffer[204];
				 realIp1B6 <= realWorkingBuffer[204];
				 imgIp2B6 <= imagWorkingBuffer[205];
				 realIp2B6 <= realWorkingBuffer[205];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 204;
				 stateIp2B6<=#1 205;

				 //(206,207)
				 imgIp1B7 <= imagWorkingBuffer[206];
				 realIp1B7 <= realWorkingBuffer[206];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 206;
				 stateIp2B7<=#1 207;
			 end
			 14 : begin

				 //(208,209)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[209];
				 realIp2B0 <= realWorkingBuffer[209];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 208;
				 stateIp2B0<=#1 209;

				 //(210,211)
				 imgIp1B1 <= imagWorkingBuffer[210];
				 realIp1B1 <= realWorkingBuffer[210];
				 imgIp2B1 <= imagWorkingBuffer[211];
				 realIp2B1 <= realWorkingBuffer[211];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 210;
				 stateIp2B1<=#1 211;

				 //(212,213)
				 imgIp1B2 <= imagWorkingBuffer[212];
				 realIp1B2 <= realWorkingBuffer[212];
				 imgIp2B2 <= imagWorkingBuffer[213];
				 realIp2B2 <= realWorkingBuffer[213];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 212;
				 stateIp2B2<=#1 213;

				 //(214,215)
				 imgIp1B3 <= imagWorkingBuffer[214];
				 realIp1B3 <= realWorkingBuffer[214];
				 imgIp2B3 <= imagWorkingBuffer[215];
				 realIp2B3 <= realWorkingBuffer[215];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 214;
				 stateIp2B3<=#1 215;

				 //(216,217)
				 imgIp1B4 <= imagWorkingBuffer[216];
				 realIp1B4 <= realWorkingBuffer[216];
				 imgIp2B4 <= imagWorkingBuffer[217];
				 realIp2B4 <= realWorkingBuffer[217];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 216;
				 stateIp2B4<=#1 217;

				 //(218,219)
				 imgIp1B5 <= imagWorkingBuffer[218];
				 realIp1B5 <= realWorkingBuffer[218];
				 imgIp2B5 <= imagWorkingBuffer[219];
				 realIp2B5 <= realWorkingBuffer[219];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 218;
				 stateIp2B5<=#1 219;

				 //(220,221)
				 imgIp1B6 <= imagWorkingBuffer[220];
				 realIp1B6 <= realWorkingBuffer[220];
				 imgIp2B6 <= imagWorkingBuffer[221];
				 realIp2B6 <= realWorkingBuffer[221];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 220;
				 stateIp2B6<=#1 221;

				 //(222,223)
				 imgIp1B7 <= imagWorkingBuffer[222];
				 realIp1B7 <= realWorkingBuffer[222];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 222;
				 stateIp2B7<=#1 223;
			 end
			 15 : begin

				 //(224,225)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[225];
				 realIp2B0 <= realWorkingBuffer[225];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 224;
				 stateIp2B0<=#1 225;

				 //(226,227)
				 imgIp1B1 <= imagWorkingBuffer[226];
				 realIp1B1 <= realWorkingBuffer[226];
				 imgIp2B1 <= imagWorkingBuffer[227];
				 realIp2B1 <= realWorkingBuffer[227];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 226;
				 stateIp2B1<=#1 227;

				 //(228,229)
				 imgIp1B2 <= imagWorkingBuffer[228];
				 realIp1B2 <= realWorkingBuffer[228];
				 imgIp2B2 <= imagWorkingBuffer[229];
				 realIp2B2 <= realWorkingBuffer[229];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 228;
				 stateIp2B2<=#1 229;

				 //(230,231)
				 imgIp1B3 <= imagWorkingBuffer[230];
				 realIp1B3 <= realWorkingBuffer[230];
				 imgIp2B3 <= imagWorkingBuffer[231];
				 realIp2B3 <= realWorkingBuffer[231];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 230;
				 stateIp2B3<=#1 231;

				 //(232,233)
				 imgIp1B4 <= imagWorkingBuffer[232];
				 realIp1B4 <= realWorkingBuffer[232];
				 imgIp2B4 <= imagWorkingBuffer[233];
				 realIp2B4 <= realWorkingBuffer[233];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 232;
				 stateIp2B4<=#1 233;

				 //(234,235)
				 imgIp1B5 <= imagWorkingBuffer[234];
				 realIp1B5 <= realWorkingBuffer[234];
				 imgIp2B5 <= imagWorkingBuffer[235];
				 realIp2B5 <= realWorkingBuffer[235];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 234;
				 stateIp2B5<=#1 235;

				 //(236,237)
				 imgIp1B6 <= imagWorkingBuffer[236];
				 realIp1B6 <= realWorkingBuffer[236];
				 imgIp2B6 <= imagWorkingBuffer[237];
				 realIp2B6 <= realWorkingBuffer[237];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 236;
				 stateIp2B6<=#1 237;

				 //(238,239)
				 imgIp1B7 <= imagWorkingBuffer[238];
				 realIp1B7 <= realWorkingBuffer[238];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 238;
				 stateIp2B7<=#1 239;
			 end
			 16 : begin

				 //(240,241)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[241];
				 realIp2B0 <= realWorkingBuffer[241];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 240;
				 stateIp2B0<=#1 241;

				 //(242,243)
				 imgIp1B1 <= imagWorkingBuffer[242];
				 realIp1B1 <= realWorkingBuffer[242];
				 imgIp2B1 <= imagWorkingBuffer[243];
				 realIp2B1 <= realWorkingBuffer[243];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 242;
				 stateIp2B1<=#1 243;

				 //(244,245)
				 imgIp1B2 <= imagWorkingBuffer[244];
				 realIp1B2 <= realWorkingBuffer[244];
				 imgIp2B2 <= imagWorkingBuffer[245];
				 realIp2B2 <= realWorkingBuffer[245];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 244;
				 stateIp2B2<=#1 245;

				 //(246,247)
				 imgIp1B3 <= imagWorkingBuffer[246];
				 realIp1B3 <= realWorkingBuffer[246];
				 imgIp2B3 <= imagWorkingBuffer[247];
				 realIp2B3 <= realWorkingBuffer[247];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 246;
				 stateIp2B3<=#1 247;

				 //(248,249)
				 imgIp1B4 <= imagWorkingBuffer[248];
				 realIp1B4 <= realWorkingBuffer[248];
				 imgIp2B4 <= imagWorkingBuffer[249];
				 realIp2B4 <= realWorkingBuffer[249];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 248;
				 stateIp2B4<=#1 249;

				 //(250,251)
				 imgIp1B5 <= imagWorkingBuffer[250];
				 realIp1B5 <= realWorkingBuffer[250];
				 imgIp2B5 <= imagWorkingBuffer[251];
				 realIp2B5 <= realWorkingBuffer[251];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 250;
				 stateIp2B5<=#1 251;

				 //(252,253)
				 imgIp1B6 <= imagWorkingBuffer[252];
				 realIp1B6 <= realWorkingBuffer[252];
				 imgIp2B6 <= imagWorkingBuffer[253];
				 realIp2B6 <= realWorkingBuffer[253];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 252;
				 stateIp2B6<=#1 253;

				 //(254,255)
				 imgIp1B7 <= imagWorkingBuffer[254];
				 realIp1B7 <= realWorkingBuffer[254];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 254;
				 stateIp2B7<=#1 255;
			 end
			 17 : begin

				 //(256,257)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[257];
				 realIp2B0 <= realWorkingBuffer[257];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 257;

				 //(258,259)
				 imgIp1B1 <= imagWorkingBuffer[258];
				 realIp1B1 <= realWorkingBuffer[258];
				 imgIp2B1 <= imagWorkingBuffer[259];
				 realIp2B1 <= realWorkingBuffer[259];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 258;
				 stateIp2B1<=#1 259;

				 //(260,261)
				 imgIp1B2 <= imagWorkingBuffer[260];
				 realIp1B2 <= realWorkingBuffer[260];
				 imgIp2B2 <= imagWorkingBuffer[261];
				 realIp2B2 <= realWorkingBuffer[261];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 260;
				 stateIp2B2<=#1 261;

				 //(262,263)
				 imgIp1B3 <= imagWorkingBuffer[262];
				 realIp1B3 <= realWorkingBuffer[262];
				 imgIp2B3 <= imagWorkingBuffer[263];
				 realIp2B3 <= realWorkingBuffer[263];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 262;
				 stateIp2B3<=#1 263;

				 //(264,265)
				 imgIp1B4 <= imagWorkingBuffer[264];
				 realIp1B4 <= realWorkingBuffer[264];
				 imgIp2B4 <= imagWorkingBuffer[265];
				 realIp2B4 <= realWorkingBuffer[265];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 264;
				 stateIp2B4<=#1 265;

				 //(266,267)
				 imgIp1B5 <= imagWorkingBuffer[266];
				 realIp1B5 <= realWorkingBuffer[266];
				 imgIp2B5 <= imagWorkingBuffer[267];
				 realIp2B5 <= realWorkingBuffer[267];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 266;
				 stateIp2B5<=#1 267;

				 //(268,269)
				 imgIp1B6 <= imagWorkingBuffer[268];
				 realIp1B6 <= realWorkingBuffer[268];
				 imgIp2B6 <= imagWorkingBuffer[269];
				 realIp2B6 <= realWorkingBuffer[269];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 268;
				 stateIp2B6<=#1 269;

				 //(270,271)
				 imgIp1B7 <= imagWorkingBuffer[270];
				 realIp1B7 <= realWorkingBuffer[270];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 270;
				 stateIp2B7<=#1 271;
			 end
			 18 : begin

				 //(272,273)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[273];
				 realIp2B0 <= realWorkingBuffer[273];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 273;

				 //(274,275)
				 imgIp1B1 <= imagWorkingBuffer[274];
				 realIp1B1 <= realWorkingBuffer[274];
				 imgIp2B1 <= imagWorkingBuffer[275];
				 realIp2B1 <= realWorkingBuffer[275];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 274;
				 stateIp2B1<=#1 275;

				 //(276,277)
				 imgIp1B2 <= imagWorkingBuffer[276];
				 realIp1B2 <= realWorkingBuffer[276];
				 imgIp2B2 <= imagWorkingBuffer[277];
				 realIp2B2 <= realWorkingBuffer[277];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 276;
				 stateIp2B2<=#1 277;

				 //(278,279)
				 imgIp1B3 <= imagWorkingBuffer[278];
				 realIp1B3 <= realWorkingBuffer[278];
				 imgIp2B3 <= imagWorkingBuffer[279];
				 realIp2B3 <= realWorkingBuffer[279];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 278;
				 stateIp2B3<=#1 279;

				 //(280,281)
				 imgIp1B4 <= imagWorkingBuffer[280];
				 realIp1B4 <= realWorkingBuffer[280];
				 imgIp2B4 <= imagWorkingBuffer[281];
				 realIp2B4 <= realWorkingBuffer[281];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 280;
				 stateIp2B4<=#1 281;

				 //(282,283)
				 imgIp1B5 <= imagWorkingBuffer[282];
				 realIp1B5 <= realWorkingBuffer[282];
				 imgIp2B5 <= imagWorkingBuffer[283];
				 realIp2B5 <= realWorkingBuffer[283];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 282;
				 stateIp2B5<=#1 283;

				 //(284,285)
				 imgIp1B6 <= imagWorkingBuffer[284];
				 realIp1B6 <= realWorkingBuffer[284];
				 imgIp2B6 <= imagWorkingBuffer[285];
				 realIp2B6 <= realWorkingBuffer[285];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 284;
				 stateIp2B6<=#1 285;

				 //(286,287)
				 imgIp1B7 <= imagWorkingBuffer[286];
				 realIp1B7 <= realWorkingBuffer[286];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 286;
				 stateIp2B7<=#1 287;
			 end
			 19 : begin

				 //(288,289)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[289];
				 realIp2B0 <= realWorkingBuffer[289];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 289;

				 //(290,291)
				 imgIp1B1 <= imagWorkingBuffer[290];
				 realIp1B1 <= realWorkingBuffer[290];
				 imgIp2B1 <= imagWorkingBuffer[291];
				 realIp2B1 <= realWorkingBuffer[291];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 290;
				 stateIp2B1<=#1 291;

				 //(292,293)
				 imgIp1B2 <= imagWorkingBuffer[292];
				 realIp1B2 <= realWorkingBuffer[292];
				 imgIp2B2 <= imagWorkingBuffer[293];
				 realIp2B2 <= realWorkingBuffer[293];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 292;
				 stateIp2B2<=#1 293;

				 //(294,295)
				 imgIp1B3 <= imagWorkingBuffer[294];
				 realIp1B3 <= realWorkingBuffer[294];
				 imgIp2B3 <= imagWorkingBuffer[295];
				 realIp2B3 <= realWorkingBuffer[295];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 294;
				 stateIp2B3<=#1 295;

				 //(296,297)
				 imgIp1B4 <= imagWorkingBuffer[296];
				 realIp1B4 <= realWorkingBuffer[296];
				 imgIp2B4 <= imagWorkingBuffer[297];
				 realIp2B4 <= realWorkingBuffer[297];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 296;
				 stateIp2B4<=#1 297;

				 //(298,299)
				 imgIp1B5 <= imagWorkingBuffer[298];
				 realIp1B5 <= realWorkingBuffer[298];
				 imgIp2B5 <= imagWorkingBuffer[299];
				 realIp2B5 <= realWorkingBuffer[299];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 298;
				 stateIp2B5<=#1 299;

				 //(300,301)
				 imgIp1B6 <= imagWorkingBuffer[300];
				 realIp1B6 <= realWorkingBuffer[300];
				 imgIp2B6 <= imagWorkingBuffer[301];
				 realIp2B6 <= realWorkingBuffer[301];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 300;
				 stateIp2B6<=#1 301;

				 //(302,303)
				 imgIp1B7 <= imagWorkingBuffer[302];
				 realIp1B7 <= realWorkingBuffer[302];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 302;
				 stateIp2B7<=#1 303;
			 end
			 20 : begin

				 //(304,305)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[305];
				 realIp2B0 <= realWorkingBuffer[305];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 304;
				 stateIp2B0<=#1 305;

				 //(306,307)
				 imgIp1B1 <= imagWorkingBuffer[306];
				 realIp1B1 <= realWorkingBuffer[306];
				 imgIp2B1 <= imagWorkingBuffer[307];
				 realIp2B1 <= realWorkingBuffer[307];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 306;
				 stateIp2B1<=#1 307;

				 //(308,309)
				 imgIp1B2 <= imagWorkingBuffer[308];
				 realIp1B2 <= realWorkingBuffer[308];
				 imgIp2B2 <= imagWorkingBuffer[309];
				 realIp2B2 <= realWorkingBuffer[309];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 308;
				 stateIp2B2<=#1 309;

				 //(310,311)
				 imgIp1B3 <= imagWorkingBuffer[310];
				 realIp1B3 <= realWorkingBuffer[310];
				 imgIp2B3 <= imagWorkingBuffer[311];
				 realIp2B3 <= realWorkingBuffer[311];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 310;
				 stateIp2B3<=#1 311;

				 //(312,313)
				 imgIp1B4 <= imagWorkingBuffer[312];
				 realIp1B4 <= realWorkingBuffer[312];
				 imgIp2B4 <= imagWorkingBuffer[313];
				 realIp2B4 <= realWorkingBuffer[313];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 312;
				 stateIp2B4<=#1 313;

				 //(314,315)
				 imgIp1B5 <= imagWorkingBuffer[314];
				 realIp1B5 <= realWorkingBuffer[314];
				 imgIp2B5 <= imagWorkingBuffer[315];
				 realIp2B5 <= realWorkingBuffer[315];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 314;
				 stateIp2B5<=#1 315;

				 //(316,317)
				 imgIp1B6 <= imagWorkingBuffer[316];
				 realIp1B6 <= realWorkingBuffer[316];
				 imgIp2B6 <= imagWorkingBuffer[317];
				 realIp2B6 <= realWorkingBuffer[317];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 316;
				 stateIp2B6<=#1 317;

				 //(318,319)
				 imgIp1B7 <= imagWorkingBuffer[318];
				 realIp1B7 <= realWorkingBuffer[318];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 318;
				 stateIp2B7<=#1 319;
			 end
			 21 : begin

				 //(320,321)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[321];
				 realIp2B0 <= realWorkingBuffer[321];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 321;

				 //(322,323)
				 imgIp1B1 <= imagWorkingBuffer[322];
				 realIp1B1 <= realWorkingBuffer[322];
				 imgIp2B1 <= imagWorkingBuffer[323];
				 realIp2B1 <= realWorkingBuffer[323];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 322;
				 stateIp2B1<=#1 323;

				 //(324,325)
				 imgIp1B2 <= imagWorkingBuffer[324];
				 realIp1B2 <= realWorkingBuffer[324];
				 imgIp2B2 <= imagWorkingBuffer[325];
				 realIp2B2 <= realWorkingBuffer[325];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 324;
				 stateIp2B2<=#1 325;

				 //(326,327)
				 imgIp1B3 <= imagWorkingBuffer[326];
				 realIp1B3 <= realWorkingBuffer[326];
				 imgIp2B3 <= imagWorkingBuffer[327];
				 realIp2B3 <= realWorkingBuffer[327];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 326;
				 stateIp2B3<=#1 327;

				 //(328,329)
				 imgIp1B4 <= imagWorkingBuffer[328];
				 realIp1B4 <= realWorkingBuffer[328];
				 imgIp2B4 <= imagWorkingBuffer[329];
				 realIp2B4 <= realWorkingBuffer[329];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 328;
				 stateIp2B4<=#1 329;

				 //(330,331)
				 imgIp1B5 <= imagWorkingBuffer[330];
				 realIp1B5 <= realWorkingBuffer[330];
				 imgIp2B5 <= imagWorkingBuffer[331];
				 realIp2B5 <= realWorkingBuffer[331];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 330;
				 stateIp2B5<=#1 331;

				 //(332,333)
				 imgIp1B6 <= imagWorkingBuffer[332];
				 realIp1B6 <= realWorkingBuffer[332];
				 imgIp2B6 <= imagWorkingBuffer[333];
				 realIp2B6 <= realWorkingBuffer[333];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 332;
				 stateIp2B6<=#1 333;

				 //(334,335)
				 imgIp1B7 <= imagWorkingBuffer[334];
				 realIp1B7 <= realWorkingBuffer[334];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 334;
				 stateIp2B7<=#1 335;
			 end
			 22 : begin

				 //(336,337)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[337];
				 realIp2B0 <= realWorkingBuffer[337];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 336;
				 stateIp2B0<=#1 337;

				 //(338,339)
				 imgIp1B1 <= imagWorkingBuffer[338];
				 realIp1B1 <= realWorkingBuffer[338];
				 imgIp2B1 <= imagWorkingBuffer[339];
				 realIp2B1 <= realWorkingBuffer[339];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 338;
				 stateIp2B1<=#1 339;

				 //(340,341)
				 imgIp1B2 <= imagWorkingBuffer[340];
				 realIp1B2 <= realWorkingBuffer[340];
				 imgIp2B2 <= imagWorkingBuffer[341];
				 realIp2B2 <= realWorkingBuffer[341];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 340;
				 stateIp2B2<=#1 341;

				 //(342,343)
				 imgIp1B3 <= imagWorkingBuffer[342];
				 realIp1B3 <= realWorkingBuffer[342];
				 imgIp2B3 <= imagWorkingBuffer[343];
				 realIp2B3 <= realWorkingBuffer[343];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 342;
				 stateIp2B3<=#1 343;

				 //(344,345)
				 imgIp1B4 <= imagWorkingBuffer[344];
				 realIp1B4 <= realWorkingBuffer[344];
				 imgIp2B4 <= imagWorkingBuffer[345];
				 realIp2B4 <= realWorkingBuffer[345];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 344;
				 stateIp2B4<=#1 345;

				 //(346,347)
				 imgIp1B5 <= imagWorkingBuffer[346];
				 realIp1B5 <= realWorkingBuffer[346];
				 imgIp2B5 <= imagWorkingBuffer[347];
				 realIp2B5 <= realWorkingBuffer[347];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 346;
				 stateIp2B5<=#1 347;

				 //(348,349)
				 imgIp1B6 <= imagWorkingBuffer[348];
				 realIp1B6 <= realWorkingBuffer[348];
				 imgIp2B6 <= imagWorkingBuffer[349];
				 realIp2B6 <= realWorkingBuffer[349];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 348;
				 stateIp2B6<=#1 349;

				 //(350,351)
				 imgIp1B7 <= imagWorkingBuffer[350];
				 realIp1B7 <= realWorkingBuffer[350];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 350;
				 stateIp2B7<=#1 351;
			 end
			 23 : begin

				 //(352,353)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[353];
				 realIp2B0 <= realWorkingBuffer[353];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 352;
				 stateIp2B0<=#1 353;

				 //(354,355)
				 imgIp1B1 <= imagWorkingBuffer[354];
				 realIp1B1 <= realWorkingBuffer[354];
				 imgIp2B1 <= imagWorkingBuffer[355];
				 realIp2B1 <= realWorkingBuffer[355];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 354;
				 stateIp2B1<=#1 355;

				 //(356,357)
				 imgIp1B2 <= imagWorkingBuffer[356];
				 realIp1B2 <= realWorkingBuffer[356];
				 imgIp2B2 <= imagWorkingBuffer[357];
				 realIp2B2 <= realWorkingBuffer[357];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 356;
				 stateIp2B2<=#1 357;

				 //(358,359)
				 imgIp1B3 <= imagWorkingBuffer[358];
				 realIp1B3 <= realWorkingBuffer[358];
				 imgIp2B3 <= imagWorkingBuffer[359];
				 realIp2B3 <= realWorkingBuffer[359];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 358;
				 stateIp2B3<=#1 359;

				 //(360,361)
				 imgIp1B4 <= imagWorkingBuffer[360];
				 realIp1B4 <= realWorkingBuffer[360];
				 imgIp2B4 <= imagWorkingBuffer[361];
				 realIp2B4 <= realWorkingBuffer[361];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 360;
				 stateIp2B4<=#1 361;

				 //(362,363)
				 imgIp1B5 <= imagWorkingBuffer[362];
				 realIp1B5 <= realWorkingBuffer[362];
				 imgIp2B5 <= imagWorkingBuffer[363];
				 realIp2B5 <= realWorkingBuffer[363];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 362;
				 stateIp2B5<=#1 363;

				 //(364,365)
				 imgIp1B6 <= imagWorkingBuffer[364];
				 realIp1B6 <= realWorkingBuffer[364];
				 imgIp2B6 <= imagWorkingBuffer[365];
				 realIp2B6 <= realWorkingBuffer[365];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 364;
				 stateIp2B6<=#1 365;

				 //(366,367)
				 imgIp1B7 <= imagWorkingBuffer[366];
				 realIp1B7 <= realWorkingBuffer[366];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 366;
				 stateIp2B7<=#1 367;
			 end
			 24 : begin

				 //(368,369)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[369];
				 realIp2B0 <= realWorkingBuffer[369];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 368;
				 stateIp2B0<=#1 369;

				 //(370,371)
				 imgIp1B1 <= imagWorkingBuffer[370];
				 realIp1B1 <= realWorkingBuffer[370];
				 imgIp2B1 <= imagWorkingBuffer[371];
				 realIp2B1 <= realWorkingBuffer[371];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 370;
				 stateIp2B1<=#1 371;

				 //(372,373)
				 imgIp1B2 <= imagWorkingBuffer[372];
				 realIp1B2 <= realWorkingBuffer[372];
				 imgIp2B2 <= imagWorkingBuffer[373];
				 realIp2B2 <= realWorkingBuffer[373];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 372;
				 stateIp2B2<=#1 373;

				 //(374,375)
				 imgIp1B3 <= imagWorkingBuffer[374];
				 realIp1B3 <= realWorkingBuffer[374];
				 imgIp2B3 <= imagWorkingBuffer[375];
				 realIp2B3 <= realWorkingBuffer[375];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 374;
				 stateIp2B3<=#1 375;

				 //(376,377)
				 imgIp1B4 <= imagWorkingBuffer[376];
				 realIp1B4 <= realWorkingBuffer[376];
				 imgIp2B4 <= imagWorkingBuffer[377];
				 realIp2B4 <= realWorkingBuffer[377];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 376;
				 stateIp2B4<=#1 377;

				 //(378,379)
				 imgIp1B5 <= imagWorkingBuffer[378];
				 realIp1B5 <= realWorkingBuffer[378];
				 imgIp2B5 <= imagWorkingBuffer[379];
				 realIp2B5 <= realWorkingBuffer[379];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 378;
				 stateIp2B5<=#1 379;

				 //(380,381)
				 imgIp1B6 <= imagWorkingBuffer[380];
				 realIp1B6 <= realWorkingBuffer[380];
				 imgIp2B6 <= imagWorkingBuffer[381];
				 realIp2B6 <= realWorkingBuffer[381];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 380;
				 stateIp2B6<=#1 381;

				 //(382,383)
				 imgIp1B7 <= imagWorkingBuffer[382];
				 realIp1B7 <= realWorkingBuffer[382];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 382;
				 stateIp2B7<=#1 383;
			 end
			 25 : begin

				 //(384,385)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[385];
				 realIp2B0 <= realWorkingBuffer[385];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 385;

				 //(386,387)
				 imgIp1B1 <= imagWorkingBuffer[386];
				 realIp1B1 <= realWorkingBuffer[386];
				 imgIp2B1 <= imagWorkingBuffer[387];
				 realIp2B1 <= realWorkingBuffer[387];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 386;
				 stateIp2B1<=#1 387;

				 //(388,389)
				 imgIp1B2 <= imagWorkingBuffer[388];
				 realIp1B2 <= realWorkingBuffer[388];
				 imgIp2B2 <= imagWorkingBuffer[389];
				 realIp2B2 <= realWorkingBuffer[389];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 388;
				 stateIp2B2<=#1 389;

				 //(390,391)
				 imgIp1B3 <= imagWorkingBuffer[390];
				 realIp1B3 <= realWorkingBuffer[390];
				 imgIp2B3 <= imagWorkingBuffer[391];
				 realIp2B3 <= realWorkingBuffer[391];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 390;
				 stateIp2B3<=#1 391;

				 //(392,393)
				 imgIp1B4 <= imagWorkingBuffer[392];
				 realIp1B4 <= realWorkingBuffer[392];
				 imgIp2B4 <= imagWorkingBuffer[393];
				 realIp2B4 <= realWorkingBuffer[393];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 392;
				 stateIp2B4<=#1 393;

				 //(394,395)
				 imgIp1B5 <= imagWorkingBuffer[394];
				 realIp1B5 <= realWorkingBuffer[394];
				 imgIp2B5 <= imagWorkingBuffer[395];
				 realIp2B5 <= realWorkingBuffer[395];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 394;
				 stateIp2B5<=#1 395;

				 //(396,397)
				 imgIp1B6 <= imagWorkingBuffer[396];
				 realIp1B6 <= realWorkingBuffer[396];
				 imgIp2B6 <= imagWorkingBuffer[397];
				 realIp2B6 <= realWorkingBuffer[397];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 396;
				 stateIp2B6<=#1 397;

				 //(398,399)
				 imgIp1B7 <= imagWorkingBuffer[398];
				 realIp1B7 <= realWorkingBuffer[398];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 398;
				 stateIp2B7<=#1 399;
			 end
			 26 : begin

				 //(400,401)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[401];
				 realIp2B0 <= realWorkingBuffer[401];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 400;
				 stateIp2B0<=#1 401;

				 //(402,403)
				 imgIp1B1 <= imagWorkingBuffer[402];
				 realIp1B1 <= realWorkingBuffer[402];
				 imgIp2B1 <= imagWorkingBuffer[403];
				 realIp2B1 <= realWorkingBuffer[403];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 402;
				 stateIp2B1<=#1 403;

				 //(404,405)
				 imgIp1B2 <= imagWorkingBuffer[404];
				 realIp1B2 <= realWorkingBuffer[404];
				 imgIp2B2 <= imagWorkingBuffer[405];
				 realIp2B2 <= realWorkingBuffer[405];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 404;
				 stateIp2B2<=#1 405;

				 //(406,407)
				 imgIp1B3 <= imagWorkingBuffer[406];
				 realIp1B3 <= realWorkingBuffer[406];
				 imgIp2B3 <= imagWorkingBuffer[407];
				 realIp2B3 <= realWorkingBuffer[407];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 406;
				 stateIp2B3<=#1 407;

				 //(408,409)
				 imgIp1B4 <= imagWorkingBuffer[408];
				 realIp1B4 <= realWorkingBuffer[408];
				 imgIp2B4 <= imagWorkingBuffer[409];
				 realIp2B4 <= realWorkingBuffer[409];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 408;
				 stateIp2B4<=#1 409;

				 //(410,411)
				 imgIp1B5 <= imagWorkingBuffer[410];
				 realIp1B5 <= realWorkingBuffer[410];
				 imgIp2B5 <= imagWorkingBuffer[411];
				 realIp2B5 <= realWorkingBuffer[411];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 410;
				 stateIp2B5<=#1 411;

				 //(412,413)
				 imgIp1B6 <= imagWorkingBuffer[412];
				 realIp1B6 <= realWorkingBuffer[412];
				 imgIp2B6 <= imagWorkingBuffer[413];
				 realIp2B6 <= realWorkingBuffer[413];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 412;
				 stateIp2B6<=#1 413;

				 //(414,415)
				 imgIp1B7 <= imagWorkingBuffer[414];
				 realIp1B7 <= realWorkingBuffer[414];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 414;
				 stateIp2B7<=#1 415;
			 end
			 27 : begin

				 //(416,417)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[417];
				 realIp2B0 <= realWorkingBuffer[417];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 416;
				 stateIp2B0<=#1 417;

				 //(418,419)
				 imgIp1B1 <= imagWorkingBuffer[418];
				 realIp1B1 <= realWorkingBuffer[418];
				 imgIp2B1 <= imagWorkingBuffer[419];
				 realIp2B1 <= realWorkingBuffer[419];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 418;
				 stateIp2B1<=#1 419;

				 //(420,421)
				 imgIp1B2 <= imagWorkingBuffer[420];
				 realIp1B2 <= realWorkingBuffer[420];
				 imgIp2B2 <= imagWorkingBuffer[421];
				 realIp2B2 <= realWorkingBuffer[421];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 420;
				 stateIp2B2<=#1 421;

				 //(422,423)
				 imgIp1B3 <= imagWorkingBuffer[422];
				 realIp1B3 <= realWorkingBuffer[422];
				 imgIp2B3 <= imagWorkingBuffer[423];
				 realIp2B3 <= realWorkingBuffer[423];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 422;
				 stateIp2B3<=#1 423;

				 //(424,425)
				 imgIp1B4 <= imagWorkingBuffer[424];
				 realIp1B4 <= realWorkingBuffer[424];
				 imgIp2B4 <= imagWorkingBuffer[425];
				 realIp2B4 <= realWorkingBuffer[425];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 424;
				 stateIp2B4<=#1 425;

				 //(426,427)
				 imgIp1B5 <= imagWorkingBuffer[426];
				 realIp1B5 <= realWorkingBuffer[426];
				 imgIp2B5 <= imagWorkingBuffer[427];
				 realIp2B5 <= realWorkingBuffer[427];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 426;
				 stateIp2B5<=#1 427;

				 //(428,429)
				 imgIp1B6 <= imagWorkingBuffer[428];
				 realIp1B6 <= realWorkingBuffer[428];
				 imgIp2B6 <= imagWorkingBuffer[429];
				 realIp2B6 <= realWorkingBuffer[429];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 428;
				 stateIp2B6<=#1 429;

				 //(430,431)
				 imgIp1B7 <= imagWorkingBuffer[430];
				 realIp1B7 <= realWorkingBuffer[430];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 430;
				 stateIp2B7<=#1 431;
			 end
			 28 : begin

				 //(432,433)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[433];
				 realIp2B0 <= realWorkingBuffer[433];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 432;
				 stateIp2B0<=#1 433;

				 //(434,435)
				 imgIp1B1 <= imagWorkingBuffer[434];
				 realIp1B1 <= realWorkingBuffer[434];
				 imgIp2B1 <= imagWorkingBuffer[435];
				 realIp2B1 <= realWorkingBuffer[435];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 434;
				 stateIp2B1<=#1 435;

				 //(436,437)
				 imgIp1B2 <= imagWorkingBuffer[436];
				 realIp1B2 <= realWorkingBuffer[436];
				 imgIp2B2 <= imagWorkingBuffer[437];
				 realIp2B2 <= realWorkingBuffer[437];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 436;
				 stateIp2B2<=#1 437;

				 //(438,439)
				 imgIp1B3 <= imagWorkingBuffer[438];
				 realIp1B3 <= realWorkingBuffer[438];
				 imgIp2B3 <= imagWorkingBuffer[439];
				 realIp2B3 <= realWorkingBuffer[439];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 438;
				 stateIp2B3<=#1 439;

				 //(440,441)
				 imgIp1B4 <= imagWorkingBuffer[440];
				 realIp1B4 <= realWorkingBuffer[440];
				 imgIp2B4 <= imagWorkingBuffer[441];
				 realIp2B4 <= realWorkingBuffer[441];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 440;
				 stateIp2B4<=#1 441;

				 //(442,443)
				 imgIp1B5 <= imagWorkingBuffer[442];
				 realIp1B5 <= realWorkingBuffer[442];
				 imgIp2B5 <= imagWorkingBuffer[443];
				 realIp2B5 <= realWorkingBuffer[443];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 442;
				 stateIp2B5<=#1 443;

				 //(444,445)
				 imgIp1B6 <= imagWorkingBuffer[444];
				 realIp1B6 <= realWorkingBuffer[444];
				 imgIp2B6 <= imagWorkingBuffer[445];
				 realIp2B6 <= realWorkingBuffer[445];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 444;
				 stateIp2B6<=#1 445;

				 //(446,447)
				 imgIp1B7 <= imagWorkingBuffer[446];
				 realIp1B7 <= realWorkingBuffer[446];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 446;
				 stateIp2B7<=#1 447;
			 end
			 29 : begin

				 //(448,449)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[449];
				 realIp2B0 <= realWorkingBuffer[449];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 448;
				 stateIp2B0<=#1 449;

				 //(450,451)
				 imgIp1B1 <= imagWorkingBuffer[450];
				 realIp1B1 <= realWorkingBuffer[450];
				 imgIp2B1 <= imagWorkingBuffer[451];
				 realIp2B1 <= realWorkingBuffer[451];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 450;
				 stateIp2B1<=#1 451;

				 //(452,453)
				 imgIp1B2 <= imagWorkingBuffer[452];
				 realIp1B2 <= realWorkingBuffer[452];
				 imgIp2B2 <= imagWorkingBuffer[453];
				 realIp2B2 <= realWorkingBuffer[453];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 452;
				 stateIp2B2<=#1 453;

				 //(454,455)
				 imgIp1B3 <= imagWorkingBuffer[454];
				 realIp1B3 <= realWorkingBuffer[454];
				 imgIp2B3 <= imagWorkingBuffer[455];
				 realIp2B3 <= realWorkingBuffer[455];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 454;
				 stateIp2B3<=#1 455;

				 //(456,457)
				 imgIp1B4 <= imagWorkingBuffer[456];
				 realIp1B4 <= realWorkingBuffer[456];
				 imgIp2B4 <= imagWorkingBuffer[457];
				 realIp2B4 <= realWorkingBuffer[457];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 456;
				 stateIp2B4<=#1 457;

				 //(458,459)
				 imgIp1B5 <= imagWorkingBuffer[458];
				 realIp1B5 <= realWorkingBuffer[458];
				 imgIp2B5 <= imagWorkingBuffer[459];
				 realIp2B5 <= realWorkingBuffer[459];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 458;
				 stateIp2B5<=#1 459;

				 //(460,461)
				 imgIp1B6 <= imagWorkingBuffer[460];
				 realIp1B6 <= realWorkingBuffer[460];
				 imgIp2B6 <= imagWorkingBuffer[461];
				 realIp2B6 <= realWorkingBuffer[461];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 460;
				 stateIp2B6<=#1 461;

				 //(462,463)
				 imgIp1B7 <= imagWorkingBuffer[462];
				 realIp1B7 <= realWorkingBuffer[462];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 462;
				 stateIp2B7<=#1 463;
			 end
			 30 : begin

				 //(464,465)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[465];
				 realIp2B0 <= realWorkingBuffer[465];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 464;
				 stateIp2B0<=#1 465;

				 //(466,467)
				 imgIp1B1 <= imagWorkingBuffer[466];
				 realIp1B1 <= realWorkingBuffer[466];
				 imgIp2B1 <= imagWorkingBuffer[467];
				 realIp2B1 <= realWorkingBuffer[467];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 466;
				 stateIp2B1<=#1 467;

				 //(468,469)
				 imgIp1B2 <= imagWorkingBuffer[468];
				 realIp1B2 <= realWorkingBuffer[468];
				 imgIp2B2 <= imagWorkingBuffer[469];
				 realIp2B2 <= realWorkingBuffer[469];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 468;
				 stateIp2B2<=#1 469;

				 //(470,471)
				 imgIp1B3 <= imagWorkingBuffer[470];
				 realIp1B3 <= realWorkingBuffer[470];
				 imgIp2B3 <= imagWorkingBuffer[471];
				 realIp2B3 <= realWorkingBuffer[471];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 470;
				 stateIp2B3<=#1 471;

				 //(472,473)
				 imgIp1B4 <= imagWorkingBuffer[472];
				 realIp1B4 <= realWorkingBuffer[472];
				 imgIp2B4 <= imagWorkingBuffer[473];
				 realIp2B4 <= realWorkingBuffer[473];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 472;
				 stateIp2B4<=#1 473;

				 //(474,475)
				 imgIp1B5 <= imagWorkingBuffer[474];
				 realIp1B5 <= realWorkingBuffer[474];
				 imgIp2B5 <= imagWorkingBuffer[475];
				 realIp2B5 <= realWorkingBuffer[475];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 474;
				 stateIp2B5<=#1 475;

				 //(476,477)
				 imgIp1B6 <= imagWorkingBuffer[476];
				 realIp1B6 <= realWorkingBuffer[476];
				 imgIp2B6 <= imagWorkingBuffer[477];
				 realIp2B6 <= realWorkingBuffer[477];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 476;
				 stateIp2B6<=#1 477;

				 //(478,479)
				 imgIp1B7 <= imagWorkingBuffer[478];
				 realIp1B7 <= realWorkingBuffer[478];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 478;
				 stateIp2B7<=#1 479;
			 end
			 31 : begin

				 //(480,481)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[481];
				 realIp2B0 <= realWorkingBuffer[481];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 480;
				 stateIp2B0<=#1 481;

				 //(482,483)
				 imgIp1B1 <= imagWorkingBuffer[482];
				 realIp1B1 <= realWorkingBuffer[482];
				 imgIp2B1 <= imagWorkingBuffer[483];
				 realIp2B1 <= realWorkingBuffer[483];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 482;
				 stateIp2B1<=#1 483;

				 //(484,485)
				 imgIp1B2 <= imagWorkingBuffer[484];
				 realIp1B2 <= realWorkingBuffer[484];
				 imgIp2B2 <= imagWorkingBuffer[485];
				 realIp2B2 <= realWorkingBuffer[485];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 484;
				 stateIp2B2<=#1 485;

				 //(486,487)
				 imgIp1B3 <= imagWorkingBuffer[486];
				 realIp1B3 <= realWorkingBuffer[486];
				 imgIp2B3 <= imagWorkingBuffer[487];
				 realIp2B3 <= realWorkingBuffer[487];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 486;
				 stateIp2B3<=#1 487;

				 //(488,489)
				 imgIp1B4 <= imagWorkingBuffer[488];
				 realIp1B4 <= realWorkingBuffer[488];
				 imgIp2B4 <= imagWorkingBuffer[489];
				 realIp2B4 <= realWorkingBuffer[489];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 488;
				 stateIp2B4<=#1 489;

				 //(490,491)
				 imgIp1B5 <= imagWorkingBuffer[490];
				 realIp1B5 <= realWorkingBuffer[490];
				 imgIp2B5 <= imagWorkingBuffer[491];
				 realIp2B5 <= realWorkingBuffer[491];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 490;
				 stateIp2B5<=#1 491;

				 //(492,493)
				 imgIp1B6 <= imagWorkingBuffer[492];
				 realIp1B6 <= realWorkingBuffer[492];
				 imgIp2B6 <= imagWorkingBuffer[493];
				 realIp2B6 <= realWorkingBuffer[493];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 492;
				 stateIp2B6<=#1 493;

				 //(494,495)
				 imgIp1B7 <= imagWorkingBuffer[494];
				 realIp1B7 <= realWorkingBuffer[494];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 494;
				 stateIp2B7<=#1 495;
			 end
			 32 : begin

				 //(496,497)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[497];
				 realIp2B0 <= realWorkingBuffer[497];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 496;
				 stateIp2B0<=#1 497;

				 //(498,499)
				 imgIp1B1 <= imagWorkingBuffer[498];
				 realIp1B1 <= realWorkingBuffer[498];
				 imgIp2B1 <= imagWorkingBuffer[499];
				 realIp2B1 <= realWorkingBuffer[499];
				 twiddleFactorRealB1 <=#1 1.0;
				 twiddleFactorimgB1 <=#1 0.0;
				 stateIp1B1<=#1 498;
				 stateIp2B1<=#1 499;

				 //(500,501)
				 imgIp1B2 <= imagWorkingBuffer[500];
				 realIp1B2 <= realWorkingBuffer[500];
				 imgIp2B2 <= imagWorkingBuffer[501];
				 realIp2B2 <= realWorkingBuffer[501];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 500;
				 stateIp2B2<=#1 501;

				 //(502,503)
				 imgIp1B3 <= imagWorkingBuffer[502];
				 realIp1B3 <= realWorkingBuffer[502];
				 imgIp2B3 <= imagWorkingBuffer[503];
				 realIp2B3 <= realWorkingBuffer[503];
				 twiddleFactorRealB3 <=#1 1.0;
				 twiddleFactorimgB3 <=#1 0.0;
				 stateIp1B3<=#1 502;
				 stateIp2B3<=#1 503;

				 //(504,505)
				 imgIp1B4 <= imagWorkingBuffer[504];
				 realIp1B4 <= realWorkingBuffer[504];
				 imgIp2B4 <= imagWorkingBuffer[505];
				 realIp2B4 <= realWorkingBuffer[505];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 504;
				 stateIp2B4<=#1 505;

				 //(506,507)
				 imgIp1B5 <= imagWorkingBuffer[506];
				 realIp1B5 <= realWorkingBuffer[506];
				 imgIp2B5 <= imagWorkingBuffer[507];
				 realIp2B5 <= realWorkingBuffer[507];
				 twiddleFactorRealB5 <=#1 1.0;
				 twiddleFactorimgB5 <=#1 0.0;
				 stateIp1B5<=#1 506;
				 stateIp2B5<=#1 507;

				 //(508,509)
				 imgIp1B6 <= imagWorkingBuffer[508];
				 realIp1B6 <= realWorkingBuffer[508];
				 imgIp2B6 <= imagWorkingBuffer[509];
				 realIp2B6 <= realWorkingBuffer[509];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 508;
				 stateIp2B6<=#1 509;

				 //(510,511)
				 imgIp1B7 <= imagWorkingBuffer[510];
				 realIp1B7 <= realWorkingBuffer[510];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 1.0;
				 twiddleFactorimgB7 <=#1 0.0;
				 stateIp1B7<=#1 510;
				 stateIp2B7<=#1 511;
			 end
			 33 : begin

				 //(0,2)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[2];
				 realIp2B0 <= realWorkingBuffer[2];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 2;

				 //(1,3)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[3];
				 realIp2B1 <= realWorkingBuffer[3];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 3;

				 //(4,6)
				 imgIp1B2 <= imagWorkingBuffer[4];
				 realIp1B2 <= realWorkingBuffer[4];
				 imgIp2B2 <= imagWorkingBuffer[6];
				 realIp2B2 <= realWorkingBuffer[6];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 4;
				 stateIp2B2<=#1 6;

				 //(5,7)
				 imgIp1B3 <= imagWorkingBuffer[5];
				 realIp1B3 <= realWorkingBuffer[5];
				 imgIp2B3 <= imagWorkingBuffer[7];
				 realIp2B3 <= realWorkingBuffer[7];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 5;
				 stateIp2B3<=#1 7;

				 //(8,10)
				 imgIp1B4 <= imagWorkingBuffer[8];
				 realIp1B4 <= realWorkingBuffer[8];
				 imgIp2B4 <= imagWorkingBuffer[10];
				 realIp2B4 <= realWorkingBuffer[10];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 8;
				 stateIp2B4<=#1 10;

				 //(9,11)
				 imgIp1B5 <= imagWorkingBuffer[9];
				 realIp1B5 <= realWorkingBuffer[9];
				 imgIp2B5 <= imagWorkingBuffer[11];
				 realIp2B5 <= realWorkingBuffer[11];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 9;
				 stateIp2B5<=#1 11;

				 //(12,14)
				 imgIp1B6 <= imagWorkingBuffer[12];
				 realIp1B6 <= realWorkingBuffer[12];
				 imgIp2B6 <= imagWorkingBuffer[14];
				 realIp2B6 <= realWorkingBuffer[14];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 12;
				 stateIp2B6<=#1 14;

				 //(13,15)
				 imgIp1B7 <= imagWorkingBuffer[13];
				 realIp1B7 <= realWorkingBuffer[13];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 13;
				 stateIp2B7<=#1 15;
			 end
			 34 : begin

				 //(16,18)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[18];
				 realIp2B0 <= realWorkingBuffer[18];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 18;

				 //(17,19)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[19];
				 realIp2B1 <= realWorkingBuffer[19];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 19;

				 //(20,22)
				 imgIp1B2 <= imagWorkingBuffer[20];
				 realIp1B2 <= realWorkingBuffer[20];
				 imgIp2B2 <= imagWorkingBuffer[22];
				 realIp2B2 <= realWorkingBuffer[22];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 20;
				 stateIp2B2<=#1 22;

				 //(21,23)
				 imgIp1B3 <= imagWorkingBuffer[21];
				 realIp1B3 <= realWorkingBuffer[21];
				 imgIp2B3 <= imagWorkingBuffer[23];
				 realIp2B3 <= realWorkingBuffer[23];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 21;
				 stateIp2B3<=#1 23;

				 //(24,26)
				 imgIp1B4 <= imagWorkingBuffer[24];
				 realIp1B4 <= realWorkingBuffer[24];
				 imgIp2B4 <= imagWorkingBuffer[26];
				 realIp2B4 <= realWorkingBuffer[26];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 24;
				 stateIp2B4<=#1 26;

				 //(25,27)
				 imgIp1B5 <= imagWorkingBuffer[25];
				 realIp1B5 <= realWorkingBuffer[25];
				 imgIp2B5 <= imagWorkingBuffer[27];
				 realIp2B5 <= realWorkingBuffer[27];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 25;
				 stateIp2B5<=#1 27;

				 //(28,30)
				 imgIp1B6 <= imagWorkingBuffer[28];
				 realIp1B6 <= realWorkingBuffer[28];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 28;
				 stateIp2B6<=#1 30;

				 //(29,31)
				 imgIp1B7 <= imagWorkingBuffer[29];
				 realIp1B7 <= realWorkingBuffer[29];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 29;
				 stateIp2B7<=#1 31;
			 end
			 35 : begin

				 //(32,34)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[34];
				 realIp2B0 <= realWorkingBuffer[34];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 34;

				 //(33,35)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[35];
				 realIp2B1 <= realWorkingBuffer[35];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 35;

				 //(36,38)
				 imgIp1B2 <= imagWorkingBuffer[36];
				 realIp1B2 <= realWorkingBuffer[36];
				 imgIp2B2 <= imagWorkingBuffer[38];
				 realIp2B2 <= realWorkingBuffer[38];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 36;
				 stateIp2B2<=#1 38;

				 //(37,39)
				 imgIp1B3 <= imagWorkingBuffer[37];
				 realIp1B3 <= realWorkingBuffer[37];
				 imgIp2B3 <= imagWorkingBuffer[39];
				 realIp2B3 <= realWorkingBuffer[39];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 37;
				 stateIp2B3<=#1 39;

				 //(40,42)
				 imgIp1B4 <= imagWorkingBuffer[40];
				 realIp1B4 <= realWorkingBuffer[40];
				 imgIp2B4 <= imagWorkingBuffer[42];
				 realIp2B4 <= realWorkingBuffer[42];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 40;
				 stateIp2B4<=#1 42;

				 //(41,43)
				 imgIp1B5 <= imagWorkingBuffer[41];
				 realIp1B5 <= realWorkingBuffer[41];
				 imgIp2B5 <= imagWorkingBuffer[43];
				 realIp2B5 <= realWorkingBuffer[43];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 41;
				 stateIp2B5<=#1 43;

				 //(44,46)
				 imgIp1B6 <= imagWorkingBuffer[44];
				 realIp1B6 <= realWorkingBuffer[44];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 44;
				 stateIp2B6<=#1 46;

				 //(45,47)
				 imgIp1B7 <= imagWorkingBuffer[45];
				 realIp1B7 <= realWorkingBuffer[45];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 45;
				 stateIp2B7<=#1 47;
			 end
			 36 : begin

				 //(48,50)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[50];
				 realIp2B0 <= realWorkingBuffer[50];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 50;

				 //(49,51)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[51];
				 realIp2B1 <= realWorkingBuffer[51];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 49;
				 stateIp2B1<=#1 51;

				 //(52,54)
				 imgIp1B2 <= imagWorkingBuffer[52];
				 realIp1B2 <= realWorkingBuffer[52];
				 imgIp2B2 <= imagWorkingBuffer[54];
				 realIp2B2 <= realWorkingBuffer[54];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 52;
				 stateIp2B2<=#1 54;

				 //(53,55)
				 imgIp1B3 <= imagWorkingBuffer[53];
				 realIp1B3 <= realWorkingBuffer[53];
				 imgIp2B3 <= imagWorkingBuffer[55];
				 realIp2B3 <= realWorkingBuffer[55];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 53;
				 stateIp2B3<=#1 55;

				 //(56,58)
				 imgIp1B4 <= imagWorkingBuffer[56];
				 realIp1B4 <= realWorkingBuffer[56];
				 imgIp2B4 <= imagWorkingBuffer[58];
				 realIp2B4 <= realWorkingBuffer[58];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 56;
				 stateIp2B4<=#1 58;

				 //(57,59)
				 imgIp1B5 <= imagWorkingBuffer[57];
				 realIp1B5 <= realWorkingBuffer[57];
				 imgIp2B5 <= imagWorkingBuffer[59];
				 realIp2B5 <= realWorkingBuffer[59];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 57;
				 stateIp2B5<=#1 59;

				 //(60,62)
				 imgIp1B6 <= imagWorkingBuffer[60];
				 realIp1B6 <= realWorkingBuffer[60];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 60;
				 stateIp2B6<=#1 62;

				 //(61,63)
				 imgIp1B7 <= imagWorkingBuffer[61];
				 realIp1B7 <= realWorkingBuffer[61];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 61;
				 stateIp2B7<=#1 63;
			 end
			 37 : begin

				 //(64,66)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[66];
				 realIp2B0 <= realWorkingBuffer[66];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 66;

				 //(65,67)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[67];
				 realIp2B1 <= realWorkingBuffer[67];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 67;

				 //(68,70)
				 imgIp1B2 <= imagWorkingBuffer[68];
				 realIp1B2 <= realWorkingBuffer[68];
				 imgIp2B2 <= imagWorkingBuffer[70];
				 realIp2B2 <= realWorkingBuffer[70];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 68;
				 stateIp2B2<=#1 70;

				 //(69,71)
				 imgIp1B3 <= imagWorkingBuffer[69];
				 realIp1B3 <= realWorkingBuffer[69];
				 imgIp2B3 <= imagWorkingBuffer[71];
				 realIp2B3 <= realWorkingBuffer[71];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 69;
				 stateIp2B3<=#1 71;

				 //(72,74)
				 imgIp1B4 <= imagWorkingBuffer[72];
				 realIp1B4 <= realWorkingBuffer[72];
				 imgIp2B4 <= imagWorkingBuffer[74];
				 realIp2B4 <= realWorkingBuffer[74];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 72;
				 stateIp2B4<=#1 74;

				 //(73,75)
				 imgIp1B5 <= imagWorkingBuffer[73];
				 realIp1B5 <= realWorkingBuffer[73];
				 imgIp2B5 <= imagWorkingBuffer[75];
				 realIp2B5 <= realWorkingBuffer[75];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 73;
				 stateIp2B5<=#1 75;

				 //(76,78)
				 imgIp1B6 <= imagWorkingBuffer[76];
				 realIp1B6 <= realWorkingBuffer[76];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 76;
				 stateIp2B6<=#1 78;

				 //(77,79)
				 imgIp1B7 <= imagWorkingBuffer[77];
				 realIp1B7 <= realWorkingBuffer[77];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 77;
				 stateIp2B7<=#1 79;
			 end
			 38 : begin

				 //(80,82)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[82];
				 realIp2B0 <= realWorkingBuffer[82];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 82;

				 //(81,83)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[83];
				 realIp2B1 <= realWorkingBuffer[83];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 81;
				 stateIp2B1<=#1 83;

				 //(84,86)
				 imgIp1B2 <= imagWorkingBuffer[84];
				 realIp1B2 <= realWorkingBuffer[84];
				 imgIp2B2 <= imagWorkingBuffer[86];
				 realIp2B2 <= realWorkingBuffer[86];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 84;
				 stateIp2B2<=#1 86;

				 //(85,87)
				 imgIp1B3 <= imagWorkingBuffer[85];
				 realIp1B3 <= realWorkingBuffer[85];
				 imgIp2B3 <= imagWorkingBuffer[87];
				 realIp2B3 <= realWorkingBuffer[87];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 85;
				 stateIp2B3<=#1 87;

				 //(88,90)
				 imgIp1B4 <= imagWorkingBuffer[88];
				 realIp1B4 <= realWorkingBuffer[88];
				 imgIp2B4 <= imagWorkingBuffer[90];
				 realIp2B4 <= realWorkingBuffer[90];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 88;
				 stateIp2B4<=#1 90;

				 //(89,91)
				 imgIp1B5 <= imagWorkingBuffer[89];
				 realIp1B5 <= realWorkingBuffer[89];
				 imgIp2B5 <= imagWorkingBuffer[91];
				 realIp2B5 <= realWorkingBuffer[91];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 89;
				 stateIp2B5<=#1 91;

				 //(92,94)
				 imgIp1B6 <= imagWorkingBuffer[92];
				 realIp1B6 <= realWorkingBuffer[92];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 92;
				 stateIp2B6<=#1 94;

				 //(93,95)
				 imgIp1B7 <= imagWorkingBuffer[93];
				 realIp1B7 <= realWorkingBuffer[93];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 93;
				 stateIp2B7<=#1 95;
			 end
			 39 : begin

				 //(96,98)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[98];
				 realIp2B0 <= realWorkingBuffer[98];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 98;

				 //(97,99)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[99];
				 realIp2B1 <= realWorkingBuffer[99];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 97;
				 stateIp2B1<=#1 99;

				 //(100,102)
				 imgIp1B2 <= imagWorkingBuffer[100];
				 realIp1B2 <= realWorkingBuffer[100];
				 imgIp2B2 <= imagWorkingBuffer[102];
				 realIp2B2 <= realWorkingBuffer[102];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 100;
				 stateIp2B2<=#1 102;

				 //(101,103)
				 imgIp1B3 <= imagWorkingBuffer[101];
				 realIp1B3 <= realWorkingBuffer[101];
				 imgIp2B3 <= imagWorkingBuffer[103];
				 realIp2B3 <= realWorkingBuffer[103];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 101;
				 stateIp2B3<=#1 103;

				 //(104,106)
				 imgIp1B4 <= imagWorkingBuffer[104];
				 realIp1B4 <= realWorkingBuffer[104];
				 imgIp2B4 <= imagWorkingBuffer[106];
				 realIp2B4 <= realWorkingBuffer[106];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 104;
				 stateIp2B4<=#1 106;

				 //(105,107)
				 imgIp1B5 <= imagWorkingBuffer[105];
				 realIp1B5 <= realWorkingBuffer[105];
				 imgIp2B5 <= imagWorkingBuffer[107];
				 realIp2B5 <= realWorkingBuffer[107];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 105;
				 stateIp2B5<=#1 107;

				 //(108,110)
				 imgIp1B6 <= imagWorkingBuffer[108];
				 realIp1B6 <= realWorkingBuffer[108];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 108;
				 stateIp2B6<=#1 110;

				 //(109,111)
				 imgIp1B7 <= imagWorkingBuffer[109];
				 realIp1B7 <= realWorkingBuffer[109];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 109;
				 stateIp2B7<=#1 111;
			 end
			 40 : begin

				 //(112,114)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[114];
				 realIp2B0 <= realWorkingBuffer[114];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 112;
				 stateIp2B0<=#1 114;

				 //(113,115)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[115];
				 realIp2B1 <= realWorkingBuffer[115];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 113;
				 stateIp2B1<=#1 115;

				 //(116,118)
				 imgIp1B2 <= imagWorkingBuffer[116];
				 realIp1B2 <= realWorkingBuffer[116];
				 imgIp2B2 <= imagWorkingBuffer[118];
				 realIp2B2 <= realWorkingBuffer[118];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 116;
				 stateIp2B2<=#1 118;

				 //(117,119)
				 imgIp1B3 <= imagWorkingBuffer[117];
				 realIp1B3 <= realWorkingBuffer[117];
				 imgIp2B3 <= imagWorkingBuffer[119];
				 realIp2B3 <= realWorkingBuffer[119];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 117;
				 stateIp2B3<=#1 119;

				 //(120,122)
				 imgIp1B4 <= imagWorkingBuffer[120];
				 realIp1B4 <= realWorkingBuffer[120];
				 imgIp2B4 <= imagWorkingBuffer[122];
				 realIp2B4 <= realWorkingBuffer[122];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 120;
				 stateIp2B4<=#1 122;

				 //(121,123)
				 imgIp1B5 <= imagWorkingBuffer[121];
				 realIp1B5 <= realWorkingBuffer[121];
				 imgIp2B5 <= imagWorkingBuffer[123];
				 realIp2B5 <= realWorkingBuffer[123];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 121;
				 stateIp2B5<=#1 123;

				 //(124,126)
				 imgIp1B6 <= imagWorkingBuffer[124];
				 realIp1B6 <= realWorkingBuffer[124];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 124;
				 stateIp2B6<=#1 126;

				 //(125,127)
				 imgIp1B7 <= imagWorkingBuffer[125];
				 realIp1B7 <= realWorkingBuffer[125];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 125;
				 stateIp2B7<=#1 127;
			 end
			 41 : begin

				 //(128,130)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[130];
				 realIp2B0 <= realWorkingBuffer[130];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 130;

				 //(129,131)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[131];
				 realIp2B1 <= realWorkingBuffer[131];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 131;

				 //(132,134)
				 imgIp1B2 <= imagWorkingBuffer[132];
				 realIp1B2 <= realWorkingBuffer[132];
				 imgIp2B2 <= imagWorkingBuffer[134];
				 realIp2B2 <= realWorkingBuffer[134];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 132;
				 stateIp2B2<=#1 134;

				 //(133,135)
				 imgIp1B3 <= imagWorkingBuffer[133];
				 realIp1B3 <= realWorkingBuffer[133];
				 imgIp2B3 <= imagWorkingBuffer[135];
				 realIp2B3 <= realWorkingBuffer[135];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 133;
				 stateIp2B3<=#1 135;

				 //(136,138)
				 imgIp1B4 <= imagWorkingBuffer[136];
				 realIp1B4 <= realWorkingBuffer[136];
				 imgIp2B4 <= imagWorkingBuffer[138];
				 realIp2B4 <= realWorkingBuffer[138];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 136;
				 stateIp2B4<=#1 138;

				 //(137,139)
				 imgIp1B5 <= imagWorkingBuffer[137];
				 realIp1B5 <= realWorkingBuffer[137];
				 imgIp2B5 <= imagWorkingBuffer[139];
				 realIp2B5 <= realWorkingBuffer[139];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 137;
				 stateIp2B5<=#1 139;

				 //(140,142)
				 imgIp1B6 <= imagWorkingBuffer[140];
				 realIp1B6 <= realWorkingBuffer[140];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 140;
				 stateIp2B6<=#1 142;

				 //(141,143)
				 imgIp1B7 <= imagWorkingBuffer[141];
				 realIp1B7 <= realWorkingBuffer[141];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 141;
				 stateIp2B7<=#1 143;
			 end
			 42 : begin

				 //(144,146)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[146];
				 realIp2B0 <= realWorkingBuffer[146];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 146;

				 //(145,147)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[147];
				 realIp2B1 <= realWorkingBuffer[147];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 145;
				 stateIp2B1<=#1 147;

				 //(148,150)
				 imgIp1B2 <= imagWorkingBuffer[148];
				 realIp1B2 <= realWorkingBuffer[148];
				 imgIp2B2 <= imagWorkingBuffer[150];
				 realIp2B2 <= realWorkingBuffer[150];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 148;
				 stateIp2B2<=#1 150;

				 //(149,151)
				 imgIp1B3 <= imagWorkingBuffer[149];
				 realIp1B3 <= realWorkingBuffer[149];
				 imgIp2B3 <= imagWorkingBuffer[151];
				 realIp2B3 <= realWorkingBuffer[151];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 149;
				 stateIp2B3<=#1 151;

				 //(152,154)
				 imgIp1B4 <= imagWorkingBuffer[152];
				 realIp1B4 <= realWorkingBuffer[152];
				 imgIp2B4 <= imagWorkingBuffer[154];
				 realIp2B4 <= realWorkingBuffer[154];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 152;
				 stateIp2B4<=#1 154;

				 //(153,155)
				 imgIp1B5 <= imagWorkingBuffer[153];
				 realIp1B5 <= realWorkingBuffer[153];
				 imgIp2B5 <= imagWorkingBuffer[155];
				 realIp2B5 <= realWorkingBuffer[155];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 153;
				 stateIp2B5<=#1 155;

				 //(156,158)
				 imgIp1B6 <= imagWorkingBuffer[156];
				 realIp1B6 <= realWorkingBuffer[156];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 156;
				 stateIp2B6<=#1 158;

				 //(157,159)
				 imgIp1B7 <= imagWorkingBuffer[157];
				 realIp1B7 <= realWorkingBuffer[157];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 157;
				 stateIp2B7<=#1 159;
			 end
			 43 : begin

				 //(160,162)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[162];
				 realIp2B0 <= realWorkingBuffer[162];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 162;

				 //(161,163)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[163];
				 realIp2B1 <= realWorkingBuffer[163];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 161;
				 stateIp2B1<=#1 163;

				 //(164,166)
				 imgIp1B2 <= imagWorkingBuffer[164];
				 realIp1B2 <= realWorkingBuffer[164];
				 imgIp2B2 <= imagWorkingBuffer[166];
				 realIp2B2 <= realWorkingBuffer[166];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 164;
				 stateIp2B2<=#1 166;

				 //(165,167)
				 imgIp1B3 <= imagWorkingBuffer[165];
				 realIp1B3 <= realWorkingBuffer[165];
				 imgIp2B3 <= imagWorkingBuffer[167];
				 realIp2B3 <= realWorkingBuffer[167];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 165;
				 stateIp2B3<=#1 167;

				 //(168,170)
				 imgIp1B4 <= imagWorkingBuffer[168];
				 realIp1B4 <= realWorkingBuffer[168];
				 imgIp2B4 <= imagWorkingBuffer[170];
				 realIp2B4 <= realWorkingBuffer[170];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 168;
				 stateIp2B4<=#1 170;

				 //(169,171)
				 imgIp1B5 <= imagWorkingBuffer[169];
				 realIp1B5 <= realWorkingBuffer[169];
				 imgIp2B5 <= imagWorkingBuffer[171];
				 realIp2B5 <= realWorkingBuffer[171];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 169;
				 stateIp2B5<=#1 171;

				 //(172,174)
				 imgIp1B6 <= imagWorkingBuffer[172];
				 realIp1B6 <= realWorkingBuffer[172];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 172;
				 stateIp2B6<=#1 174;

				 //(173,175)
				 imgIp1B7 <= imagWorkingBuffer[173];
				 realIp1B7 <= realWorkingBuffer[173];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 173;
				 stateIp2B7<=#1 175;
			 end
			 44 : begin

				 //(176,178)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[178];
				 realIp2B0 <= realWorkingBuffer[178];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 176;
				 stateIp2B0<=#1 178;

				 //(177,179)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[179];
				 realIp2B1 <= realWorkingBuffer[179];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 177;
				 stateIp2B1<=#1 179;

				 //(180,182)
				 imgIp1B2 <= imagWorkingBuffer[180];
				 realIp1B2 <= realWorkingBuffer[180];
				 imgIp2B2 <= imagWorkingBuffer[182];
				 realIp2B2 <= realWorkingBuffer[182];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 180;
				 stateIp2B2<=#1 182;

				 //(181,183)
				 imgIp1B3 <= imagWorkingBuffer[181];
				 realIp1B3 <= realWorkingBuffer[181];
				 imgIp2B3 <= imagWorkingBuffer[183];
				 realIp2B3 <= realWorkingBuffer[183];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 181;
				 stateIp2B3<=#1 183;

				 //(184,186)
				 imgIp1B4 <= imagWorkingBuffer[184];
				 realIp1B4 <= realWorkingBuffer[184];
				 imgIp2B4 <= imagWorkingBuffer[186];
				 realIp2B4 <= realWorkingBuffer[186];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 184;
				 stateIp2B4<=#1 186;

				 //(185,187)
				 imgIp1B5 <= imagWorkingBuffer[185];
				 realIp1B5 <= realWorkingBuffer[185];
				 imgIp2B5 <= imagWorkingBuffer[187];
				 realIp2B5 <= realWorkingBuffer[187];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 185;
				 stateIp2B5<=#1 187;

				 //(188,190)
				 imgIp1B6 <= imagWorkingBuffer[188];
				 realIp1B6 <= realWorkingBuffer[188];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 188;
				 stateIp2B6<=#1 190;

				 //(189,191)
				 imgIp1B7 <= imagWorkingBuffer[189];
				 realIp1B7 <= realWorkingBuffer[189];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 189;
				 stateIp2B7<=#1 191;
			 end
			 45 : begin

				 //(192,194)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[194];
				 realIp2B0 <= realWorkingBuffer[194];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 194;

				 //(193,195)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[195];
				 realIp2B1 <= realWorkingBuffer[195];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 193;
				 stateIp2B1<=#1 195;

				 //(196,198)
				 imgIp1B2 <= imagWorkingBuffer[196];
				 realIp1B2 <= realWorkingBuffer[196];
				 imgIp2B2 <= imagWorkingBuffer[198];
				 realIp2B2 <= realWorkingBuffer[198];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 196;
				 stateIp2B2<=#1 198;

				 //(197,199)
				 imgIp1B3 <= imagWorkingBuffer[197];
				 realIp1B3 <= realWorkingBuffer[197];
				 imgIp2B3 <= imagWorkingBuffer[199];
				 realIp2B3 <= realWorkingBuffer[199];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 197;
				 stateIp2B3<=#1 199;

				 //(200,202)
				 imgIp1B4 <= imagWorkingBuffer[200];
				 realIp1B4 <= realWorkingBuffer[200];
				 imgIp2B4 <= imagWorkingBuffer[202];
				 realIp2B4 <= realWorkingBuffer[202];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 200;
				 stateIp2B4<=#1 202;

				 //(201,203)
				 imgIp1B5 <= imagWorkingBuffer[201];
				 realIp1B5 <= realWorkingBuffer[201];
				 imgIp2B5 <= imagWorkingBuffer[203];
				 realIp2B5 <= realWorkingBuffer[203];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 201;
				 stateIp2B5<=#1 203;

				 //(204,206)
				 imgIp1B6 <= imagWorkingBuffer[204];
				 realIp1B6 <= realWorkingBuffer[204];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 204;
				 stateIp2B6<=#1 206;

				 //(205,207)
				 imgIp1B7 <= imagWorkingBuffer[205];
				 realIp1B7 <= realWorkingBuffer[205];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 205;
				 stateIp2B7<=#1 207;
			 end
			 46 : begin

				 //(208,210)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[210];
				 realIp2B0 <= realWorkingBuffer[210];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 208;
				 stateIp2B0<=#1 210;

				 //(209,211)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[211];
				 realIp2B1 <= realWorkingBuffer[211];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 209;
				 stateIp2B1<=#1 211;

				 //(212,214)
				 imgIp1B2 <= imagWorkingBuffer[212];
				 realIp1B2 <= realWorkingBuffer[212];
				 imgIp2B2 <= imagWorkingBuffer[214];
				 realIp2B2 <= realWorkingBuffer[214];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 212;
				 stateIp2B2<=#1 214;

				 //(213,215)
				 imgIp1B3 <= imagWorkingBuffer[213];
				 realIp1B3 <= realWorkingBuffer[213];
				 imgIp2B3 <= imagWorkingBuffer[215];
				 realIp2B3 <= realWorkingBuffer[215];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 213;
				 stateIp2B3<=#1 215;

				 //(216,218)
				 imgIp1B4 <= imagWorkingBuffer[216];
				 realIp1B4 <= realWorkingBuffer[216];
				 imgIp2B4 <= imagWorkingBuffer[218];
				 realIp2B4 <= realWorkingBuffer[218];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 216;
				 stateIp2B4<=#1 218;

				 //(217,219)
				 imgIp1B5 <= imagWorkingBuffer[217];
				 realIp1B5 <= realWorkingBuffer[217];
				 imgIp2B5 <= imagWorkingBuffer[219];
				 realIp2B5 <= realWorkingBuffer[219];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 217;
				 stateIp2B5<=#1 219;

				 //(220,222)
				 imgIp1B6 <= imagWorkingBuffer[220];
				 realIp1B6 <= realWorkingBuffer[220];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 220;
				 stateIp2B6<=#1 222;

				 //(221,223)
				 imgIp1B7 <= imagWorkingBuffer[221];
				 realIp1B7 <= realWorkingBuffer[221];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 221;
				 stateIp2B7<=#1 223;
			 end
			 47 : begin

				 //(224,226)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[226];
				 realIp2B0 <= realWorkingBuffer[226];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 224;
				 stateIp2B0<=#1 226;

				 //(225,227)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[227];
				 realIp2B1 <= realWorkingBuffer[227];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 225;
				 stateIp2B1<=#1 227;

				 //(228,230)
				 imgIp1B2 <= imagWorkingBuffer[228];
				 realIp1B2 <= realWorkingBuffer[228];
				 imgIp2B2 <= imagWorkingBuffer[230];
				 realIp2B2 <= realWorkingBuffer[230];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 228;
				 stateIp2B2<=#1 230;

				 //(229,231)
				 imgIp1B3 <= imagWorkingBuffer[229];
				 realIp1B3 <= realWorkingBuffer[229];
				 imgIp2B3 <= imagWorkingBuffer[231];
				 realIp2B3 <= realWorkingBuffer[231];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 229;
				 stateIp2B3<=#1 231;

				 //(232,234)
				 imgIp1B4 <= imagWorkingBuffer[232];
				 realIp1B4 <= realWorkingBuffer[232];
				 imgIp2B4 <= imagWorkingBuffer[234];
				 realIp2B4 <= realWorkingBuffer[234];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 232;
				 stateIp2B4<=#1 234;

				 //(233,235)
				 imgIp1B5 <= imagWorkingBuffer[233];
				 realIp1B5 <= realWorkingBuffer[233];
				 imgIp2B5 <= imagWorkingBuffer[235];
				 realIp2B5 <= realWorkingBuffer[235];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 233;
				 stateIp2B5<=#1 235;

				 //(236,238)
				 imgIp1B6 <= imagWorkingBuffer[236];
				 realIp1B6 <= realWorkingBuffer[236];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 236;
				 stateIp2B6<=#1 238;

				 //(237,239)
				 imgIp1B7 <= imagWorkingBuffer[237];
				 realIp1B7 <= realWorkingBuffer[237];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 237;
				 stateIp2B7<=#1 239;
			 end
			 48 : begin

				 //(240,242)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[242];
				 realIp2B0 <= realWorkingBuffer[242];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 240;
				 stateIp2B0<=#1 242;

				 //(241,243)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[243];
				 realIp2B1 <= realWorkingBuffer[243];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 241;
				 stateIp2B1<=#1 243;

				 //(244,246)
				 imgIp1B2 <= imagWorkingBuffer[244];
				 realIp1B2 <= realWorkingBuffer[244];
				 imgIp2B2 <= imagWorkingBuffer[246];
				 realIp2B2 <= realWorkingBuffer[246];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 244;
				 stateIp2B2<=#1 246;

				 //(245,247)
				 imgIp1B3 <= imagWorkingBuffer[245];
				 realIp1B3 <= realWorkingBuffer[245];
				 imgIp2B3 <= imagWorkingBuffer[247];
				 realIp2B3 <= realWorkingBuffer[247];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 245;
				 stateIp2B3<=#1 247;

				 //(248,250)
				 imgIp1B4 <= imagWorkingBuffer[248];
				 realIp1B4 <= realWorkingBuffer[248];
				 imgIp2B4 <= imagWorkingBuffer[250];
				 realIp2B4 <= realWorkingBuffer[250];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 248;
				 stateIp2B4<=#1 250;

				 //(249,251)
				 imgIp1B5 <= imagWorkingBuffer[249];
				 realIp1B5 <= realWorkingBuffer[249];
				 imgIp2B5 <= imagWorkingBuffer[251];
				 realIp2B5 <= realWorkingBuffer[251];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 249;
				 stateIp2B5<=#1 251;

				 //(252,254)
				 imgIp1B6 <= imagWorkingBuffer[252];
				 realIp1B6 <= realWorkingBuffer[252];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 252;
				 stateIp2B6<=#1 254;

				 //(253,255)
				 imgIp1B7 <= imagWorkingBuffer[253];
				 realIp1B7 <= realWorkingBuffer[253];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 253;
				 stateIp2B7<=#1 255;
			 end
			 49 : begin

				 //(256,258)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[258];
				 realIp2B0 <= realWorkingBuffer[258];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 258;

				 //(257,259)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[259];
				 realIp2B1 <= realWorkingBuffer[259];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 259;

				 //(260,262)
				 imgIp1B2 <= imagWorkingBuffer[260];
				 realIp1B2 <= realWorkingBuffer[260];
				 imgIp2B2 <= imagWorkingBuffer[262];
				 realIp2B2 <= realWorkingBuffer[262];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 260;
				 stateIp2B2<=#1 262;

				 //(261,263)
				 imgIp1B3 <= imagWorkingBuffer[261];
				 realIp1B3 <= realWorkingBuffer[261];
				 imgIp2B3 <= imagWorkingBuffer[263];
				 realIp2B3 <= realWorkingBuffer[263];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 261;
				 stateIp2B3<=#1 263;

				 //(264,266)
				 imgIp1B4 <= imagWorkingBuffer[264];
				 realIp1B4 <= realWorkingBuffer[264];
				 imgIp2B4 <= imagWorkingBuffer[266];
				 realIp2B4 <= realWorkingBuffer[266];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 264;
				 stateIp2B4<=#1 266;

				 //(265,267)
				 imgIp1B5 <= imagWorkingBuffer[265];
				 realIp1B5 <= realWorkingBuffer[265];
				 imgIp2B5 <= imagWorkingBuffer[267];
				 realIp2B5 <= realWorkingBuffer[267];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 265;
				 stateIp2B5<=#1 267;

				 //(268,270)
				 imgIp1B6 <= imagWorkingBuffer[268];
				 realIp1B6 <= realWorkingBuffer[268];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 268;
				 stateIp2B6<=#1 270;

				 //(269,271)
				 imgIp1B7 <= imagWorkingBuffer[269];
				 realIp1B7 <= realWorkingBuffer[269];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 269;
				 stateIp2B7<=#1 271;
			 end
			 50 : begin

				 //(272,274)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[274];
				 realIp2B0 <= realWorkingBuffer[274];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 274;

				 //(273,275)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[275];
				 realIp2B1 <= realWorkingBuffer[275];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 273;
				 stateIp2B1<=#1 275;

				 //(276,278)
				 imgIp1B2 <= imagWorkingBuffer[276];
				 realIp1B2 <= realWorkingBuffer[276];
				 imgIp2B2 <= imagWorkingBuffer[278];
				 realIp2B2 <= realWorkingBuffer[278];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 276;
				 stateIp2B2<=#1 278;

				 //(277,279)
				 imgIp1B3 <= imagWorkingBuffer[277];
				 realIp1B3 <= realWorkingBuffer[277];
				 imgIp2B3 <= imagWorkingBuffer[279];
				 realIp2B3 <= realWorkingBuffer[279];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 277;
				 stateIp2B3<=#1 279;

				 //(280,282)
				 imgIp1B4 <= imagWorkingBuffer[280];
				 realIp1B4 <= realWorkingBuffer[280];
				 imgIp2B4 <= imagWorkingBuffer[282];
				 realIp2B4 <= realWorkingBuffer[282];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 280;
				 stateIp2B4<=#1 282;

				 //(281,283)
				 imgIp1B5 <= imagWorkingBuffer[281];
				 realIp1B5 <= realWorkingBuffer[281];
				 imgIp2B5 <= imagWorkingBuffer[283];
				 realIp2B5 <= realWorkingBuffer[283];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 281;
				 stateIp2B5<=#1 283;

				 //(284,286)
				 imgIp1B6 <= imagWorkingBuffer[284];
				 realIp1B6 <= realWorkingBuffer[284];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 284;
				 stateIp2B6<=#1 286;

				 //(285,287)
				 imgIp1B7 <= imagWorkingBuffer[285];
				 realIp1B7 <= realWorkingBuffer[285];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 285;
				 stateIp2B7<=#1 287;
			 end
			 51 : begin

				 //(288,290)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[290];
				 realIp2B0 <= realWorkingBuffer[290];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 290;

				 //(289,291)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[291];
				 realIp2B1 <= realWorkingBuffer[291];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 289;
				 stateIp2B1<=#1 291;

				 //(292,294)
				 imgIp1B2 <= imagWorkingBuffer[292];
				 realIp1B2 <= realWorkingBuffer[292];
				 imgIp2B2 <= imagWorkingBuffer[294];
				 realIp2B2 <= realWorkingBuffer[294];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 292;
				 stateIp2B2<=#1 294;

				 //(293,295)
				 imgIp1B3 <= imagWorkingBuffer[293];
				 realIp1B3 <= realWorkingBuffer[293];
				 imgIp2B3 <= imagWorkingBuffer[295];
				 realIp2B3 <= realWorkingBuffer[295];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 293;
				 stateIp2B3<=#1 295;

				 //(296,298)
				 imgIp1B4 <= imagWorkingBuffer[296];
				 realIp1B4 <= realWorkingBuffer[296];
				 imgIp2B4 <= imagWorkingBuffer[298];
				 realIp2B4 <= realWorkingBuffer[298];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 296;
				 stateIp2B4<=#1 298;

				 //(297,299)
				 imgIp1B5 <= imagWorkingBuffer[297];
				 realIp1B5 <= realWorkingBuffer[297];
				 imgIp2B5 <= imagWorkingBuffer[299];
				 realIp2B5 <= realWorkingBuffer[299];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 297;
				 stateIp2B5<=#1 299;

				 //(300,302)
				 imgIp1B6 <= imagWorkingBuffer[300];
				 realIp1B6 <= realWorkingBuffer[300];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 300;
				 stateIp2B6<=#1 302;

				 //(301,303)
				 imgIp1B7 <= imagWorkingBuffer[301];
				 realIp1B7 <= realWorkingBuffer[301];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 301;
				 stateIp2B7<=#1 303;
			 end
			 52 : begin

				 //(304,306)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[306];
				 realIp2B0 <= realWorkingBuffer[306];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 304;
				 stateIp2B0<=#1 306;

				 //(305,307)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[307];
				 realIp2B1 <= realWorkingBuffer[307];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 305;
				 stateIp2B1<=#1 307;

				 //(308,310)
				 imgIp1B2 <= imagWorkingBuffer[308];
				 realIp1B2 <= realWorkingBuffer[308];
				 imgIp2B2 <= imagWorkingBuffer[310];
				 realIp2B2 <= realWorkingBuffer[310];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 308;
				 stateIp2B2<=#1 310;

				 //(309,311)
				 imgIp1B3 <= imagWorkingBuffer[309];
				 realIp1B3 <= realWorkingBuffer[309];
				 imgIp2B3 <= imagWorkingBuffer[311];
				 realIp2B3 <= realWorkingBuffer[311];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 309;
				 stateIp2B3<=#1 311;

				 //(312,314)
				 imgIp1B4 <= imagWorkingBuffer[312];
				 realIp1B4 <= realWorkingBuffer[312];
				 imgIp2B4 <= imagWorkingBuffer[314];
				 realIp2B4 <= realWorkingBuffer[314];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 312;
				 stateIp2B4<=#1 314;

				 //(313,315)
				 imgIp1B5 <= imagWorkingBuffer[313];
				 realIp1B5 <= realWorkingBuffer[313];
				 imgIp2B5 <= imagWorkingBuffer[315];
				 realIp2B5 <= realWorkingBuffer[315];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 313;
				 stateIp2B5<=#1 315;

				 //(316,318)
				 imgIp1B6 <= imagWorkingBuffer[316];
				 realIp1B6 <= realWorkingBuffer[316];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 316;
				 stateIp2B6<=#1 318;

				 //(317,319)
				 imgIp1B7 <= imagWorkingBuffer[317];
				 realIp1B7 <= realWorkingBuffer[317];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 317;
				 stateIp2B7<=#1 319;
			 end
			 53 : begin

				 //(320,322)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[322];
				 realIp2B0 <= realWorkingBuffer[322];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 322;

				 //(321,323)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[323];
				 realIp2B1 <= realWorkingBuffer[323];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 321;
				 stateIp2B1<=#1 323;

				 //(324,326)
				 imgIp1B2 <= imagWorkingBuffer[324];
				 realIp1B2 <= realWorkingBuffer[324];
				 imgIp2B2 <= imagWorkingBuffer[326];
				 realIp2B2 <= realWorkingBuffer[326];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 324;
				 stateIp2B2<=#1 326;

				 //(325,327)
				 imgIp1B3 <= imagWorkingBuffer[325];
				 realIp1B3 <= realWorkingBuffer[325];
				 imgIp2B3 <= imagWorkingBuffer[327];
				 realIp2B3 <= realWorkingBuffer[327];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 325;
				 stateIp2B3<=#1 327;

				 //(328,330)
				 imgIp1B4 <= imagWorkingBuffer[328];
				 realIp1B4 <= realWorkingBuffer[328];
				 imgIp2B4 <= imagWorkingBuffer[330];
				 realIp2B4 <= realWorkingBuffer[330];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 328;
				 stateIp2B4<=#1 330;

				 //(329,331)
				 imgIp1B5 <= imagWorkingBuffer[329];
				 realIp1B5 <= realWorkingBuffer[329];
				 imgIp2B5 <= imagWorkingBuffer[331];
				 realIp2B5 <= realWorkingBuffer[331];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 329;
				 stateIp2B5<=#1 331;

				 //(332,334)
				 imgIp1B6 <= imagWorkingBuffer[332];
				 realIp1B6 <= realWorkingBuffer[332];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 332;
				 stateIp2B6<=#1 334;

				 //(333,335)
				 imgIp1B7 <= imagWorkingBuffer[333];
				 realIp1B7 <= realWorkingBuffer[333];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 333;
				 stateIp2B7<=#1 335;
			 end
			 54 : begin

				 //(336,338)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[338];
				 realIp2B0 <= realWorkingBuffer[338];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 336;
				 stateIp2B0<=#1 338;

				 //(337,339)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[339];
				 realIp2B1 <= realWorkingBuffer[339];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 337;
				 stateIp2B1<=#1 339;

				 //(340,342)
				 imgIp1B2 <= imagWorkingBuffer[340];
				 realIp1B2 <= realWorkingBuffer[340];
				 imgIp2B2 <= imagWorkingBuffer[342];
				 realIp2B2 <= realWorkingBuffer[342];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 340;
				 stateIp2B2<=#1 342;

				 //(341,343)
				 imgIp1B3 <= imagWorkingBuffer[341];
				 realIp1B3 <= realWorkingBuffer[341];
				 imgIp2B3 <= imagWorkingBuffer[343];
				 realIp2B3 <= realWorkingBuffer[343];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 341;
				 stateIp2B3<=#1 343;

				 //(344,346)
				 imgIp1B4 <= imagWorkingBuffer[344];
				 realIp1B4 <= realWorkingBuffer[344];
				 imgIp2B4 <= imagWorkingBuffer[346];
				 realIp2B4 <= realWorkingBuffer[346];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 344;
				 stateIp2B4<=#1 346;

				 //(345,347)
				 imgIp1B5 <= imagWorkingBuffer[345];
				 realIp1B5 <= realWorkingBuffer[345];
				 imgIp2B5 <= imagWorkingBuffer[347];
				 realIp2B5 <= realWorkingBuffer[347];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 345;
				 stateIp2B5<=#1 347;

				 //(348,350)
				 imgIp1B6 <= imagWorkingBuffer[348];
				 realIp1B6 <= realWorkingBuffer[348];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 348;
				 stateIp2B6<=#1 350;

				 //(349,351)
				 imgIp1B7 <= imagWorkingBuffer[349];
				 realIp1B7 <= realWorkingBuffer[349];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 349;
				 stateIp2B7<=#1 351;
			 end
			 55 : begin

				 //(352,354)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[354];
				 realIp2B0 <= realWorkingBuffer[354];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 352;
				 stateIp2B0<=#1 354;

				 //(353,355)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[355];
				 realIp2B1 <= realWorkingBuffer[355];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 353;
				 stateIp2B1<=#1 355;

				 //(356,358)
				 imgIp1B2 <= imagWorkingBuffer[356];
				 realIp1B2 <= realWorkingBuffer[356];
				 imgIp2B2 <= imagWorkingBuffer[358];
				 realIp2B2 <= realWorkingBuffer[358];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 356;
				 stateIp2B2<=#1 358;

				 //(357,359)
				 imgIp1B3 <= imagWorkingBuffer[357];
				 realIp1B3 <= realWorkingBuffer[357];
				 imgIp2B3 <= imagWorkingBuffer[359];
				 realIp2B3 <= realWorkingBuffer[359];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 357;
				 stateIp2B3<=#1 359;

				 //(360,362)
				 imgIp1B4 <= imagWorkingBuffer[360];
				 realIp1B4 <= realWorkingBuffer[360];
				 imgIp2B4 <= imagWorkingBuffer[362];
				 realIp2B4 <= realWorkingBuffer[362];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 360;
				 stateIp2B4<=#1 362;

				 //(361,363)
				 imgIp1B5 <= imagWorkingBuffer[361];
				 realIp1B5 <= realWorkingBuffer[361];
				 imgIp2B5 <= imagWorkingBuffer[363];
				 realIp2B5 <= realWorkingBuffer[363];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 361;
				 stateIp2B5<=#1 363;

				 //(364,366)
				 imgIp1B6 <= imagWorkingBuffer[364];
				 realIp1B6 <= realWorkingBuffer[364];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 364;
				 stateIp2B6<=#1 366;

				 //(365,367)
				 imgIp1B7 <= imagWorkingBuffer[365];
				 realIp1B7 <= realWorkingBuffer[365];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 365;
				 stateIp2B7<=#1 367;
			 end
			 56 : begin

				 //(368,370)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[370];
				 realIp2B0 <= realWorkingBuffer[370];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 368;
				 stateIp2B0<=#1 370;

				 //(369,371)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[371];
				 realIp2B1 <= realWorkingBuffer[371];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 369;
				 stateIp2B1<=#1 371;

				 //(372,374)
				 imgIp1B2 <= imagWorkingBuffer[372];
				 realIp1B2 <= realWorkingBuffer[372];
				 imgIp2B2 <= imagWorkingBuffer[374];
				 realIp2B2 <= realWorkingBuffer[374];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 372;
				 stateIp2B2<=#1 374;

				 //(373,375)
				 imgIp1B3 <= imagWorkingBuffer[373];
				 realIp1B3 <= realWorkingBuffer[373];
				 imgIp2B3 <= imagWorkingBuffer[375];
				 realIp2B3 <= realWorkingBuffer[375];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 373;
				 stateIp2B3<=#1 375;

				 //(376,378)
				 imgIp1B4 <= imagWorkingBuffer[376];
				 realIp1B4 <= realWorkingBuffer[376];
				 imgIp2B4 <= imagWorkingBuffer[378];
				 realIp2B4 <= realWorkingBuffer[378];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 376;
				 stateIp2B4<=#1 378;

				 //(377,379)
				 imgIp1B5 <= imagWorkingBuffer[377];
				 realIp1B5 <= realWorkingBuffer[377];
				 imgIp2B5 <= imagWorkingBuffer[379];
				 realIp2B5 <= realWorkingBuffer[379];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 377;
				 stateIp2B5<=#1 379;

				 //(380,382)
				 imgIp1B6 <= imagWorkingBuffer[380];
				 realIp1B6 <= realWorkingBuffer[380];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 380;
				 stateIp2B6<=#1 382;

				 //(381,383)
				 imgIp1B7 <= imagWorkingBuffer[381];
				 realIp1B7 <= realWorkingBuffer[381];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 381;
				 stateIp2B7<=#1 383;
			 end
			 57 : begin

				 //(384,386)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[386];
				 realIp2B0 <= realWorkingBuffer[386];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 386;

				 //(385,387)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[387];
				 realIp2B1 <= realWorkingBuffer[387];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 385;
				 stateIp2B1<=#1 387;

				 //(388,390)
				 imgIp1B2 <= imagWorkingBuffer[388];
				 realIp1B2 <= realWorkingBuffer[388];
				 imgIp2B2 <= imagWorkingBuffer[390];
				 realIp2B2 <= realWorkingBuffer[390];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 388;
				 stateIp2B2<=#1 390;

				 //(389,391)
				 imgIp1B3 <= imagWorkingBuffer[389];
				 realIp1B3 <= realWorkingBuffer[389];
				 imgIp2B3 <= imagWorkingBuffer[391];
				 realIp2B3 <= realWorkingBuffer[391];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 389;
				 stateIp2B3<=#1 391;

				 //(392,394)
				 imgIp1B4 <= imagWorkingBuffer[392];
				 realIp1B4 <= realWorkingBuffer[392];
				 imgIp2B4 <= imagWorkingBuffer[394];
				 realIp2B4 <= realWorkingBuffer[394];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 392;
				 stateIp2B4<=#1 394;

				 //(393,395)
				 imgIp1B5 <= imagWorkingBuffer[393];
				 realIp1B5 <= realWorkingBuffer[393];
				 imgIp2B5 <= imagWorkingBuffer[395];
				 realIp2B5 <= realWorkingBuffer[395];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 393;
				 stateIp2B5<=#1 395;

				 //(396,398)
				 imgIp1B6 <= imagWorkingBuffer[396];
				 realIp1B6 <= realWorkingBuffer[396];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 396;
				 stateIp2B6<=#1 398;

				 //(397,399)
				 imgIp1B7 <= imagWorkingBuffer[397];
				 realIp1B7 <= realWorkingBuffer[397];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 397;
				 stateIp2B7<=#1 399;
			 end
			 58 : begin

				 //(400,402)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[402];
				 realIp2B0 <= realWorkingBuffer[402];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 400;
				 stateIp2B0<=#1 402;

				 //(401,403)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[403];
				 realIp2B1 <= realWorkingBuffer[403];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 401;
				 stateIp2B1<=#1 403;

				 //(404,406)
				 imgIp1B2 <= imagWorkingBuffer[404];
				 realIp1B2 <= realWorkingBuffer[404];
				 imgIp2B2 <= imagWorkingBuffer[406];
				 realIp2B2 <= realWorkingBuffer[406];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 404;
				 stateIp2B2<=#1 406;

				 //(405,407)
				 imgIp1B3 <= imagWorkingBuffer[405];
				 realIp1B3 <= realWorkingBuffer[405];
				 imgIp2B3 <= imagWorkingBuffer[407];
				 realIp2B3 <= realWorkingBuffer[407];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 405;
				 stateIp2B3<=#1 407;

				 //(408,410)
				 imgIp1B4 <= imagWorkingBuffer[408];
				 realIp1B4 <= realWorkingBuffer[408];
				 imgIp2B4 <= imagWorkingBuffer[410];
				 realIp2B4 <= realWorkingBuffer[410];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 408;
				 stateIp2B4<=#1 410;

				 //(409,411)
				 imgIp1B5 <= imagWorkingBuffer[409];
				 realIp1B5 <= realWorkingBuffer[409];
				 imgIp2B5 <= imagWorkingBuffer[411];
				 realIp2B5 <= realWorkingBuffer[411];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 409;
				 stateIp2B5<=#1 411;

				 //(412,414)
				 imgIp1B6 <= imagWorkingBuffer[412];
				 realIp1B6 <= realWorkingBuffer[412];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 412;
				 stateIp2B6<=#1 414;

				 //(413,415)
				 imgIp1B7 <= imagWorkingBuffer[413];
				 realIp1B7 <= realWorkingBuffer[413];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 413;
				 stateIp2B7<=#1 415;
			 end
			 59 : begin

				 //(416,418)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[418];
				 realIp2B0 <= realWorkingBuffer[418];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 416;
				 stateIp2B0<=#1 418;

				 //(417,419)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[419];
				 realIp2B1 <= realWorkingBuffer[419];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 417;
				 stateIp2B1<=#1 419;

				 //(420,422)
				 imgIp1B2 <= imagWorkingBuffer[420];
				 realIp1B2 <= realWorkingBuffer[420];
				 imgIp2B2 <= imagWorkingBuffer[422];
				 realIp2B2 <= realWorkingBuffer[422];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 420;
				 stateIp2B2<=#1 422;

				 //(421,423)
				 imgIp1B3 <= imagWorkingBuffer[421];
				 realIp1B3 <= realWorkingBuffer[421];
				 imgIp2B3 <= imagWorkingBuffer[423];
				 realIp2B3 <= realWorkingBuffer[423];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 421;
				 stateIp2B3<=#1 423;

				 //(424,426)
				 imgIp1B4 <= imagWorkingBuffer[424];
				 realIp1B4 <= realWorkingBuffer[424];
				 imgIp2B4 <= imagWorkingBuffer[426];
				 realIp2B4 <= realWorkingBuffer[426];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 424;
				 stateIp2B4<=#1 426;

				 //(425,427)
				 imgIp1B5 <= imagWorkingBuffer[425];
				 realIp1B5 <= realWorkingBuffer[425];
				 imgIp2B5 <= imagWorkingBuffer[427];
				 realIp2B5 <= realWorkingBuffer[427];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 425;
				 stateIp2B5<=#1 427;

				 //(428,430)
				 imgIp1B6 <= imagWorkingBuffer[428];
				 realIp1B6 <= realWorkingBuffer[428];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 428;
				 stateIp2B6<=#1 430;

				 //(429,431)
				 imgIp1B7 <= imagWorkingBuffer[429];
				 realIp1B7 <= realWorkingBuffer[429];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 429;
				 stateIp2B7<=#1 431;
			 end
			 60 : begin

				 //(432,434)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[434];
				 realIp2B0 <= realWorkingBuffer[434];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 432;
				 stateIp2B0<=#1 434;

				 //(433,435)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[435];
				 realIp2B1 <= realWorkingBuffer[435];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 433;
				 stateIp2B1<=#1 435;

				 //(436,438)
				 imgIp1B2 <= imagWorkingBuffer[436];
				 realIp1B2 <= realWorkingBuffer[436];
				 imgIp2B2 <= imagWorkingBuffer[438];
				 realIp2B2 <= realWorkingBuffer[438];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 436;
				 stateIp2B2<=#1 438;

				 //(437,439)
				 imgIp1B3 <= imagWorkingBuffer[437];
				 realIp1B3 <= realWorkingBuffer[437];
				 imgIp2B3 <= imagWorkingBuffer[439];
				 realIp2B3 <= realWorkingBuffer[439];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 437;
				 stateIp2B3<=#1 439;

				 //(440,442)
				 imgIp1B4 <= imagWorkingBuffer[440];
				 realIp1B4 <= realWorkingBuffer[440];
				 imgIp2B4 <= imagWorkingBuffer[442];
				 realIp2B4 <= realWorkingBuffer[442];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 440;
				 stateIp2B4<=#1 442;

				 //(441,443)
				 imgIp1B5 <= imagWorkingBuffer[441];
				 realIp1B5 <= realWorkingBuffer[441];
				 imgIp2B5 <= imagWorkingBuffer[443];
				 realIp2B5 <= realWorkingBuffer[443];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 441;
				 stateIp2B5<=#1 443;

				 //(444,446)
				 imgIp1B6 <= imagWorkingBuffer[444];
				 realIp1B6 <= realWorkingBuffer[444];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 444;
				 stateIp2B6<=#1 446;

				 //(445,447)
				 imgIp1B7 <= imagWorkingBuffer[445];
				 realIp1B7 <= realWorkingBuffer[445];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 445;
				 stateIp2B7<=#1 447;
			 end
			 61 : begin

				 //(448,450)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[450];
				 realIp2B0 <= realWorkingBuffer[450];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 448;
				 stateIp2B0<=#1 450;

				 //(449,451)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[451];
				 realIp2B1 <= realWorkingBuffer[451];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 449;
				 stateIp2B1<=#1 451;

				 //(452,454)
				 imgIp1B2 <= imagWorkingBuffer[452];
				 realIp1B2 <= realWorkingBuffer[452];
				 imgIp2B2 <= imagWorkingBuffer[454];
				 realIp2B2 <= realWorkingBuffer[454];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 452;
				 stateIp2B2<=#1 454;

				 //(453,455)
				 imgIp1B3 <= imagWorkingBuffer[453];
				 realIp1B3 <= realWorkingBuffer[453];
				 imgIp2B3 <= imagWorkingBuffer[455];
				 realIp2B3 <= realWorkingBuffer[455];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 453;
				 stateIp2B3<=#1 455;

				 //(456,458)
				 imgIp1B4 <= imagWorkingBuffer[456];
				 realIp1B4 <= realWorkingBuffer[456];
				 imgIp2B4 <= imagWorkingBuffer[458];
				 realIp2B4 <= realWorkingBuffer[458];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 456;
				 stateIp2B4<=#1 458;

				 //(457,459)
				 imgIp1B5 <= imagWorkingBuffer[457];
				 realIp1B5 <= realWorkingBuffer[457];
				 imgIp2B5 <= imagWorkingBuffer[459];
				 realIp2B5 <= realWorkingBuffer[459];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 457;
				 stateIp2B5<=#1 459;

				 //(460,462)
				 imgIp1B6 <= imagWorkingBuffer[460];
				 realIp1B6 <= realWorkingBuffer[460];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 460;
				 stateIp2B6<=#1 462;

				 //(461,463)
				 imgIp1B7 <= imagWorkingBuffer[461];
				 realIp1B7 <= realWorkingBuffer[461];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 461;
				 stateIp2B7<=#1 463;
			 end
			 62 : begin

				 //(464,466)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[466];
				 realIp2B0 <= realWorkingBuffer[466];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 464;
				 stateIp2B0<=#1 466;

				 //(465,467)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[467];
				 realIp2B1 <= realWorkingBuffer[467];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 465;
				 stateIp2B1<=#1 467;

				 //(468,470)
				 imgIp1B2 <= imagWorkingBuffer[468];
				 realIp1B2 <= realWorkingBuffer[468];
				 imgIp2B2 <= imagWorkingBuffer[470];
				 realIp2B2 <= realWorkingBuffer[470];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 468;
				 stateIp2B2<=#1 470;

				 //(469,471)
				 imgIp1B3 <= imagWorkingBuffer[469];
				 realIp1B3 <= realWorkingBuffer[469];
				 imgIp2B3 <= imagWorkingBuffer[471];
				 realIp2B3 <= realWorkingBuffer[471];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 469;
				 stateIp2B3<=#1 471;

				 //(472,474)
				 imgIp1B4 <= imagWorkingBuffer[472];
				 realIp1B4 <= realWorkingBuffer[472];
				 imgIp2B4 <= imagWorkingBuffer[474];
				 realIp2B4 <= realWorkingBuffer[474];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 472;
				 stateIp2B4<=#1 474;

				 //(473,475)
				 imgIp1B5 <= imagWorkingBuffer[473];
				 realIp1B5 <= realWorkingBuffer[473];
				 imgIp2B5 <= imagWorkingBuffer[475];
				 realIp2B5 <= realWorkingBuffer[475];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 473;
				 stateIp2B5<=#1 475;

				 //(476,478)
				 imgIp1B6 <= imagWorkingBuffer[476];
				 realIp1B6 <= realWorkingBuffer[476];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 476;
				 stateIp2B6<=#1 478;

				 //(477,479)
				 imgIp1B7 <= imagWorkingBuffer[477];
				 realIp1B7 <= realWorkingBuffer[477];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 477;
				 stateIp2B7<=#1 479;
			 end
			 63 : begin

				 //(480,482)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[482];
				 realIp2B0 <= realWorkingBuffer[482];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 480;
				 stateIp2B0<=#1 482;

				 //(481,483)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[483];
				 realIp2B1 <= realWorkingBuffer[483];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 481;
				 stateIp2B1<=#1 483;

				 //(484,486)
				 imgIp1B2 <= imagWorkingBuffer[484];
				 realIp1B2 <= realWorkingBuffer[484];
				 imgIp2B2 <= imagWorkingBuffer[486];
				 realIp2B2 <= realWorkingBuffer[486];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 484;
				 stateIp2B2<=#1 486;

				 //(485,487)
				 imgIp1B3 <= imagWorkingBuffer[485];
				 realIp1B3 <= realWorkingBuffer[485];
				 imgIp2B3 <= imagWorkingBuffer[487];
				 realIp2B3 <= realWorkingBuffer[487];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 485;
				 stateIp2B3<=#1 487;

				 //(488,490)
				 imgIp1B4 <= imagWorkingBuffer[488];
				 realIp1B4 <= realWorkingBuffer[488];
				 imgIp2B4 <= imagWorkingBuffer[490];
				 realIp2B4 <= realWorkingBuffer[490];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 488;
				 stateIp2B4<=#1 490;

				 //(489,491)
				 imgIp1B5 <= imagWorkingBuffer[489];
				 realIp1B5 <= realWorkingBuffer[489];
				 imgIp2B5 <= imagWorkingBuffer[491];
				 realIp2B5 <= realWorkingBuffer[491];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 489;
				 stateIp2B5<=#1 491;

				 //(492,494)
				 imgIp1B6 <= imagWorkingBuffer[492];
				 realIp1B6 <= realWorkingBuffer[492];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 492;
				 stateIp2B6<=#1 494;

				 //(493,495)
				 imgIp1B7 <= imagWorkingBuffer[493];
				 realIp1B7 <= realWorkingBuffer[493];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 493;
				 stateIp2B7<=#1 495;
			 end
			 64 : begin

				 //(496,498)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[498];
				 realIp2B0 <= realWorkingBuffer[498];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 496;
				 stateIp2B0<=#1 498;

				 //(497,499)
				 imgIp1B1 <= imagWorkingBuffer[497];
				 realIp1B1 <= realWorkingBuffer[497];
				 imgIp2B1 <= imagWorkingBuffer[499];
				 realIp2B1 <= realWorkingBuffer[499];
				 twiddleFactorRealB1 <=#1 0.0;
				 twiddleFactorimgB1 <=#1 -1.0;
				 stateIp1B1<=#1 497;
				 stateIp2B1<=#1 499;

				 //(500,502)
				 imgIp1B2 <= imagWorkingBuffer[500];
				 realIp1B2 <= realWorkingBuffer[500];
				 imgIp2B2 <= imagWorkingBuffer[502];
				 realIp2B2 <= realWorkingBuffer[502];
				 twiddleFactorRealB2 <=#1 1.0;
				 twiddleFactorimgB2 <=#1 0.0;
				 stateIp1B2<=#1 500;
				 stateIp2B2<=#1 502;

				 //(501,503)
				 imgIp1B3 <= imagWorkingBuffer[501];
				 realIp1B3 <= realWorkingBuffer[501];
				 imgIp2B3 <= imagWorkingBuffer[503];
				 realIp2B3 <= realWorkingBuffer[503];
				 twiddleFactorRealB3 <=#1 0.0;
				 twiddleFactorimgB3 <=#1 -1.0;
				 stateIp1B3<=#1 501;
				 stateIp2B3<=#1 503;

				 //(504,506)
				 imgIp1B4 <= imagWorkingBuffer[504];
				 realIp1B4 <= realWorkingBuffer[504];
				 imgIp2B4 <= imagWorkingBuffer[506];
				 realIp2B4 <= realWorkingBuffer[506];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 504;
				 stateIp2B4<=#1 506;

				 //(505,507)
				 imgIp1B5 <= imagWorkingBuffer[505];
				 realIp1B5 <= realWorkingBuffer[505];
				 imgIp2B5 <= imagWorkingBuffer[507];
				 realIp2B5 <= realWorkingBuffer[507];
				 twiddleFactorRealB5 <=#1 0.0;
				 twiddleFactorimgB5 <=#1 -1.0;
				 stateIp1B5<=#1 505;
				 stateIp2B5<=#1 507;

				 //(508,510)
				 imgIp1B6 <= imagWorkingBuffer[508];
				 realIp1B6 <= realWorkingBuffer[508];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 1.0;
				 twiddleFactorimgB6 <=#1 0.0;
				 stateIp1B6<=#1 508;
				 stateIp2B6<=#1 510;

				 //(509,511)
				 imgIp1B7 <= imagWorkingBuffer[509];
				 realIp1B7 <= realWorkingBuffer[509];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 0.0;
				 twiddleFactorimgB7 <=#1 -1.0;
				 stateIp1B7<=#1 509;
				 stateIp2B7<=#1 511;
			 end
			 65 : begin

				 //(0,4)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[4];
				 realIp2B0 <= realWorkingBuffer[4];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 4;

				 //(1,5)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[5];
				 realIp2B1 <= realWorkingBuffer[5];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 5;

				 //(2,6)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[6];
				 realIp2B2 <= realWorkingBuffer[6];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 6;

				 //(3,7)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[7];
				 realIp2B3 <= realWorkingBuffer[7];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 7;

				 //(8,12)
				 imgIp1B4 <= imagWorkingBuffer[8];
				 realIp1B4 <= realWorkingBuffer[8];
				 imgIp2B4 <= imagWorkingBuffer[12];
				 realIp2B4 <= realWorkingBuffer[12];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 8;
				 stateIp2B4<=#1 12;

				 //(9,13)
				 imgIp1B5 <= imagWorkingBuffer[9];
				 realIp1B5 <= realWorkingBuffer[9];
				 imgIp2B5 <= imagWorkingBuffer[13];
				 realIp2B5 <= realWorkingBuffer[13];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 9;
				 stateIp2B5<=#1 13;

				 //(10,14)
				 imgIp1B6 <= imagWorkingBuffer[10];
				 realIp1B6 <= realWorkingBuffer[10];
				 imgIp2B6 <= imagWorkingBuffer[14];
				 realIp2B6 <= realWorkingBuffer[14];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 10;
				 stateIp2B6<=#1 14;

				 //(11,15)
				 imgIp1B7 <= imagWorkingBuffer[11];
				 realIp1B7 <= realWorkingBuffer[11];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 11;
				 stateIp2B7<=#1 15;
			 end
			 66 : begin

				 //(16,20)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[20];
				 realIp2B0 <= realWorkingBuffer[20];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 20;

				 //(17,21)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[21];
				 realIp2B1 <= realWorkingBuffer[21];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 21;

				 //(18,22)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[22];
				 realIp2B2 <= realWorkingBuffer[22];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 18;
				 stateIp2B2<=#1 22;

				 //(19,23)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[23];
				 realIp2B3 <= realWorkingBuffer[23];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 19;
				 stateIp2B3<=#1 23;

				 //(24,28)
				 imgIp1B4 <= imagWorkingBuffer[24];
				 realIp1B4 <= realWorkingBuffer[24];
				 imgIp2B4 <= imagWorkingBuffer[28];
				 realIp2B4 <= realWorkingBuffer[28];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 24;
				 stateIp2B4<=#1 28;

				 //(25,29)
				 imgIp1B5 <= imagWorkingBuffer[25];
				 realIp1B5 <= realWorkingBuffer[25];
				 imgIp2B5 <= imagWorkingBuffer[29];
				 realIp2B5 <= realWorkingBuffer[29];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 25;
				 stateIp2B5<=#1 29;

				 //(26,30)
				 imgIp1B6 <= imagWorkingBuffer[26];
				 realIp1B6 <= realWorkingBuffer[26];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 26;
				 stateIp2B6<=#1 30;

				 //(27,31)
				 imgIp1B7 <= imagWorkingBuffer[27];
				 realIp1B7 <= realWorkingBuffer[27];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 27;
				 stateIp2B7<=#1 31;
			 end
			 67 : begin

				 //(32,36)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[36];
				 realIp2B0 <= realWorkingBuffer[36];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 36;

				 //(33,37)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[37];
				 realIp2B1 <= realWorkingBuffer[37];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 37;

				 //(34,38)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[38];
				 realIp2B2 <= realWorkingBuffer[38];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 34;
				 stateIp2B2<=#1 38;

				 //(35,39)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[39];
				 realIp2B3 <= realWorkingBuffer[39];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 35;
				 stateIp2B3<=#1 39;

				 //(40,44)
				 imgIp1B4 <= imagWorkingBuffer[40];
				 realIp1B4 <= realWorkingBuffer[40];
				 imgIp2B4 <= imagWorkingBuffer[44];
				 realIp2B4 <= realWorkingBuffer[44];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 40;
				 stateIp2B4<=#1 44;

				 //(41,45)
				 imgIp1B5 <= imagWorkingBuffer[41];
				 realIp1B5 <= realWorkingBuffer[41];
				 imgIp2B5 <= imagWorkingBuffer[45];
				 realIp2B5 <= realWorkingBuffer[45];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 41;
				 stateIp2B5<=#1 45;

				 //(42,46)
				 imgIp1B6 <= imagWorkingBuffer[42];
				 realIp1B6 <= realWorkingBuffer[42];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 42;
				 stateIp2B6<=#1 46;

				 //(43,47)
				 imgIp1B7 <= imagWorkingBuffer[43];
				 realIp1B7 <= realWorkingBuffer[43];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 43;
				 stateIp2B7<=#1 47;
			 end
			 68 : begin

				 //(48,52)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[52];
				 realIp2B0 <= realWorkingBuffer[52];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 52;

				 //(49,53)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[53];
				 realIp2B1 <= realWorkingBuffer[53];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 49;
				 stateIp2B1<=#1 53;

				 //(50,54)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[54];
				 realIp2B2 <= realWorkingBuffer[54];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 50;
				 stateIp2B2<=#1 54;

				 //(51,55)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[55];
				 realIp2B3 <= realWorkingBuffer[55];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 51;
				 stateIp2B3<=#1 55;

				 //(56,60)
				 imgIp1B4 <= imagWorkingBuffer[56];
				 realIp1B4 <= realWorkingBuffer[56];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 56;
				 stateIp2B4<=#1 60;

				 //(57,61)
				 imgIp1B5 <= imagWorkingBuffer[57];
				 realIp1B5 <= realWorkingBuffer[57];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 57;
				 stateIp2B5<=#1 61;

				 //(58,62)
				 imgIp1B6 <= imagWorkingBuffer[58];
				 realIp1B6 <= realWorkingBuffer[58];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 58;
				 stateIp2B6<=#1 62;

				 //(59,63)
				 imgIp1B7 <= imagWorkingBuffer[59];
				 realIp1B7 <= realWorkingBuffer[59];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 59;
				 stateIp2B7<=#1 63;
			 end
			 69 : begin

				 //(64,68)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[68];
				 realIp2B0 <= realWorkingBuffer[68];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 68;

				 //(65,69)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[69];
				 realIp2B1 <= realWorkingBuffer[69];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 69;

				 //(66,70)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[70];
				 realIp2B2 <= realWorkingBuffer[70];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 66;
				 stateIp2B2<=#1 70;

				 //(67,71)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[71];
				 realIp2B3 <= realWorkingBuffer[71];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 67;
				 stateIp2B3<=#1 71;

				 //(72,76)
				 imgIp1B4 <= imagWorkingBuffer[72];
				 realIp1B4 <= realWorkingBuffer[72];
				 imgIp2B4 <= imagWorkingBuffer[76];
				 realIp2B4 <= realWorkingBuffer[76];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 72;
				 stateIp2B4<=#1 76;

				 //(73,77)
				 imgIp1B5 <= imagWorkingBuffer[73];
				 realIp1B5 <= realWorkingBuffer[73];
				 imgIp2B5 <= imagWorkingBuffer[77];
				 realIp2B5 <= realWorkingBuffer[77];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 73;
				 stateIp2B5<=#1 77;

				 //(74,78)
				 imgIp1B6 <= imagWorkingBuffer[74];
				 realIp1B6 <= realWorkingBuffer[74];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 74;
				 stateIp2B6<=#1 78;

				 //(75,79)
				 imgIp1B7 <= imagWorkingBuffer[75];
				 realIp1B7 <= realWorkingBuffer[75];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 75;
				 stateIp2B7<=#1 79;
			 end
			 70 : begin

				 //(80,84)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[84];
				 realIp2B0 <= realWorkingBuffer[84];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 84;

				 //(81,85)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[85];
				 realIp2B1 <= realWorkingBuffer[85];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 81;
				 stateIp2B1<=#1 85;

				 //(82,86)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[86];
				 realIp2B2 <= realWorkingBuffer[86];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 82;
				 stateIp2B2<=#1 86;

				 //(83,87)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[87];
				 realIp2B3 <= realWorkingBuffer[87];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 83;
				 stateIp2B3<=#1 87;

				 //(88,92)
				 imgIp1B4 <= imagWorkingBuffer[88];
				 realIp1B4 <= realWorkingBuffer[88];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 88;
				 stateIp2B4<=#1 92;

				 //(89,93)
				 imgIp1B5 <= imagWorkingBuffer[89];
				 realIp1B5 <= realWorkingBuffer[89];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 89;
				 stateIp2B5<=#1 93;

				 //(90,94)
				 imgIp1B6 <= imagWorkingBuffer[90];
				 realIp1B6 <= realWorkingBuffer[90];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 90;
				 stateIp2B6<=#1 94;

				 //(91,95)
				 imgIp1B7 <= imagWorkingBuffer[91];
				 realIp1B7 <= realWorkingBuffer[91];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 91;
				 stateIp2B7<=#1 95;
			 end
			 71 : begin

				 //(96,100)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[100];
				 realIp2B0 <= realWorkingBuffer[100];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 100;

				 //(97,101)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[101];
				 realIp2B1 <= realWorkingBuffer[101];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 97;
				 stateIp2B1<=#1 101;

				 //(98,102)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[102];
				 realIp2B2 <= realWorkingBuffer[102];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 98;
				 stateIp2B2<=#1 102;

				 //(99,103)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[103];
				 realIp2B3 <= realWorkingBuffer[103];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 99;
				 stateIp2B3<=#1 103;

				 //(104,108)
				 imgIp1B4 <= imagWorkingBuffer[104];
				 realIp1B4 <= realWorkingBuffer[104];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 104;
				 stateIp2B4<=#1 108;

				 //(105,109)
				 imgIp1B5 <= imagWorkingBuffer[105];
				 realIp1B5 <= realWorkingBuffer[105];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 105;
				 stateIp2B5<=#1 109;

				 //(106,110)
				 imgIp1B6 <= imagWorkingBuffer[106];
				 realIp1B6 <= realWorkingBuffer[106];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 106;
				 stateIp2B6<=#1 110;

				 //(107,111)
				 imgIp1B7 <= imagWorkingBuffer[107];
				 realIp1B7 <= realWorkingBuffer[107];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 107;
				 stateIp2B7<=#1 111;
			 end
			 72 : begin

				 //(112,116)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[116];
				 realIp2B0 <= realWorkingBuffer[116];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 112;
				 stateIp2B0<=#1 116;

				 //(113,117)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[117];
				 realIp2B1 <= realWorkingBuffer[117];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 113;
				 stateIp2B1<=#1 117;

				 //(114,118)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[118];
				 realIp2B2 <= realWorkingBuffer[118];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 114;
				 stateIp2B2<=#1 118;

				 //(115,119)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[119];
				 realIp2B3 <= realWorkingBuffer[119];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 115;
				 stateIp2B3<=#1 119;

				 //(120,124)
				 imgIp1B4 <= imagWorkingBuffer[120];
				 realIp1B4 <= realWorkingBuffer[120];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 120;
				 stateIp2B4<=#1 124;

				 //(121,125)
				 imgIp1B5 <= imagWorkingBuffer[121];
				 realIp1B5 <= realWorkingBuffer[121];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 121;
				 stateIp2B5<=#1 125;

				 //(122,126)
				 imgIp1B6 <= imagWorkingBuffer[122];
				 realIp1B6 <= realWorkingBuffer[122];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 122;
				 stateIp2B6<=#1 126;

				 //(123,127)
				 imgIp1B7 <= imagWorkingBuffer[123];
				 realIp1B7 <= realWorkingBuffer[123];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 123;
				 stateIp2B7<=#1 127;
			 end
			 73 : begin

				 //(128,132)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[132];
				 realIp2B0 <= realWorkingBuffer[132];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 132;

				 //(129,133)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[133];
				 realIp2B1 <= realWorkingBuffer[133];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 133;

				 //(130,134)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[134];
				 realIp2B2 <= realWorkingBuffer[134];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 130;
				 stateIp2B2<=#1 134;

				 //(131,135)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[135];
				 realIp2B3 <= realWorkingBuffer[135];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 131;
				 stateIp2B3<=#1 135;

				 //(136,140)
				 imgIp1B4 <= imagWorkingBuffer[136];
				 realIp1B4 <= realWorkingBuffer[136];
				 imgIp2B4 <= imagWorkingBuffer[140];
				 realIp2B4 <= realWorkingBuffer[140];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 136;
				 stateIp2B4<=#1 140;

				 //(137,141)
				 imgIp1B5 <= imagWorkingBuffer[137];
				 realIp1B5 <= realWorkingBuffer[137];
				 imgIp2B5 <= imagWorkingBuffer[141];
				 realIp2B5 <= realWorkingBuffer[141];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 137;
				 stateIp2B5<=#1 141;

				 //(138,142)
				 imgIp1B6 <= imagWorkingBuffer[138];
				 realIp1B6 <= realWorkingBuffer[138];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 138;
				 stateIp2B6<=#1 142;

				 //(139,143)
				 imgIp1B7 <= imagWorkingBuffer[139];
				 realIp1B7 <= realWorkingBuffer[139];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 139;
				 stateIp2B7<=#1 143;
			 end
			 74 : begin

				 //(144,148)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[148];
				 realIp2B0 <= realWorkingBuffer[148];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 148;

				 //(145,149)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[149];
				 realIp2B1 <= realWorkingBuffer[149];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 145;
				 stateIp2B1<=#1 149;

				 //(146,150)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[150];
				 realIp2B2 <= realWorkingBuffer[150];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 146;
				 stateIp2B2<=#1 150;

				 //(147,151)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[151];
				 realIp2B3 <= realWorkingBuffer[151];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 147;
				 stateIp2B3<=#1 151;

				 //(152,156)
				 imgIp1B4 <= imagWorkingBuffer[152];
				 realIp1B4 <= realWorkingBuffer[152];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 152;
				 stateIp2B4<=#1 156;

				 //(153,157)
				 imgIp1B5 <= imagWorkingBuffer[153];
				 realIp1B5 <= realWorkingBuffer[153];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 153;
				 stateIp2B5<=#1 157;

				 //(154,158)
				 imgIp1B6 <= imagWorkingBuffer[154];
				 realIp1B6 <= realWorkingBuffer[154];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 154;
				 stateIp2B6<=#1 158;

				 //(155,159)
				 imgIp1B7 <= imagWorkingBuffer[155];
				 realIp1B7 <= realWorkingBuffer[155];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 155;
				 stateIp2B7<=#1 159;
			 end
			 75 : begin

				 //(160,164)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[164];
				 realIp2B0 <= realWorkingBuffer[164];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 164;

				 //(161,165)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[165];
				 realIp2B1 <= realWorkingBuffer[165];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 161;
				 stateIp2B1<=#1 165;

				 //(162,166)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[166];
				 realIp2B2 <= realWorkingBuffer[166];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 162;
				 stateIp2B2<=#1 166;

				 //(163,167)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[167];
				 realIp2B3 <= realWorkingBuffer[167];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 163;
				 stateIp2B3<=#1 167;

				 //(168,172)
				 imgIp1B4 <= imagWorkingBuffer[168];
				 realIp1B4 <= realWorkingBuffer[168];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 168;
				 stateIp2B4<=#1 172;

				 //(169,173)
				 imgIp1B5 <= imagWorkingBuffer[169];
				 realIp1B5 <= realWorkingBuffer[169];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 169;
				 stateIp2B5<=#1 173;

				 //(170,174)
				 imgIp1B6 <= imagWorkingBuffer[170];
				 realIp1B6 <= realWorkingBuffer[170];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 170;
				 stateIp2B6<=#1 174;

				 //(171,175)
				 imgIp1B7 <= imagWorkingBuffer[171];
				 realIp1B7 <= realWorkingBuffer[171];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 171;
				 stateIp2B7<=#1 175;
			 end
			 76 : begin

				 //(176,180)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[180];
				 realIp2B0 <= realWorkingBuffer[180];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 176;
				 stateIp2B0<=#1 180;

				 //(177,181)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[181];
				 realIp2B1 <= realWorkingBuffer[181];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 177;
				 stateIp2B1<=#1 181;

				 //(178,182)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[182];
				 realIp2B2 <= realWorkingBuffer[182];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 178;
				 stateIp2B2<=#1 182;

				 //(179,183)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[183];
				 realIp2B3 <= realWorkingBuffer[183];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 179;
				 stateIp2B3<=#1 183;

				 //(184,188)
				 imgIp1B4 <= imagWorkingBuffer[184];
				 realIp1B4 <= realWorkingBuffer[184];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 184;
				 stateIp2B4<=#1 188;

				 //(185,189)
				 imgIp1B5 <= imagWorkingBuffer[185];
				 realIp1B5 <= realWorkingBuffer[185];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 185;
				 stateIp2B5<=#1 189;

				 //(186,190)
				 imgIp1B6 <= imagWorkingBuffer[186];
				 realIp1B6 <= realWorkingBuffer[186];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 186;
				 stateIp2B6<=#1 190;

				 //(187,191)
				 imgIp1B7 <= imagWorkingBuffer[187];
				 realIp1B7 <= realWorkingBuffer[187];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 187;
				 stateIp2B7<=#1 191;
			 end
			 77 : begin

				 //(192,196)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[196];
				 realIp2B0 <= realWorkingBuffer[196];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 196;

				 //(193,197)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[197];
				 realIp2B1 <= realWorkingBuffer[197];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 193;
				 stateIp2B1<=#1 197;

				 //(194,198)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[198];
				 realIp2B2 <= realWorkingBuffer[198];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 194;
				 stateIp2B2<=#1 198;

				 //(195,199)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[199];
				 realIp2B3 <= realWorkingBuffer[199];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 195;
				 stateIp2B3<=#1 199;

				 //(200,204)
				 imgIp1B4 <= imagWorkingBuffer[200];
				 realIp1B4 <= realWorkingBuffer[200];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 200;
				 stateIp2B4<=#1 204;

				 //(201,205)
				 imgIp1B5 <= imagWorkingBuffer[201];
				 realIp1B5 <= realWorkingBuffer[201];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 201;
				 stateIp2B5<=#1 205;

				 //(202,206)
				 imgIp1B6 <= imagWorkingBuffer[202];
				 realIp1B6 <= realWorkingBuffer[202];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 202;
				 stateIp2B6<=#1 206;

				 //(203,207)
				 imgIp1B7 <= imagWorkingBuffer[203];
				 realIp1B7 <= realWorkingBuffer[203];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 203;
				 stateIp2B7<=#1 207;
			 end
			 78 : begin

				 //(208,212)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[212];
				 realIp2B0 <= realWorkingBuffer[212];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 208;
				 stateIp2B0<=#1 212;

				 //(209,213)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[213];
				 realIp2B1 <= realWorkingBuffer[213];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 209;
				 stateIp2B1<=#1 213;

				 //(210,214)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[214];
				 realIp2B2 <= realWorkingBuffer[214];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 210;
				 stateIp2B2<=#1 214;

				 //(211,215)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[215];
				 realIp2B3 <= realWorkingBuffer[215];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 211;
				 stateIp2B3<=#1 215;

				 //(216,220)
				 imgIp1B4 <= imagWorkingBuffer[216];
				 realIp1B4 <= realWorkingBuffer[216];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 216;
				 stateIp2B4<=#1 220;

				 //(217,221)
				 imgIp1B5 <= imagWorkingBuffer[217];
				 realIp1B5 <= realWorkingBuffer[217];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 217;
				 stateIp2B5<=#1 221;

				 //(218,222)
				 imgIp1B6 <= imagWorkingBuffer[218];
				 realIp1B6 <= realWorkingBuffer[218];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 218;
				 stateIp2B6<=#1 222;

				 //(219,223)
				 imgIp1B7 <= imagWorkingBuffer[219];
				 realIp1B7 <= realWorkingBuffer[219];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 219;
				 stateIp2B7<=#1 223;
			 end
			 79 : begin

				 //(224,228)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[228];
				 realIp2B0 <= realWorkingBuffer[228];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 224;
				 stateIp2B0<=#1 228;

				 //(225,229)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[229];
				 realIp2B1 <= realWorkingBuffer[229];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 225;
				 stateIp2B1<=#1 229;

				 //(226,230)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[230];
				 realIp2B2 <= realWorkingBuffer[230];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 226;
				 stateIp2B2<=#1 230;

				 //(227,231)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[231];
				 realIp2B3 <= realWorkingBuffer[231];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 227;
				 stateIp2B3<=#1 231;

				 //(232,236)
				 imgIp1B4 <= imagWorkingBuffer[232];
				 realIp1B4 <= realWorkingBuffer[232];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 232;
				 stateIp2B4<=#1 236;

				 //(233,237)
				 imgIp1B5 <= imagWorkingBuffer[233];
				 realIp1B5 <= realWorkingBuffer[233];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 233;
				 stateIp2B5<=#1 237;

				 //(234,238)
				 imgIp1B6 <= imagWorkingBuffer[234];
				 realIp1B6 <= realWorkingBuffer[234];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 234;
				 stateIp2B6<=#1 238;

				 //(235,239)
				 imgIp1B7 <= imagWorkingBuffer[235];
				 realIp1B7 <= realWorkingBuffer[235];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 235;
				 stateIp2B7<=#1 239;
			 end
			 80 : begin

				 //(240,244)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[244];
				 realIp2B0 <= realWorkingBuffer[244];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 240;
				 stateIp2B0<=#1 244;

				 //(241,245)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[245];
				 realIp2B1 <= realWorkingBuffer[245];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 241;
				 stateIp2B1<=#1 245;

				 //(242,246)
				 imgIp1B2 <= imagWorkingBuffer[242];
				 realIp1B2 <= realWorkingBuffer[242];
				 imgIp2B2 <= imagWorkingBuffer[246];
				 realIp2B2 <= realWorkingBuffer[246];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 242;
				 stateIp2B2<=#1 246;

				 //(243,247)
				 imgIp1B3 <= imagWorkingBuffer[243];
				 realIp1B3 <= realWorkingBuffer[243];
				 imgIp2B3 <= imagWorkingBuffer[247];
				 realIp2B3 <= realWorkingBuffer[247];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 243;
				 stateIp2B3<=#1 247;

				 //(248,252)
				 imgIp1B4 <= imagWorkingBuffer[248];
				 realIp1B4 <= realWorkingBuffer[248];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 248;
				 stateIp2B4<=#1 252;

				 //(249,253)
				 imgIp1B5 <= imagWorkingBuffer[249];
				 realIp1B5 <= realWorkingBuffer[249];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 249;
				 stateIp2B5<=#1 253;

				 //(250,254)
				 imgIp1B6 <= imagWorkingBuffer[250];
				 realIp1B6 <= realWorkingBuffer[250];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 250;
				 stateIp2B6<=#1 254;

				 //(251,255)
				 imgIp1B7 <= imagWorkingBuffer[251];
				 realIp1B7 <= realWorkingBuffer[251];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 251;
				 stateIp2B7<=#1 255;
			 end
			 81 : begin

				 //(256,260)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[260];
				 realIp2B0 <= realWorkingBuffer[260];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 260;

				 //(257,261)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[261];
				 realIp2B1 <= realWorkingBuffer[261];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 261;

				 //(258,262)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[262];
				 realIp2B2 <= realWorkingBuffer[262];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 258;
				 stateIp2B2<=#1 262;

				 //(259,263)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[263];
				 realIp2B3 <= realWorkingBuffer[263];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 259;
				 stateIp2B3<=#1 263;

				 //(264,268)
				 imgIp1B4 <= imagWorkingBuffer[264];
				 realIp1B4 <= realWorkingBuffer[264];
				 imgIp2B4 <= imagWorkingBuffer[268];
				 realIp2B4 <= realWorkingBuffer[268];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 264;
				 stateIp2B4<=#1 268;

				 //(265,269)
				 imgIp1B5 <= imagWorkingBuffer[265];
				 realIp1B5 <= realWorkingBuffer[265];
				 imgIp2B5 <= imagWorkingBuffer[269];
				 realIp2B5 <= realWorkingBuffer[269];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 265;
				 stateIp2B5<=#1 269;

				 //(266,270)
				 imgIp1B6 <= imagWorkingBuffer[266];
				 realIp1B6 <= realWorkingBuffer[266];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 266;
				 stateIp2B6<=#1 270;

				 //(267,271)
				 imgIp1B7 <= imagWorkingBuffer[267];
				 realIp1B7 <= realWorkingBuffer[267];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 267;
				 stateIp2B7<=#1 271;
			 end
			 82 : begin

				 //(272,276)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[276];
				 realIp2B0 <= realWorkingBuffer[276];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 276;

				 //(273,277)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[277];
				 realIp2B1 <= realWorkingBuffer[277];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 273;
				 stateIp2B1<=#1 277;

				 //(274,278)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[278];
				 realIp2B2 <= realWorkingBuffer[278];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 274;
				 stateIp2B2<=#1 278;

				 //(275,279)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[279];
				 realIp2B3 <= realWorkingBuffer[279];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 275;
				 stateIp2B3<=#1 279;

				 //(280,284)
				 imgIp1B4 <= imagWorkingBuffer[280];
				 realIp1B4 <= realWorkingBuffer[280];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 280;
				 stateIp2B4<=#1 284;

				 //(281,285)
				 imgIp1B5 <= imagWorkingBuffer[281];
				 realIp1B5 <= realWorkingBuffer[281];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 281;
				 stateIp2B5<=#1 285;

				 //(282,286)
				 imgIp1B6 <= imagWorkingBuffer[282];
				 realIp1B6 <= realWorkingBuffer[282];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 282;
				 stateIp2B6<=#1 286;

				 //(283,287)
				 imgIp1B7 <= imagWorkingBuffer[283];
				 realIp1B7 <= realWorkingBuffer[283];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 283;
				 stateIp2B7<=#1 287;
			 end
			 83 : begin

				 //(288,292)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[292];
				 realIp2B0 <= realWorkingBuffer[292];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 292;

				 //(289,293)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[293];
				 realIp2B1 <= realWorkingBuffer[293];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 289;
				 stateIp2B1<=#1 293;

				 //(290,294)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[294];
				 realIp2B2 <= realWorkingBuffer[294];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 290;
				 stateIp2B2<=#1 294;

				 //(291,295)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[295];
				 realIp2B3 <= realWorkingBuffer[295];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 291;
				 stateIp2B3<=#1 295;

				 //(296,300)
				 imgIp1B4 <= imagWorkingBuffer[296];
				 realIp1B4 <= realWorkingBuffer[296];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 296;
				 stateIp2B4<=#1 300;

				 //(297,301)
				 imgIp1B5 <= imagWorkingBuffer[297];
				 realIp1B5 <= realWorkingBuffer[297];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 297;
				 stateIp2B5<=#1 301;

				 //(298,302)
				 imgIp1B6 <= imagWorkingBuffer[298];
				 realIp1B6 <= realWorkingBuffer[298];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 298;
				 stateIp2B6<=#1 302;

				 //(299,303)
				 imgIp1B7 <= imagWorkingBuffer[299];
				 realIp1B7 <= realWorkingBuffer[299];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 299;
				 stateIp2B7<=#1 303;
			 end
			 84 : begin

				 //(304,308)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[308];
				 realIp2B0 <= realWorkingBuffer[308];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 304;
				 stateIp2B0<=#1 308;

				 //(305,309)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[309];
				 realIp2B1 <= realWorkingBuffer[309];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 305;
				 stateIp2B1<=#1 309;

				 //(306,310)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[310];
				 realIp2B2 <= realWorkingBuffer[310];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 306;
				 stateIp2B2<=#1 310;

				 //(307,311)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[311];
				 realIp2B3 <= realWorkingBuffer[311];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 307;
				 stateIp2B3<=#1 311;

				 //(312,316)
				 imgIp1B4 <= imagWorkingBuffer[312];
				 realIp1B4 <= realWorkingBuffer[312];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 312;
				 stateIp2B4<=#1 316;

				 //(313,317)
				 imgIp1B5 <= imagWorkingBuffer[313];
				 realIp1B5 <= realWorkingBuffer[313];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 313;
				 stateIp2B5<=#1 317;

				 //(314,318)
				 imgIp1B6 <= imagWorkingBuffer[314];
				 realIp1B6 <= realWorkingBuffer[314];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 314;
				 stateIp2B6<=#1 318;

				 //(315,319)
				 imgIp1B7 <= imagWorkingBuffer[315];
				 realIp1B7 <= realWorkingBuffer[315];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 315;
				 stateIp2B7<=#1 319;
			 end
			 85 : begin

				 //(320,324)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[324];
				 realIp2B0 <= realWorkingBuffer[324];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 324;

				 //(321,325)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[325];
				 realIp2B1 <= realWorkingBuffer[325];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 321;
				 stateIp2B1<=#1 325;

				 //(322,326)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[326];
				 realIp2B2 <= realWorkingBuffer[326];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 322;
				 stateIp2B2<=#1 326;

				 //(323,327)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[327];
				 realIp2B3 <= realWorkingBuffer[327];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 323;
				 stateIp2B3<=#1 327;

				 //(328,332)
				 imgIp1B4 <= imagWorkingBuffer[328];
				 realIp1B4 <= realWorkingBuffer[328];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 328;
				 stateIp2B4<=#1 332;

				 //(329,333)
				 imgIp1B5 <= imagWorkingBuffer[329];
				 realIp1B5 <= realWorkingBuffer[329];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 329;
				 stateIp2B5<=#1 333;

				 //(330,334)
				 imgIp1B6 <= imagWorkingBuffer[330];
				 realIp1B6 <= realWorkingBuffer[330];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 330;
				 stateIp2B6<=#1 334;

				 //(331,335)
				 imgIp1B7 <= imagWorkingBuffer[331];
				 realIp1B7 <= realWorkingBuffer[331];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 331;
				 stateIp2B7<=#1 335;
			 end
			 86 : begin

				 //(336,340)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[340];
				 realIp2B0 <= realWorkingBuffer[340];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 336;
				 stateIp2B0<=#1 340;

				 //(337,341)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[341];
				 realIp2B1 <= realWorkingBuffer[341];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 337;
				 stateIp2B1<=#1 341;

				 //(338,342)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[342];
				 realIp2B2 <= realWorkingBuffer[342];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 338;
				 stateIp2B2<=#1 342;

				 //(339,343)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[343];
				 realIp2B3 <= realWorkingBuffer[343];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 339;
				 stateIp2B3<=#1 343;

				 //(344,348)
				 imgIp1B4 <= imagWorkingBuffer[344];
				 realIp1B4 <= realWorkingBuffer[344];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 344;
				 stateIp2B4<=#1 348;

				 //(345,349)
				 imgIp1B5 <= imagWorkingBuffer[345];
				 realIp1B5 <= realWorkingBuffer[345];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 345;
				 stateIp2B5<=#1 349;

				 //(346,350)
				 imgIp1B6 <= imagWorkingBuffer[346];
				 realIp1B6 <= realWorkingBuffer[346];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 346;
				 stateIp2B6<=#1 350;

				 //(347,351)
				 imgIp1B7 <= imagWorkingBuffer[347];
				 realIp1B7 <= realWorkingBuffer[347];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 347;
				 stateIp2B7<=#1 351;
			 end
			 87 : begin

				 //(352,356)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[356];
				 realIp2B0 <= realWorkingBuffer[356];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 352;
				 stateIp2B0<=#1 356;

				 //(353,357)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[357];
				 realIp2B1 <= realWorkingBuffer[357];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 353;
				 stateIp2B1<=#1 357;

				 //(354,358)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[358];
				 realIp2B2 <= realWorkingBuffer[358];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 354;
				 stateIp2B2<=#1 358;

				 //(355,359)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[359];
				 realIp2B3 <= realWorkingBuffer[359];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 355;
				 stateIp2B3<=#1 359;

				 //(360,364)
				 imgIp1B4 <= imagWorkingBuffer[360];
				 realIp1B4 <= realWorkingBuffer[360];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 360;
				 stateIp2B4<=#1 364;

				 //(361,365)
				 imgIp1B5 <= imagWorkingBuffer[361];
				 realIp1B5 <= realWorkingBuffer[361];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 361;
				 stateIp2B5<=#1 365;

				 //(362,366)
				 imgIp1B6 <= imagWorkingBuffer[362];
				 realIp1B6 <= realWorkingBuffer[362];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 362;
				 stateIp2B6<=#1 366;

				 //(363,367)
				 imgIp1B7 <= imagWorkingBuffer[363];
				 realIp1B7 <= realWorkingBuffer[363];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 363;
				 stateIp2B7<=#1 367;
			 end
			 88 : begin

				 //(368,372)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[372];
				 realIp2B0 <= realWorkingBuffer[372];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 368;
				 stateIp2B0<=#1 372;

				 //(369,373)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[373];
				 realIp2B1 <= realWorkingBuffer[373];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 369;
				 stateIp2B1<=#1 373;

				 //(370,374)
				 imgIp1B2 <= imagWorkingBuffer[370];
				 realIp1B2 <= realWorkingBuffer[370];
				 imgIp2B2 <= imagWorkingBuffer[374];
				 realIp2B2 <= realWorkingBuffer[374];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 370;
				 stateIp2B2<=#1 374;

				 //(371,375)
				 imgIp1B3 <= imagWorkingBuffer[371];
				 realIp1B3 <= realWorkingBuffer[371];
				 imgIp2B3 <= imagWorkingBuffer[375];
				 realIp2B3 <= realWorkingBuffer[375];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 371;
				 stateIp2B3<=#1 375;

				 //(376,380)
				 imgIp1B4 <= imagWorkingBuffer[376];
				 realIp1B4 <= realWorkingBuffer[376];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 376;
				 stateIp2B4<=#1 380;

				 //(377,381)
				 imgIp1B5 <= imagWorkingBuffer[377];
				 realIp1B5 <= realWorkingBuffer[377];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 377;
				 stateIp2B5<=#1 381;

				 //(378,382)
				 imgIp1B6 <= imagWorkingBuffer[378];
				 realIp1B6 <= realWorkingBuffer[378];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 378;
				 stateIp2B6<=#1 382;

				 //(379,383)
				 imgIp1B7 <= imagWorkingBuffer[379];
				 realIp1B7 <= realWorkingBuffer[379];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 379;
				 stateIp2B7<=#1 383;
			 end
			 89 : begin

				 //(384,388)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[388];
				 realIp2B0 <= realWorkingBuffer[388];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 388;

				 //(385,389)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[389];
				 realIp2B1 <= realWorkingBuffer[389];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 385;
				 stateIp2B1<=#1 389;

				 //(386,390)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[390];
				 realIp2B2 <= realWorkingBuffer[390];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 386;
				 stateIp2B2<=#1 390;

				 //(387,391)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[391];
				 realIp2B3 <= realWorkingBuffer[391];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 387;
				 stateIp2B3<=#1 391;

				 //(392,396)
				 imgIp1B4 <= imagWorkingBuffer[392];
				 realIp1B4 <= realWorkingBuffer[392];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 392;
				 stateIp2B4<=#1 396;

				 //(393,397)
				 imgIp1B5 <= imagWorkingBuffer[393];
				 realIp1B5 <= realWorkingBuffer[393];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 393;
				 stateIp2B5<=#1 397;

				 //(394,398)
				 imgIp1B6 <= imagWorkingBuffer[394];
				 realIp1B6 <= realWorkingBuffer[394];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 394;
				 stateIp2B6<=#1 398;

				 //(395,399)
				 imgIp1B7 <= imagWorkingBuffer[395];
				 realIp1B7 <= realWorkingBuffer[395];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 395;
				 stateIp2B7<=#1 399;
			 end
			 90 : begin

				 //(400,404)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[404];
				 realIp2B0 <= realWorkingBuffer[404];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 400;
				 stateIp2B0<=#1 404;

				 //(401,405)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[405];
				 realIp2B1 <= realWorkingBuffer[405];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 401;
				 stateIp2B1<=#1 405;

				 //(402,406)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[406];
				 realIp2B2 <= realWorkingBuffer[406];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 402;
				 stateIp2B2<=#1 406;

				 //(403,407)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[407];
				 realIp2B3 <= realWorkingBuffer[407];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 403;
				 stateIp2B3<=#1 407;

				 //(408,412)
				 imgIp1B4 <= imagWorkingBuffer[408];
				 realIp1B4 <= realWorkingBuffer[408];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 408;
				 stateIp2B4<=#1 412;

				 //(409,413)
				 imgIp1B5 <= imagWorkingBuffer[409];
				 realIp1B5 <= realWorkingBuffer[409];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 409;
				 stateIp2B5<=#1 413;

				 //(410,414)
				 imgIp1B6 <= imagWorkingBuffer[410];
				 realIp1B6 <= realWorkingBuffer[410];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 410;
				 stateIp2B6<=#1 414;

				 //(411,415)
				 imgIp1B7 <= imagWorkingBuffer[411];
				 realIp1B7 <= realWorkingBuffer[411];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 411;
				 stateIp2B7<=#1 415;
			 end
			 91 : begin

				 //(416,420)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[420];
				 realIp2B0 <= realWorkingBuffer[420];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 416;
				 stateIp2B0<=#1 420;

				 //(417,421)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[421];
				 realIp2B1 <= realWorkingBuffer[421];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 417;
				 stateIp2B1<=#1 421;

				 //(418,422)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[422];
				 realIp2B2 <= realWorkingBuffer[422];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 418;
				 stateIp2B2<=#1 422;

				 //(419,423)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[423];
				 realIp2B3 <= realWorkingBuffer[423];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 419;
				 stateIp2B3<=#1 423;

				 //(424,428)
				 imgIp1B4 <= imagWorkingBuffer[424];
				 realIp1B4 <= realWorkingBuffer[424];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 424;
				 stateIp2B4<=#1 428;

				 //(425,429)
				 imgIp1B5 <= imagWorkingBuffer[425];
				 realIp1B5 <= realWorkingBuffer[425];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 425;
				 stateIp2B5<=#1 429;

				 //(426,430)
				 imgIp1B6 <= imagWorkingBuffer[426];
				 realIp1B6 <= realWorkingBuffer[426];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 426;
				 stateIp2B6<=#1 430;

				 //(427,431)
				 imgIp1B7 <= imagWorkingBuffer[427];
				 realIp1B7 <= realWorkingBuffer[427];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 427;
				 stateIp2B7<=#1 431;
			 end
			 92 : begin

				 //(432,436)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[436];
				 realIp2B0 <= realWorkingBuffer[436];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 432;
				 stateIp2B0<=#1 436;

				 //(433,437)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[437];
				 realIp2B1 <= realWorkingBuffer[437];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 433;
				 stateIp2B1<=#1 437;

				 //(434,438)
				 imgIp1B2 <= imagWorkingBuffer[434];
				 realIp1B2 <= realWorkingBuffer[434];
				 imgIp2B2 <= imagWorkingBuffer[438];
				 realIp2B2 <= realWorkingBuffer[438];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 434;
				 stateIp2B2<=#1 438;

				 //(435,439)
				 imgIp1B3 <= imagWorkingBuffer[435];
				 realIp1B3 <= realWorkingBuffer[435];
				 imgIp2B3 <= imagWorkingBuffer[439];
				 realIp2B3 <= realWorkingBuffer[439];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 435;
				 stateIp2B3<=#1 439;

				 //(440,444)
				 imgIp1B4 <= imagWorkingBuffer[440];
				 realIp1B4 <= realWorkingBuffer[440];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 440;
				 stateIp2B4<=#1 444;

				 //(441,445)
				 imgIp1B5 <= imagWorkingBuffer[441];
				 realIp1B5 <= realWorkingBuffer[441];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 441;
				 stateIp2B5<=#1 445;

				 //(442,446)
				 imgIp1B6 <= imagWorkingBuffer[442];
				 realIp1B6 <= realWorkingBuffer[442];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 442;
				 stateIp2B6<=#1 446;

				 //(443,447)
				 imgIp1B7 <= imagWorkingBuffer[443];
				 realIp1B7 <= realWorkingBuffer[443];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 443;
				 stateIp2B7<=#1 447;
			 end
			 93 : begin

				 //(448,452)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[452];
				 realIp2B0 <= realWorkingBuffer[452];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 448;
				 stateIp2B0<=#1 452;

				 //(449,453)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[453];
				 realIp2B1 <= realWorkingBuffer[453];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 449;
				 stateIp2B1<=#1 453;

				 //(450,454)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[454];
				 realIp2B2 <= realWorkingBuffer[454];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 450;
				 stateIp2B2<=#1 454;

				 //(451,455)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[455];
				 realIp2B3 <= realWorkingBuffer[455];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 451;
				 stateIp2B3<=#1 455;

				 //(456,460)
				 imgIp1B4 <= imagWorkingBuffer[456];
				 realIp1B4 <= realWorkingBuffer[456];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 456;
				 stateIp2B4<=#1 460;

				 //(457,461)
				 imgIp1B5 <= imagWorkingBuffer[457];
				 realIp1B5 <= realWorkingBuffer[457];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 457;
				 stateIp2B5<=#1 461;

				 //(458,462)
				 imgIp1B6 <= imagWorkingBuffer[458];
				 realIp1B6 <= realWorkingBuffer[458];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 458;
				 stateIp2B6<=#1 462;

				 //(459,463)
				 imgIp1B7 <= imagWorkingBuffer[459];
				 realIp1B7 <= realWorkingBuffer[459];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 459;
				 stateIp2B7<=#1 463;
			 end
			 94 : begin

				 //(464,468)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[468];
				 realIp2B0 <= realWorkingBuffer[468];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 464;
				 stateIp2B0<=#1 468;

				 //(465,469)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[469];
				 realIp2B1 <= realWorkingBuffer[469];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 465;
				 stateIp2B1<=#1 469;

				 //(466,470)
				 imgIp1B2 <= imagWorkingBuffer[466];
				 realIp1B2 <= realWorkingBuffer[466];
				 imgIp2B2 <= imagWorkingBuffer[470];
				 realIp2B2 <= realWorkingBuffer[470];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 466;
				 stateIp2B2<=#1 470;

				 //(467,471)
				 imgIp1B3 <= imagWorkingBuffer[467];
				 realIp1B3 <= realWorkingBuffer[467];
				 imgIp2B3 <= imagWorkingBuffer[471];
				 realIp2B3 <= realWorkingBuffer[471];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 467;
				 stateIp2B3<=#1 471;

				 //(472,476)
				 imgIp1B4 <= imagWorkingBuffer[472];
				 realIp1B4 <= realWorkingBuffer[472];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 472;
				 stateIp2B4<=#1 476;

				 //(473,477)
				 imgIp1B5 <= imagWorkingBuffer[473];
				 realIp1B5 <= realWorkingBuffer[473];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 473;
				 stateIp2B5<=#1 477;

				 //(474,478)
				 imgIp1B6 <= imagWorkingBuffer[474];
				 realIp1B6 <= realWorkingBuffer[474];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 474;
				 stateIp2B6<=#1 478;

				 //(475,479)
				 imgIp1B7 <= imagWorkingBuffer[475];
				 realIp1B7 <= realWorkingBuffer[475];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 475;
				 stateIp2B7<=#1 479;
			 end
			 95 : begin

				 //(480,484)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[484];
				 realIp2B0 <= realWorkingBuffer[484];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 480;
				 stateIp2B0<=#1 484;

				 //(481,485)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[485];
				 realIp2B1 <= realWorkingBuffer[485];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 481;
				 stateIp2B1<=#1 485;

				 //(482,486)
				 imgIp1B2 <= imagWorkingBuffer[482];
				 realIp1B2 <= realWorkingBuffer[482];
				 imgIp2B2 <= imagWorkingBuffer[486];
				 realIp2B2 <= realWorkingBuffer[486];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 482;
				 stateIp2B2<=#1 486;

				 //(483,487)
				 imgIp1B3 <= imagWorkingBuffer[483];
				 realIp1B3 <= realWorkingBuffer[483];
				 imgIp2B3 <= imagWorkingBuffer[487];
				 realIp2B3 <= realWorkingBuffer[487];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 483;
				 stateIp2B3<=#1 487;

				 //(488,492)
				 imgIp1B4 <= imagWorkingBuffer[488];
				 realIp1B4 <= realWorkingBuffer[488];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 488;
				 stateIp2B4<=#1 492;

				 //(489,493)
				 imgIp1B5 <= imagWorkingBuffer[489];
				 realIp1B5 <= realWorkingBuffer[489];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 489;
				 stateIp2B5<=#1 493;

				 //(490,494)
				 imgIp1B6 <= imagWorkingBuffer[490];
				 realIp1B6 <= realWorkingBuffer[490];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 490;
				 stateIp2B6<=#1 494;

				 //(491,495)
				 imgIp1B7 <= imagWorkingBuffer[491];
				 realIp1B7 <= realWorkingBuffer[491];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 491;
				 stateIp2B7<=#1 495;
			 end
			 96 : begin

				 //(496,500)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[500];
				 realIp2B0 <= realWorkingBuffer[500];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 496;
				 stateIp2B0<=#1 500;

				 //(497,501)
				 imgIp1B1 <= imagWorkingBuffer[497];
				 realIp1B1 <= realWorkingBuffer[497];
				 imgIp2B1 <= imagWorkingBuffer[501];
				 realIp2B1 <= realWorkingBuffer[501];
				 twiddleFactorRealB1 <=#1 0.707107;
				 twiddleFactorimgB1 <=#1 -0.707107;
				 stateIp1B1<=#1 497;
				 stateIp2B1<=#1 501;

				 //(498,502)
				 imgIp1B2 <= imagWorkingBuffer[498];
				 realIp1B2 <= realWorkingBuffer[498];
				 imgIp2B2 <= imagWorkingBuffer[502];
				 realIp2B2 <= realWorkingBuffer[502];
				 twiddleFactorRealB2 <=#1 0.0;
				 twiddleFactorimgB2 <=#1 -1.0;
				 stateIp1B2<=#1 498;
				 stateIp2B2<=#1 502;

				 //(499,503)
				 imgIp1B3 <= imagWorkingBuffer[499];
				 realIp1B3 <= realWorkingBuffer[499];
				 imgIp2B3 <= imagWorkingBuffer[503];
				 realIp2B3 <= realWorkingBuffer[503];
				 twiddleFactorRealB3 <=#1 -0.707107;
				 twiddleFactorimgB3 <=#1 -0.707107;
				 stateIp1B3<=#1 499;
				 stateIp2B3<=#1 503;

				 //(504,508)
				 imgIp1B4 <= imagWorkingBuffer[504];
				 realIp1B4 <= realWorkingBuffer[504];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 1.0;
				 twiddleFactorimgB4 <=#1 0.0;
				 stateIp1B4<=#1 504;
				 stateIp2B4<=#1 508;

				 //(505,509)
				 imgIp1B5 <= imagWorkingBuffer[505];
				 realIp1B5 <= realWorkingBuffer[505];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 0.707107;
				 twiddleFactorimgB5 <=#1 -0.707107;
				 stateIp1B5<=#1 505;
				 stateIp2B5<=#1 509;

				 //(506,510)
				 imgIp1B6 <= imagWorkingBuffer[506];
				 realIp1B6 <= realWorkingBuffer[506];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 0.0;
				 twiddleFactorimgB6 <=#1 -1.0;
				 stateIp1B6<=#1 506;
				 stateIp2B6<=#1 510;

				 //(507,511)
				 imgIp1B7 <= imagWorkingBuffer[507];
				 realIp1B7 <= realWorkingBuffer[507];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.707107;
				 twiddleFactorimgB7 <=#1 -0.707107;
				 stateIp1B7<=#1 507;
				 stateIp2B7<=#1 511;
			 end
			 97 : begin

				 //(0,8)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[8];
				 realIp2B0 <= realWorkingBuffer[8];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 8;

				 //(1,9)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[9];
				 realIp2B1 <= realWorkingBuffer[9];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 9;

				 //(2,10)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[10];
				 realIp2B2 <= realWorkingBuffer[10];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 10;

				 //(3,11)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[11];
				 realIp2B3 <= realWorkingBuffer[11];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 11;

				 //(4,12)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[12];
				 realIp2B4 <= realWorkingBuffer[12];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 4;
				 stateIp2B4<=#1 12;

				 //(5,13)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[13];
				 realIp2B5 <= realWorkingBuffer[13];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 5;
				 stateIp2B5<=#1 13;

				 //(6,14)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[14];
				 realIp2B6 <= realWorkingBuffer[14];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 6;
				 stateIp2B6<=#1 14;

				 //(7,15)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[15];
				 realIp2B7 <= realWorkingBuffer[15];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 7;
				 stateIp2B7<=#1 15;
			 end
			 98 : begin

				 //(16,24)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[24];
				 realIp2B0 <= realWorkingBuffer[24];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 24;

				 //(17,25)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[25];
				 realIp2B1 <= realWorkingBuffer[25];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 25;

				 //(18,26)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[26];
				 realIp2B2 <= realWorkingBuffer[26];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 18;
				 stateIp2B2<=#1 26;

				 //(19,27)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[27];
				 realIp2B3 <= realWorkingBuffer[27];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 19;
				 stateIp2B3<=#1 27;

				 //(20,28)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[28];
				 realIp2B4 <= realWorkingBuffer[28];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 20;
				 stateIp2B4<=#1 28;

				 //(21,29)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[29];
				 realIp2B5 <= realWorkingBuffer[29];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 21;
				 stateIp2B5<=#1 29;

				 //(22,30)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 22;
				 stateIp2B6<=#1 30;

				 //(23,31)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 23;
				 stateIp2B7<=#1 31;
			 end
			 99 : begin

				 //(32,40)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[40];
				 realIp2B0 <= realWorkingBuffer[40];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 40;

				 //(33,41)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[41];
				 realIp2B1 <= realWorkingBuffer[41];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 41;

				 //(34,42)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[42];
				 realIp2B2 <= realWorkingBuffer[42];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 34;
				 stateIp2B2<=#1 42;

				 //(35,43)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[43];
				 realIp2B3 <= realWorkingBuffer[43];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 35;
				 stateIp2B3<=#1 43;

				 //(36,44)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[44];
				 realIp2B4 <= realWorkingBuffer[44];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 36;
				 stateIp2B4<=#1 44;

				 //(37,45)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[45];
				 realIp2B5 <= realWorkingBuffer[45];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 37;
				 stateIp2B5<=#1 45;

				 //(38,46)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 38;
				 stateIp2B6<=#1 46;

				 //(39,47)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 39;
				 stateIp2B7<=#1 47;
			 end
			 100 : begin

				 //(48,56)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[56];
				 realIp2B0 <= realWorkingBuffer[56];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 56;

				 //(49,57)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[57];
				 realIp2B1 <= realWorkingBuffer[57];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 49;
				 stateIp2B1<=#1 57;

				 //(50,58)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[58];
				 realIp2B2 <= realWorkingBuffer[58];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 50;
				 stateIp2B2<=#1 58;

				 //(51,59)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[59];
				 realIp2B3 <= realWorkingBuffer[59];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 51;
				 stateIp2B3<=#1 59;

				 //(52,60)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 52;
				 stateIp2B4<=#1 60;

				 //(53,61)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 53;
				 stateIp2B5<=#1 61;

				 //(54,62)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 54;
				 stateIp2B6<=#1 62;

				 //(55,63)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 55;
				 stateIp2B7<=#1 63;
			 end
			 101 : begin

				 //(64,72)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[72];
				 realIp2B0 <= realWorkingBuffer[72];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 72;

				 //(65,73)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[73];
				 realIp2B1 <= realWorkingBuffer[73];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 73;

				 //(66,74)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[74];
				 realIp2B2 <= realWorkingBuffer[74];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 66;
				 stateIp2B2<=#1 74;

				 //(67,75)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[75];
				 realIp2B3 <= realWorkingBuffer[75];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 67;
				 stateIp2B3<=#1 75;

				 //(68,76)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[76];
				 realIp2B4 <= realWorkingBuffer[76];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 68;
				 stateIp2B4<=#1 76;

				 //(69,77)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[77];
				 realIp2B5 <= realWorkingBuffer[77];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 69;
				 stateIp2B5<=#1 77;

				 //(70,78)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 70;
				 stateIp2B6<=#1 78;

				 //(71,79)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 71;
				 stateIp2B7<=#1 79;
			 end
			 102 : begin

				 //(80,88)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[88];
				 realIp2B0 <= realWorkingBuffer[88];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 88;

				 //(81,89)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[89];
				 realIp2B1 <= realWorkingBuffer[89];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 81;
				 stateIp2B1<=#1 89;

				 //(82,90)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[90];
				 realIp2B2 <= realWorkingBuffer[90];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 82;
				 stateIp2B2<=#1 90;

				 //(83,91)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[91];
				 realIp2B3 <= realWorkingBuffer[91];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 83;
				 stateIp2B3<=#1 91;

				 //(84,92)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 84;
				 stateIp2B4<=#1 92;

				 //(85,93)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 85;
				 stateIp2B5<=#1 93;

				 //(86,94)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 86;
				 stateIp2B6<=#1 94;

				 //(87,95)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 87;
				 stateIp2B7<=#1 95;
			 end
			 103 : begin

				 //(96,104)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[104];
				 realIp2B0 <= realWorkingBuffer[104];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 104;

				 //(97,105)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[105];
				 realIp2B1 <= realWorkingBuffer[105];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 97;
				 stateIp2B1<=#1 105;

				 //(98,106)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[106];
				 realIp2B2 <= realWorkingBuffer[106];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 98;
				 stateIp2B2<=#1 106;

				 //(99,107)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[107];
				 realIp2B3 <= realWorkingBuffer[107];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 99;
				 stateIp2B3<=#1 107;

				 //(100,108)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 100;
				 stateIp2B4<=#1 108;

				 //(101,109)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 101;
				 stateIp2B5<=#1 109;

				 //(102,110)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 102;
				 stateIp2B6<=#1 110;

				 //(103,111)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 103;
				 stateIp2B7<=#1 111;
			 end
			 104 : begin

				 //(112,120)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 112;
				 stateIp2B0<=#1 120;

				 //(113,121)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 113;
				 stateIp2B1<=#1 121;

				 //(114,122)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 114;
				 stateIp2B2<=#1 122;

				 //(115,123)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 115;
				 stateIp2B3<=#1 123;

				 //(116,124)
				 imgIp1B4 <= imagWorkingBuffer[116];
				 realIp1B4 <= realWorkingBuffer[116];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 116;
				 stateIp2B4<=#1 124;

				 //(117,125)
				 imgIp1B5 <= imagWorkingBuffer[117];
				 realIp1B5 <= realWorkingBuffer[117];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 117;
				 stateIp2B5<=#1 125;

				 //(118,126)
				 imgIp1B6 <= imagWorkingBuffer[118];
				 realIp1B6 <= realWorkingBuffer[118];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 118;
				 stateIp2B6<=#1 126;

				 //(119,127)
				 imgIp1B7 <= imagWorkingBuffer[119];
				 realIp1B7 <= realWorkingBuffer[119];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 119;
				 stateIp2B7<=#1 127;
			 end
			 105 : begin

				 //(128,136)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[136];
				 realIp2B0 <= realWorkingBuffer[136];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 136;

				 //(129,137)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[137];
				 realIp2B1 <= realWorkingBuffer[137];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 137;

				 //(130,138)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[138];
				 realIp2B2 <= realWorkingBuffer[138];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 130;
				 stateIp2B2<=#1 138;

				 //(131,139)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[139];
				 realIp2B3 <= realWorkingBuffer[139];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 131;
				 stateIp2B3<=#1 139;

				 //(132,140)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[140];
				 realIp2B4 <= realWorkingBuffer[140];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 132;
				 stateIp2B4<=#1 140;

				 //(133,141)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[141];
				 realIp2B5 <= realWorkingBuffer[141];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 133;
				 stateIp2B5<=#1 141;

				 //(134,142)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 134;
				 stateIp2B6<=#1 142;

				 //(135,143)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 135;
				 stateIp2B7<=#1 143;
			 end
			 106 : begin

				 //(144,152)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[152];
				 realIp2B0 <= realWorkingBuffer[152];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 152;

				 //(145,153)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[153];
				 realIp2B1 <= realWorkingBuffer[153];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 145;
				 stateIp2B1<=#1 153;

				 //(146,154)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[154];
				 realIp2B2 <= realWorkingBuffer[154];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 146;
				 stateIp2B2<=#1 154;

				 //(147,155)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[155];
				 realIp2B3 <= realWorkingBuffer[155];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 147;
				 stateIp2B3<=#1 155;

				 //(148,156)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 148;
				 stateIp2B4<=#1 156;

				 //(149,157)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 149;
				 stateIp2B5<=#1 157;

				 //(150,158)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 150;
				 stateIp2B6<=#1 158;

				 //(151,159)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 151;
				 stateIp2B7<=#1 159;
			 end
			 107 : begin

				 //(160,168)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[168];
				 realIp2B0 <= realWorkingBuffer[168];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 168;

				 //(161,169)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[169];
				 realIp2B1 <= realWorkingBuffer[169];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 161;
				 stateIp2B1<=#1 169;

				 //(162,170)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[170];
				 realIp2B2 <= realWorkingBuffer[170];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 162;
				 stateIp2B2<=#1 170;

				 //(163,171)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[171];
				 realIp2B3 <= realWorkingBuffer[171];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 163;
				 stateIp2B3<=#1 171;

				 //(164,172)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 164;
				 stateIp2B4<=#1 172;

				 //(165,173)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 165;
				 stateIp2B5<=#1 173;

				 //(166,174)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 166;
				 stateIp2B6<=#1 174;

				 //(167,175)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 167;
				 stateIp2B7<=#1 175;
			 end
			 108 : begin

				 //(176,184)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 176;
				 stateIp2B0<=#1 184;

				 //(177,185)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 177;
				 stateIp2B1<=#1 185;

				 //(178,186)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 178;
				 stateIp2B2<=#1 186;

				 //(179,187)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 179;
				 stateIp2B3<=#1 187;

				 //(180,188)
				 imgIp1B4 <= imagWorkingBuffer[180];
				 realIp1B4 <= realWorkingBuffer[180];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 180;
				 stateIp2B4<=#1 188;

				 //(181,189)
				 imgIp1B5 <= imagWorkingBuffer[181];
				 realIp1B5 <= realWorkingBuffer[181];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 181;
				 stateIp2B5<=#1 189;

				 //(182,190)
				 imgIp1B6 <= imagWorkingBuffer[182];
				 realIp1B6 <= realWorkingBuffer[182];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 182;
				 stateIp2B6<=#1 190;

				 //(183,191)
				 imgIp1B7 <= imagWorkingBuffer[183];
				 realIp1B7 <= realWorkingBuffer[183];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 183;
				 stateIp2B7<=#1 191;
			 end
			 109 : begin

				 //(192,200)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[200];
				 realIp2B0 <= realWorkingBuffer[200];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 200;

				 //(193,201)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[201];
				 realIp2B1 <= realWorkingBuffer[201];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 193;
				 stateIp2B1<=#1 201;

				 //(194,202)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[202];
				 realIp2B2 <= realWorkingBuffer[202];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 194;
				 stateIp2B2<=#1 202;

				 //(195,203)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[203];
				 realIp2B3 <= realWorkingBuffer[203];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 195;
				 stateIp2B3<=#1 203;

				 //(196,204)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 196;
				 stateIp2B4<=#1 204;

				 //(197,205)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 197;
				 stateIp2B5<=#1 205;

				 //(198,206)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 198;
				 stateIp2B6<=#1 206;

				 //(199,207)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 199;
				 stateIp2B7<=#1 207;
			 end
			 110 : begin

				 //(208,216)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 208;
				 stateIp2B0<=#1 216;

				 //(209,217)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 209;
				 stateIp2B1<=#1 217;

				 //(210,218)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 210;
				 stateIp2B2<=#1 218;

				 //(211,219)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 211;
				 stateIp2B3<=#1 219;

				 //(212,220)
				 imgIp1B4 <= imagWorkingBuffer[212];
				 realIp1B4 <= realWorkingBuffer[212];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 212;
				 stateIp2B4<=#1 220;

				 //(213,221)
				 imgIp1B5 <= imagWorkingBuffer[213];
				 realIp1B5 <= realWorkingBuffer[213];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 213;
				 stateIp2B5<=#1 221;

				 //(214,222)
				 imgIp1B6 <= imagWorkingBuffer[214];
				 realIp1B6 <= realWorkingBuffer[214];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 214;
				 stateIp2B6<=#1 222;

				 //(215,223)
				 imgIp1B7 <= imagWorkingBuffer[215];
				 realIp1B7 <= realWorkingBuffer[215];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 215;
				 stateIp2B7<=#1 223;
			 end
			 111 : begin

				 //(224,232)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 224;
				 stateIp2B0<=#1 232;

				 //(225,233)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 225;
				 stateIp2B1<=#1 233;

				 //(226,234)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 226;
				 stateIp2B2<=#1 234;

				 //(227,235)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 227;
				 stateIp2B3<=#1 235;

				 //(228,236)
				 imgIp1B4 <= imagWorkingBuffer[228];
				 realIp1B4 <= realWorkingBuffer[228];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 228;
				 stateIp2B4<=#1 236;

				 //(229,237)
				 imgIp1B5 <= imagWorkingBuffer[229];
				 realIp1B5 <= realWorkingBuffer[229];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 229;
				 stateIp2B5<=#1 237;

				 //(230,238)
				 imgIp1B6 <= imagWorkingBuffer[230];
				 realIp1B6 <= realWorkingBuffer[230];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 230;
				 stateIp2B6<=#1 238;

				 //(231,239)
				 imgIp1B7 <= imagWorkingBuffer[231];
				 realIp1B7 <= realWorkingBuffer[231];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 231;
				 stateIp2B7<=#1 239;
			 end
			 112 : begin

				 //(240,248)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 240;
				 stateIp2B0<=#1 248;

				 //(241,249)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 241;
				 stateIp2B1<=#1 249;

				 //(242,250)
				 imgIp1B2 <= imagWorkingBuffer[242];
				 realIp1B2 <= realWorkingBuffer[242];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 242;
				 stateIp2B2<=#1 250;

				 //(243,251)
				 imgIp1B3 <= imagWorkingBuffer[243];
				 realIp1B3 <= realWorkingBuffer[243];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 243;
				 stateIp2B3<=#1 251;

				 //(244,252)
				 imgIp1B4 <= imagWorkingBuffer[244];
				 realIp1B4 <= realWorkingBuffer[244];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 244;
				 stateIp2B4<=#1 252;

				 //(245,253)
				 imgIp1B5 <= imagWorkingBuffer[245];
				 realIp1B5 <= realWorkingBuffer[245];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 245;
				 stateIp2B5<=#1 253;

				 //(246,254)
				 imgIp1B6 <= imagWorkingBuffer[246];
				 realIp1B6 <= realWorkingBuffer[246];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 246;
				 stateIp2B6<=#1 254;

				 //(247,255)
				 imgIp1B7 <= imagWorkingBuffer[247];
				 realIp1B7 <= realWorkingBuffer[247];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 247;
				 stateIp2B7<=#1 255;
			 end
			 113 : begin

				 //(256,264)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[264];
				 realIp2B0 <= realWorkingBuffer[264];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 264;

				 //(257,265)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[265];
				 realIp2B1 <= realWorkingBuffer[265];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 265;

				 //(258,266)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[266];
				 realIp2B2 <= realWorkingBuffer[266];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 258;
				 stateIp2B2<=#1 266;

				 //(259,267)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[267];
				 realIp2B3 <= realWorkingBuffer[267];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 259;
				 stateIp2B3<=#1 267;

				 //(260,268)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[268];
				 realIp2B4 <= realWorkingBuffer[268];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 260;
				 stateIp2B4<=#1 268;

				 //(261,269)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[269];
				 realIp2B5 <= realWorkingBuffer[269];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 261;
				 stateIp2B5<=#1 269;

				 //(262,270)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 262;
				 stateIp2B6<=#1 270;

				 //(263,271)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 263;
				 stateIp2B7<=#1 271;
			 end
			 114 : begin

				 //(272,280)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[280];
				 realIp2B0 <= realWorkingBuffer[280];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 280;

				 //(273,281)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[281];
				 realIp2B1 <= realWorkingBuffer[281];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 273;
				 stateIp2B1<=#1 281;

				 //(274,282)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[282];
				 realIp2B2 <= realWorkingBuffer[282];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 274;
				 stateIp2B2<=#1 282;

				 //(275,283)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[283];
				 realIp2B3 <= realWorkingBuffer[283];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 275;
				 stateIp2B3<=#1 283;

				 //(276,284)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 276;
				 stateIp2B4<=#1 284;

				 //(277,285)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 277;
				 stateIp2B5<=#1 285;

				 //(278,286)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 278;
				 stateIp2B6<=#1 286;

				 //(279,287)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 279;
				 stateIp2B7<=#1 287;
			 end
			 115 : begin

				 //(288,296)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[296];
				 realIp2B0 <= realWorkingBuffer[296];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 296;

				 //(289,297)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[297];
				 realIp2B1 <= realWorkingBuffer[297];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 289;
				 stateIp2B1<=#1 297;

				 //(290,298)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[298];
				 realIp2B2 <= realWorkingBuffer[298];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 290;
				 stateIp2B2<=#1 298;

				 //(291,299)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[299];
				 realIp2B3 <= realWorkingBuffer[299];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 291;
				 stateIp2B3<=#1 299;

				 //(292,300)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 292;
				 stateIp2B4<=#1 300;

				 //(293,301)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 293;
				 stateIp2B5<=#1 301;

				 //(294,302)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 294;
				 stateIp2B6<=#1 302;

				 //(295,303)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 295;
				 stateIp2B7<=#1 303;
			 end
			 116 : begin

				 //(304,312)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 304;
				 stateIp2B0<=#1 312;

				 //(305,313)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 305;
				 stateIp2B1<=#1 313;

				 //(306,314)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 306;
				 stateIp2B2<=#1 314;

				 //(307,315)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 307;
				 stateIp2B3<=#1 315;

				 //(308,316)
				 imgIp1B4 <= imagWorkingBuffer[308];
				 realIp1B4 <= realWorkingBuffer[308];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 308;
				 stateIp2B4<=#1 316;

				 //(309,317)
				 imgIp1B5 <= imagWorkingBuffer[309];
				 realIp1B5 <= realWorkingBuffer[309];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 309;
				 stateIp2B5<=#1 317;

				 //(310,318)
				 imgIp1B6 <= imagWorkingBuffer[310];
				 realIp1B6 <= realWorkingBuffer[310];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 310;
				 stateIp2B6<=#1 318;

				 //(311,319)
				 imgIp1B7 <= imagWorkingBuffer[311];
				 realIp1B7 <= realWorkingBuffer[311];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 311;
				 stateIp2B7<=#1 319;
			 end
			 117 : begin

				 //(320,328)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[328];
				 realIp2B0 <= realWorkingBuffer[328];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 328;

				 //(321,329)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[329];
				 realIp2B1 <= realWorkingBuffer[329];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 321;
				 stateIp2B1<=#1 329;

				 //(322,330)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[330];
				 realIp2B2 <= realWorkingBuffer[330];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 322;
				 stateIp2B2<=#1 330;

				 //(323,331)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[331];
				 realIp2B3 <= realWorkingBuffer[331];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 323;
				 stateIp2B3<=#1 331;

				 //(324,332)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 324;
				 stateIp2B4<=#1 332;

				 //(325,333)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 325;
				 stateIp2B5<=#1 333;

				 //(326,334)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 326;
				 stateIp2B6<=#1 334;

				 //(327,335)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 327;
				 stateIp2B7<=#1 335;
			 end
			 118 : begin

				 //(336,344)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 336;
				 stateIp2B0<=#1 344;

				 //(337,345)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 337;
				 stateIp2B1<=#1 345;

				 //(338,346)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 338;
				 stateIp2B2<=#1 346;

				 //(339,347)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 339;
				 stateIp2B3<=#1 347;

				 //(340,348)
				 imgIp1B4 <= imagWorkingBuffer[340];
				 realIp1B4 <= realWorkingBuffer[340];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 340;
				 stateIp2B4<=#1 348;

				 //(341,349)
				 imgIp1B5 <= imagWorkingBuffer[341];
				 realIp1B5 <= realWorkingBuffer[341];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 341;
				 stateIp2B5<=#1 349;

				 //(342,350)
				 imgIp1B6 <= imagWorkingBuffer[342];
				 realIp1B6 <= realWorkingBuffer[342];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 342;
				 stateIp2B6<=#1 350;

				 //(343,351)
				 imgIp1B7 <= imagWorkingBuffer[343];
				 realIp1B7 <= realWorkingBuffer[343];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 343;
				 stateIp2B7<=#1 351;
			 end
			 119 : begin

				 //(352,360)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 352;
				 stateIp2B0<=#1 360;

				 //(353,361)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 353;
				 stateIp2B1<=#1 361;

				 //(354,362)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 354;
				 stateIp2B2<=#1 362;

				 //(355,363)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 355;
				 stateIp2B3<=#1 363;

				 //(356,364)
				 imgIp1B4 <= imagWorkingBuffer[356];
				 realIp1B4 <= realWorkingBuffer[356];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 356;
				 stateIp2B4<=#1 364;

				 //(357,365)
				 imgIp1B5 <= imagWorkingBuffer[357];
				 realIp1B5 <= realWorkingBuffer[357];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 357;
				 stateIp2B5<=#1 365;

				 //(358,366)
				 imgIp1B6 <= imagWorkingBuffer[358];
				 realIp1B6 <= realWorkingBuffer[358];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 358;
				 stateIp2B6<=#1 366;

				 //(359,367)
				 imgIp1B7 <= imagWorkingBuffer[359];
				 realIp1B7 <= realWorkingBuffer[359];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 359;
				 stateIp2B7<=#1 367;
			 end
			 120 : begin

				 //(368,376)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 368;
				 stateIp2B0<=#1 376;

				 //(369,377)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 369;
				 stateIp2B1<=#1 377;

				 //(370,378)
				 imgIp1B2 <= imagWorkingBuffer[370];
				 realIp1B2 <= realWorkingBuffer[370];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 370;
				 stateIp2B2<=#1 378;

				 //(371,379)
				 imgIp1B3 <= imagWorkingBuffer[371];
				 realIp1B3 <= realWorkingBuffer[371];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 371;
				 stateIp2B3<=#1 379;

				 //(372,380)
				 imgIp1B4 <= imagWorkingBuffer[372];
				 realIp1B4 <= realWorkingBuffer[372];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 372;
				 stateIp2B4<=#1 380;

				 //(373,381)
				 imgIp1B5 <= imagWorkingBuffer[373];
				 realIp1B5 <= realWorkingBuffer[373];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 373;
				 stateIp2B5<=#1 381;

				 //(374,382)
				 imgIp1B6 <= imagWorkingBuffer[374];
				 realIp1B6 <= realWorkingBuffer[374];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 374;
				 stateIp2B6<=#1 382;

				 //(375,383)
				 imgIp1B7 <= imagWorkingBuffer[375];
				 realIp1B7 <= realWorkingBuffer[375];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 375;
				 stateIp2B7<=#1 383;
			 end
			 121 : begin

				 //(384,392)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[392];
				 realIp2B0 <= realWorkingBuffer[392];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 392;

				 //(385,393)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[393];
				 realIp2B1 <= realWorkingBuffer[393];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 385;
				 stateIp2B1<=#1 393;

				 //(386,394)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[394];
				 realIp2B2 <= realWorkingBuffer[394];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 386;
				 stateIp2B2<=#1 394;

				 //(387,395)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[395];
				 realIp2B3 <= realWorkingBuffer[395];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 387;
				 stateIp2B3<=#1 395;

				 //(388,396)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 388;
				 stateIp2B4<=#1 396;

				 //(389,397)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 389;
				 stateIp2B5<=#1 397;

				 //(390,398)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 390;
				 stateIp2B6<=#1 398;

				 //(391,399)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 391;
				 stateIp2B7<=#1 399;
			 end
			 122 : begin

				 //(400,408)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 400;
				 stateIp2B0<=#1 408;

				 //(401,409)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 401;
				 stateIp2B1<=#1 409;

				 //(402,410)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 402;
				 stateIp2B2<=#1 410;

				 //(403,411)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 403;
				 stateIp2B3<=#1 411;

				 //(404,412)
				 imgIp1B4 <= imagWorkingBuffer[404];
				 realIp1B4 <= realWorkingBuffer[404];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 404;
				 stateIp2B4<=#1 412;

				 //(405,413)
				 imgIp1B5 <= imagWorkingBuffer[405];
				 realIp1B5 <= realWorkingBuffer[405];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 405;
				 stateIp2B5<=#1 413;

				 //(406,414)
				 imgIp1B6 <= imagWorkingBuffer[406];
				 realIp1B6 <= realWorkingBuffer[406];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 406;
				 stateIp2B6<=#1 414;

				 //(407,415)
				 imgIp1B7 <= imagWorkingBuffer[407];
				 realIp1B7 <= realWorkingBuffer[407];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 407;
				 stateIp2B7<=#1 415;
			 end
			 123 : begin

				 //(416,424)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 416;
				 stateIp2B0<=#1 424;

				 //(417,425)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 417;
				 stateIp2B1<=#1 425;

				 //(418,426)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 418;
				 stateIp2B2<=#1 426;

				 //(419,427)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 419;
				 stateIp2B3<=#1 427;

				 //(420,428)
				 imgIp1B4 <= imagWorkingBuffer[420];
				 realIp1B4 <= realWorkingBuffer[420];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 420;
				 stateIp2B4<=#1 428;

				 //(421,429)
				 imgIp1B5 <= imagWorkingBuffer[421];
				 realIp1B5 <= realWorkingBuffer[421];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 421;
				 stateIp2B5<=#1 429;

				 //(422,430)
				 imgIp1B6 <= imagWorkingBuffer[422];
				 realIp1B6 <= realWorkingBuffer[422];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 422;
				 stateIp2B6<=#1 430;

				 //(423,431)
				 imgIp1B7 <= imagWorkingBuffer[423];
				 realIp1B7 <= realWorkingBuffer[423];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 423;
				 stateIp2B7<=#1 431;
			 end
			 124 : begin

				 //(432,440)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 432;
				 stateIp2B0<=#1 440;

				 //(433,441)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 433;
				 stateIp2B1<=#1 441;

				 //(434,442)
				 imgIp1B2 <= imagWorkingBuffer[434];
				 realIp1B2 <= realWorkingBuffer[434];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 434;
				 stateIp2B2<=#1 442;

				 //(435,443)
				 imgIp1B3 <= imagWorkingBuffer[435];
				 realIp1B3 <= realWorkingBuffer[435];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 435;
				 stateIp2B3<=#1 443;

				 //(436,444)
				 imgIp1B4 <= imagWorkingBuffer[436];
				 realIp1B4 <= realWorkingBuffer[436];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 436;
				 stateIp2B4<=#1 444;

				 //(437,445)
				 imgIp1B5 <= imagWorkingBuffer[437];
				 realIp1B5 <= realWorkingBuffer[437];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 437;
				 stateIp2B5<=#1 445;

				 //(438,446)
				 imgIp1B6 <= imagWorkingBuffer[438];
				 realIp1B6 <= realWorkingBuffer[438];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 438;
				 stateIp2B6<=#1 446;

				 //(439,447)
				 imgIp1B7 <= imagWorkingBuffer[439];
				 realIp1B7 <= realWorkingBuffer[439];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 439;
				 stateIp2B7<=#1 447;
			 end
			 125 : begin

				 //(448,456)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 448;
				 stateIp2B0<=#1 456;

				 //(449,457)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 449;
				 stateIp2B1<=#1 457;

				 //(450,458)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 450;
				 stateIp2B2<=#1 458;

				 //(451,459)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 451;
				 stateIp2B3<=#1 459;

				 //(452,460)
				 imgIp1B4 <= imagWorkingBuffer[452];
				 realIp1B4 <= realWorkingBuffer[452];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 452;
				 stateIp2B4<=#1 460;

				 //(453,461)
				 imgIp1B5 <= imagWorkingBuffer[453];
				 realIp1B5 <= realWorkingBuffer[453];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 453;
				 stateIp2B5<=#1 461;

				 //(454,462)
				 imgIp1B6 <= imagWorkingBuffer[454];
				 realIp1B6 <= realWorkingBuffer[454];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 454;
				 stateIp2B6<=#1 462;

				 //(455,463)
				 imgIp1B7 <= imagWorkingBuffer[455];
				 realIp1B7 <= realWorkingBuffer[455];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 455;
				 stateIp2B7<=#1 463;
			 end
			 126 : begin

				 //(464,472)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 464;
				 stateIp2B0<=#1 472;

				 //(465,473)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 465;
				 stateIp2B1<=#1 473;

				 //(466,474)
				 imgIp1B2 <= imagWorkingBuffer[466];
				 realIp1B2 <= realWorkingBuffer[466];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 466;
				 stateIp2B2<=#1 474;

				 //(467,475)
				 imgIp1B3 <= imagWorkingBuffer[467];
				 realIp1B3 <= realWorkingBuffer[467];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 467;
				 stateIp2B3<=#1 475;

				 //(468,476)
				 imgIp1B4 <= imagWorkingBuffer[468];
				 realIp1B4 <= realWorkingBuffer[468];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 468;
				 stateIp2B4<=#1 476;

				 //(469,477)
				 imgIp1B5 <= imagWorkingBuffer[469];
				 realIp1B5 <= realWorkingBuffer[469];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 469;
				 stateIp2B5<=#1 477;

				 //(470,478)
				 imgIp1B6 <= imagWorkingBuffer[470];
				 realIp1B6 <= realWorkingBuffer[470];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 470;
				 stateIp2B6<=#1 478;

				 //(471,479)
				 imgIp1B7 <= imagWorkingBuffer[471];
				 realIp1B7 <= realWorkingBuffer[471];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 471;
				 stateIp2B7<=#1 479;
			 end
			 127 : begin

				 //(480,488)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 480;
				 stateIp2B0<=#1 488;

				 //(481,489)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 481;
				 stateIp2B1<=#1 489;

				 //(482,490)
				 imgIp1B2 <= imagWorkingBuffer[482];
				 realIp1B2 <= realWorkingBuffer[482];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 482;
				 stateIp2B2<=#1 490;

				 //(483,491)
				 imgIp1B3 <= imagWorkingBuffer[483];
				 realIp1B3 <= realWorkingBuffer[483];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 483;
				 stateIp2B3<=#1 491;

				 //(484,492)
				 imgIp1B4 <= imagWorkingBuffer[484];
				 realIp1B4 <= realWorkingBuffer[484];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 484;
				 stateIp2B4<=#1 492;

				 //(485,493)
				 imgIp1B5 <= imagWorkingBuffer[485];
				 realIp1B5 <= realWorkingBuffer[485];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 485;
				 stateIp2B5<=#1 493;

				 //(486,494)
				 imgIp1B6 <= imagWorkingBuffer[486];
				 realIp1B6 <= realWorkingBuffer[486];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 486;
				 stateIp2B6<=#1 494;

				 //(487,495)
				 imgIp1B7 <= imagWorkingBuffer[487];
				 realIp1B7 <= realWorkingBuffer[487];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 487;
				 stateIp2B7<=#1 495;
			 end
			 128 : begin

				 //(496,504)
				 imgIp1B0 <= imagWorkingBuffer[496];
				 realIp1B0 <= realWorkingBuffer[496];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 496;
				 stateIp2B0<=#1 504;

				 //(497,505)
				 imgIp1B1 <= imagWorkingBuffer[497];
				 realIp1B1 <= realWorkingBuffer[497];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=#1 0.92388;
				 twiddleFactorimgB1 <=#1 -0.382683;
				 stateIp1B1<=#1 497;
				 stateIp2B1<=#1 505;

				 //(498,506)
				 imgIp1B2 <= imagWorkingBuffer[498];
				 realIp1B2 <= realWorkingBuffer[498];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=#1 0.707107;
				 twiddleFactorimgB2 <=#1 -0.707107;
				 stateIp1B2<=#1 498;
				 stateIp2B2<=#1 506;

				 //(499,507)
				 imgIp1B3 <= imagWorkingBuffer[499];
				 realIp1B3 <= realWorkingBuffer[499];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=#1 0.382683;
				 twiddleFactorimgB3 <=#1 -0.92388;
				 stateIp1B3<=#1 499;
				 stateIp2B3<=#1 507;

				 //(500,508)
				 imgIp1B4 <= imagWorkingBuffer[500];
				 realIp1B4 <= realWorkingBuffer[500];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 0.0;
				 twiddleFactorimgB4 <=#1 -1.0;
				 stateIp1B4<=#1 500;
				 stateIp2B4<=#1 508;

				 //(501,509)
				 imgIp1B5 <= imagWorkingBuffer[501];
				 realIp1B5 <= realWorkingBuffer[501];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 -0.382683;
				 twiddleFactorimgB5 <=#1 -0.92388;
				 stateIp1B5<=#1 501;
				 stateIp2B5<=#1 509;

				 //(502,510)
				 imgIp1B6 <= imagWorkingBuffer[502];
				 realIp1B6 <= realWorkingBuffer[502];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 -0.707107;
				 twiddleFactorimgB6 <=#1 -0.707107;
				 stateIp1B6<=#1 502;
				 stateIp2B6<=#1 510;

				 //(503,511)
				 imgIp1B7 <= imagWorkingBuffer[503];
				 realIp1B7 <= realWorkingBuffer[503];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.92388;
				 twiddleFactorimgB7 <=#1 -0.382683;
				 stateIp1B7<=#1 503;
				 stateIp2B7<=#1 511;
			 end
			 129 : begin

				 //(0,16)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[16];
				 realIp2B0 <= realWorkingBuffer[16];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 16;

				 //(1,17)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[17];
				 realIp2B1 <= realWorkingBuffer[17];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 17;

				 //(2,18)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[18];
				 realIp2B2 <= realWorkingBuffer[18];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 18;

				 //(3,19)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[19];
				 realIp2B3 <= realWorkingBuffer[19];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 19;

				 //(4,20)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[20];
				 realIp2B4 <= realWorkingBuffer[20];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 4;
				 stateIp2B4<=#1 20;

				 //(5,21)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[21];
				 realIp2B5 <= realWorkingBuffer[21];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 5;
				 stateIp2B5<=#1 21;

				 //(6,22)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[22];
				 realIp2B6 <= realWorkingBuffer[22];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 6;
				 stateIp2B6<=#1 22;

				 //(7,23)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[23];
				 realIp2B7 <= realWorkingBuffer[23];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 7;
				 stateIp2B7<=#1 23;
			 end
			 130 : begin

				 //(8,24)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[24];
				 realIp2B0 <= realWorkingBuffer[24];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 8;
				 stateIp2B0<=#1 24;

				 //(9,25)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[25];
				 realIp2B1 <= realWorkingBuffer[25];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 9;
				 stateIp2B1<=#1 25;

				 //(10,26)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[26];
				 realIp2B2 <= realWorkingBuffer[26];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 10;
				 stateIp2B2<=#1 26;

				 //(11,27)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[27];
				 realIp2B3 <= realWorkingBuffer[27];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 11;
				 stateIp2B3<=#1 27;

				 //(12,28)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[28];
				 realIp2B4 <= realWorkingBuffer[28];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 12;
				 stateIp2B4<=#1 28;

				 //(13,29)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[29];
				 realIp2B5 <= realWorkingBuffer[29];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 13;
				 stateIp2B5<=#1 29;

				 //(14,30)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[30];
				 realIp2B6 <= realWorkingBuffer[30];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 14;
				 stateIp2B6<=#1 30;

				 //(15,31)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[31];
				 realIp2B7 <= realWorkingBuffer[31];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 15;
				 stateIp2B7<=#1 31;
			 end
			 131 : begin

				 //(32,48)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[48];
				 realIp2B0 <= realWorkingBuffer[48];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 48;

				 //(33,49)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[49];
				 realIp2B1 <= realWorkingBuffer[49];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 49;

				 //(34,50)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[50];
				 realIp2B2 <= realWorkingBuffer[50];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 34;
				 stateIp2B2<=#1 50;

				 //(35,51)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[51];
				 realIp2B3 <= realWorkingBuffer[51];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 35;
				 stateIp2B3<=#1 51;

				 //(36,52)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[52];
				 realIp2B4 <= realWorkingBuffer[52];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 36;
				 stateIp2B4<=#1 52;

				 //(37,53)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[53];
				 realIp2B5 <= realWorkingBuffer[53];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 37;
				 stateIp2B5<=#1 53;

				 //(38,54)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[54];
				 realIp2B6 <= realWorkingBuffer[54];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 38;
				 stateIp2B6<=#1 54;

				 //(39,55)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[55];
				 realIp2B7 <= realWorkingBuffer[55];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 39;
				 stateIp2B7<=#1 55;
			 end
			 132 : begin

				 //(40,56)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[56];
				 realIp2B0 <= realWorkingBuffer[56];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 40;
				 stateIp2B0<=#1 56;

				 //(41,57)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[57];
				 realIp2B1 <= realWorkingBuffer[57];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 41;
				 stateIp2B1<=#1 57;

				 //(42,58)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[58];
				 realIp2B2 <= realWorkingBuffer[58];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 42;
				 stateIp2B2<=#1 58;

				 //(43,59)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[59];
				 realIp2B3 <= realWorkingBuffer[59];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 43;
				 stateIp2B3<=#1 59;

				 //(44,60)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 44;
				 stateIp2B4<=#1 60;

				 //(45,61)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 45;
				 stateIp2B5<=#1 61;

				 //(46,62)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 46;
				 stateIp2B6<=#1 62;

				 //(47,63)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 47;
				 stateIp2B7<=#1 63;
			 end
			 133 : begin

				 //(64,80)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[80];
				 realIp2B0 <= realWorkingBuffer[80];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 80;

				 //(65,81)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[81];
				 realIp2B1 <= realWorkingBuffer[81];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 81;

				 //(66,82)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[82];
				 realIp2B2 <= realWorkingBuffer[82];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 66;
				 stateIp2B2<=#1 82;

				 //(67,83)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[83];
				 realIp2B3 <= realWorkingBuffer[83];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 67;
				 stateIp2B3<=#1 83;

				 //(68,84)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[84];
				 realIp2B4 <= realWorkingBuffer[84];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 68;
				 stateIp2B4<=#1 84;

				 //(69,85)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[85];
				 realIp2B5 <= realWorkingBuffer[85];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 69;
				 stateIp2B5<=#1 85;

				 //(70,86)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[86];
				 realIp2B6 <= realWorkingBuffer[86];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 70;
				 stateIp2B6<=#1 86;

				 //(71,87)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[87];
				 realIp2B7 <= realWorkingBuffer[87];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 71;
				 stateIp2B7<=#1 87;
			 end
			 134 : begin

				 //(72,88)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[88];
				 realIp2B0 <= realWorkingBuffer[88];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 72;
				 stateIp2B0<=#1 88;

				 //(73,89)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[89];
				 realIp2B1 <= realWorkingBuffer[89];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 73;
				 stateIp2B1<=#1 89;

				 //(74,90)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[90];
				 realIp2B2 <= realWorkingBuffer[90];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 74;
				 stateIp2B2<=#1 90;

				 //(75,91)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[91];
				 realIp2B3 <= realWorkingBuffer[91];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 75;
				 stateIp2B3<=#1 91;

				 //(76,92)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 76;
				 stateIp2B4<=#1 92;

				 //(77,93)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 77;
				 stateIp2B5<=#1 93;

				 //(78,94)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 78;
				 stateIp2B6<=#1 94;

				 //(79,95)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 79;
				 stateIp2B7<=#1 95;
			 end
			 135 : begin

				 //(96,112)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[112];
				 realIp2B0 <= realWorkingBuffer[112];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 112;

				 //(97,113)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[113];
				 realIp2B1 <= realWorkingBuffer[113];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 97;
				 stateIp2B1<=#1 113;

				 //(98,114)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[114];
				 realIp2B2 <= realWorkingBuffer[114];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 98;
				 stateIp2B2<=#1 114;

				 //(99,115)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[115];
				 realIp2B3 <= realWorkingBuffer[115];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 99;
				 stateIp2B3<=#1 115;

				 //(100,116)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[116];
				 realIp2B4 <= realWorkingBuffer[116];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 100;
				 stateIp2B4<=#1 116;

				 //(101,117)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[117];
				 realIp2B5 <= realWorkingBuffer[117];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 101;
				 stateIp2B5<=#1 117;

				 //(102,118)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[118];
				 realIp2B6 <= realWorkingBuffer[118];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 102;
				 stateIp2B6<=#1 118;

				 //(103,119)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[119];
				 realIp2B7 <= realWorkingBuffer[119];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 103;
				 stateIp2B7<=#1 119;
			 end
			 136 : begin

				 //(104,120)
				 imgIp1B0 <= imagWorkingBuffer[104];
				 realIp1B0 <= realWorkingBuffer[104];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 104;
				 stateIp2B0<=#1 120;

				 //(105,121)
				 imgIp1B1 <= imagWorkingBuffer[105];
				 realIp1B1 <= realWorkingBuffer[105];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 105;
				 stateIp2B1<=#1 121;

				 //(106,122)
				 imgIp1B2 <= imagWorkingBuffer[106];
				 realIp1B2 <= realWorkingBuffer[106];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 106;
				 stateIp2B2<=#1 122;

				 //(107,123)
				 imgIp1B3 <= imagWorkingBuffer[107];
				 realIp1B3 <= realWorkingBuffer[107];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 107;
				 stateIp2B3<=#1 123;

				 //(108,124)
				 imgIp1B4 <= imagWorkingBuffer[108];
				 realIp1B4 <= realWorkingBuffer[108];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 108;
				 stateIp2B4<=#1 124;

				 //(109,125)
				 imgIp1B5 <= imagWorkingBuffer[109];
				 realIp1B5 <= realWorkingBuffer[109];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 109;
				 stateIp2B5<=#1 125;

				 //(110,126)
				 imgIp1B6 <= imagWorkingBuffer[110];
				 realIp1B6 <= realWorkingBuffer[110];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 110;
				 stateIp2B6<=#1 126;

				 //(111,127)
				 imgIp1B7 <= imagWorkingBuffer[111];
				 realIp1B7 <= realWorkingBuffer[111];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 111;
				 stateIp2B7<=#1 127;
			 end
			 137 : begin

				 //(128,144)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[144];
				 realIp2B0 <= realWorkingBuffer[144];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 144;

				 //(129,145)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[145];
				 realIp2B1 <= realWorkingBuffer[145];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 145;

				 //(130,146)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[146];
				 realIp2B2 <= realWorkingBuffer[146];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 130;
				 stateIp2B2<=#1 146;

				 //(131,147)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[147];
				 realIp2B3 <= realWorkingBuffer[147];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 131;
				 stateIp2B3<=#1 147;

				 //(132,148)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[148];
				 realIp2B4 <= realWorkingBuffer[148];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 132;
				 stateIp2B4<=#1 148;

				 //(133,149)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[149];
				 realIp2B5 <= realWorkingBuffer[149];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 133;
				 stateIp2B5<=#1 149;

				 //(134,150)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[150];
				 realIp2B6 <= realWorkingBuffer[150];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 134;
				 stateIp2B6<=#1 150;

				 //(135,151)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[151];
				 realIp2B7 <= realWorkingBuffer[151];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 135;
				 stateIp2B7<=#1 151;
			 end
			 138 : begin

				 //(136,152)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[152];
				 realIp2B0 <= realWorkingBuffer[152];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 136;
				 stateIp2B0<=#1 152;

				 //(137,153)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[153];
				 realIp2B1 <= realWorkingBuffer[153];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 137;
				 stateIp2B1<=#1 153;

				 //(138,154)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[154];
				 realIp2B2 <= realWorkingBuffer[154];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 138;
				 stateIp2B2<=#1 154;

				 //(139,155)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[155];
				 realIp2B3 <= realWorkingBuffer[155];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 139;
				 stateIp2B3<=#1 155;

				 //(140,156)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 140;
				 stateIp2B4<=#1 156;

				 //(141,157)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 141;
				 stateIp2B5<=#1 157;

				 //(142,158)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 142;
				 stateIp2B6<=#1 158;

				 //(143,159)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 143;
				 stateIp2B7<=#1 159;
			 end
			 139 : begin

				 //(160,176)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[176];
				 realIp2B0 <= realWorkingBuffer[176];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 176;

				 //(161,177)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[177];
				 realIp2B1 <= realWorkingBuffer[177];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 161;
				 stateIp2B1<=#1 177;

				 //(162,178)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[178];
				 realIp2B2 <= realWorkingBuffer[178];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 162;
				 stateIp2B2<=#1 178;

				 //(163,179)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[179];
				 realIp2B3 <= realWorkingBuffer[179];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 163;
				 stateIp2B3<=#1 179;

				 //(164,180)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[180];
				 realIp2B4 <= realWorkingBuffer[180];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 164;
				 stateIp2B4<=#1 180;

				 //(165,181)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[181];
				 realIp2B5 <= realWorkingBuffer[181];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 165;
				 stateIp2B5<=#1 181;

				 //(166,182)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[182];
				 realIp2B6 <= realWorkingBuffer[182];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 166;
				 stateIp2B6<=#1 182;

				 //(167,183)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[183];
				 realIp2B7 <= realWorkingBuffer[183];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 167;
				 stateIp2B7<=#1 183;
			 end
			 140 : begin

				 //(168,184)
				 imgIp1B0 <= imagWorkingBuffer[168];
				 realIp1B0 <= realWorkingBuffer[168];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 168;
				 stateIp2B0<=#1 184;

				 //(169,185)
				 imgIp1B1 <= imagWorkingBuffer[169];
				 realIp1B1 <= realWorkingBuffer[169];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 169;
				 stateIp2B1<=#1 185;

				 //(170,186)
				 imgIp1B2 <= imagWorkingBuffer[170];
				 realIp1B2 <= realWorkingBuffer[170];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 170;
				 stateIp2B2<=#1 186;

				 //(171,187)
				 imgIp1B3 <= imagWorkingBuffer[171];
				 realIp1B3 <= realWorkingBuffer[171];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 171;
				 stateIp2B3<=#1 187;

				 //(172,188)
				 imgIp1B4 <= imagWorkingBuffer[172];
				 realIp1B4 <= realWorkingBuffer[172];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 172;
				 stateIp2B4<=#1 188;

				 //(173,189)
				 imgIp1B5 <= imagWorkingBuffer[173];
				 realIp1B5 <= realWorkingBuffer[173];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 173;
				 stateIp2B5<=#1 189;

				 //(174,190)
				 imgIp1B6 <= imagWorkingBuffer[174];
				 realIp1B6 <= realWorkingBuffer[174];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 174;
				 stateIp2B6<=#1 190;

				 //(175,191)
				 imgIp1B7 <= imagWorkingBuffer[175];
				 realIp1B7 <= realWorkingBuffer[175];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 175;
				 stateIp2B7<=#1 191;
			 end
			 141 : begin

				 //(192,208)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[208];
				 realIp2B0 <= realWorkingBuffer[208];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 208;

				 //(193,209)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[209];
				 realIp2B1 <= realWorkingBuffer[209];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 193;
				 stateIp2B1<=#1 209;

				 //(194,210)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[210];
				 realIp2B2 <= realWorkingBuffer[210];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 194;
				 stateIp2B2<=#1 210;

				 //(195,211)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[211];
				 realIp2B3 <= realWorkingBuffer[211];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 195;
				 stateIp2B3<=#1 211;

				 //(196,212)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[212];
				 realIp2B4 <= realWorkingBuffer[212];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 196;
				 stateIp2B4<=#1 212;

				 //(197,213)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[213];
				 realIp2B5 <= realWorkingBuffer[213];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 197;
				 stateIp2B5<=#1 213;

				 //(198,214)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[214];
				 realIp2B6 <= realWorkingBuffer[214];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 198;
				 stateIp2B6<=#1 214;

				 //(199,215)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[215];
				 realIp2B7 <= realWorkingBuffer[215];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 199;
				 stateIp2B7<=#1 215;
			 end
			 142 : begin

				 //(200,216)
				 imgIp1B0 <= imagWorkingBuffer[200];
				 realIp1B0 <= realWorkingBuffer[200];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 200;
				 stateIp2B0<=#1 216;

				 //(201,217)
				 imgIp1B1 <= imagWorkingBuffer[201];
				 realIp1B1 <= realWorkingBuffer[201];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 201;
				 stateIp2B1<=#1 217;

				 //(202,218)
				 imgIp1B2 <= imagWorkingBuffer[202];
				 realIp1B2 <= realWorkingBuffer[202];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 202;
				 stateIp2B2<=#1 218;

				 //(203,219)
				 imgIp1B3 <= imagWorkingBuffer[203];
				 realIp1B3 <= realWorkingBuffer[203];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 203;
				 stateIp2B3<=#1 219;

				 //(204,220)
				 imgIp1B4 <= imagWorkingBuffer[204];
				 realIp1B4 <= realWorkingBuffer[204];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 204;
				 stateIp2B4<=#1 220;

				 //(205,221)
				 imgIp1B5 <= imagWorkingBuffer[205];
				 realIp1B5 <= realWorkingBuffer[205];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 205;
				 stateIp2B5<=#1 221;

				 //(206,222)
				 imgIp1B6 <= imagWorkingBuffer[206];
				 realIp1B6 <= realWorkingBuffer[206];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 206;
				 stateIp2B6<=#1 222;

				 //(207,223)
				 imgIp1B7 <= imagWorkingBuffer[207];
				 realIp1B7 <= realWorkingBuffer[207];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 207;
				 stateIp2B7<=#1 223;
			 end
			 143 : begin

				 //(224,240)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 224;
				 stateIp2B0<=#1 240;

				 //(225,241)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 225;
				 stateIp2B1<=#1 241;

				 //(226,242)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 226;
				 stateIp2B2<=#1 242;

				 //(227,243)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 227;
				 stateIp2B3<=#1 243;

				 //(228,244)
				 imgIp1B4 <= imagWorkingBuffer[228];
				 realIp1B4 <= realWorkingBuffer[228];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 228;
				 stateIp2B4<=#1 244;

				 //(229,245)
				 imgIp1B5 <= imagWorkingBuffer[229];
				 realIp1B5 <= realWorkingBuffer[229];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 229;
				 stateIp2B5<=#1 245;

				 //(230,246)
				 imgIp1B6 <= imagWorkingBuffer[230];
				 realIp1B6 <= realWorkingBuffer[230];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 230;
				 stateIp2B6<=#1 246;

				 //(231,247)
				 imgIp1B7 <= imagWorkingBuffer[231];
				 realIp1B7 <= realWorkingBuffer[231];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 231;
				 stateIp2B7<=#1 247;
			 end
			 144 : begin

				 //(232,248)
				 imgIp1B0 <= imagWorkingBuffer[232];
				 realIp1B0 <= realWorkingBuffer[232];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 232;
				 stateIp2B0<=#1 248;

				 //(233,249)
				 imgIp1B1 <= imagWorkingBuffer[233];
				 realIp1B1 <= realWorkingBuffer[233];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 233;
				 stateIp2B1<=#1 249;

				 //(234,250)
				 imgIp1B2 <= imagWorkingBuffer[234];
				 realIp1B2 <= realWorkingBuffer[234];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 234;
				 stateIp2B2<=#1 250;

				 //(235,251)
				 imgIp1B3 <= imagWorkingBuffer[235];
				 realIp1B3 <= realWorkingBuffer[235];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 235;
				 stateIp2B3<=#1 251;

				 //(236,252)
				 imgIp1B4 <= imagWorkingBuffer[236];
				 realIp1B4 <= realWorkingBuffer[236];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 236;
				 stateIp2B4<=#1 252;

				 //(237,253)
				 imgIp1B5 <= imagWorkingBuffer[237];
				 realIp1B5 <= realWorkingBuffer[237];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 237;
				 stateIp2B5<=#1 253;

				 //(238,254)
				 imgIp1B6 <= imagWorkingBuffer[238];
				 realIp1B6 <= realWorkingBuffer[238];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 238;
				 stateIp2B6<=#1 254;

				 //(239,255)
				 imgIp1B7 <= imagWorkingBuffer[239];
				 realIp1B7 <= realWorkingBuffer[239];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 239;
				 stateIp2B7<=#1 255;
			 end
			 145 : begin

				 //(256,272)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[272];
				 realIp2B0 <= realWorkingBuffer[272];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 272;

				 //(257,273)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[273];
				 realIp2B1 <= realWorkingBuffer[273];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 273;

				 //(258,274)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[274];
				 realIp2B2 <= realWorkingBuffer[274];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 258;
				 stateIp2B2<=#1 274;

				 //(259,275)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[275];
				 realIp2B3 <= realWorkingBuffer[275];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 259;
				 stateIp2B3<=#1 275;

				 //(260,276)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[276];
				 realIp2B4 <= realWorkingBuffer[276];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 260;
				 stateIp2B4<=#1 276;

				 //(261,277)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[277];
				 realIp2B5 <= realWorkingBuffer[277];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 261;
				 stateIp2B5<=#1 277;

				 //(262,278)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[278];
				 realIp2B6 <= realWorkingBuffer[278];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 262;
				 stateIp2B6<=#1 278;

				 //(263,279)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[279];
				 realIp2B7 <= realWorkingBuffer[279];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 263;
				 stateIp2B7<=#1 279;
			 end
			 146 : begin

				 //(264,280)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[280];
				 realIp2B0 <= realWorkingBuffer[280];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 264;
				 stateIp2B0<=#1 280;

				 //(265,281)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[281];
				 realIp2B1 <= realWorkingBuffer[281];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 265;
				 stateIp2B1<=#1 281;

				 //(266,282)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[282];
				 realIp2B2 <= realWorkingBuffer[282];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 266;
				 stateIp2B2<=#1 282;

				 //(267,283)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[283];
				 realIp2B3 <= realWorkingBuffer[283];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 267;
				 stateIp2B3<=#1 283;

				 //(268,284)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 268;
				 stateIp2B4<=#1 284;

				 //(269,285)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 269;
				 stateIp2B5<=#1 285;

				 //(270,286)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 270;
				 stateIp2B6<=#1 286;

				 //(271,287)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 271;
				 stateIp2B7<=#1 287;
			 end
			 147 : begin

				 //(288,304)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[304];
				 realIp2B0 <= realWorkingBuffer[304];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 304;

				 //(289,305)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[305];
				 realIp2B1 <= realWorkingBuffer[305];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 289;
				 stateIp2B1<=#1 305;

				 //(290,306)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[306];
				 realIp2B2 <= realWorkingBuffer[306];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 290;
				 stateIp2B2<=#1 306;

				 //(291,307)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[307];
				 realIp2B3 <= realWorkingBuffer[307];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 291;
				 stateIp2B3<=#1 307;

				 //(292,308)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[308];
				 realIp2B4 <= realWorkingBuffer[308];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 292;
				 stateIp2B4<=#1 308;

				 //(293,309)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[309];
				 realIp2B5 <= realWorkingBuffer[309];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 293;
				 stateIp2B5<=#1 309;

				 //(294,310)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[310];
				 realIp2B6 <= realWorkingBuffer[310];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 294;
				 stateIp2B6<=#1 310;

				 //(295,311)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[311];
				 realIp2B7 <= realWorkingBuffer[311];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 295;
				 stateIp2B7<=#1 311;
			 end
			 148 : begin

				 //(296,312)
				 imgIp1B0 <= imagWorkingBuffer[296];
				 realIp1B0 <= realWorkingBuffer[296];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 296;
				 stateIp2B0<=#1 312;

				 //(297,313)
				 imgIp1B1 <= imagWorkingBuffer[297];
				 realIp1B1 <= realWorkingBuffer[297];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 297;
				 stateIp2B1<=#1 313;

				 //(298,314)
				 imgIp1B2 <= imagWorkingBuffer[298];
				 realIp1B2 <= realWorkingBuffer[298];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 298;
				 stateIp2B2<=#1 314;

				 //(299,315)
				 imgIp1B3 <= imagWorkingBuffer[299];
				 realIp1B3 <= realWorkingBuffer[299];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 299;
				 stateIp2B3<=#1 315;

				 //(300,316)
				 imgIp1B4 <= imagWorkingBuffer[300];
				 realIp1B4 <= realWorkingBuffer[300];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 300;
				 stateIp2B4<=#1 316;

				 //(301,317)
				 imgIp1B5 <= imagWorkingBuffer[301];
				 realIp1B5 <= realWorkingBuffer[301];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 301;
				 stateIp2B5<=#1 317;

				 //(302,318)
				 imgIp1B6 <= imagWorkingBuffer[302];
				 realIp1B6 <= realWorkingBuffer[302];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 302;
				 stateIp2B6<=#1 318;

				 //(303,319)
				 imgIp1B7 <= imagWorkingBuffer[303];
				 realIp1B7 <= realWorkingBuffer[303];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 303;
				 stateIp2B7<=#1 319;
			 end
			 149 : begin

				 //(320,336)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[336];
				 realIp2B0 <= realWorkingBuffer[336];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 336;

				 //(321,337)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[337];
				 realIp2B1 <= realWorkingBuffer[337];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 321;
				 stateIp2B1<=#1 337;

				 //(322,338)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[338];
				 realIp2B2 <= realWorkingBuffer[338];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 322;
				 stateIp2B2<=#1 338;

				 //(323,339)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[339];
				 realIp2B3 <= realWorkingBuffer[339];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 323;
				 stateIp2B3<=#1 339;

				 //(324,340)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[340];
				 realIp2B4 <= realWorkingBuffer[340];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 324;
				 stateIp2B4<=#1 340;

				 //(325,341)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[341];
				 realIp2B5 <= realWorkingBuffer[341];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 325;
				 stateIp2B5<=#1 341;

				 //(326,342)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[342];
				 realIp2B6 <= realWorkingBuffer[342];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 326;
				 stateIp2B6<=#1 342;

				 //(327,343)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[343];
				 realIp2B7 <= realWorkingBuffer[343];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 327;
				 stateIp2B7<=#1 343;
			 end
			 150 : begin

				 //(328,344)
				 imgIp1B0 <= imagWorkingBuffer[328];
				 realIp1B0 <= realWorkingBuffer[328];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 328;
				 stateIp2B0<=#1 344;

				 //(329,345)
				 imgIp1B1 <= imagWorkingBuffer[329];
				 realIp1B1 <= realWorkingBuffer[329];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 329;
				 stateIp2B1<=#1 345;

				 //(330,346)
				 imgIp1B2 <= imagWorkingBuffer[330];
				 realIp1B2 <= realWorkingBuffer[330];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 330;
				 stateIp2B2<=#1 346;

				 //(331,347)
				 imgIp1B3 <= imagWorkingBuffer[331];
				 realIp1B3 <= realWorkingBuffer[331];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 331;
				 stateIp2B3<=#1 347;

				 //(332,348)
				 imgIp1B4 <= imagWorkingBuffer[332];
				 realIp1B4 <= realWorkingBuffer[332];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 332;
				 stateIp2B4<=#1 348;

				 //(333,349)
				 imgIp1B5 <= imagWorkingBuffer[333];
				 realIp1B5 <= realWorkingBuffer[333];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 333;
				 stateIp2B5<=#1 349;

				 //(334,350)
				 imgIp1B6 <= imagWorkingBuffer[334];
				 realIp1B6 <= realWorkingBuffer[334];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 334;
				 stateIp2B6<=#1 350;

				 //(335,351)
				 imgIp1B7 <= imagWorkingBuffer[335];
				 realIp1B7 <= realWorkingBuffer[335];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 335;
				 stateIp2B7<=#1 351;
			 end
			 151 : begin

				 //(352,368)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 352;
				 stateIp2B0<=#1 368;

				 //(353,369)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 353;
				 stateIp2B1<=#1 369;

				 //(354,370)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 354;
				 stateIp2B2<=#1 370;

				 //(355,371)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 355;
				 stateIp2B3<=#1 371;

				 //(356,372)
				 imgIp1B4 <= imagWorkingBuffer[356];
				 realIp1B4 <= realWorkingBuffer[356];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 356;
				 stateIp2B4<=#1 372;

				 //(357,373)
				 imgIp1B5 <= imagWorkingBuffer[357];
				 realIp1B5 <= realWorkingBuffer[357];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 357;
				 stateIp2B5<=#1 373;

				 //(358,374)
				 imgIp1B6 <= imagWorkingBuffer[358];
				 realIp1B6 <= realWorkingBuffer[358];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 358;
				 stateIp2B6<=#1 374;

				 //(359,375)
				 imgIp1B7 <= imagWorkingBuffer[359];
				 realIp1B7 <= realWorkingBuffer[359];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 359;
				 stateIp2B7<=#1 375;
			 end
			 152 : begin

				 //(360,376)
				 imgIp1B0 <= imagWorkingBuffer[360];
				 realIp1B0 <= realWorkingBuffer[360];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 360;
				 stateIp2B0<=#1 376;

				 //(361,377)
				 imgIp1B1 <= imagWorkingBuffer[361];
				 realIp1B1 <= realWorkingBuffer[361];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 361;
				 stateIp2B1<=#1 377;

				 //(362,378)
				 imgIp1B2 <= imagWorkingBuffer[362];
				 realIp1B2 <= realWorkingBuffer[362];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 362;
				 stateIp2B2<=#1 378;

				 //(363,379)
				 imgIp1B3 <= imagWorkingBuffer[363];
				 realIp1B3 <= realWorkingBuffer[363];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 363;
				 stateIp2B3<=#1 379;

				 //(364,380)
				 imgIp1B4 <= imagWorkingBuffer[364];
				 realIp1B4 <= realWorkingBuffer[364];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 364;
				 stateIp2B4<=#1 380;

				 //(365,381)
				 imgIp1B5 <= imagWorkingBuffer[365];
				 realIp1B5 <= realWorkingBuffer[365];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 365;
				 stateIp2B5<=#1 381;

				 //(366,382)
				 imgIp1B6 <= imagWorkingBuffer[366];
				 realIp1B6 <= realWorkingBuffer[366];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 366;
				 stateIp2B6<=#1 382;

				 //(367,383)
				 imgIp1B7 <= imagWorkingBuffer[367];
				 realIp1B7 <= realWorkingBuffer[367];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 367;
				 stateIp2B7<=#1 383;
			 end
			 153 : begin

				 //(384,400)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[400];
				 realIp2B0 <= realWorkingBuffer[400];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 400;

				 //(385,401)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[401];
				 realIp2B1 <= realWorkingBuffer[401];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 385;
				 stateIp2B1<=#1 401;

				 //(386,402)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[402];
				 realIp2B2 <= realWorkingBuffer[402];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 386;
				 stateIp2B2<=#1 402;

				 //(387,403)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[403];
				 realIp2B3 <= realWorkingBuffer[403];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 387;
				 stateIp2B3<=#1 403;

				 //(388,404)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[404];
				 realIp2B4 <= realWorkingBuffer[404];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 388;
				 stateIp2B4<=#1 404;

				 //(389,405)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[405];
				 realIp2B5 <= realWorkingBuffer[405];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 389;
				 stateIp2B5<=#1 405;

				 //(390,406)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[406];
				 realIp2B6 <= realWorkingBuffer[406];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 390;
				 stateIp2B6<=#1 406;

				 //(391,407)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[407];
				 realIp2B7 <= realWorkingBuffer[407];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 391;
				 stateIp2B7<=#1 407;
			 end
			 154 : begin

				 //(392,408)
				 imgIp1B0 <= imagWorkingBuffer[392];
				 realIp1B0 <= realWorkingBuffer[392];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 392;
				 stateIp2B0<=#1 408;

				 //(393,409)
				 imgIp1B1 <= imagWorkingBuffer[393];
				 realIp1B1 <= realWorkingBuffer[393];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 393;
				 stateIp2B1<=#1 409;

				 //(394,410)
				 imgIp1B2 <= imagWorkingBuffer[394];
				 realIp1B2 <= realWorkingBuffer[394];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 394;
				 stateIp2B2<=#1 410;

				 //(395,411)
				 imgIp1B3 <= imagWorkingBuffer[395];
				 realIp1B3 <= realWorkingBuffer[395];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 395;
				 stateIp2B3<=#1 411;

				 //(396,412)
				 imgIp1B4 <= imagWorkingBuffer[396];
				 realIp1B4 <= realWorkingBuffer[396];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 396;
				 stateIp2B4<=#1 412;

				 //(397,413)
				 imgIp1B5 <= imagWorkingBuffer[397];
				 realIp1B5 <= realWorkingBuffer[397];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 397;
				 stateIp2B5<=#1 413;

				 //(398,414)
				 imgIp1B6 <= imagWorkingBuffer[398];
				 realIp1B6 <= realWorkingBuffer[398];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 398;
				 stateIp2B6<=#1 414;

				 //(399,415)
				 imgIp1B7 <= imagWorkingBuffer[399];
				 realIp1B7 <= realWorkingBuffer[399];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 399;
				 stateIp2B7<=#1 415;
			 end
			 155 : begin

				 //(416,432)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 416;
				 stateIp2B0<=#1 432;

				 //(417,433)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 417;
				 stateIp2B1<=#1 433;

				 //(418,434)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 418;
				 stateIp2B2<=#1 434;

				 //(419,435)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 419;
				 stateIp2B3<=#1 435;

				 //(420,436)
				 imgIp1B4 <= imagWorkingBuffer[420];
				 realIp1B4 <= realWorkingBuffer[420];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 420;
				 stateIp2B4<=#1 436;

				 //(421,437)
				 imgIp1B5 <= imagWorkingBuffer[421];
				 realIp1B5 <= realWorkingBuffer[421];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 421;
				 stateIp2B5<=#1 437;

				 //(422,438)
				 imgIp1B6 <= imagWorkingBuffer[422];
				 realIp1B6 <= realWorkingBuffer[422];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 422;
				 stateIp2B6<=#1 438;

				 //(423,439)
				 imgIp1B7 <= imagWorkingBuffer[423];
				 realIp1B7 <= realWorkingBuffer[423];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 423;
				 stateIp2B7<=#1 439;
			 end
			 156 : begin

				 //(424,440)
				 imgIp1B0 <= imagWorkingBuffer[424];
				 realIp1B0 <= realWorkingBuffer[424];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 424;
				 stateIp2B0<=#1 440;

				 //(425,441)
				 imgIp1B1 <= imagWorkingBuffer[425];
				 realIp1B1 <= realWorkingBuffer[425];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 425;
				 stateIp2B1<=#1 441;

				 //(426,442)
				 imgIp1B2 <= imagWorkingBuffer[426];
				 realIp1B2 <= realWorkingBuffer[426];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 426;
				 stateIp2B2<=#1 442;

				 //(427,443)
				 imgIp1B3 <= imagWorkingBuffer[427];
				 realIp1B3 <= realWorkingBuffer[427];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 427;
				 stateIp2B3<=#1 443;

				 //(428,444)
				 imgIp1B4 <= imagWorkingBuffer[428];
				 realIp1B4 <= realWorkingBuffer[428];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 428;
				 stateIp2B4<=#1 444;

				 //(429,445)
				 imgIp1B5 <= imagWorkingBuffer[429];
				 realIp1B5 <= realWorkingBuffer[429];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 429;
				 stateIp2B5<=#1 445;

				 //(430,446)
				 imgIp1B6 <= imagWorkingBuffer[430];
				 realIp1B6 <= realWorkingBuffer[430];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 430;
				 stateIp2B6<=#1 446;

				 //(431,447)
				 imgIp1B7 <= imagWorkingBuffer[431];
				 realIp1B7 <= realWorkingBuffer[431];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 431;
				 stateIp2B7<=#1 447;
			 end
			 157 : begin

				 //(448,464)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 448;
				 stateIp2B0<=#1 464;

				 //(449,465)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 449;
				 stateIp2B1<=#1 465;

				 //(450,466)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 450;
				 stateIp2B2<=#1 466;

				 //(451,467)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 451;
				 stateIp2B3<=#1 467;

				 //(452,468)
				 imgIp1B4 <= imagWorkingBuffer[452];
				 realIp1B4 <= realWorkingBuffer[452];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 452;
				 stateIp2B4<=#1 468;

				 //(453,469)
				 imgIp1B5 <= imagWorkingBuffer[453];
				 realIp1B5 <= realWorkingBuffer[453];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 453;
				 stateIp2B5<=#1 469;

				 //(454,470)
				 imgIp1B6 <= imagWorkingBuffer[454];
				 realIp1B6 <= realWorkingBuffer[454];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 454;
				 stateIp2B6<=#1 470;

				 //(455,471)
				 imgIp1B7 <= imagWorkingBuffer[455];
				 realIp1B7 <= realWorkingBuffer[455];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 455;
				 stateIp2B7<=#1 471;
			 end
			 158 : begin

				 //(456,472)
				 imgIp1B0 <= imagWorkingBuffer[456];
				 realIp1B0 <= realWorkingBuffer[456];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 456;
				 stateIp2B0<=#1 472;

				 //(457,473)
				 imgIp1B1 <= imagWorkingBuffer[457];
				 realIp1B1 <= realWorkingBuffer[457];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 457;
				 stateIp2B1<=#1 473;

				 //(458,474)
				 imgIp1B2 <= imagWorkingBuffer[458];
				 realIp1B2 <= realWorkingBuffer[458];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 458;
				 stateIp2B2<=#1 474;

				 //(459,475)
				 imgIp1B3 <= imagWorkingBuffer[459];
				 realIp1B3 <= realWorkingBuffer[459];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 459;
				 stateIp2B3<=#1 475;

				 //(460,476)
				 imgIp1B4 <= imagWorkingBuffer[460];
				 realIp1B4 <= realWorkingBuffer[460];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 460;
				 stateIp2B4<=#1 476;

				 //(461,477)
				 imgIp1B5 <= imagWorkingBuffer[461];
				 realIp1B5 <= realWorkingBuffer[461];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 461;
				 stateIp2B5<=#1 477;

				 //(462,478)
				 imgIp1B6 <= imagWorkingBuffer[462];
				 realIp1B6 <= realWorkingBuffer[462];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 462;
				 stateIp2B6<=#1 478;

				 //(463,479)
				 imgIp1B7 <= imagWorkingBuffer[463];
				 realIp1B7 <= realWorkingBuffer[463];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 463;
				 stateIp2B7<=#1 479;
			 end
			 159 : begin

				 //(480,496)
				 imgIp1B0 <= imagWorkingBuffer[480];
				 realIp1B0 <= realWorkingBuffer[480];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 480;
				 stateIp2B0<=#1 496;

				 //(481,497)
				 imgIp1B1 <= imagWorkingBuffer[481];
				 realIp1B1 <= realWorkingBuffer[481];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=#1 0.980785;
				 twiddleFactorimgB1 <=#1 -0.19509;
				 stateIp1B1<=#1 481;
				 stateIp2B1<=#1 497;

				 //(482,498)
				 imgIp1B2 <= imagWorkingBuffer[482];
				 realIp1B2 <= realWorkingBuffer[482];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=#1 0.92388;
				 twiddleFactorimgB2 <=#1 -0.382683;
				 stateIp1B2<=#1 482;
				 stateIp2B2<=#1 498;

				 //(483,499)
				 imgIp1B3 <= imagWorkingBuffer[483];
				 realIp1B3 <= realWorkingBuffer[483];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=#1 0.83147;
				 twiddleFactorimgB3 <=#1 -0.55557;
				 stateIp1B3<=#1 483;
				 stateIp2B3<=#1 499;

				 //(484,500)
				 imgIp1B4 <= imagWorkingBuffer[484];
				 realIp1B4 <= realWorkingBuffer[484];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=#1 0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 484;
				 stateIp2B4<=#1 500;

				 //(485,501)
				 imgIp1B5 <= imagWorkingBuffer[485];
				 realIp1B5 <= realWorkingBuffer[485];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=#1 0.55557;
				 twiddleFactorimgB5 <=#1 -0.83147;
				 stateIp1B5<=#1 485;
				 stateIp2B5<=#1 501;

				 //(486,502)
				 imgIp1B6 <= imagWorkingBuffer[486];
				 realIp1B6 <= realWorkingBuffer[486];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=#1 0.382683;
				 twiddleFactorimgB6 <=#1 -0.92388;
				 stateIp1B6<=#1 486;
				 stateIp2B6<=#1 502;

				 //(487,503)
				 imgIp1B7 <= imagWorkingBuffer[487];
				 realIp1B7 <= realWorkingBuffer[487];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=#1 0.19509;
				 twiddleFactorimgB7 <=#1 -0.980785;
				 stateIp1B7<=#1 487;
				 stateIp2B7<=#1 503;
			 end
			 160 : begin

				 //(488,504)
				 imgIp1B0 <= imagWorkingBuffer[488];
				 realIp1B0 <= realWorkingBuffer[488];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 488;
				 stateIp2B0<=#1 504;

				 //(489,505)
				 imgIp1B1 <= imagWorkingBuffer[489];
				 realIp1B1 <= realWorkingBuffer[489];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=#1 -0.19509;
				 twiddleFactorimgB1 <=#1 -0.980785;
				 stateIp1B1<=#1 489;
				 stateIp2B1<=#1 505;

				 //(490,506)
				 imgIp1B2 <= imagWorkingBuffer[490];
				 realIp1B2 <= realWorkingBuffer[490];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=#1 -0.382683;
				 twiddleFactorimgB2 <=#1 -0.92388;
				 stateIp1B2<=#1 490;
				 stateIp2B2<=#1 506;

				 //(491,507)
				 imgIp1B3 <= imagWorkingBuffer[491];
				 realIp1B3 <= realWorkingBuffer[491];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=#1 -0.55557;
				 twiddleFactorimgB3 <=#1 -0.83147;
				 stateIp1B3<=#1 491;
				 stateIp2B3<=#1 507;

				 //(492,508)
				 imgIp1B4 <= imagWorkingBuffer[492];
				 realIp1B4 <= realWorkingBuffer[492];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 -0.707107;
				 twiddleFactorimgB4 <=#1 -0.707107;
				 stateIp1B4<=#1 492;
				 stateIp2B4<=#1 508;

				 //(493,509)
				 imgIp1B5 <= imagWorkingBuffer[493];
				 realIp1B5 <= realWorkingBuffer[493];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 -0.83147;
				 twiddleFactorimgB5 <=#1 -0.55557;
				 stateIp1B5<=#1 493;
				 stateIp2B5<=#1 509;

				 //(494,510)
				 imgIp1B6 <= imagWorkingBuffer[494];
				 realIp1B6 <= realWorkingBuffer[494];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 -0.92388;
				 twiddleFactorimgB6 <=#1 -0.382683;
				 stateIp1B6<=#1 494;
				 stateIp2B6<=#1 510;

				 //(495,511)
				 imgIp1B7 <= imagWorkingBuffer[495];
				 realIp1B7 <= realWorkingBuffer[495];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.980785;
				 twiddleFactorimgB7 <=#1 -0.19509;
				 stateIp1B7<=#1 495;
				 stateIp2B7<=#1 511;
			 end
			 161 : begin

				 //(0,32)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[32];
				 realIp2B0 <= realWorkingBuffer[32];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 32;

				 //(1,33)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[33];
				 realIp2B1 <= realWorkingBuffer[33];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 33;

				 //(2,34)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[34];
				 realIp2B2 <= realWorkingBuffer[34];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 34;

				 //(3,35)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[35];
				 realIp2B3 <= realWorkingBuffer[35];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 35;

				 //(4,36)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[36];
				 realIp2B4 <= realWorkingBuffer[36];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 4;
				 stateIp2B4<=#1 36;

				 //(5,37)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[37];
				 realIp2B5 <= realWorkingBuffer[37];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 5;
				 stateIp2B5<=#1 37;

				 //(6,38)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[38];
				 realIp2B6 <= realWorkingBuffer[38];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 6;
				 stateIp2B6<=#1 38;

				 //(7,39)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[39];
				 realIp2B7 <= realWorkingBuffer[39];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 7;
				 stateIp2B7<=#1 39;
			 end
			 162 : begin

				 //(8,40)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[40];
				 realIp2B0 <= realWorkingBuffer[40];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 8;
				 stateIp2B0<=#1 40;

				 //(9,41)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[41];
				 realIp2B1 <= realWorkingBuffer[41];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 9;
				 stateIp2B1<=#1 41;

				 //(10,42)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[42];
				 realIp2B2 <= realWorkingBuffer[42];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 10;
				 stateIp2B2<=#1 42;

				 //(11,43)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[43];
				 realIp2B3 <= realWorkingBuffer[43];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 11;
				 stateIp2B3<=#1 43;

				 //(12,44)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[44];
				 realIp2B4 <= realWorkingBuffer[44];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 12;
				 stateIp2B4<=#1 44;

				 //(13,45)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[45];
				 realIp2B5 <= realWorkingBuffer[45];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 13;
				 stateIp2B5<=#1 45;

				 //(14,46)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[46];
				 realIp2B6 <= realWorkingBuffer[46];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 14;
				 stateIp2B6<=#1 46;

				 //(15,47)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[47];
				 realIp2B7 <= realWorkingBuffer[47];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 15;
				 stateIp2B7<=#1 47;
			 end
			 163 : begin

				 //(16,48)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[48];
				 realIp2B0 <= realWorkingBuffer[48];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 48;

				 //(17,49)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[49];
				 realIp2B1 <= realWorkingBuffer[49];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 49;

				 //(18,50)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[50];
				 realIp2B2 <= realWorkingBuffer[50];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 18;
				 stateIp2B2<=#1 50;

				 //(19,51)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[51];
				 realIp2B3 <= realWorkingBuffer[51];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 19;
				 stateIp2B3<=#1 51;

				 //(20,52)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[52];
				 realIp2B4 <= realWorkingBuffer[52];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 20;
				 stateIp2B4<=#1 52;

				 //(21,53)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[53];
				 realIp2B5 <= realWorkingBuffer[53];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 21;
				 stateIp2B5<=#1 53;

				 //(22,54)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[54];
				 realIp2B6 <= realWorkingBuffer[54];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 22;
				 stateIp2B6<=#1 54;

				 //(23,55)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[55];
				 realIp2B7 <= realWorkingBuffer[55];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 23;
				 stateIp2B7<=#1 55;
			 end
			 164 : begin

				 //(24,56)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[56];
				 realIp2B0 <= realWorkingBuffer[56];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 24;
				 stateIp2B0<=#1 56;

				 //(25,57)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[57];
				 realIp2B1 <= realWorkingBuffer[57];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 25;
				 stateIp2B1<=#1 57;

				 //(26,58)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[58];
				 realIp2B2 <= realWorkingBuffer[58];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 26;
				 stateIp2B2<=#1 58;

				 //(27,59)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[59];
				 realIp2B3 <= realWorkingBuffer[59];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 27;
				 stateIp2B3<=#1 59;

				 //(28,60)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[60];
				 realIp2B4 <= realWorkingBuffer[60];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 28;
				 stateIp2B4<=#1 60;

				 //(29,61)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[61];
				 realIp2B5 <= realWorkingBuffer[61];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 29;
				 stateIp2B5<=#1 61;

				 //(30,62)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[62];
				 realIp2B6 <= realWorkingBuffer[62];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 30;
				 stateIp2B6<=#1 62;

				 //(31,63)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[63];
				 realIp2B7 <= realWorkingBuffer[63];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 31;
				 stateIp2B7<=#1 63;
			 end
			 165 : begin

				 //(64,96)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[96];
				 realIp2B0 <= realWorkingBuffer[96];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 96;

				 //(65,97)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[97];
				 realIp2B1 <= realWorkingBuffer[97];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 97;

				 //(66,98)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[98];
				 realIp2B2 <= realWorkingBuffer[98];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 66;
				 stateIp2B2<=#1 98;

				 //(67,99)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[99];
				 realIp2B3 <= realWorkingBuffer[99];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 67;
				 stateIp2B3<=#1 99;

				 //(68,100)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[100];
				 realIp2B4 <= realWorkingBuffer[100];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 68;
				 stateIp2B4<=#1 100;

				 //(69,101)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[101];
				 realIp2B5 <= realWorkingBuffer[101];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 69;
				 stateIp2B5<=#1 101;

				 //(70,102)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[102];
				 realIp2B6 <= realWorkingBuffer[102];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 70;
				 stateIp2B6<=#1 102;

				 //(71,103)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[103];
				 realIp2B7 <= realWorkingBuffer[103];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 71;
				 stateIp2B7<=#1 103;
			 end
			 166 : begin

				 //(72,104)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[104];
				 realIp2B0 <= realWorkingBuffer[104];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 72;
				 stateIp2B0<=#1 104;

				 //(73,105)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[105];
				 realIp2B1 <= realWorkingBuffer[105];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 73;
				 stateIp2B1<=#1 105;

				 //(74,106)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[106];
				 realIp2B2 <= realWorkingBuffer[106];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 74;
				 stateIp2B2<=#1 106;

				 //(75,107)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[107];
				 realIp2B3 <= realWorkingBuffer[107];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 75;
				 stateIp2B3<=#1 107;

				 //(76,108)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 76;
				 stateIp2B4<=#1 108;

				 //(77,109)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 77;
				 stateIp2B5<=#1 109;

				 //(78,110)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 78;
				 stateIp2B6<=#1 110;

				 //(79,111)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 79;
				 stateIp2B7<=#1 111;
			 end
			 167 : begin

				 //(80,112)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[112];
				 realIp2B0 <= realWorkingBuffer[112];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 112;

				 //(81,113)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[113];
				 realIp2B1 <= realWorkingBuffer[113];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 81;
				 stateIp2B1<=#1 113;

				 //(82,114)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[114];
				 realIp2B2 <= realWorkingBuffer[114];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 82;
				 stateIp2B2<=#1 114;

				 //(83,115)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[115];
				 realIp2B3 <= realWorkingBuffer[115];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 83;
				 stateIp2B3<=#1 115;

				 //(84,116)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[116];
				 realIp2B4 <= realWorkingBuffer[116];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 84;
				 stateIp2B4<=#1 116;

				 //(85,117)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[117];
				 realIp2B5 <= realWorkingBuffer[117];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 85;
				 stateIp2B5<=#1 117;

				 //(86,118)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[118];
				 realIp2B6 <= realWorkingBuffer[118];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 86;
				 stateIp2B6<=#1 118;

				 //(87,119)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[119];
				 realIp2B7 <= realWorkingBuffer[119];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 87;
				 stateIp2B7<=#1 119;
			 end
			 168 : begin

				 //(88,120)
				 imgIp1B0 <= imagWorkingBuffer[88];
				 realIp1B0 <= realWorkingBuffer[88];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 88;
				 stateIp2B0<=#1 120;

				 //(89,121)
				 imgIp1B1 <= imagWorkingBuffer[89];
				 realIp1B1 <= realWorkingBuffer[89];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 89;
				 stateIp2B1<=#1 121;

				 //(90,122)
				 imgIp1B2 <= imagWorkingBuffer[90];
				 realIp1B2 <= realWorkingBuffer[90];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 90;
				 stateIp2B2<=#1 122;

				 //(91,123)
				 imgIp1B3 <= imagWorkingBuffer[91];
				 realIp1B3 <= realWorkingBuffer[91];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 91;
				 stateIp2B3<=#1 123;

				 //(92,124)
				 imgIp1B4 <= imagWorkingBuffer[92];
				 realIp1B4 <= realWorkingBuffer[92];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 92;
				 stateIp2B4<=#1 124;

				 //(93,125)
				 imgIp1B5 <= imagWorkingBuffer[93];
				 realIp1B5 <= realWorkingBuffer[93];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 93;
				 stateIp2B5<=#1 125;

				 //(94,126)
				 imgIp1B6 <= imagWorkingBuffer[94];
				 realIp1B6 <= realWorkingBuffer[94];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 94;
				 stateIp2B6<=#1 126;

				 //(95,127)
				 imgIp1B7 <= imagWorkingBuffer[95];
				 realIp1B7 <= realWorkingBuffer[95];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 95;
				 stateIp2B7<=#1 127;
			 end
			 169 : begin

				 //(128,160)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[160];
				 realIp2B0 <= realWorkingBuffer[160];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 160;

				 //(129,161)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[161];
				 realIp2B1 <= realWorkingBuffer[161];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 161;

				 //(130,162)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[162];
				 realIp2B2 <= realWorkingBuffer[162];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 130;
				 stateIp2B2<=#1 162;

				 //(131,163)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[163];
				 realIp2B3 <= realWorkingBuffer[163];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 131;
				 stateIp2B3<=#1 163;

				 //(132,164)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[164];
				 realIp2B4 <= realWorkingBuffer[164];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 132;
				 stateIp2B4<=#1 164;

				 //(133,165)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[165];
				 realIp2B5 <= realWorkingBuffer[165];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 133;
				 stateIp2B5<=#1 165;

				 //(134,166)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[166];
				 realIp2B6 <= realWorkingBuffer[166];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 134;
				 stateIp2B6<=#1 166;

				 //(135,167)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[167];
				 realIp2B7 <= realWorkingBuffer[167];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 135;
				 stateIp2B7<=#1 167;
			 end
			 170 : begin

				 //(136,168)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[168];
				 realIp2B0 <= realWorkingBuffer[168];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 136;
				 stateIp2B0<=#1 168;

				 //(137,169)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[169];
				 realIp2B1 <= realWorkingBuffer[169];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 137;
				 stateIp2B1<=#1 169;

				 //(138,170)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[170];
				 realIp2B2 <= realWorkingBuffer[170];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 138;
				 stateIp2B2<=#1 170;

				 //(139,171)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[171];
				 realIp2B3 <= realWorkingBuffer[171];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 139;
				 stateIp2B3<=#1 171;

				 //(140,172)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 140;
				 stateIp2B4<=#1 172;

				 //(141,173)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 141;
				 stateIp2B5<=#1 173;

				 //(142,174)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 142;
				 stateIp2B6<=#1 174;

				 //(143,175)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 143;
				 stateIp2B7<=#1 175;
			 end
			 171 : begin

				 //(144,176)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[176];
				 realIp2B0 <= realWorkingBuffer[176];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 176;

				 //(145,177)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[177];
				 realIp2B1 <= realWorkingBuffer[177];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 145;
				 stateIp2B1<=#1 177;

				 //(146,178)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[178];
				 realIp2B2 <= realWorkingBuffer[178];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 146;
				 stateIp2B2<=#1 178;

				 //(147,179)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[179];
				 realIp2B3 <= realWorkingBuffer[179];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 147;
				 stateIp2B3<=#1 179;

				 //(148,180)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[180];
				 realIp2B4 <= realWorkingBuffer[180];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 148;
				 stateIp2B4<=#1 180;

				 //(149,181)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[181];
				 realIp2B5 <= realWorkingBuffer[181];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 149;
				 stateIp2B5<=#1 181;

				 //(150,182)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[182];
				 realIp2B6 <= realWorkingBuffer[182];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 150;
				 stateIp2B6<=#1 182;

				 //(151,183)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[183];
				 realIp2B7 <= realWorkingBuffer[183];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 151;
				 stateIp2B7<=#1 183;
			 end
			 172 : begin

				 //(152,184)
				 imgIp1B0 <= imagWorkingBuffer[152];
				 realIp1B0 <= realWorkingBuffer[152];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 152;
				 stateIp2B0<=#1 184;

				 //(153,185)
				 imgIp1B1 <= imagWorkingBuffer[153];
				 realIp1B1 <= realWorkingBuffer[153];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 153;
				 stateIp2B1<=#1 185;

				 //(154,186)
				 imgIp1B2 <= imagWorkingBuffer[154];
				 realIp1B2 <= realWorkingBuffer[154];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 154;
				 stateIp2B2<=#1 186;

				 //(155,187)
				 imgIp1B3 <= imagWorkingBuffer[155];
				 realIp1B3 <= realWorkingBuffer[155];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 155;
				 stateIp2B3<=#1 187;

				 //(156,188)
				 imgIp1B4 <= imagWorkingBuffer[156];
				 realIp1B4 <= realWorkingBuffer[156];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 156;
				 stateIp2B4<=#1 188;

				 //(157,189)
				 imgIp1B5 <= imagWorkingBuffer[157];
				 realIp1B5 <= realWorkingBuffer[157];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 157;
				 stateIp2B5<=#1 189;

				 //(158,190)
				 imgIp1B6 <= imagWorkingBuffer[158];
				 realIp1B6 <= realWorkingBuffer[158];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 158;
				 stateIp2B6<=#1 190;

				 //(159,191)
				 imgIp1B7 <= imagWorkingBuffer[159];
				 realIp1B7 <= realWorkingBuffer[159];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 159;
				 stateIp2B7<=#1 191;
			 end
			 173 : begin

				 //(192,224)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[224];
				 realIp2B0 <= realWorkingBuffer[224];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 224;

				 //(193,225)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[225];
				 realIp2B1 <= realWorkingBuffer[225];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 193;
				 stateIp2B1<=#1 225;

				 //(194,226)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[226];
				 realIp2B2 <= realWorkingBuffer[226];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 194;
				 stateIp2B2<=#1 226;

				 //(195,227)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[227];
				 realIp2B3 <= realWorkingBuffer[227];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 195;
				 stateIp2B3<=#1 227;

				 //(196,228)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[228];
				 realIp2B4 <= realWorkingBuffer[228];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 196;
				 stateIp2B4<=#1 228;

				 //(197,229)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[229];
				 realIp2B5 <= realWorkingBuffer[229];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 197;
				 stateIp2B5<=#1 229;

				 //(198,230)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[230];
				 realIp2B6 <= realWorkingBuffer[230];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 198;
				 stateIp2B6<=#1 230;

				 //(199,231)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[231];
				 realIp2B7 <= realWorkingBuffer[231];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 199;
				 stateIp2B7<=#1 231;
			 end
			 174 : begin

				 //(200,232)
				 imgIp1B0 <= imagWorkingBuffer[200];
				 realIp1B0 <= realWorkingBuffer[200];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 200;
				 stateIp2B0<=#1 232;

				 //(201,233)
				 imgIp1B1 <= imagWorkingBuffer[201];
				 realIp1B1 <= realWorkingBuffer[201];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 201;
				 stateIp2B1<=#1 233;

				 //(202,234)
				 imgIp1B2 <= imagWorkingBuffer[202];
				 realIp1B2 <= realWorkingBuffer[202];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 202;
				 stateIp2B2<=#1 234;

				 //(203,235)
				 imgIp1B3 <= imagWorkingBuffer[203];
				 realIp1B3 <= realWorkingBuffer[203];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 203;
				 stateIp2B3<=#1 235;

				 //(204,236)
				 imgIp1B4 <= imagWorkingBuffer[204];
				 realIp1B4 <= realWorkingBuffer[204];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 204;
				 stateIp2B4<=#1 236;

				 //(205,237)
				 imgIp1B5 <= imagWorkingBuffer[205];
				 realIp1B5 <= realWorkingBuffer[205];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 205;
				 stateIp2B5<=#1 237;

				 //(206,238)
				 imgIp1B6 <= imagWorkingBuffer[206];
				 realIp1B6 <= realWorkingBuffer[206];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 206;
				 stateIp2B6<=#1 238;

				 //(207,239)
				 imgIp1B7 <= imagWorkingBuffer[207];
				 realIp1B7 <= realWorkingBuffer[207];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 207;
				 stateIp2B7<=#1 239;
			 end
			 175 : begin

				 //(208,240)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 208;
				 stateIp2B0<=#1 240;

				 //(209,241)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 209;
				 stateIp2B1<=#1 241;

				 //(210,242)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 210;
				 stateIp2B2<=#1 242;

				 //(211,243)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 211;
				 stateIp2B3<=#1 243;

				 //(212,244)
				 imgIp1B4 <= imagWorkingBuffer[212];
				 realIp1B4 <= realWorkingBuffer[212];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 212;
				 stateIp2B4<=#1 244;

				 //(213,245)
				 imgIp1B5 <= imagWorkingBuffer[213];
				 realIp1B5 <= realWorkingBuffer[213];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 213;
				 stateIp2B5<=#1 245;

				 //(214,246)
				 imgIp1B6 <= imagWorkingBuffer[214];
				 realIp1B6 <= realWorkingBuffer[214];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 214;
				 stateIp2B6<=#1 246;

				 //(215,247)
				 imgIp1B7 <= imagWorkingBuffer[215];
				 realIp1B7 <= realWorkingBuffer[215];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 215;
				 stateIp2B7<=#1 247;
			 end
			 176 : begin

				 //(216,248)
				 imgIp1B0 <= imagWorkingBuffer[216];
				 realIp1B0 <= realWorkingBuffer[216];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 216;
				 stateIp2B0<=#1 248;

				 //(217,249)
				 imgIp1B1 <= imagWorkingBuffer[217];
				 realIp1B1 <= realWorkingBuffer[217];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 217;
				 stateIp2B1<=#1 249;

				 //(218,250)
				 imgIp1B2 <= imagWorkingBuffer[218];
				 realIp1B2 <= realWorkingBuffer[218];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 218;
				 stateIp2B2<=#1 250;

				 //(219,251)
				 imgIp1B3 <= imagWorkingBuffer[219];
				 realIp1B3 <= realWorkingBuffer[219];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 219;
				 stateIp2B3<=#1 251;

				 //(220,252)
				 imgIp1B4 <= imagWorkingBuffer[220];
				 realIp1B4 <= realWorkingBuffer[220];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 220;
				 stateIp2B4<=#1 252;

				 //(221,253)
				 imgIp1B5 <= imagWorkingBuffer[221];
				 realIp1B5 <= realWorkingBuffer[221];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 221;
				 stateIp2B5<=#1 253;

				 //(222,254)
				 imgIp1B6 <= imagWorkingBuffer[222];
				 realIp1B6 <= realWorkingBuffer[222];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 222;
				 stateIp2B6<=#1 254;

				 //(223,255)
				 imgIp1B7 <= imagWorkingBuffer[223];
				 realIp1B7 <= realWorkingBuffer[223];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 223;
				 stateIp2B7<=#1 255;
			 end
			 177 : begin

				 //(256,288)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[288];
				 realIp2B0 <= realWorkingBuffer[288];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 288;

				 //(257,289)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[289];
				 realIp2B1 <= realWorkingBuffer[289];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 289;

				 //(258,290)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[290];
				 realIp2B2 <= realWorkingBuffer[290];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 258;
				 stateIp2B2<=#1 290;

				 //(259,291)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[291];
				 realIp2B3 <= realWorkingBuffer[291];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 259;
				 stateIp2B3<=#1 291;

				 //(260,292)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[292];
				 realIp2B4 <= realWorkingBuffer[292];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 260;
				 stateIp2B4<=#1 292;

				 //(261,293)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[293];
				 realIp2B5 <= realWorkingBuffer[293];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 261;
				 stateIp2B5<=#1 293;

				 //(262,294)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[294];
				 realIp2B6 <= realWorkingBuffer[294];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 262;
				 stateIp2B6<=#1 294;

				 //(263,295)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[295];
				 realIp2B7 <= realWorkingBuffer[295];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 263;
				 stateIp2B7<=#1 295;
			 end
			 178 : begin

				 //(264,296)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[296];
				 realIp2B0 <= realWorkingBuffer[296];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 264;
				 stateIp2B0<=#1 296;

				 //(265,297)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[297];
				 realIp2B1 <= realWorkingBuffer[297];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 265;
				 stateIp2B1<=#1 297;

				 //(266,298)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[298];
				 realIp2B2 <= realWorkingBuffer[298];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 266;
				 stateIp2B2<=#1 298;

				 //(267,299)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[299];
				 realIp2B3 <= realWorkingBuffer[299];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 267;
				 stateIp2B3<=#1 299;

				 //(268,300)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 268;
				 stateIp2B4<=#1 300;

				 //(269,301)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 269;
				 stateIp2B5<=#1 301;

				 //(270,302)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 270;
				 stateIp2B6<=#1 302;

				 //(271,303)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 271;
				 stateIp2B7<=#1 303;
			 end
			 179 : begin

				 //(272,304)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[304];
				 realIp2B0 <= realWorkingBuffer[304];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 304;

				 //(273,305)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[305];
				 realIp2B1 <= realWorkingBuffer[305];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 273;
				 stateIp2B1<=#1 305;

				 //(274,306)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[306];
				 realIp2B2 <= realWorkingBuffer[306];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 274;
				 stateIp2B2<=#1 306;

				 //(275,307)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[307];
				 realIp2B3 <= realWorkingBuffer[307];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 275;
				 stateIp2B3<=#1 307;

				 //(276,308)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[308];
				 realIp2B4 <= realWorkingBuffer[308];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 276;
				 stateIp2B4<=#1 308;

				 //(277,309)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[309];
				 realIp2B5 <= realWorkingBuffer[309];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 277;
				 stateIp2B5<=#1 309;

				 //(278,310)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[310];
				 realIp2B6 <= realWorkingBuffer[310];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 278;
				 stateIp2B6<=#1 310;

				 //(279,311)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[311];
				 realIp2B7 <= realWorkingBuffer[311];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 279;
				 stateIp2B7<=#1 311;
			 end
			 180 : begin

				 //(280,312)
				 imgIp1B0 <= imagWorkingBuffer[280];
				 realIp1B0 <= realWorkingBuffer[280];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 280;
				 stateIp2B0<=#1 312;

				 //(281,313)
				 imgIp1B1 <= imagWorkingBuffer[281];
				 realIp1B1 <= realWorkingBuffer[281];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 281;
				 stateIp2B1<=#1 313;

				 //(282,314)
				 imgIp1B2 <= imagWorkingBuffer[282];
				 realIp1B2 <= realWorkingBuffer[282];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 282;
				 stateIp2B2<=#1 314;

				 //(283,315)
				 imgIp1B3 <= imagWorkingBuffer[283];
				 realIp1B3 <= realWorkingBuffer[283];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 283;
				 stateIp2B3<=#1 315;

				 //(284,316)
				 imgIp1B4 <= imagWorkingBuffer[284];
				 realIp1B4 <= realWorkingBuffer[284];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 284;
				 stateIp2B4<=#1 316;

				 //(285,317)
				 imgIp1B5 <= imagWorkingBuffer[285];
				 realIp1B5 <= realWorkingBuffer[285];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 285;
				 stateIp2B5<=#1 317;

				 //(286,318)
				 imgIp1B6 <= imagWorkingBuffer[286];
				 realIp1B6 <= realWorkingBuffer[286];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 286;
				 stateIp2B6<=#1 318;

				 //(287,319)
				 imgIp1B7 <= imagWorkingBuffer[287];
				 realIp1B7 <= realWorkingBuffer[287];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 287;
				 stateIp2B7<=#1 319;
			 end
			 181 : begin

				 //(320,352)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[352];
				 realIp2B0 <= realWorkingBuffer[352];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 352;

				 //(321,353)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[353];
				 realIp2B1 <= realWorkingBuffer[353];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 321;
				 stateIp2B1<=#1 353;

				 //(322,354)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[354];
				 realIp2B2 <= realWorkingBuffer[354];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 322;
				 stateIp2B2<=#1 354;

				 //(323,355)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[355];
				 realIp2B3 <= realWorkingBuffer[355];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 323;
				 stateIp2B3<=#1 355;

				 //(324,356)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[356];
				 realIp2B4 <= realWorkingBuffer[356];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 324;
				 stateIp2B4<=#1 356;

				 //(325,357)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[357];
				 realIp2B5 <= realWorkingBuffer[357];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 325;
				 stateIp2B5<=#1 357;

				 //(326,358)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[358];
				 realIp2B6 <= realWorkingBuffer[358];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 326;
				 stateIp2B6<=#1 358;

				 //(327,359)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[359];
				 realIp2B7 <= realWorkingBuffer[359];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 327;
				 stateIp2B7<=#1 359;
			 end
			 182 : begin

				 //(328,360)
				 imgIp1B0 <= imagWorkingBuffer[328];
				 realIp1B0 <= realWorkingBuffer[328];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 328;
				 stateIp2B0<=#1 360;

				 //(329,361)
				 imgIp1B1 <= imagWorkingBuffer[329];
				 realIp1B1 <= realWorkingBuffer[329];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 329;
				 stateIp2B1<=#1 361;

				 //(330,362)
				 imgIp1B2 <= imagWorkingBuffer[330];
				 realIp1B2 <= realWorkingBuffer[330];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 330;
				 stateIp2B2<=#1 362;

				 //(331,363)
				 imgIp1B3 <= imagWorkingBuffer[331];
				 realIp1B3 <= realWorkingBuffer[331];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 331;
				 stateIp2B3<=#1 363;

				 //(332,364)
				 imgIp1B4 <= imagWorkingBuffer[332];
				 realIp1B4 <= realWorkingBuffer[332];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 332;
				 stateIp2B4<=#1 364;

				 //(333,365)
				 imgIp1B5 <= imagWorkingBuffer[333];
				 realIp1B5 <= realWorkingBuffer[333];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 333;
				 stateIp2B5<=#1 365;

				 //(334,366)
				 imgIp1B6 <= imagWorkingBuffer[334];
				 realIp1B6 <= realWorkingBuffer[334];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 334;
				 stateIp2B6<=#1 366;

				 //(335,367)
				 imgIp1B7 <= imagWorkingBuffer[335];
				 realIp1B7 <= realWorkingBuffer[335];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 335;
				 stateIp2B7<=#1 367;
			 end
			 183 : begin

				 //(336,368)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 336;
				 stateIp2B0<=#1 368;

				 //(337,369)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 337;
				 stateIp2B1<=#1 369;

				 //(338,370)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 338;
				 stateIp2B2<=#1 370;

				 //(339,371)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 339;
				 stateIp2B3<=#1 371;

				 //(340,372)
				 imgIp1B4 <= imagWorkingBuffer[340];
				 realIp1B4 <= realWorkingBuffer[340];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 340;
				 stateIp2B4<=#1 372;

				 //(341,373)
				 imgIp1B5 <= imagWorkingBuffer[341];
				 realIp1B5 <= realWorkingBuffer[341];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 341;
				 stateIp2B5<=#1 373;

				 //(342,374)
				 imgIp1B6 <= imagWorkingBuffer[342];
				 realIp1B6 <= realWorkingBuffer[342];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 342;
				 stateIp2B6<=#1 374;

				 //(343,375)
				 imgIp1B7 <= imagWorkingBuffer[343];
				 realIp1B7 <= realWorkingBuffer[343];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 343;
				 stateIp2B7<=#1 375;
			 end
			 184 : begin

				 //(344,376)
				 imgIp1B0 <= imagWorkingBuffer[344];
				 realIp1B0 <= realWorkingBuffer[344];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 344;
				 stateIp2B0<=#1 376;

				 //(345,377)
				 imgIp1B1 <= imagWorkingBuffer[345];
				 realIp1B1 <= realWorkingBuffer[345];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 345;
				 stateIp2B1<=#1 377;

				 //(346,378)
				 imgIp1B2 <= imagWorkingBuffer[346];
				 realIp1B2 <= realWorkingBuffer[346];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 346;
				 stateIp2B2<=#1 378;

				 //(347,379)
				 imgIp1B3 <= imagWorkingBuffer[347];
				 realIp1B3 <= realWorkingBuffer[347];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 347;
				 stateIp2B3<=#1 379;

				 //(348,380)
				 imgIp1B4 <= imagWorkingBuffer[348];
				 realIp1B4 <= realWorkingBuffer[348];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 348;
				 stateIp2B4<=#1 380;

				 //(349,381)
				 imgIp1B5 <= imagWorkingBuffer[349];
				 realIp1B5 <= realWorkingBuffer[349];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 349;
				 stateIp2B5<=#1 381;

				 //(350,382)
				 imgIp1B6 <= imagWorkingBuffer[350];
				 realIp1B6 <= realWorkingBuffer[350];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 350;
				 stateIp2B6<=#1 382;

				 //(351,383)
				 imgIp1B7 <= imagWorkingBuffer[351];
				 realIp1B7 <= realWorkingBuffer[351];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 351;
				 stateIp2B7<=#1 383;
			 end
			 185 : begin

				 //(384,416)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[416];
				 realIp2B0 <= realWorkingBuffer[416];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 416;

				 //(385,417)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[417];
				 realIp2B1 <= realWorkingBuffer[417];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 385;
				 stateIp2B1<=#1 417;

				 //(386,418)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[418];
				 realIp2B2 <= realWorkingBuffer[418];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 386;
				 stateIp2B2<=#1 418;

				 //(387,419)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[419];
				 realIp2B3 <= realWorkingBuffer[419];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 387;
				 stateIp2B3<=#1 419;

				 //(388,420)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[420];
				 realIp2B4 <= realWorkingBuffer[420];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 388;
				 stateIp2B4<=#1 420;

				 //(389,421)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[421];
				 realIp2B5 <= realWorkingBuffer[421];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 389;
				 stateIp2B5<=#1 421;

				 //(390,422)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[422];
				 realIp2B6 <= realWorkingBuffer[422];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 390;
				 stateIp2B6<=#1 422;

				 //(391,423)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[423];
				 realIp2B7 <= realWorkingBuffer[423];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 391;
				 stateIp2B7<=#1 423;
			 end
			 186 : begin

				 //(392,424)
				 imgIp1B0 <= imagWorkingBuffer[392];
				 realIp1B0 <= realWorkingBuffer[392];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 392;
				 stateIp2B0<=#1 424;

				 //(393,425)
				 imgIp1B1 <= imagWorkingBuffer[393];
				 realIp1B1 <= realWorkingBuffer[393];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 393;
				 stateIp2B1<=#1 425;

				 //(394,426)
				 imgIp1B2 <= imagWorkingBuffer[394];
				 realIp1B2 <= realWorkingBuffer[394];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 394;
				 stateIp2B2<=#1 426;

				 //(395,427)
				 imgIp1B3 <= imagWorkingBuffer[395];
				 realIp1B3 <= realWorkingBuffer[395];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 395;
				 stateIp2B3<=#1 427;

				 //(396,428)
				 imgIp1B4 <= imagWorkingBuffer[396];
				 realIp1B4 <= realWorkingBuffer[396];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 396;
				 stateIp2B4<=#1 428;

				 //(397,429)
				 imgIp1B5 <= imagWorkingBuffer[397];
				 realIp1B5 <= realWorkingBuffer[397];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 397;
				 stateIp2B5<=#1 429;

				 //(398,430)
				 imgIp1B6 <= imagWorkingBuffer[398];
				 realIp1B6 <= realWorkingBuffer[398];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 398;
				 stateIp2B6<=#1 430;

				 //(399,431)
				 imgIp1B7 <= imagWorkingBuffer[399];
				 realIp1B7 <= realWorkingBuffer[399];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 399;
				 stateIp2B7<=#1 431;
			 end
			 187 : begin

				 //(400,432)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 400;
				 stateIp2B0<=#1 432;

				 //(401,433)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 401;
				 stateIp2B1<=#1 433;

				 //(402,434)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 402;
				 stateIp2B2<=#1 434;

				 //(403,435)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 403;
				 stateIp2B3<=#1 435;

				 //(404,436)
				 imgIp1B4 <= imagWorkingBuffer[404];
				 realIp1B4 <= realWorkingBuffer[404];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 404;
				 stateIp2B4<=#1 436;

				 //(405,437)
				 imgIp1B5 <= imagWorkingBuffer[405];
				 realIp1B5 <= realWorkingBuffer[405];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 405;
				 stateIp2B5<=#1 437;

				 //(406,438)
				 imgIp1B6 <= imagWorkingBuffer[406];
				 realIp1B6 <= realWorkingBuffer[406];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 406;
				 stateIp2B6<=#1 438;

				 //(407,439)
				 imgIp1B7 <= imagWorkingBuffer[407];
				 realIp1B7 <= realWorkingBuffer[407];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 407;
				 stateIp2B7<=#1 439;
			 end
			 188 : begin

				 //(408,440)
				 imgIp1B0 <= imagWorkingBuffer[408];
				 realIp1B0 <= realWorkingBuffer[408];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 408;
				 stateIp2B0<=#1 440;

				 //(409,441)
				 imgIp1B1 <= imagWorkingBuffer[409];
				 realIp1B1 <= realWorkingBuffer[409];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 409;
				 stateIp2B1<=#1 441;

				 //(410,442)
				 imgIp1B2 <= imagWorkingBuffer[410];
				 realIp1B2 <= realWorkingBuffer[410];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 410;
				 stateIp2B2<=#1 442;

				 //(411,443)
				 imgIp1B3 <= imagWorkingBuffer[411];
				 realIp1B3 <= realWorkingBuffer[411];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 411;
				 stateIp2B3<=#1 443;

				 //(412,444)
				 imgIp1B4 <= imagWorkingBuffer[412];
				 realIp1B4 <= realWorkingBuffer[412];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 412;
				 stateIp2B4<=#1 444;

				 //(413,445)
				 imgIp1B5 <= imagWorkingBuffer[413];
				 realIp1B5 <= realWorkingBuffer[413];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 413;
				 stateIp2B5<=#1 445;

				 //(414,446)
				 imgIp1B6 <= imagWorkingBuffer[414];
				 realIp1B6 <= realWorkingBuffer[414];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 414;
				 stateIp2B6<=#1 446;

				 //(415,447)
				 imgIp1B7 <= imagWorkingBuffer[415];
				 realIp1B7 <= realWorkingBuffer[415];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 415;
				 stateIp2B7<=#1 447;
			 end
			 189 : begin

				 //(448,480)
				 imgIp1B0 <= imagWorkingBuffer[448];
				 realIp1B0 <= realWorkingBuffer[448];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 448;
				 stateIp2B0<=#1 480;

				 //(449,481)
				 imgIp1B1 <= imagWorkingBuffer[449];
				 realIp1B1 <= realWorkingBuffer[449];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=#1 0.995185;
				 twiddleFactorimgB1 <=#1 -0.098017;
				 stateIp1B1<=#1 449;
				 stateIp2B1<=#1 481;

				 //(450,482)
				 imgIp1B2 <= imagWorkingBuffer[450];
				 realIp1B2 <= realWorkingBuffer[450];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=#1 0.980785;
				 twiddleFactorimgB2 <=#1 -0.19509;
				 stateIp1B2<=#1 450;
				 stateIp2B2<=#1 482;

				 //(451,483)
				 imgIp1B3 <= imagWorkingBuffer[451];
				 realIp1B3 <= realWorkingBuffer[451];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=#1 0.95694;
				 twiddleFactorimgB3 <=#1 -0.290285;
				 stateIp1B3<=#1 451;
				 stateIp2B3<=#1 483;

				 //(452,484)
				 imgIp1B4 <= imagWorkingBuffer[452];
				 realIp1B4 <= realWorkingBuffer[452];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=#1 0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 452;
				 stateIp2B4<=#1 484;

				 //(453,485)
				 imgIp1B5 <= imagWorkingBuffer[453];
				 realIp1B5 <= realWorkingBuffer[453];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=#1 0.881921;
				 twiddleFactorimgB5 <=#1 -0.471397;
				 stateIp1B5<=#1 453;
				 stateIp2B5<=#1 485;

				 //(454,486)
				 imgIp1B6 <= imagWorkingBuffer[454];
				 realIp1B6 <= realWorkingBuffer[454];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=#1 0.83147;
				 twiddleFactorimgB6 <=#1 -0.55557;
				 stateIp1B6<=#1 454;
				 stateIp2B6<=#1 486;

				 //(455,487)
				 imgIp1B7 <= imagWorkingBuffer[455];
				 realIp1B7 <= realWorkingBuffer[455];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=#1 0.77301;
				 twiddleFactorimgB7 <=#1 -0.634393;
				 stateIp1B7<=#1 455;
				 stateIp2B7<=#1 487;
			 end
			 190 : begin

				 //(456,488)
				 imgIp1B0 <= imagWorkingBuffer[456];
				 realIp1B0 <= realWorkingBuffer[456];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 456;
				 stateIp2B0<=#1 488;

				 //(457,489)
				 imgIp1B1 <= imagWorkingBuffer[457];
				 realIp1B1 <= realWorkingBuffer[457];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=#1 0.634393;
				 twiddleFactorimgB1 <=#1 -0.77301;
				 stateIp1B1<=#1 457;
				 stateIp2B1<=#1 489;

				 //(458,490)
				 imgIp1B2 <= imagWorkingBuffer[458];
				 realIp1B2 <= realWorkingBuffer[458];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=#1 0.55557;
				 twiddleFactorimgB2 <=#1 -0.83147;
				 stateIp1B2<=#1 458;
				 stateIp2B2<=#1 490;

				 //(459,491)
				 imgIp1B3 <= imagWorkingBuffer[459];
				 realIp1B3 <= realWorkingBuffer[459];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=#1 0.471397;
				 twiddleFactorimgB3 <=#1 -0.881921;
				 stateIp1B3<=#1 459;
				 stateIp2B3<=#1 491;

				 //(460,492)
				 imgIp1B4 <= imagWorkingBuffer[460];
				 realIp1B4 <= realWorkingBuffer[460];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=#1 0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 460;
				 stateIp2B4<=#1 492;

				 //(461,493)
				 imgIp1B5 <= imagWorkingBuffer[461];
				 realIp1B5 <= realWorkingBuffer[461];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=#1 0.290285;
				 twiddleFactorimgB5 <=#1 -0.95694;
				 stateIp1B5<=#1 461;
				 stateIp2B5<=#1 493;

				 //(462,494)
				 imgIp1B6 <= imagWorkingBuffer[462];
				 realIp1B6 <= realWorkingBuffer[462];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 0.19509;
				 twiddleFactorimgB6 <=#1 -0.980785;
				 stateIp1B6<=#1 462;
				 stateIp2B6<=#1 494;

				 //(463,495)
				 imgIp1B7 <= imagWorkingBuffer[463];
				 realIp1B7 <= realWorkingBuffer[463];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 0.098017;
				 twiddleFactorimgB7 <=#1 -0.995185;
				 stateIp1B7<=#1 463;
				 stateIp2B7<=#1 495;
			 end
			 191 : begin

				 //(464,496)
				 imgIp1B0 <= imagWorkingBuffer[464];
				 realIp1B0 <= realWorkingBuffer[464];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 464;
				 stateIp2B0<=#1 496;

				 //(465,497)
				 imgIp1B1 <= imagWorkingBuffer[465];
				 realIp1B1 <= realWorkingBuffer[465];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=#1 -0.098017;
				 twiddleFactorimgB1 <=#1 -0.995185;
				 stateIp1B1<=#1 465;
				 stateIp2B1<=#1 497;

				 //(466,498)
				 imgIp1B2 <= imagWorkingBuffer[466];
				 realIp1B2 <= realWorkingBuffer[466];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=#1 -0.19509;
				 twiddleFactorimgB2 <=#1 -0.980785;
				 stateIp1B2<=#1 466;
				 stateIp2B2<=#1 498;

				 //(467,499)
				 imgIp1B3 <= imagWorkingBuffer[467];
				 realIp1B3 <= realWorkingBuffer[467];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=#1 -0.290285;
				 twiddleFactorimgB3 <=#1 -0.95694;
				 stateIp1B3<=#1 467;
				 stateIp2B3<=#1 499;

				 //(468,500)
				 imgIp1B4 <= imagWorkingBuffer[468];
				 realIp1B4 <= realWorkingBuffer[468];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=#1 -0.382683;
				 twiddleFactorimgB4 <=#1 -0.92388;
				 stateIp1B4<=#1 468;
				 stateIp2B4<=#1 500;

				 //(469,501)
				 imgIp1B5 <= imagWorkingBuffer[469];
				 realIp1B5 <= realWorkingBuffer[469];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=#1 -0.471397;
				 twiddleFactorimgB5 <=#1 -0.881921;
				 stateIp1B5<=#1 469;
				 stateIp2B5<=#1 501;

				 //(470,502)
				 imgIp1B6 <= imagWorkingBuffer[470];
				 realIp1B6 <= realWorkingBuffer[470];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=#1 -0.55557;
				 twiddleFactorimgB6 <=#1 -0.83147;
				 stateIp1B6<=#1 470;
				 stateIp2B6<=#1 502;

				 //(471,503)
				 imgIp1B7 <= imagWorkingBuffer[471];
				 realIp1B7 <= realWorkingBuffer[471];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=#1 -0.634393;
				 twiddleFactorimgB7 <=#1 -0.77301;
				 stateIp1B7<=#1 471;
				 stateIp2B7<=#1 503;
			 end
			 192 : begin

				 //(472,504)
				 imgIp1B0 <= imagWorkingBuffer[472];
				 realIp1B0 <= realWorkingBuffer[472];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 472;
				 stateIp2B0<=#1 504;

				 //(473,505)
				 imgIp1B1 <= imagWorkingBuffer[473];
				 realIp1B1 <= realWorkingBuffer[473];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=#1 -0.77301;
				 twiddleFactorimgB1 <=#1 -0.634393;
				 stateIp1B1<=#1 473;
				 stateIp2B1<=#1 505;

				 //(474,506)
				 imgIp1B2 <= imagWorkingBuffer[474];
				 realIp1B2 <= realWorkingBuffer[474];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=#1 -0.83147;
				 twiddleFactorimgB2 <=#1 -0.55557;
				 stateIp1B2<=#1 474;
				 stateIp2B2<=#1 506;

				 //(475,507)
				 imgIp1B3 <= imagWorkingBuffer[475];
				 realIp1B3 <= realWorkingBuffer[475];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=#1 -0.881921;
				 twiddleFactorimgB3 <=#1 -0.471397;
				 stateIp1B3<=#1 475;
				 stateIp2B3<=#1 507;

				 //(476,508)
				 imgIp1B4 <= imagWorkingBuffer[476];
				 realIp1B4 <= realWorkingBuffer[476];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 -0.92388;
				 twiddleFactorimgB4 <=#1 -0.382683;
				 stateIp1B4<=#1 476;
				 stateIp2B4<=#1 508;

				 //(477,509)
				 imgIp1B5 <= imagWorkingBuffer[477];
				 realIp1B5 <= realWorkingBuffer[477];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 -0.95694;
				 twiddleFactorimgB5 <=#1 -0.290285;
				 stateIp1B5<=#1 477;
				 stateIp2B5<=#1 509;

				 //(478,510)
				 imgIp1B6 <= imagWorkingBuffer[478];
				 realIp1B6 <= realWorkingBuffer[478];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 -0.980785;
				 twiddleFactorimgB6 <=#1 -0.19509;
				 stateIp1B6<=#1 478;
				 stateIp2B6<=#1 510;

				 //(479,511)
				 imgIp1B7 <= imagWorkingBuffer[479];
				 realIp1B7 <= realWorkingBuffer[479];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.995185;
				 twiddleFactorimgB7 <=#1 -0.098017;
				 stateIp1B7<=#1 479;
				 stateIp2B7<=#1 511;
			 end
			 193 : begin

				 //(0,64)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[64];
				 realIp2B0 <= realWorkingBuffer[64];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 64;

				 //(1,65)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[65];
				 realIp2B1 <= realWorkingBuffer[65];
				 twiddleFactorRealB1 <=#1 0.998795;
				 twiddleFactorimgB1 <=#1 -0.049068;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 65;

				 //(2,66)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[66];
				 realIp2B2 <= realWorkingBuffer[66];
				 twiddleFactorRealB2 <=#1 0.995185;
				 twiddleFactorimgB2 <=#1 -0.098017;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 66;

				 //(3,67)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[67];
				 realIp2B3 <= realWorkingBuffer[67];
				 twiddleFactorRealB3 <=#1 0.989177;
				 twiddleFactorimgB3 <=#1 -0.14673;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 67;

				 //(4,68)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[68];
				 realIp2B4 <= realWorkingBuffer[68];
				 twiddleFactorRealB4 <=#1 0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 4;
				 stateIp2B4<=#1 68;

				 //(5,69)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[69];
				 realIp2B5 <= realWorkingBuffer[69];
				 twiddleFactorRealB5 <=#1 0.970031;
				 twiddleFactorimgB5 <=#1 -0.24298;
				 stateIp1B5<=#1 5;
				 stateIp2B5<=#1 69;

				 //(6,70)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[70];
				 realIp2B6 <= realWorkingBuffer[70];
				 twiddleFactorRealB6 <=#1 0.95694;
				 twiddleFactorimgB6 <=#1 -0.290285;
				 stateIp1B6<=#1 6;
				 stateIp2B6<=#1 70;

				 //(7,71)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[71];
				 realIp2B7 <= realWorkingBuffer[71];
				 twiddleFactorRealB7 <=#1 0.941544;
				 twiddleFactorimgB7 <=#1 -0.33689;
				 stateIp1B7<=#1 7;
				 stateIp2B7<=#1 71;
			 end
			 194 : begin

				 //(8,72)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[72];
				 realIp2B0 <= realWorkingBuffer[72];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 8;
				 stateIp2B0<=#1 72;

				 //(9,73)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[73];
				 realIp2B1 <= realWorkingBuffer[73];
				 twiddleFactorRealB1 <=#1 0.903989;
				 twiddleFactorimgB1 <=#1 -0.427555;
				 stateIp1B1<=#1 9;
				 stateIp2B1<=#1 73;

				 //(10,74)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[74];
				 realIp2B2 <= realWorkingBuffer[74];
				 twiddleFactorRealB2 <=#1 0.881921;
				 twiddleFactorimgB2 <=#1 -0.471397;
				 stateIp1B2<=#1 10;
				 stateIp2B2<=#1 74;

				 //(11,75)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[75];
				 realIp2B3 <= realWorkingBuffer[75];
				 twiddleFactorRealB3 <=#1 0.857729;
				 twiddleFactorimgB3 <=#1 -0.514103;
				 stateIp1B3<=#1 11;
				 stateIp2B3<=#1 75;

				 //(12,76)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[76];
				 realIp2B4 <= realWorkingBuffer[76];
				 twiddleFactorRealB4 <=#1 0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 12;
				 stateIp2B4<=#1 76;

				 //(13,77)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[77];
				 realIp2B5 <= realWorkingBuffer[77];
				 twiddleFactorRealB5 <=#1 0.803208;
				 twiddleFactorimgB5 <=#1 -0.595699;
				 stateIp1B5<=#1 13;
				 stateIp2B5<=#1 77;

				 //(14,78)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[78];
				 realIp2B6 <= realWorkingBuffer[78];
				 twiddleFactorRealB6 <=#1 0.77301;
				 twiddleFactorimgB6 <=#1 -0.634393;
				 stateIp1B6<=#1 14;
				 stateIp2B6<=#1 78;

				 //(15,79)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[79];
				 realIp2B7 <= realWorkingBuffer[79];
				 twiddleFactorRealB7 <=#1 0.740951;
				 twiddleFactorimgB7 <=#1 -0.671559;
				 stateIp1B7<=#1 15;
				 stateIp2B7<=#1 79;
			 end
			 195 : begin

				 //(16,80)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[80];
				 realIp2B0 <= realWorkingBuffer[80];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 80;

				 //(17,81)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[81];
				 realIp2B1 <= realWorkingBuffer[81];
				 twiddleFactorRealB1 <=#1 0.671559;
				 twiddleFactorimgB1 <=#1 -0.740951;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 81;

				 //(18,82)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[82];
				 realIp2B2 <= realWorkingBuffer[82];
				 twiddleFactorRealB2 <=#1 0.634393;
				 twiddleFactorimgB2 <=#1 -0.77301;
				 stateIp1B2<=#1 18;
				 stateIp2B2<=#1 82;

				 //(19,83)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[83];
				 realIp2B3 <= realWorkingBuffer[83];
				 twiddleFactorRealB3 <=#1 0.595699;
				 twiddleFactorimgB3 <=#1 -0.803208;
				 stateIp1B3<=#1 19;
				 stateIp2B3<=#1 83;

				 //(20,84)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[84];
				 realIp2B4 <= realWorkingBuffer[84];
				 twiddleFactorRealB4 <=#1 0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 20;
				 stateIp2B4<=#1 84;

				 //(21,85)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[85];
				 realIp2B5 <= realWorkingBuffer[85];
				 twiddleFactorRealB5 <=#1 0.514103;
				 twiddleFactorimgB5 <=#1 -0.857729;
				 stateIp1B5<=#1 21;
				 stateIp2B5<=#1 85;

				 //(22,86)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[86];
				 realIp2B6 <= realWorkingBuffer[86];
				 twiddleFactorRealB6 <=#1 0.471397;
				 twiddleFactorimgB6 <=#1 -0.881921;
				 stateIp1B6<=#1 22;
				 stateIp2B6<=#1 86;

				 //(23,87)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[87];
				 realIp2B7 <= realWorkingBuffer[87];
				 twiddleFactorRealB7 <=#1 0.427555;
				 twiddleFactorimgB7 <=#1 -0.903989;
				 stateIp1B7<=#1 23;
				 stateIp2B7<=#1 87;
			 end
			 196 : begin

				 //(24,88)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[88];
				 realIp2B0 <= realWorkingBuffer[88];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 24;
				 stateIp2B0<=#1 88;

				 //(25,89)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[89];
				 realIp2B1 <= realWorkingBuffer[89];
				 twiddleFactorRealB1 <=#1 0.33689;
				 twiddleFactorimgB1 <=#1 -0.941544;
				 stateIp1B1<=#1 25;
				 stateIp2B1<=#1 89;

				 //(26,90)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[90];
				 realIp2B2 <= realWorkingBuffer[90];
				 twiddleFactorRealB2 <=#1 0.290285;
				 twiddleFactorimgB2 <=#1 -0.95694;
				 stateIp1B2<=#1 26;
				 stateIp2B2<=#1 90;

				 //(27,91)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[91];
				 realIp2B3 <= realWorkingBuffer[91];
				 twiddleFactorRealB3 <=#1 0.24298;
				 twiddleFactorimgB3 <=#1 -0.970031;
				 stateIp1B3<=#1 27;
				 stateIp2B3<=#1 91;

				 //(28,92)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[92];
				 realIp2B4 <= realWorkingBuffer[92];
				 twiddleFactorRealB4 <=#1 0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 28;
				 stateIp2B4<=#1 92;

				 //(29,93)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[93];
				 realIp2B5 <= realWorkingBuffer[93];
				 twiddleFactorRealB5 <=#1 0.14673;
				 twiddleFactorimgB5 <=#1 -0.989177;
				 stateIp1B5<=#1 29;
				 stateIp2B5<=#1 93;

				 //(30,94)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[94];
				 realIp2B6 <= realWorkingBuffer[94];
				 twiddleFactorRealB6 <=#1 0.098017;
				 twiddleFactorimgB6 <=#1 -0.995185;
				 stateIp1B6<=#1 30;
				 stateIp2B6<=#1 94;

				 //(31,95)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[95];
				 realIp2B7 <= realWorkingBuffer[95];
				 twiddleFactorRealB7 <=#1 0.049068;
				 twiddleFactorimgB7 <=#1 -0.998795;
				 stateIp1B7<=#1 31;
				 stateIp2B7<=#1 95;
			 end
			 197 : begin

				 //(32,96)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[96];
				 realIp2B0 <= realWorkingBuffer[96];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 96;

				 //(33,97)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[97];
				 realIp2B1 <= realWorkingBuffer[97];
				 twiddleFactorRealB1 <=#1 -0.049068;
				 twiddleFactorimgB1 <=#1 -0.998795;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 97;

				 //(34,98)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[98];
				 realIp2B2 <= realWorkingBuffer[98];
				 twiddleFactorRealB2 <=#1 -0.098017;
				 twiddleFactorimgB2 <=#1 -0.995185;
				 stateIp1B2<=#1 34;
				 stateIp2B2<=#1 98;

				 //(35,99)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[99];
				 realIp2B3 <= realWorkingBuffer[99];
				 twiddleFactorRealB3 <=#1 -0.14673;
				 twiddleFactorimgB3 <=#1 -0.989177;
				 stateIp1B3<=#1 35;
				 stateIp2B3<=#1 99;

				 //(36,100)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[100];
				 realIp2B4 <= realWorkingBuffer[100];
				 twiddleFactorRealB4 <=#1 -0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 36;
				 stateIp2B4<=#1 100;

				 //(37,101)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[101];
				 realIp2B5 <= realWorkingBuffer[101];
				 twiddleFactorRealB5 <=#1 -0.24298;
				 twiddleFactorimgB5 <=#1 -0.970031;
				 stateIp1B5<=#1 37;
				 stateIp2B5<=#1 101;

				 //(38,102)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[102];
				 realIp2B6 <= realWorkingBuffer[102];
				 twiddleFactorRealB6 <=#1 -0.290285;
				 twiddleFactorimgB6 <=#1 -0.95694;
				 stateIp1B6<=#1 38;
				 stateIp2B6<=#1 102;

				 //(39,103)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[103];
				 realIp2B7 <= realWorkingBuffer[103];
				 twiddleFactorRealB7 <=#1 -0.33689;
				 twiddleFactorimgB7 <=#1 -0.941544;
				 stateIp1B7<=#1 39;
				 stateIp2B7<=#1 103;
			 end
			 198 : begin

				 //(40,104)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[104];
				 realIp2B0 <= realWorkingBuffer[104];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 40;
				 stateIp2B0<=#1 104;

				 //(41,105)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[105];
				 realIp2B1 <= realWorkingBuffer[105];
				 twiddleFactorRealB1 <=#1 -0.427555;
				 twiddleFactorimgB1 <=#1 -0.903989;
				 stateIp1B1<=#1 41;
				 stateIp2B1<=#1 105;

				 //(42,106)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[106];
				 realIp2B2 <= realWorkingBuffer[106];
				 twiddleFactorRealB2 <=#1 -0.471397;
				 twiddleFactorimgB2 <=#1 -0.881921;
				 stateIp1B2<=#1 42;
				 stateIp2B2<=#1 106;

				 //(43,107)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[107];
				 realIp2B3 <= realWorkingBuffer[107];
				 twiddleFactorRealB3 <=#1 -0.514103;
				 twiddleFactorimgB3 <=#1 -0.857729;
				 stateIp1B3<=#1 43;
				 stateIp2B3<=#1 107;

				 //(44,108)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[108];
				 realIp2B4 <= realWorkingBuffer[108];
				 twiddleFactorRealB4 <=#1 -0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 44;
				 stateIp2B4<=#1 108;

				 //(45,109)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[109];
				 realIp2B5 <= realWorkingBuffer[109];
				 twiddleFactorRealB5 <=#1 -0.595699;
				 twiddleFactorimgB5 <=#1 -0.803208;
				 stateIp1B5<=#1 45;
				 stateIp2B5<=#1 109;

				 //(46,110)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[110];
				 realIp2B6 <= realWorkingBuffer[110];
				 twiddleFactorRealB6 <=#1 -0.634393;
				 twiddleFactorimgB6 <=#1 -0.77301;
				 stateIp1B6<=#1 46;
				 stateIp2B6<=#1 110;

				 //(47,111)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[111];
				 realIp2B7 <= realWorkingBuffer[111];
				 twiddleFactorRealB7 <=#1 -0.671559;
				 twiddleFactorimgB7 <=#1 -0.740951;
				 stateIp1B7<=#1 47;
				 stateIp2B7<=#1 111;
			 end
			 199 : begin

				 //(48,112)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[112];
				 realIp2B0 <= realWorkingBuffer[112];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 112;

				 //(49,113)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[113];
				 realIp2B1 <= realWorkingBuffer[113];
				 twiddleFactorRealB1 <=#1 -0.740951;
				 twiddleFactorimgB1 <=#1 -0.671559;
				 stateIp1B1<=#1 49;
				 stateIp2B1<=#1 113;

				 //(50,114)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[114];
				 realIp2B2 <= realWorkingBuffer[114];
				 twiddleFactorRealB2 <=#1 -0.77301;
				 twiddleFactorimgB2 <=#1 -0.634393;
				 stateIp1B2<=#1 50;
				 stateIp2B2<=#1 114;

				 //(51,115)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[115];
				 realIp2B3 <= realWorkingBuffer[115];
				 twiddleFactorRealB3 <=#1 -0.803208;
				 twiddleFactorimgB3 <=#1 -0.595699;
				 stateIp1B3<=#1 51;
				 stateIp2B3<=#1 115;

				 //(52,116)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[116];
				 realIp2B4 <= realWorkingBuffer[116];
				 twiddleFactorRealB4 <=#1 -0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 52;
				 stateIp2B4<=#1 116;

				 //(53,117)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[117];
				 realIp2B5 <= realWorkingBuffer[117];
				 twiddleFactorRealB5 <=#1 -0.857729;
				 twiddleFactorimgB5 <=#1 -0.514103;
				 stateIp1B5<=#1 53;
				 stateIp2B5<=#1 117;

				 //(54,118)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[118];
				 realIp2B6 <= realWorkingBuffer[118];
				 twiddleFactorRealB6 <=#1 -0.881921;
				 twiddleFactorimgB6 <=#1 -0.471397;
				 stateIp1B6<=#1 54;
				 stateIp2B6<=#1 118;

				 //(55,119)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[119];
				 realIp2B7 <= realWorkingBuffer[119];
				 twiddleFactorRealB7 <=#1 -0.903989;
				 twiddleFactorimgB7 <=#1 -0.427555;
				 stateIp1B7<=#1 55;
				 stateIp2B7<=#1 119;
			 end
			 200 : begin

				 //(56,120)
				 imgIp1B0 <= imagWorkingBuffer[56];
				 realIp1B0 <= realWorkingBuffer[56];
				 imgIp2B0 <= imagWorkingBuffer[120];
				 realIp2B0 <= realWorkingBuffer[120];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 56;
				 stateIp2B0<=#1 120;

				 //(57,121)
				 imgIp1B1 <= imagWorkingBuffer[57];
				 realIp1B1 <= realWorkingBuffer[57];
				 imgIp2B1 <= imagWorkingBuffer[121];
				 realIp2B1 <= realWorkingBuffer[121];
				 twiddleFactorRealB1 <=#1 -0.941544;
				 twiddleFactorimgB1 <=#1 -0.33689;
				 stateIp1B1<=#1 57;
				 stateIp2B1<=#1 121;

				 //(58,122)
				 imgIp1B2 <= imagWorkingBuffer[58];
				 realIp1B2 <= realWorkingBuffer[58];
				 imgIp2B2 <= imagWorkingBuffer[122];
				 realIp2B2 <= realWorkingBuffer[122];
				 twiddleFactorRealB2 <=#1 -0.95694;
				 twiddleFactorimgB2 <=#1 -0.290285;
				 stateIp1B2<=#1 58;
				 stateIp2B2<=#1 122;

				 //(59,123)
				 imgIp1B3 <= imagWorkingBuffer[59];
				 realIp1B3 <= realWorkingBuffer[59];
				 imgIp2B3 <= imagWorkingBuffer[123];
				 realIp2B3 <= realWorkingBuffer[123];
				 twiddleFactorRealB3 <=#1 -0.970031;
				 twiddleFactorimgB3 <=#1 -0.24298;
				 stateIp1B3<=#1 59;
				 stateIp2B3<=#1 123;

				 //(60,124)
				 imgIp1B4 <= imagWorkingBuffer[60];
				 realIp1B4 <= realWorkingBuffer[60];
				 imgIp2B4 <= imagWorkingBuffer[124];
				 realIp2B4 <= realWorkingBuffer[124];
				 twiddleFactorRealB4 <=#1 -0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 60;
				 stateIp2B4<=#1 124;

				 //(61,125)
				 imgIp1B5 <= imagWorkingBuffer[61];
				 realIp1B5 <= realWorkingBuffer[61];
				 imgIp2B5 <= imagWorkingBuffer[125];
				 realIp2B5 <= realWorkingBuffer[125];
				 twiddleFactorRealB5 <=#1 -0.989177;
				 twiddleFactorimgB5 <=#1 -0.14673;
				 stateIp1B5<=#1 61;
				 stateIp2B5<=#1 125;

				 //(62,126)
				 imgIp1B6 <= imagWorkingBuffer[62];
				 realIp1B6 <= realWorkingBuffer[62];
				 imgIp2B6 <= imagWorkingBuffer[126];
				 realIp2B6 <= realWorkingBuffer[126];
				 twiddleFactorRealB6 <=#1 -0.995185;
				 twiddleFactorimgB6 <=#1 -0.098017;
				 stateIp1B6<=#1 62;
				 stateIp2B6<=#1 126;

				 //(63,127)
				 imgIp1B7 <= imagWorkingBuffer[63];
				 realIp1B7 <= realWorkingBuffer[63];
				 imgIp2B7 <= imagWorkingBuffer[127];
				 realIp2B7 <= realWorkingBuffer[127];
				 twiddleFactorRealB7 <=#1 -0.998795;
				 twiddleFactorimgB7 <=#1 -0.049068;
				 stateIp1B7<=#1 63;
				 stateIp2B7<=#1 127;
			 end
			 201 : begin

				 //(128,192)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[192];
				 realIp2B0 <= realWorkingBuffer[192];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 192;

				 //(129,193)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[193];
				 realIp2B1 <= realWorkingBuffer[193];
				 twiddleFactorRealB1 <=#1 0.998795;
				 twiddleFactorimgB1 <=#1 -0.049068;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 193;

				 //(130,194)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[194];
				 realIp2B2 <= realWorkingBuffer[194];
				 twiddleFactorRealB2 <=#1 0.995185;
				 twiddleFactorimgB2 <=#1 -0.098017;
				 stateIp1B2<=#1 130;
				 stateIp2B2<=#1 194;

				 //(131,195)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[195];
				 realIp2B3 <= realWorkingBuffer[195];
				 twiddleFactorRealB3 <=#1 0.989177;
				 twiddleFactorimgB3 <=#1 -0.14673;
				 stateIp1B3<=#1 131;
				 stateIp2B3<=#1 195;

				 //(132,196)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[196];
				 realIp2B4 <= realWorkingBuffer[196];
				 twiddleFactorRealB4 <=#1 0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 132;
				 stateIp2B4<=#1 196;

				 //(133,197)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[197];
				 realIp2B5 <= realWorkingBuffer[197];
				 twiddleFactorRealB5 <=#1 0.970031;
				 twiddleFactorimgB5 <=#1 -0.24298;
				 stateIp1B5<=#1 133;
				 stateIp2B5<=#1 197;

				 //(134,198)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[198];
				 realIp2B6 <= realWorkingBuffer[198];
				 twiddleFactorRealB6 <=#1 0.95694;
				 twiddleFactorimgB6 <=#1 -0.290285;
				 stateIp1B6<=#1 134;
				 stateIp2B6<=#1 198;

				 //(135,199)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[199];
				 realIp2B7 <= realWorkingBuffer[199];
				 twiddleFactorRealB7 <=#1 0.941544;
				 twiddleFactorimgB7 <=#1 -0.33689;
				 stateIp1B7<=#1 135;
				 stateIp2B7<=#1 199;
			 end
			 202 : begin

				 //(136,200)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[200];
				 realIp2B0 <= realWorkingBuffer[200];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 136;
				 stateIp2B0<=#1 200;

				 //(137,201)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[201];
				 realIp2B1 <= realWorkingBuffer[201];
				 twiddleFactorRealB1 <=#1 0.903989;
				 twiddleFactorimgB1 <=#1 -0.427555;
				 stateIp1B1<=#1 137;
				 stateIp2B1<=#1 201;

				 //(138,202)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[202];
				 realIp2B2 <= realWorkingBuffer[202];
				 twiddleFactorRealB2 <=#1 0.881921;
				 twiddleFactorimgB2 <=#1 -0.471397;
				 stateIp1B2<=#1 138;
				 stateIp2B2<=#1 202;

				 //(139,203)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[203];
				 realIp2B3 <= realWorkingBuffer[203];
				 twiddleFactorRealB3 <=#1 0.857729;
				 twiddleFactorimgB3 <=#1 -0.514103;
				 stateIp1B3<=#1 139;
				 stateIp2B3<=#1 203;

				 //(140,204)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=#1 0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 140;
				 stateIp2B4<=#1 204;

				 //(141,205)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=#1 0.803208;
				 twiddleFactorimgB5 <=#1 -0.595699;
				 stateIp1B5<=#1 141;
				 stateIp2B5<=#1 205;

				 //(142,206)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=#1 0.77301;
				 twiddleFactorimgB6 <=#1 -0.634393;
				 stateIp1B6<=#1 142;
				 stateIp2B6<=#1 206;

				 //(143,207)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=#1 0.740951;
				 twiddleFactorimgB7 <=#1 -0.671559;
				 stateIp1B7<=#1 143;
				 stateIp2B7<=#1 207;
			 end
			 203 : begin

				 //(144,208)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[208];
				 realIp2B0 <= realWorkingBuffer[208];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 208;

				 //(145,209)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[209];
				 realIp2B1 <= realWorkingBuffer[209];
				 twiddleFactorRealB1 <=#1 0.671559;
				 twiddleFactorimgB1 <=#1 -0.740951;
				 stateIp1B1<=#1 145;
				 stateIp2B1<=#1 209;

				 //(146,210)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[210];
				 realIp2B2 <= realWorkingBuffer[210];
				 twiddleFactorRealB2 <=#1 0.634393;
				 twiddleFactorimgB2 <=#1 -0.77301;
				 stateIp1B2<=#1 146;
				 stateIp2B2<=#1 210;

				 //(147,211)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[211];
				 realIp2B3 <= realWorkingBuffer[211];
				 twiddleFactorRealB3 <=#1 0.595699;
				 twiddleFactorimgB3 <=#1 -0.803208;
				 stateIp1B3<=#1 147;
				 stateIp2B3<=#1 211;

				 //(148,212)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[212];
				 realIp2B4 <= realWorkingBuffer[212];
				 twiddleFactorRealB4 <=#1 0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 148;
				 stateIp2B4<=#1 212;

				 //(149,213)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[213];
				 realIp2B5 <= realWorkingBuffer[213];
				 twiddleFactorRealB5 <=#1 0.514103;
				 twiddleFactorimgB5 <=#1 -0.857729;
				 stateIp1B5<=#1 149;
				 stateIp2B5<=#1 213;

				 //(150,214)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[214];
				 realIp2B6 <= realWorkingBuffer[214];
				 twiddleFactorRealB6 <=#1 0.471397;
				 twiddleFactorimgB6 <=#1 -0.881921;
				 stateIp1B6<=#1 150;
				 stateIp2B6<=#1 214;

				 //(151,215)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[215];
				 realIp2B7 <= realWorkingBuffer[215];
				 twiddleFactorRealB7 <=#1 0.427555;
				 twiddleFactorimgB7 <=#1 -0.903989;
				 stateIp1B7<=#1 151;
				 stateIp2B7<=#1 215;
			 end
			 204 : begin

				 //(152,216)
				 imgIp1B0 <= imagWorkingBuffer[152];
				 realIp1B0 <= realWorkingBuffer[152];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 152;
				 stateIp2B0<=#1 216;

				 //(153,217)
				 imgIp1B1 <= imagWorkingBuffer[153];
				 realIp1B1 <= realWorkingBuffer[153];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=#1 0.33689;
				 twiddleFactorimgB1 <=#1 -0.941544;
				 stateIp1B1<=#1 153;
				 stateIp2B1<=#1 217;

				 //(154,218)
				 imgIp1B2 <= imagWorkingBuffer[154];
				 realIp1B2 <= realWorkingBuffer[154];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=#1 0.290285;
				 twiddleFactorimgB2 <=#1 -0.95694;
				 stateIp1B2<=#1 154;
				 stateIp2B2<=#1 218;

				 //(155,219)
				 imgIp1B3 <= imagWorkingBuffer[155];
				 realIp1B3 <= realWorkingBuffer[155];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=#1 0.24298;
				 twiddleFactorimgB3 <=#1 -0.970031;
				 stateIp1B3<=#1 155;
				 stateIp2B3<=#1 219;

				 //(156,220)
				 imgIp1B4 <= imagWorkingBuffer[156];
				 realIp1B4 <= realWorkingBuffer[156];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=#1 0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 156;
				 stateIp2B4<=#1 220;

				 //(157,221)
				 imgIp1B5 <= imagWorkingBuffer[157];
				 realIp1B5 <= realWorkingBuffer[157];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=#1 0.14673;
				 twiddleFactorimgB5 <=#1 -0.989177;
				 stateIp1B5<=#1 157;
				 stateIp2B5<=#1 221;

				 //(158,222)
				 imgIp1B6 <= imagWorkingBuffer[158];
				 realIp1B6 <= realWorkingBuffer[158];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=#1 0.098017;
				 twiddleFactorimgB6 <=#1 -0.995185;
				 stateIp1B6<=#1 158;
				 stateIp2B6<=#1 222;

				 //(159,223)
				 imgIp1B7 <= imagWorkingBuffer[159];
				 realIp1B7 <= realWorkingBuffer[159];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 0.049068;
				 twiddleFactorimgB7 <=#1 -0.998795;
				 stateIp1B7<=#1 159;
				 stateIp2B7<=#1 223;
			 end
			 205 : begin

				 //(160,224)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[224];
				 realIp2B0 <= realWorkingBuffer[224];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 224;

				 //(161,225)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[225];
				 realIp2B1 <= realWorkingBuffer[225];
				 twiddleFactorRealB1 <=#1 -0.049068;
				 twiddleFactorimgB1 <=#1 -0.998795;
				 stateIp1B1<=#1 161;
				 stateIp2B1<=#1 225;

				 //(162,226)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[226];
				 realIp2B2 <= realWorkingBuffer[226];
				 twiddleFactorRealB2 <=#1 -0.098017;
				 twiddleFactorimgB2 <=#1 -0.995185;
				 stateIp1B2<=#1 162;
				 stateIp2B2<=#1 226;

				 //(163,227)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[227];
				 realIp2B3 <= realWorkingBuffer[227];
				 twiddleFactorRealB3 <=#1 -0.14673;
				 twiddleFactorimgB3 <=#1 -0.989177;
				 stateIp1B3<=#1 163;
				 stateIp2B3<=#1 227;

				 //(164,228)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[228];
				 realIp2B4 <= realWorkingBuffer[228];
				 twiddleFactorRealB4 <=#1 -0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 164;
				 stateIp2B4<=#1 228;

				 //(165,229)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[229];
				 realIp2B5 <= realWorkingBuffer[229];
				 twiddleFactorRealB5 <=#1 -0.24298;
				 twiddleFactorimgB5 <=#1 -0.970031;
				 stateIp1B5<=#1 165;
				 stateIp2B5<=#1 229;

				 //(166,230)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[230];
				 realIp2B6 <= realWorkingBuffer[230];
				 twiddleFactorRealB6 <=#1 -0.290285;
				 twiddleFactorimgB6 <=#1 -0.95694;
				 stateIp1B6<=#1 166;
				 stateIp2B6<=#1 230;

				 //(167,231)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[231];
				 realIp2B7 <= realWorkingBuffer[231];
				 twiddleFactorRealB7 <=#1 -0.33689;
				 twiddleFactorimgB7 <=#1 -0.941544;
				 stateIp1B7<=#1 167;
				 stateIp2B7<=#1 231;
			 end
			 206 : begin

				 //(168,232)
				 imgIp1B0 <= imagWorkingBuffer[168];
				 realIp1B0 <= realWorkingBuffer[168];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 168;
				 stateIp2B0<=#1 232;

				 //(169,233)
				 imgIp1B1 <= imagWorkingBuffer[169];
				 realIp1B1 <= realWorkingBuffer[169];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=#1 -0.427555;
				 twiddleFactorimgB1 <=#1 -0.903989;
				 stateIp1B1<=#1 169;
				 stateIp2B1<=#1 233;

				 //(170,234)
				 imgIp1B2 <= imagWorkingBuffer[170];
				 realIp1B2 <= realWorkingBuffer[170];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=#1 -0.471397;
				 twiddleFactorimgB2 <=#1 -0.881921;
				 stateIp1B2<=#1 170;
				 stateIp2B2<=#1 234;

				 //(171,235)
				 imgIp1B3 <= imagWorkingBuffer[171];
				 realIp1B3 <= realWorkingBuffer[171];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=#1 -0.514103;
				 twiddleFactorimgB3 <=#1 -0.857729;
				 stateIp1B3<=#1 171;
				 stateIp2B3<=#1 235;

				 //(172,236)
				 imgIp1B4 <= imagWorkingBuffer[172];
				 realIp1B4 <= realWorkingBuffer[172];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=#1 -0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 172;
				 stateIp2B4<=#1 236;

				 //(173,237)
				 imgIp1B5 <= imagWorkingBuffer[173];
				 realIp1B5 <= realWorkingBuffer[173];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=#1 -0.595699;
				 twiddleFactorimgB5 <=#1 -0.803208;
				 stateIp1B5<=#1 173;
				 stateIp2B5<=#1 237;

				 //(174,238)
				 imgIp1B6 <= imagWorkingBuffer[174];
				 realIp1B6 <= realWorkingBuffer[174];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=#1 -0.634393;
				 twiddleFactorimgB6 <=#1 -0.77301;
				 stateIp1B6<=#1 174;
				 stateIp2B6<=#1 238;

				 //(175,239)
				 imgIp1B7 <= imagWorkingBuffer[175];
				 realIp1B7 <= realWorkingBuffer[175];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 -0.671559;
				 twiddleFactorimgB7 <=#1 -0.740951;
				 stateIp1B7<=#1 175;
				 stateIp2B7<=#1 239;
			 end
			 207 : begin

				 //(176,240)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 176;
				 stateIp2B0<=#1 240;

				 //(177,241)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=#1 -0.740951;
				 twiddleFactorimgB1 <=#1 -0.671559;
				 stateIp1B1<=#1 177;
				 stateIp2B1<=#1 241;

				 //(178,242)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=#1 -0.77301;
				 twiddleFactorimgB2 <=#1 -0.634393;
				 stateIp1B2<=#1 178;
				 stateIp2B2<=#1 242;

				 //(179,243)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=#1 -0.803208;
				 twiddleFactorimgB3 <=#1 -0.595699;
				 stateIp1B3<=#1 179;
				 stateIp2B3<=#1 243;

				 //(180,244)
				 imgIp1B4 <= imagWorkingBuffer[180];
				 realIp1B4 <= realWorkingBuffer[180];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=#1 -0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 180;
				 stateIp2B4<=#1 244;

				 //(181,245)
				 imgIp1B5 <= imagWorkingBuffer[181];
				 realIp1B5 <= realWorkingBuffer[181];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=#1 -0.857729;
				 twiddleFactorimgB5 <=#1 -0.514103;
				 stateIp1B5<=#1 181;
				 stateIp2B5<=#1 245;

				 //(182,246)
				 imgIp1B6 <= imagWorkingBuffer[182];
				 realIp1B6 <= realWorkingBuffer[182];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=#1 -0.881921;
				 twiddleFactorimgB6 <=#1 -0.471397;
				 stateIp1B6<=#1 182;
				 stateIp2B6<=#1 246;

				 //(183,247)
				 imgIp1B7 <= imagWorkingBuffer[183];
				 realIp1B7 <= realWorkingBuffer[183];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=#1 -0.903989;
				 twiddleFactorimgB7 <=#1 -0.427555;
				 stateIp1B7<=#1 183;
				 stateIp2B7<=#1 247;
			 end
			 208 : begin

				 //(184,248)
				 imgIp1B0 <= imagWorkingBuffer[184];
				 realIp1B0 <= realWorkingBuffer[184];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 184;
				 stateIp2B0<=#1 248;

				 //(185,249)
				 imgIp1B1 <= imagWorkingBuffer[185];
				 realIp1B1 <= realWorkingBuffer[185];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=#1 -0.941544;
				 twiddleFactorimgB1 <=#1 -0.33689;
				 stateIp1B1<=#1 185;
				 stateIp2B1<=#1 249;

				 //(186,250)
				 imgIp1B2 <= imagWorkingBuffer[186];
				 realIp1B2 <= realWorkingBuffer[186];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=#1 -0.95694;
				 twiddleFactorimgB2 <=#1 -0.290285;
				 stateIp1B2<=#1 186;
				 stateIp2B2<=#1 250;

				 //(187,251)
				 imgIp1B3 <= imagWorkingBuffer[187];
				 realIp1B3 <= realWorkingBuffer[187];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=#1 -0.970031;
				 twiddleFactorimgB3 <=#1 -0.24298;
				 stateIp1B3<=#1 187;
				 stateIp2B3<=#1 251;

				 //(188,252)
				 imgIp1B4 <= imagWorkingBuffer[188];
				 realIp1B4 <= realWorkingBuffer[188];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=#1 -0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 188;
				 stateIp2B4<=#1 252;

				 //(189,253)
				 imgIp1B5 <= imagWorkingBuffer[189];
				 realIp1B5 <= realWorkingBuffer[189];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=#1 -0.989177;
				 twiddleFactorimgB5 <=#1 -0.14673;
				 stateIp1B5<=#1 189;
				 stateIp2B5<=#1 253;

				 //(190,254)
				 imgIp1B6 <= imagWorkingBuffer[190];
				 realIp1B6 <= realWorkingBuffer[190];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 -0.995185;
				 twiddleFactorimgB6 <=#1 -0.098017;
				 stateIp1B6<=#1 190;
				 stateIp2B6<=#1 254;

				 //(191,255)
				 imgIp1B7 <= imagWorkingBuffer[191];
				 realIp1B7 <= realWorkingBuffer[191];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 -0.998795;
				 twiddleFactorimgB7 <=#1 -0.049068;
				 stateIp1B7<=#1 191;
				 stateIp2B7<=#1 255;
			 end
			 209 : begin

				 //(256,320)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[320];
				 realIp2B0 <= realWorkingBuffer[320];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 320;

				 //(257,321)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[321];
				 realIp2B1 <= realWorkingBuffer[321];
				 twiddleFactorRealB1 <=#1 0.998795;
				 twiddleFactorimgB1 <=#1 -0.049068;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 321;

				 //(258,322)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[322];
				 realIp2B2 <= realWorkingBuffer[322];
				 twiddleFactorRealB2 <=#1 0.995185;
				 twiddleFactorimgB2 <=#1 -0.098017;
				 stateIp1B2<=#1 258;
				 stateIp2B2<=#1 322;

				 //(259,323)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[323];
				 realIp2B3 <= realWorkingBuffer[323];
				 twiddleFactorRealB3 <=#1 0.989177;
				 twiddleFactorimgB3 <=#1 -0.14673;
				 stateIp1B3<=#1 259;
				 stateIp2B3<=#1 323;

				 //(260,324)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[324];
				 realIp2B4 <= realWorkingBuffer[324];
				 twiddleFactorRealB4 <=#1 0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 260;
				 stateIp2B4<=#1 324;

				 //(261,325)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[325];
				 realIp2B5 <= realWorkingBuffer[325];
				 twiddleFactorRealB5 <=#1 0.970031;
				 twiddleFactorimgB5 <=#1 -0.24298;
				 stateIp1B5<=#1 261;
				 stateIp2B5<=#1 325;

				 //(262,326)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[326];
				 realIp2B6 <= realWorkingBuffer[326];
				 twiddleFactorRealB6 <=#1 0.95694;
				 twiddleFactorimgB6 <=#1 -0.290285;
				 stateIp1B6<=#1 262;
				 stateIp2B6<=#1 326;

				 //(263,327)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[327];
				 realIp2B7 <= realWorkingBuffer[327];
				 twiddleFactorRealB7 <=#1 0.941544;
				 twiddleFactorimgB7 <=#1 -0.33689;
				 stateIp1B7<=#1 263;
				 stateIp2B7<=#1 327;
			 end
			 210 : begin

				 //(264,328)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[328];
				 realIp2B0 <= realWorkingBuffer[328];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 264;
				 stateIp2B0<=#1 328;

				 //(265,329)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[329];
				 realIp2B1 <= realWorkingBuffer[329];
				 twiddleFactorRealB1 <=#1 0.903989;
				 twiddleFactorimgB1 <=#1 -0.427555;
				 stateIp1B1<=#1 265;
				 stateIp2B1<=#1 329;

				 //(266,330)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[330];
				 realIp2B2 <= realWorkingBuffer[330];
				 twiddleFactorRealB2 <=#1 0.881921;
				 twiddleFactorimgB2 <=#1 -0.471397;
				 stateIp1B2<=#1 266;
				 stateIp2B2<=#1 330;

				 //(267,331)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[331];
				 realIp2B3 <= realWorkingBuffer[331];
				 twiddleFactorRealB3 <=#1 0.857729;
				 twiddleFactorimgB3 <=#1 -0.514103;
				 stateIp1B3<=#1 267;
				 stateIp2B3<=#1 331;

				 //(268,332)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=#1 0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 268;
				 stateIp2B4<=#1 332;

				 //(269,333)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=#1 0.803208;
				 twiddleFactorimgB5 <=#1 -0.595699;
				 stateIp1B5<=#1 269;
				 stateIp2B5<=#1 333;

				 //(270,334)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=#1 0.77301;
				 twiddleFactorimgB6 <=#1 -0.634393;
				 stateIp1B6<=#1 270;
				 stateIp2B6<=#1 334;

				 //(271,335)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=#1 0.740951;
				 twiddleFactorimgB7 <=#1 -0.671559;
				 stateIp1B7<=#1 271;
				 stateIp2B7<=#1 335;
			 end
			 211 : begin

				 //(272,336)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[336];
				 realIp2B0 <= realWorkingBuffer[336];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 336;

				 //(273,337)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[337];
				 realIp2B1 <= realWorkingBuffer[337];
				 twiddleFactorRealB1 <=#1 0.671559;
				 twiddleFactorimgB1 <=#1 -0.740951;
				 stateIp1B1<=#1 273;
				 stateIp2B1<=#1 337;

				 //(274,338)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[338];
				 realIp2B2 <= realWorkingBuffer[338];
				 twiddleFactorRealB2 <=#1 0.634393;
				 twiddleFactorimgB2 <=#1 -0.77301;
				 stateIp1B2<=#1 274;
				 stateIp2B2<=#1 338;

				 //(275,339)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[339];
				 realIp2B3 <= realWorkingBuffer[339];
				 twiddleFactorRealB3 <=#1 0.595699;
				 twiddleFactorimgB3 <=#1 -0.803208;
				 stateIp1B3<=#1 275;
				 stateIp2B3<=#1 339;

				 //(276,340)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[340];
				 realIp2B4 <= realWorkingBuffer[340];
				 twiddleFactorRealB4 <=#1 0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 276;
				 stateIp2B4<=#1 340;

				 //(277,341)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[341];
				 realIp2B5 <= realWorkingBuffer[341];
				 twiddleFactorRealB5 <=#1 0.514103;
				 twiddleFactorimgB5 <=#1 -0.857729;
				 stateIp1B5<=#1 277;
				 stateIp2B5<=#1 341;

				 //(278,342)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[342];
				 realIp2B6 <= realWorkingBuffer[342];
				 twiddleFactorRealB6 <=#1 0.471397;
				 twiddleFactorimgB6 <=#1 -0.881921;
				 stateIp1B6<=#1 278;
				 stateIp2B6<=#1 342;

				 //(279,343)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[343];
				 realIp2B7 <= realWorkingBuffer[343];
				 twiddleFactorRealB7 <=#1 0.427555;
				 twiddleFactorimgB7 <=#1 -0.903989;
				 stateIp1B7<=#1 279;
				 stateIp2B7<=#1 343;
			 end
			 212 : begin

				 //(280,344)
				 imgIp1B0 <= imagWorkingBuffer[280];
				 realIp1B0 <= realWorkingBuffer[280];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 280;
				 stateIp2B0<=#1 344;

				 //(281,345)
				 imgIp1B1 <= imagWorkingBuffer[281];
				 realIp1B1 <= realWorkingBuffer[281];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=#1 0.33689;
				 twiddleFactorimgB1 <=#1 -0.941544;
				 stateIp1B1<=#1 281;
				 stateIp2B1<=#1 345;

				 //(282,346)
				 imgIp1B2 <= imagWorkingBuffer[282];
				 realIp1B2 <= realWorkingBuffer[282];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=#1 0.290285;
				 twiddleFactorimgB2 <=#1 -0.95694;
				 stateIp1B2<=#1 282;
				 stateIp2B2<=#1 346;

				 //(283,347)
				 imgIp1B3 <= imagWorkingBuffer[283];
				 realIp1B3 <= realWorkingBuffer[283];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=#1 0.24298;
				 twiddleFactorimgB3 <=#1 -0.970031;
				 stateIp1B3<=#1 283;
				 stateIp2B3<=#1 347;

				 //(284,348)
				 imgIp1B4 <= imagWorkingBuffer[284];
				 realIp1B4 <= realWorkingBuffer[284];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=#1 0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 284;
				 stateIp2B4<=#1 348;

				 //(285,349)
				 imgIp1B5 <= imagWorkingBuffer[285];
				 realIp1B5 <= realWorkingBuffer[285];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=#1 0.14673;
				 twiddleFactorimgB5 <=#1 -0.989177;
				 stateIp1B5<=#1 285;
				 stateIp2B5<=#1 349;

				 //(286,350)
				 imgIp1B6 <= imagWorkingBuffer[286];
				 realIp1B6 <= realWorkingBuffer[286];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=#1 0.098017;
				 twiddleFactorimgB6 <=#1 -0.995185;
				 stateIp1B6<=#1 286;
				 stateIp2B6<=#1 350;

				 //(287,351)
				 imgIp1B7 <= imagWorkingBuffer[287];
				 realIp1B7 <= realWorkingBuffer[287];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 0.049068;
				 twiddleFactorimgB7 <=#1 -0.998795;
				 stateIp1B7<=#1 287;
				 stateIp2B7<=#1 351;
			 end
			 213 : begin

				 //(288,352)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[352];
				 realIp2B0 <= realWorkingBuffer[352];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 352;

				 //(289,353)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[353];
				 realIp2B1 <= realWorkingBuffer[353];
				 twiddleFactorRealB1 <=#1 -0.049068;
				 twiddleFactorimgB1 <=#1 -0.998795;
				 stateIp1B1<=#1 289;
				 stateIp2B1<=#1 353;

				 //(290,354)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[354];
				 realIp2B2 <= realWorkingBuffer[354];
				 twiddleFactorRealB2 <=#1 -0.098017;
				 twiddleFactorimgB2 <=#1 -0.995185;
				 stateIp1B2<=#1 290;
				 stateIp2B2<=#1 354;

				 //(291,355)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[355];
				 realIp2B3 <= realWorkingBuffer[355];
				 twiddleFactorRealB3 <=#1 -0.14673;
				 twiddleFactorimgB3 <=#1 -0.989177;
				 stateIp1B3<=#1 291;
				 stateIp2B3<=#1 355;

				 //(292,356)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[356];
				 realIp2B4 <= realWorkingBuffer[356];
				 twiddleFactorRealB4 <=#1 -0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 292;
				 stateIp2B4<=#1 356;

				 //(293,357)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[357];
				 realIp2B5 <= realWorkingBuffer[357];
				 twiddleFactorRealB5 <=#1 -0.24298;
				 twiddleFactorimgB5 <=#1 -0.970031;
				 stateIp1B5<=#1 293;
				 stateIp2B5<=#1 357;

				 //(294,358)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[358];
				 realIp2B6 <= realWorkingBuffer[358];
				 twiddleFactorRealB6 <=#1 -0.290285;
				 twiddleFactorimgB6 <=#1 -0.95694;
				 stateIp1B6<=#1 294;
				 stateIp2B6<=#1 358;

				 //(295,359)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[359];
				 realIp2B7 <= realWorkingBuffer[359];
				 twiddleFactorRealB7 <=#1 -0.33689;
				 twiddleFactorimgB7 <=#1 -0.941544;
				 stateIp1B7<=#1 295;
				 stateIp2B7<=#1 359;
			 end
			 214 : begin

				 //(296,360)
				 imgIp1B0 <= imagWorkingBuffer[296];
				 realIp1B0 <= realWorkingBuffer[296];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 296;
				 stateIp2B0<=#1 360;

				 //(297,361)
				 imgIp1B1 <= imagWorkingBuffer[297];
				 realIp1B1 <= realWorkingBuffer[297];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=#1 -0.427555;
				 twiddleFactorimgB1 <=#1 -0.903989;
				 stateIp1B1<=#1 297;
				 stateIp2B1<=#1 361;

				 //(298,362)
				 imgIp1B2 <= imagWorkingBuffer[298];
				 realIp1B2 <= realWorkingBuffer[298];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=#1 -0.471397;
				 twiddleFactorimgB2 <=#1 -0.881921;
				 stateIp1B2<=#1 298;
				 stateIp2B2<=#1 362;

				 //(299,363)
				 imgIp1B3 <= imagWorkingBuffer[299];
				 realIp1B3 <= realWorkingBuffer[299];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=#1 -0.514103;
				 twiddleFactorimgB3 <=#1 -0.857729;
				 stateIp1B3<=#1 299;
				 stateIp2B3<=#1 363;

				 //(300,364)
				 imgIp1B4 <= imagWorkingBuffer[300];
				 realIp1B4 <= realWorkingBuffer[300];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=#1 -0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 300;
				 stateIp2B4<=#1 364;

				 //(301,365)
				 imgIp1B5 <= imagWorkingBuffer[301];
				 realIp1B5 <= realWorkingBuffer[301];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=#1 -0.595699;
				 twiddleFactorimgB5 <=#1 -0.803208;
				 stateIp1B5<=#1 301;
				 stateIp2B5<=#1 365;

				 //(302,366)
				 imgIp1B6 <= imagWorkingBuffer[302];
				 realIp1B6 <= realWorkingBuffer[302];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=#1 -0.634393;
				 twiddleFactorimgB6 <=#1 -0.77301;
				 stateIp1B6<=#1 302;
				 stateIp2B6<=#1 366;

				 //(303,367)
				 imgIp1B7 <= imagWorkingBuffer[303];
				 realIp1B7 <= realWorkingBuffer[303];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 -0.671559;
				 twiddleFactorimgB7 <=#1 -0.740951;
				 stateIp1B7<=#1 303;
				 stateIp2B7<=#1 367;
			 end
			 215 : begin

				 //(304,368)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 304;
				 stateIp2B0<=#1 368;

				 //(305,369)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=#1 -0.740951;
				 twiddleFactorimgB1 <=#1 -0.671559;
				 stateIp1B1<=#1 305;
				 stateIp2B1<=#1 369;

				 //(306,370)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=#1 -0.77301;
				 twiddleFactorimgB2 <=#1 -0.634393;
				 stateIp1B2<=#1 306;
				 stateIp2B2<=#1 370;

				 //(307,371)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=#1 -0.803208;
				 twiddleFactorimgB3 <=#1 -0.595699;
				 stateIp1B3<=#1 307;
				 stateIp2B3<=#1 371;

				 //(308,372)
				 imgIp1B4 <= imagWorkingBuffer[308];
				 realIp1B4 <= realWorkingBuffer[308];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=#1 -0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 308;
				 stateIp2B4<=#1 372;

				 //(309,373)
				 imgIp1B5 <= imagWorkingBuffer[309];
				 realIp1B5 <= realWorkingBuffer[309];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=#1 -0.857729;
				 twiddleFactorimgB5 <=#1 -0.514103;
				 stateIp1B5<=#1 309;
				 stateIp2B5<=#1 373;

				 //(310,374)
				 imgIp1B6 <= imagWorkingBuffer[310];
				 realIp1B6 <= realWorkingBuffer[310];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=#1 -0.881921;
				 twiddleFactorimgB6 <=#1 -0.471397;
				 stateIp1B6<=#1 310;
				 stateIp2B6<=#1 374;

				 //(311,375)
				 imgIp1B7 <= imagWorkingBuffer[311];
				 realIp1B7 <= realWorkingBuffer[311];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=#1 -0.903989;
				 twiddleFactorimgB7 <=#1 -0.427555;
				 stateIp1B7<=#1 311;
				 stateIp2B7<=#1 375;
			 end
			 216 : begin

				 //(312,376)
				 imgIp1B0 <= imagWorkingBuffer[312];
				 realIp1B0 <= realWorkingBuffer[312];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 312;
				 stateIp2B0<=#1 376;

				 //(313,377)
				 imgIp1B1 <= imagWorkingBuffer[313];
				 realIp1B1 <= realWorkingBuffer[313];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=#1 -0.941544;
				 twiddleFactorimgB1 <=#1 -0.33689;
				 stateIp1B1<=#1 313;
				 stateIp2B1<=#1 377;

				 //(314,378)
				 imgIp1B2 <= imagWorkingBuffer[314];
				 realIp1B2 <= realWorkingBuffer[314];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=#1 -0.95694;
				 twiddleFactorimgB2 <=#1 -0.290285;
				 stateIp1B2<=#1 314;
				 stateIp2B2<=#1 378;

				 //(315,379)
				 imgIp1B3 <= imagWorkingBuffer[315];
				 realIp1B3 <= realWorkingBuffer[315];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=#1 -0.970031;
				 twiddleFactorimgB3 <=#1 -0.24298;
				 stateIp1B3<=#1 315;
				 stateIp2B3<=#1 379;

				 //(316,380)
				 imgIp1B4 <= imagWorkingBuffer[316];
				 realIp1B4 <= realWorkingBuffer[316];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=#1 -0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 316;
				 stateIp2B4<=#1 380;

				 //(317,381)
				 imgIp1B5 <= imagWorkingBuffer[317];
				 realIp1B5 <= realWorkingBuffer[317];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=#1 -0.989177;
				 twiddleFactorimgB5 <=#1 -0.14673;
				 stateIp1B5<=#1 317;
				 stateIp2B5<=#1 381;

				 //(318,382)
				 imgIp1B6 <= imagWorkingBuffer[318];
				 realIp1B6 <= realWorkingBuffer[318];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 -0.995185;
				 twiddleFactorimgB6 <=#1 -0.098017;
				 stateIp1B6<=#1 318;
				 stateIp2B6<=#1 382;

				 //(319,383)
				 imgIp1B7 <= imagWorkingBuffer[319];
				 realIp1B7 <= realWorkingBuffer[319];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 -0.998795;
				 twiddleFactorimgB7 <=#1 -0.049068;
				 stateIp1B7<=#1 319;
				 stateIp2B7<=#1 383;
			 end
			 217 : begin

				 //(384,448)
				 imgIp1B0 <= imagWorkingBuffer[384];
				 realIp1B0 <= realWorkingBuffer[384];
				 imgIp2B0 <= imagWorkingBuffer[448];
				 realIp2B0 <= realWorkingBuffer[448];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 384;
				 stateIp2B0<=#1 448;

				 //(385,449)
				 imgIp1B1 <= imagWorkingBuffer[385];
				 realIp1B1 <= realWorkingBuffer[385];
				 imgIp2B1 <= imagWorkingBuffer[449];
				 realIp2B1 <= realWorkingBuffer[449];
				 twiddleFactorRealB1 <=#1 0.998795;
				 twiddleFactorimgB1 <=#1 -0.049068;
				 stateIp1B1<=#1 385;
				 stateIp2B1<=#1 449;

				 //(386,450)
				 imgIp1B2 <= imagWorkingBuffer[386];
				 realIp1B2 <= realWorkingBuffer[386];
				 imgIp2B2 <= imagWorkingBuffer[450];
				 realIp2B2 <= realWorkingBuffer[450];
				 twiddleFactorRealB2 <=#1 0.995185;
				 twiddleFactorimgB2 <=#1 -0.098017;
				 stateIp1B2<=#1 386;
				 stateIp2B2<=#1 450;

				 //(387,451)
				 imgIp1B3 <= imagWorkingBuffer[387];
				 realIp1B3 <= realWorkingBuffer[387];
				 imgIp2B3 <= imagWorkingBuffer[451];
				 realIp2B3 <= realWorkingBuffer[451];
				 twiddleFactorRealB3 <=#1 0.989177;
				 twiddleFactorimgB3 <=#1 -0.14673;
				 stateIp1B3<=#1 387;
				 stateIp2B3<=#1 451;

				 //(388,452)
				 imgIp1B4 <= imagWorkingBuffer[388];
				 realIp1B4 <= realWorkingBuffer[388];
				 imgIp2B4 <= imagWorkingBuffer[452];
				 realIp2B4 <= realWorkingBuffer[452];
				 twiddleFactorRealB4 <=#1 0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 388;
				 stateIp2B4<=#1 452;

				 //(389,453)
				 imgIp1B5 <= imagWorkingBuffer[389];
				 realIp1B5 <= realWorkingBuffer[389];
				 imgIp2B5 <= imagWorkingBuffer[453];
				 realIp2B5 <= realWorkingBuffer[453];
				 twiddleFactorRealB5 <=#1 0.970031;
				 twiddleFactorimgB5 <=#1 -0.24298;
				 stateIp1B5<=#1 389;
				 stateIp2B5<=#1 453;

				 //(390,454)
				 imgIp1B6 <= imagWorkingBuffer[390];
				 realIp1B6 <= realWorkingBuffer[390];
				 imgIp2B6 <= imagWorkingBuffer[454];
				 realIp2B6 <= realWorkingBuffer[454];
				 twiddleFactorRealB6 <=#1 0.95694;
				 twiddleFactorimgB6 <=#1 -0.290285;
				 stateIp1B6<=#1 390;
				 stateIp2B6<=#1 454;

				 //(391,455)
				 imgIp1B7 <= imagWorkingBuffer[391];
				 realIp1B7 <= realWorkingBuffer[391];
				 imgIp2B7 <= imagWorkingBuffer[455];
				 realIp2B7 <= realWorkingBuffer[455];
				 twiddleFactorRealB7 <=#1 0.941544;
				 twiddleFactorimgB7 <=#1 -0.33689;
				 stateIp1B7<=#1 391;
				 stateIp2B7<=#1 455;
			 end
			 218 : begin

				 //(392,456)
				 imgIp1B0 <= imagWorkingBuffer[392];
				 realIp1B0 <= realWorkingBuffer[392];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 392;
				 stateIp2B0<=#1 456;

				 //(393,457)
				 imgIp1B1 <= imagWorkingBuffer[393];
				 realIp1B1 <= realWorkingBuffer[393];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=#1 0.903989;
				 twiddleFactorimgB1 <=#1 -0.427555;
				 stateIp1B1<=#1 393;
				 stateIp2B1<=#1 457;

				 //(394,458)
				 imgIp1B2 <= imagWorkingBuffer[394];
				 realIp1B2 <= realWorkingBuffer[394];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=#1 0.881921;
				 twiddleFactorimgB2 <=#1 -0.471397;
				 stateIp1B2<=#1 394;
				 stateIp2B2<=#1 458;

				 //(395,459)
				 imgIp1B3 <= imagWorkingBuffer[395];
				 realIp1B3 <= realWorkingBuffer[395];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=#1 0.857729;
				 twiddleFactorimgB3 <=#1 -0.514103;
				 stateIp1B3<=#1 395;
				 stateIp2B3<=#1 459;

				 //(396,460)
				 imgIp1B4 <= imagWorkingBuffer[396];
				 realIp1B4 <= realWorkingBuffer[396];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=#1 0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 396;
				 stateIp2B4<=#1 460;

				 //(397,461)
				 imgIp1B5 <= imagWorkingBuffer[397];
				 realIp1B5 <= realWorkingBuffer[397];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=#1 0.803208;
				 twiddleFactorimgB5 <=#1 -0.595699;
				 stateIp1B5<=#1 397;
				 stateIp2B5<=#1 461;

				 //(398,462)
				 imgIp1B6 <= imagWorkingBuffer[398];
				 realIp1B6 <= realWorkingBuffer[398];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=#1 0.77301;
				 twiddleFactorimgB6 <=#1 -0.634393;
				 stateIp1B6<=#1 398;
				 stateIp2B6<=#1 462;

				 //(399,463)
				 imgIp1B7 <= imagWorkingBuffer[399];
				 realIp1B7 <= realWorkingBuffer[399];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 0.740951;
				 twiddleFactorimgB7 <=#1 -0.671559;
				 stateIp1B7<=#1 399;
				 stateIp2B7<=#1 463;
			 end
			 219 : begin

				 //(400,464)
				 imgIp1B0 <= imagWorkingBuffer[400];
				 realIp1B0 <= realWorkingBuffer[400];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 400;
				 stateIp2B0<=#1 464;

				 //(401,465)
				 imgIp1B1 <= imagWorkingBuffer[401];
				 realIp1B1 <= realWorkingBuffer[401];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=#1 0.671559;
				 twiddleFactorimgB1 <=#1 -0.740951;
				 stateIp1B1<=#1 401;
				 stateIp2B1<=#1 465;

				 //(402,466)
				 imgIp1B2 <= imagWorkingBuffer[402];
				 realIp1B2 <= realWorkingBuffer[402];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=#1 0.634393;
				 twiddleFactorimgB2 <=#1 -0.77301;
				 stateIp1B2<=#1 402;
				 stateIp2B2<=#1 466;

				 //(403,467)
				 imgIp1B3 <= imagWorkingBuffer[403];
				 realIp1B3 <= realWorkingBuffer[403];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=#1 0.595699;
				 twiddleFactorimgB3 <=#1 -0.803208;
				 stateIp1B3<=#1 403;
				 stateIp2B3<=#1 467;

				 //(404,468)
				 imgIp1B4 <= imagWorkingBuffer[404];
				 realIp1B4 <= realWorkingBuffer[404];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=#1 0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 404;
				 stateIp2B4<=#1 468;

				 //(405,469)
				 imgIp1B5 <= imagWorkingBuffer[405];
				 realIp1B5 <= realWorkingBuffer[405];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=#1 0.514103;
				 twiddleFactorimgB5 <=#1 -0.857729;
				 stateIp1B5<=#1 405;
				 stateIp2B5<=#1 469;

				 //(406,470)
				 imgIp1B6 <= imagWorkingBuffer[406];
				 realIp1B6 <= realWorkingBuffer[406];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=#1 0.471397;
				 twiddleFactorimgB6 <=#1 -0.881921;
				 stateIp1B6<=#1 406;
				 stateIp2B6<=#1 470;

				 //(407,471)
				 imgIp1B7 <= imagWorkingBuffer[407];
				 realIp1B7 <= realWorkingBuffer[407];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=#1 0.427555;
				 twiddleFactorimgB7 <=#1 -0.903989;
				 stateIp1B7<=#1 407;
				 stateIp2B7<=#1 471;
			 end
			 220 : begin

				 //(408,472)
				 imgIp1B0 <= imagWorkingBuffer[408];
				 realIp1B0 <= realWorkingBuffer[408];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 408;
				 stateIp2B0<=#1 472;

				 //(409,473)
				 imgIp1B1 <= imagWorkingBuffer[409];
				 realIp1B1 <= realWorkingBuffer[409];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=#1 0.33689;
				 twiddleFactorimgB1 <=#1 -0.941544;
				 stateIp1B1<=#1 409;
				 stateIp2B1<=#1 473;

				 //(410,474)
				 imgIp1B2 <= imagWorkingBuffer[410];
				 realIp1B2 <= realWorkingBuffer[410];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=#1 0.290285;
				 twiddleFactorimgB2 <=#1 -0.95694;
				 stateIp1B2<=#1 410;
				 stateIp2B2<=#1 474;

				 //(411,475)
				 imgIp1B3 <= imagWorkingBuffer[411];
				 realIp1B3 <= realWorkingBuffer[411];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=#1 0.24298;
				 twiddleFactorimgB3 <=#1 -0.970031;
				 stateIp1B3<=#1 411;
				 stateIp2B3<=#1 475;

				 //(412,476)
				 imgIp1B4 <= imagWorkingBuffer[412];
				 realIp1B4 <= realWorkingBuffer[412];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=#1 0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 412;
				 stateIp2B4<=#1 476;

				 //(413,477)
				 imgIp1B5 <= imagWorkingBuffer[413];
				 realIp1B5 <= realWorkingBuffer[413];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=#1 0.14673;
				 twiddleFactorimgB5 <=#1 -0.989177;
				 stateIp1B5<=#1 413;
				 stateIp2B5<=#1 477;

				 //(414,478)
				 imgIp1B6 <= imagWorkingBuffer[414];
				 realIp1B6 <= realWorkingBuffer[414];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 0.098017;
				 twiddleFactorimgB6 <=#1 -0.995185;
				 stateIp1B6<=#1 414;
				 stateIp2B6<=#1 478;

				 //(415,479)
				 imgIp1B7 <= imagWorkingBuffer[415];
				 realIp1B7 <= realWorkingBuffer[415];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 0.049068;
				 twiddleFactorimgB7 <=#1 -0.998795;
				 stateIp1B7<=#1 415;
				 stateIp2B7<=#1 479;
			 end
			 221 : begin

				 //(416,480)
				 imgIp1B0 <= imagWorkingBuffer[416];
				 realIp1B0 <= realWorkingBuffer[416];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 416;
				 stateIp2B0<=#1 480;

				 //(417,481)
				 imgIp1B1 <= imagWorkingBuffer[417];
				 realIp1B1 <= realWorkingBuffer[417];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=#1 -0.049068;
				 twiddleFactorimgB1 <=#1 -0.998795;
				 stateIp1B1<=#1 417;
				 stateIp2B1<=#1 481;

				 //(418,482)
				 imgIp1B2 <= imagWorkingBuffer[418];
				 realIp1B2 <= realWorkingBuffer[418];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=#1 -0.098017;
				 twiddleFactorimgB2 <=#1 -0.995185;
				 stateIp1B2<=#1 418;
				 stateIp2B2<=#1 482;

				 //(419,483)
				 imgIp1B3 <= imagWorkingBuffer[419];
				 realIp1B3 <= realWorkingBuffer[419];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=#1 -0.14673;
				 twiddleFactorimgB3 <=#1 -0.989177;
				 stateIp1B3<=#1 419;
				 stateIp2B3<=#1 483;

				 //(420,484)
				 imgIp1B4 <= imagWorkingBuffer[420];
				 realIp1B4 <= realWorkingBuffer[420];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=#1 -0.19509;
				 twiddleFactorimgB4 <=#1 -0.980785;
				 stateIp1B4<=#1 420;
				 stateIp2B4<=#1 484;

				 //(421,485)
				 imgIp1B5 <= imagWorkingBuffer[421];
				 realIp1B5 <= realWorkingBuffer[421];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=#1 -0.24298;
				 twiddleFactorimgB5 <=#1 -0.970031;
				 stateIp1B5<=#1 421;
				 stateIp2B5<=#1 485;

				 //(422,486)
				 imgIp1B6 <= imagWorkingBuffer[422];
				 realIp1B6 <= realWorkingBuffer[422];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=#1 -0.290285;
				 twiddleFactorimgB6 <=#1 -0.95694;
				 stateIp1B6<=#1 422;
				 stateIp2B6<=#1 486;

				 //(423,487)
				 imgIp1B7 <= imagWorkingBuffer[423];
				 realIp1B7 <= realWorkingBuffer[423];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=#1 -0.33689;
				 twiddleFactorimgB7 <=#1 -0.941544;
				 stateIp1B7<=#1 423;
				 stateIp2B7<=#1 487;
			 end
			 222 : begin

				 //(424,488)
				 imgIp1B0 <= imagWorkingBuffer[424];
				 realIp1B0 <= realWorkingBuffer[424];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 424;
				 stateIp2B0<=#1 488;

				 //(425,489)
				 imgIp1B1 <= imagWorkingBuffer[425];
				 realIp1B1 <= realWorkingBuffer[425];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=#1 -0.427555;
				 twiddleFactorimgB1 <=#1 -0.903989;
				 stateIp1B1<=#1 425;
				 stateIp2B1<=#1 489;

				 //(426,490)
				 imgIp1B2 <= imagWorkingBuffer[426];
				 realIp1B2 <= realWorkingBuffer[426];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=#1 -0.471397;
				 twiddleFactorimgB2 <=#1 -0.881921;
				 stateIp1B2<=#1 426;
				 stateIp2B2<=#1 490;

				 //(427,491)
				 imgIp1B3 <= imagWorkingBuffer[427];
				 realIp1B3 <= realWorkingBuffer[427];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=#1 -0.514103;
				 twiddleFactorimgB3 <=#1 -0.857729;
				 stateIp1B3<=#1 427;
				 stateIp2B3<=#1 491;

				 //(428,492)
				 imgIp1B4 <= imagWorkingBuffer[428];
				 realIp1B4 <= realWorkingBuffer[428];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=#1 -0.55557;
				 twiddleFactorimgB4 <=#1 -0.83147;
				 stateIp1B4<=#1 428;
				 stateIp2B4<=#1 492;

				 //(429,493)
				 imgIp1B5 <= imagWorkingBuffer[429];
				 realIp1B5 <= realWorkingBuffer[429];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=#1 -0.595699;
				 twiddleFactorimgB5 <=#1 -0.803208;
				 stateIp1B5<=#1 429;
				 stateIp2B5<=#1 493;

				 //(430,494)
				 imgIp1B6 <= imagWorkingBuffer[430];
				 realIp1B6 <= realWorkingBuffer[430];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 -0.634393;
				 twiddleFactorimgB6 <=#1 -0.77301;
				 stateIp1B6<=#1 430;
				 stateIp2B6<=#1 494;

				 //(431,495)
				 imgIp1B7 <= imagWorkingBuffer[431];
				 realIp1B7 <= realWorkingBuffer[431];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 -0.671559;
				 twiddleFactorimgB7 <=#1 -0.740951;
				 stateIp1B7<=#1 431;
				 stateIp2B7<=#1 495;
			 end
			 223 : begin

				 //(432,496)
				 imgIp1B0 <= imagWorkingBuffer[432];
				 realIp1B0 <= realWorkingBuffer[432];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 432;
				 stateIp2B0<=#1 496;

				 //(433,497)
				 imgIp1B1 <= imagWorkingBuffer[433];
				 realIp1B1 <= realWorkingBuffer[433];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=#1 -0.740951;
				 twiddleFactorimgB1 <=#1 -0.671559;
				 stateIp1B1<=#1 433;
				 stateIp2B1<=#1 497;

				 //(434,498)
				 imgIp1B2 <= imagWorkingBuffer[434];
				 realIp1B2 <= realWorkingBuffer[434];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=#1 -0.77301;
				 twiddleFactorimgB2 <=#1 -0.634393;
				 stateIp1B2<=#1 434;
				 stateIp2B2<=#1 498;

				 //(435,499)
				 imgIp1B3 <= imagWorkingBuffer[435];
				 realIp1B3 <= realWorkingBuffer[435];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=#1 -0.803208;
				 twiddleFactorimgB3 <=#1 -0.595699;
				 stateIp1B3<=#1 435;
				 stateIp2B3<=#1 499;

				 //(436,500)
				 imgIp1B4 <= imagWorkingBuffer[436];
				 realIp1B4 <= realWorkingBuffer[436];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=#1 -0.83147;
				 twiddleFactorimgB4 <=#1 -0.55557;
				 stateIp1B4<=#1 436;
				 stateIp2B4<=#1 500;

				 //(437,501)
				 imgIp1B5 <= imagWorkingBuffer[437];
				 realIp1B5 <= realWorkingBuffer[437];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=#1 -0.857729;
				 twiddleFactorimgB5 <=#1 -0.514103;
				 stateIp1B5<=#1 437;
				 stateIp2B5<=#1 501;

				 //(438,502)
				 imgIp1B6 <= imagWorkingBuffer[438];
				 realIp1B6 <= realWorkingBuffer[438];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=#1 -0.881921;
				 twiddleFactorimgB6 <=#1 -0.471397;
				 stateIp1B6<=#1 438;
				 stateIp2B6<=#1 502;

				 //(439,503)
				 imgIp1B7 <= imagWorkingBuffer[439];
				 realIp1B7 <= realWorkingBuffer[439];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=#1 -0.903989;
				 twiddleFactorimgB7 <=#1 -0.427555;
				 stateIp1B7<=#1 439;
				 stateIp2B7<=#1 503;
			 end
			 224 : begin

				 //(440,504)
				 imgIp1B0 <= imagWorkingBuffer[440];
				 realIp1B0 <= realWorkingBuffer[440];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 440;
				 stateIp2B0<=#1 504;

				 //(441,505)
				 imgIp1B1 <= imagWorkingBuffer[441];
				 realIp1B1 <= realWorkingBuffer[441];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=#1 -0.941544;
				 twiddleFactorimgB1 <=#1 -0.33689;
				 stateIp1B1<=#1 441;
				 stateIp2B1<=#1 505;

				 //(442,506)
				 imgIp1B2 <= imagWorkingBuffer[442];
				 realIp1B2 <= realWorkingBuffer[442];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=#1 -0.95694;
				 twiddleFactorimgB2 <=#1 -0.290285;
				 stateIp1B2<=#1 442;
				 stateIp2B2<=#1 506;

				 //(443,507)
				 imgIp1B3 <= imagWorkingBuffer[443];
				 realIp1B3 <= realWorkingBuffer[443];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=#1 -0.970031;
				 twiddleFactorimgB3 <=#1 -0.24298;
				 stateIp1B3<=#1 443;
				 stateIp2B3<=#1 507;

				 //(444,508)
				 imgIp1B4 <= imagWorkingBuffer[444];
				 realIp1B4 <= realWorkingBuffer[444];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 -0.980785;
				 twiddleFactorimgB4 <=#1 -0.19509;
				 stateIp1B4<=#1 444;
				 stateIp2B4<=#1 508;

				 //(445,509)
				 imgIp1B5 <= imagWorkingBuffer[445];
				 realIp1B5 <= realWorkingBuffer[445];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 -0.989177;
				 twiddleFactorimgB5 <=#1 -0.14673;
				 stateIp1B5<=#1 445;
				 stateIp2B5<=#1 509;

				 //(446,510)
				 imgIp1B6 <= imagWorkingBuffer[446];
				 realIp1B6 <= realWorkingBuffer[446];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 -0.995185;
				 twiddleFactorimgB6 <=#1 -0.098017;
				 stateIp1B6<=#1 446;
				 stateIp2B6<=#1 510;

				 //(447,511)
				 imgIp1B7 <= imagWorkingBuffer[447];
				 realIp1B7 <= realWorkingBuffer[447];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.998795;
				 twiddleFactorimgB7 <=#1 -0.049068;
				 stateIp1B7<=#1 447;
				 stateIp2B7<=#1 511;
			 end
			 225 : begin

				 //(0,128)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[128];
				 realIp2B0 <= realWorkingBuffer[128];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 128;

				 //(1,129)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[129];
				 realIp2B1 <= realWorkingBuffer[129];
				 twiddleFactorRealB1 <=#1 0.999699;
				 twiddleFactorimgB1 <=#1 -0.024541;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 129;

				 //(2,130)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[130];
				 realIp2B2 <= realWorkingBuffer[130];
				 twiddleFactorRealB2 <=#1 0.998795;
				 twiddleFactorimgB2 <=#1 -0.049068;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 130;

				 //(3,131)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[131];
				 realIp2B3 <= realWorkingBuffer[131];
				 twiddleFactorRealB3 <=#1 0.99729;
				 twiddleFactorimgB3 <=#1 -0.073565;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 131;

				 //(4,132)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[132];
				 realIp2B4 <= realWorkingBuffer[132];
				 twiddleFactorRealB4 <=#1 0.995185;
				 twiddleFactorimgB4 <=#1 -0.098017;
				 stateIp1B4<=#1 4;
				 stateIp2B4<=#1 132;

				 //(5,133)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[133];
				 realIp2B5 <= realWorkingBuffer[133];
				 twiddleFactorRealB5 <=#1 0.99248;
				 twiddleFactorimgB5 <=#1 -0.122411;
				 stateIp1B5<=#1 5;
				 stateIp2B5<=#1 133;

				 //(6,134)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[134];
				 realIp2B6 <= realWorkingBuffer[134];
				 twiddleFactorRealB6 <=#1 0.989177;
				 twiddleFactorimgB6 <=#1 -0.14673;
				 stateIp1B6<=#1 6;
				 stateIp2B6<=#1 134;

				 //(7,135)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[135];
				 realIp2B7 <= realWorkingBuffer[135];
				 twiddleFactorRealB7 <=#1 0.985278;
				 twiddleFactorimgB7 <=#1 -0.170962;
				 stateIp1B7<=#1 7;
				 stateIp2B7<=#1 135;
			 end
			 226 : begin

				 //(8,136)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[136];
				 realIp2B0 <= realWorkingBuffer[136];
				 twiddleFactorRealB0 <=#1 0.980785;
				 twiddleFactorimgB0 <=#1 -0.19509;
				 stateIp1B0<=#1 8;
				 stateIp2B0<=#1 136;

				 //(9,137)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[137];
				 realIp2B1 <= realWorkingBuffer[137];
				 twiddleFactorRealB1 <=#1 0.975702;
				 twiddleFactorimgB1 <=#1 -0.219101;
				 stateIp1B1<=#1 9;
				 stateIp2B1<=#1 137;

				 //(10,138)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[138];
				 realIp2B2 <= realWorkingBuffer[138];
				 twiddleFactorRealB2 <=#1 0.970031;
				 twiddleFactorimgB2 <=#1 -0.24298;
				 stateIp1B2<=#1 10;
				 stateIp2B2<=#1 138;

				 //(11,139)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[139];
				 realIp2B3 <= realWorkingBuffer[139];
				 twiddleFactorRealB3 <=#1 0.963776;
				 twiddleFactorimgB3 <=#1 -0.266713;
				 stateIp1B3<=#1 11;
				 stateIp2B3<=#1 139;

				 //(12,140)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[140];
				 realIp2B4 <= realWorkingBuffer[140];
				 twiddleFactorRealB4 <=#1 0.95694;
				 twiddleFactorimgB4 <=#1 -0.290285;
				 stateIp1B4<=#1 12;
				 stateIp2B4<=#1 140;

				 //(13,141)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[141];
				 realIp2B5 <= realWorkingBuffer[141];
				 twiddleFactorRealB5 <=#1 0.949528;
				 twiddleFactorimgB5 <=#1 -0.313682;
				 stateIp1B5<=#1 13;
				 stateIp2B5<=#1 141;

				 //(14,142)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[142];
				 realIp2B6 <= realWorkingBuffer[142];
				 twiddleFactorRealB6 <=#1 0.941544;
				 twiddleFactorimgB6 <=#1 -0.33689;
				 stateIp1B6<=#1 14;
				 stateIp2B6<=#1 142;

				 //(15,143)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[143];
				 realIp2B7 <= realWorkingBuffer[143];
				 twiddleFactorRealB7 <=#1 0.932993;
				 twiddleFactorimgB7 <=#1 -0.359895;
				 stateIp1B7<=#1 15;
				 stateIp2B7<=#1 143;
			 end
			 227 : begin

				 //(16,144)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[144];
				 realIp2B0 <= realWorkingBuffer[144];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 144;

				 //(17,145)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[145];
				 realIp2B1 <= realWorkingBuffer[145];
				 twiddleFactorRealB1 <=#1 0.91421;
				 twiddleFactorimgB1 <=#1 -0.405241;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 145;

				 //(18,146)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[146];
				 realIp2B2 <= realWorkingBuffer[146];
				 twiddleFactorRealB2 <=#1 0.903989;
				 twiddleFactorimgB2 <=#1 -0.427555;
				 stateIp1B2<=#1 18;
				 stateIp2B2<=#1 146;

				 //(19,147)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[147];
				 realIp2B3 <= realWorkingBuffer[147];
				 twiddleFactorRealB3 <=#1 0.893224;
				 twiddleFactorimgB3 <=#1 -0.449611;
				 stateIp1B3<=#1 19;
				 stateIp2B3<=#1 147;

				 //(20,148)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[148];
				 realIp2B4 <= realWorkingBuffer[148];
				 twiddleFactorRealB4 <=#1 0.881921;
				 twiddleFactorimgB4 <=#1 -0.471397;
				 stateIp1B4<=#1 20;
				 stateIp2B4<=#1 148;

				 //(21,149)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[149];
				 realIp2B5 <= realWorkingBuffer[149];
				 twiddleFactorRealB5 <=#1 0.870087;
				 twiddleFactorimgB5 <=#1 -0.492898;
				 stateIp1B5<=#1 21;
				 stateIp2B5<=#1 149;

				 //(22,150)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[150];
				 realIp2B6 <= realWorkingBuffer[150];
				 twiddleFactorRealB6 <=#1 0.857729;
				 twiddleFactorimgB6 <=#1 -0.514103;
				 stateIp1B6<=#1 22;
				 stateIp2B6<=#1 150;

				 //(23,151)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[151];
				 realIp2B7 <= realWorkingBuffer[151];
				 twiddleFactorRealB7 <=#1 0.844854;
				 twiddleFactorimgB7 <=#1 -0.534998;
				 stateIp1B7<=#1 23;
				 stateIp2B7<=#1 151;
			 end
			 228 : begin

				 //(24,152)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[152];
				 realIp2B0 <= realWorkingBuffer[152];
				 twiddleFactorRealB0 <=#1 0.83147;
				 twiddleFactorimgB0 <=#1 -0.55557;
				 stateIp1B0<=#1 24;
				 stateIp2B0<=#1 152;

				 //(25,153)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[153];
				 realIp2B1 <= realWorkingBuffer[153];
				 twiddleFactorRealB1 <=#1 0.817585;
				 twiddleFactorimgB1 <=#1 -0.575808;
				 stateIp1B1<=#1 25;
				 stateIp2B1<=#1 153;

				 //(26,154)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[154];
				 realIp2B2 <= realWorkingBuffer[154];
				 twiddleFactorRealB2 <=#1 0.803208;
				 twiddleFactorimgB2 <=#1 -0.595699;
				 stateIp1B2<=#1 26;
				 stateIp2B2<=#1 154;

				 //(27,155)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[155];
				 realIp2B3 <= realWorkingBuffer[155];
				 twiddleFactorRealB3 <=#1 0.788346;
				 twiddleFactorimgB3 <=#1 -0.615232;
				 stateIp1B3<=#1 27;
				 stateIp2B3<=#1 155;

				 //(28,156)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[156];
				 realIp2B4 <= realWorkingBuffer[156];
				 twiddleFactorRealB4 <=#1 0.77301;
				 twiddleFactorimgB4 <=#1 -0.634393;
				 stateIp1B4<=#1 28;
				 stateIp2B4<=#1 156;

				 //(29,157)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[157];
				 realIp2B5 <= realWorkingBuffer[157];
				 twiddleFactorRealB5 <=#1 0.757209;
				 twiddleFactorimgB5 <=#1 -0.653173;
				 stateIp1B5<=#1 29;
				 stateIp2B5<=#1 157;

				 //(30,158)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[158];
				 realIp2B6 <= realWorkingBuffer[158];
				 twiddleFactorRealB6 <=#1 0.740951;
				 twiddleFactorimgB6 <=#1 -0.671559;
				 stateIp1B6<=#1 30;
				 stateIp2B6<=#1 158;

				 //(31,159)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[159];
				 realIp2B7 <= realWorkingBuffer[159];
				 twiddleFactorRealB7 <=#1 0.724247;
				 twiddleFactorimgB7 <=#1 -0.689541;
				 stateIp1B7<=#1 31;
				 stateIp2B7<=#1 159;
			 end
			 229 : begin

				 //(32,160)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[160];
				 realIp2B0 <= realWorkingBuffer[160];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 160;

				 //(33,161)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[161];
				 realIp2B1 <= realWorkingBuffer[161];
				 twiddleFactorRealB1 <=#1 0.689541;
				 twiddleFactorimgB1 <=#1 -0.724247;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 161;

				 //(34,162)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[162];
				 realIp2B2 <= realWorkingBuffer[162];
				 twiddleFactorRealB2 <=#1 0.671559;
				 twiddleFactorimgB2 <=#1 -0.740951;
				 stateIp1B2<=#1 34;
				 stateIp2B2<=#1 162;

				 //(35,163)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[163];
				 realIp2B3 <= realWorkingBuffer[163];
				 twiddleFactorRealB3 <=#1 0.653173;
				 twiddleFactorimgB3 <=#1 -0.757209;
				 stateIp1B3<=#1 35;
				 stateIp2B3<=#1 163;

				 //(36,164)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[164];
				 realIp2B4 <= realWorkingBuffer[164];
				 twiddleFactorRealB4 <=#1 0.634393;
				 twiddleFactorimgB4 <=#1 -0.77301;
				 stateIp1B4<=#1 36;
				 stateIp2B4<=#1 164;

				 //(37,165)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[165];
				 realIp2B5 <= realWorkingBuffer[165];
				 twiddleFactorRealB5 <=#1 0.615232;
				 twiddleFactorimgB5 <=#1 -0.788346;
				 stateIp1B5<=#1 37;
				 stateIp2B5<=#1 165;

				 //(38,166)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[166];
				 realIp2B6 <= realWorkingBuffer[166];
				 twiddleFactorRealB6 <=#1 0.595699;
				 twiddleFactorimgB6 <=#1 -0.803208;
				 stateIp1B6<=#1 38;
				 stateIp2B6<=#1 166;

				 //(39,167)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[167];
				 realIp2B7 <= realWorkingBuffer[167];
				 twiddleFactorRealB7 <=#1 0.575808;
				 twiddleFactorimgB7 <=#1 -0.817585;
				 stateIp1B7<=#1 39;
				 stateIp2B7<=#1 167;
			 end
			 230 : begin

				 //(40,168)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[168];
				 realIp2B0 <= realWorkingBuffer[168];
				 twiddleFactorRealB0 <=#1 0.55557;
				 twiddleFactorimgB0 <=#1 -0.83147;
				 stateIp1B0<=#1 40;
				 stateIp2B0<=#1 168;

				 //(41,169)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[169];
				 realIp2B1 <= realWorkingBuffer[169];
				 twiddleFactorRealB1 <=#1 0.534998;
				 twiddleFactorimgB1 <=#1 -0.844854;
				 stateIp1B1<=#1 41;
				 stateIp2B1<=#1 169;

				 //(42,170)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[170];
				 realIp2B2 <= realWorkingBuffer[170];
				 twiddleFactorRealB2 <=#1 0.514103;
				 twiddleFactorimgB2 <=#1 -0.857729;
				 stateIp1B2<=#1 42;
				 stateIp2B2<=#1 170;

				 //(43,171)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[171];
				 realIp2B3 <= realWorkingBuffer[171];
				 twiddleFactorRealB3 <=#1 0.492898;
				 twiddleFactorimgB3 <=#1 -0.870087;
				 stateIp1B3<=#1 43;
				 stateIp2B3<=#1 171;

				 //(44,172)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[172];
				 realIp2B4 <= realWorkingBuffer[172];
				 twiddleFactorRealB4 <=#1 0.471397;
				 twiddleFactorimgB4 <=#1 -0.881921;
				 stateIp1B4<=#1 44;
				 stateIp2B4<=#1 172;

				 //(45,173)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[173];
				 realIp2B5 <= realWorkingBuffer[173];
				 twiddleFactorRealB5 <=#1 0.449611;
				 twiddleFactorimgB5 <=#1 -0.893224;
				 stateIp1B5<=#1 45;
				 stateIp2B5<=#1 173;

				 //(46,174)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[174];
				 realIp2B6 <= realWorkingBuffer[174];
				 twiddleFactorRealB6 <=#1 0.427555;
				 twiddleFactorimgB6 <=#1 -0.903989;
				 stateIp1B6<=#1 46;
				 stateIp2B6<=#1 174;

				 //(47,175)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[175];
				 realIp2B7 <= realWorkingBuffer[175];
				 twiddleFactorRealB7 <=#1 0.405241;
				 twiddleFactorimgB7 <=#1 -0.91421;
				 stateIp1B7<=#1 47;
				 stateIp2B7<=#1 175;
			 end
			 231 : begin

				 //(48,176)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[176];
				 realIp2B0 <= realWorkingBuffer[176];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 176;

				 //(49,177)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[177];
				 realIp2B1 <= realWorkingBuffer[177];
				 twiddleFactorRealB1 <=#1 0.359895;
				 twiddleFactorimgB1 <=#1 -0.932993;
				 stateIp1B1<=#1 49;
				 stateIp2B1<=#1 177;

				 //(50,178)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[178];
				 realIp2B2 <= realWorkingBuffer[178];
				 twiddleFactorRealB2 <=#1 0.33689;
				 twiddleFactorimgB2 <=#1 -0.941544;
				 stateIp1B2<=#1 50;
				 stateIp2B2<=#1 178;

				 //(51,179)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[179];
				 realIp2B3 <= realWorkingBuffer[179];
				 twiddleFactorRealB3 <=#1 0.313682;
				 twiddleFactorimgB3 <=#1 -0.949528;
				 stateIp1B3<=#1 51;
				 stateIp2B3<=#1 179;

				 //(52,180)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[180];
				 realIp2B4 <= realWorkingBuffer[180];
				 twiddleFactorRealB4 <=#1 0.290285;
				 twiddleFactorimgB4 <=#1 -0.95694;
				 stateIp1B4<=#1 52;
				 stateIp2B4<=#1 180;

				 //(53,181)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[181];
				 realIp2B5 <= realWorkingBuffer[181];
				 twiddleFactorRealB5 <=#1 0.266713;
				 twiddleFactorimgB5 <=#1 -0.963776;
				 stateIp1B5<=#1 53;
				 stateIp2B5<=#1 181;

				 //(54,182)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[182];
				 realIp2B6 <= realWorkingBuffer[182];
				 twiddleFactorRealB6 <=#1 0.24298;
				 twiddleFactorimgB6 <=#1 -0.970031;
				 stateIp1B6<=#1 54;
				 stateIp2B6<=#1 182;

				 //(55,183)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[183];
				 realIp2B7 <= realWorkingBuffer[183];
				 twiddleFactorRealB7 <=#1 0.219101;
				 twiddleFactorimgB7 <=#1 -0.975702;
				 stateIp1B7<=#1 55;
				 stateIp2B7<=#1 183;
			 end
			 232 : begin

				 //(56,184)
				 imgIp1B0 <= imagWorkingBuffer[56];
				 realIp1B0 <= realWorkingBuffer[56];
				 imgIp2B0 <= imagWorkingBuffer[184];
				 realIp2B0 <= realWorkingBuffer[184];
				 twiddleFactorRealB0 <=#1 0.19509;
				 twiddleFactorimgB0 <=#1 -0.980785;
				 stateIp1B0<=#1 56;
				 stateIp2B0<=#1 184;

				 //(57,185)
				 imgIp1B1 <= imagWorkingBuffer[57];
				 realIp1B1 <= realWorkingBuffer[57];
				 imgIp2B1 <= imagWorkingBuffer[185];
				 realIp2B1 <= realWorkingBuffer[185];
				 twiddleFactorRealB1 <=#1 0.170962;
				 twiddleFactorimgB1 <=#1 -0.985278;
				 stateIp1B1<=#1 57;
				 stateIp2B1<=#1 185;

				 //(58,186)
				 imgIp1B2 <= imagWorkingBuffer[58];
				 realIp1B2 <= realWorkingBuffer[58];
				 imgIp2B2 <= imagWorkingBuffer[186];
				 realIp2B2 <= realWorkingBuffer[186];
				 twiddleFactorRealB2 <=#1 0.14673;
				 twiddleFactorimgB2 <=#1 -0.989177;
				 stateIp1B2<=#1 58;
				 stateIp2B2<=#1 186;

				 //(59,187)
				 imgIp1B3 <= imagWorkingBuffer[59];
				 realIp1B3 <= realWorkingBuffer[59];
				 imgIp2B3 <= imagWorkingBuffer[187];
				 realIp2B3 <= realWorkingBuffer[187];
				 twiddleFactorRealB3 <=#1 0.122411;
				 twiddleFactorimgB3 <=#1 -0.99248;
				 stateIp1B3<=#1 59;
				 stateIp2B3<=#1 187;

				 //(60,188)
				 imgIp1B4 <= imagWorkingBuffer[60];
				 realIp1B4 <= realWorkingBuffer[60];
				 imgIp2B4 <= imagWorkingBuffer[188];
				 realIp2B4 <= realWorkingBuffer[188];
				 twiddleFactorRealB4 <=#1 0.098017;
				 twiddleFactorimgB4 <=#1 -0.995185;
				 stateIp1B4<=#1 60;
				 stateIp2B4<=#1 188;

				 //(61,189)
				 imgIp1B5 <= imagWorkingBuffer[61];
				 realIp1B5 <= realWorkingBuffer[61];
				 imgIp2B5 <= imagWorkingBuffer[189];
				 realIp2B5 <= realWorkingBuffer[189];
				 twiddleFactorRealB5 <=#1 0.073565;
				 twiddleFactorimgB5 <=#1 -0.99729;
				 stateIp1B5<=#1 61;
				 stateIp2B5<=#1 189;

				 //(62,190)
				 imgIp1B6 <= imagWorkingBuffer[62];
				 realIp1B6 <= realWorkingBuffer[62];
				 imgIp2B6 <= imagWorkingBuffer[190];
				 realIp2B6 <= realWorkingBuffer[190];
				 twiddleFactorRealB6 <=#1 0.049068;
				 twiddleFactorimgB6 <=#1 -0.998795;
				 stateIp1B6<=#1 62;
				 stateIp2B6<=#1 190;

				 //(63,191)
				 imgIp1B7 <= imagWorkingBuffer[63];
				 realIp1B7 <= realWorkingBuffer[63];
				 imgIp2B7 <= imagWorkingBuffer[191];
				 realIp2B7 <= realWorkingBuffer[191];
				 twiddleFactorRealB7 <=#1 0.024541;
				 twiddleFactorimgB7 <=#1 -0.999699;
				 stateIp1B7<=#1 63;
				 stateIp2B7<=#1 191;
			 end
			 233 : begin

				 //(64,192)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[192];
				 realIp2B0 <= realWorkingBuffer[192];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 192;

				 //(65,193)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[193];
				 realIp2B1 <= realWorkingBuffer[193];
				 twiddleFactorRealB1 <=#1 -0.024541;
				 twiddleFactorimgB1 <=#1 -0.999699;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 193;

				 //(66,194)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[194];
				 realIp2B2 <= realWorkingBuffer[194];
				 twiddleFactorRealB2 <=#1 -0.049068;
				 twiddleFactorimgB2 <=#1 -0.998795;
				 stateIp1B2<=#1 66;
				 stateIp2B2<=#1 194;

				 //(67,195)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[195];
				 realIp2B3 <= realWorkingBuffer[195];
				 twiddleFactorRealB3 <=#1 -0.073565;
				 twiddleFactorimgB3 <=#1 -0.99729;
				 stateIp1B3<=#1 67;
				 stateIp2B3<=#1 195;

				 //(68,196)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[196];
				 realIp2B4 <= realWorkingBuffer[196];
				 twiddleFactorRealB4 <=#1 -0.098017;
				 twiddleFactorimgB4 <=#1 -0.995185;
				 stateIp1B4<=#1 68;
				 stateIp2B4<=#1 196;

				 //(69,197)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[197];
				 realIp2B5 <= realWorkingBuffer[197];
				 twiddleFactorRealB5 <=#1 -0.122411;
				 twiddleFactorimgB5 <=#1 -0.99248;
				 stateIp1B5<=#1 69;
				 stateIp2B5<=#1 197;

				 //(70,198)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[198];
				 realIp2B6 <= realWorkingBuffer[198];
				 twiddleFactorRealB6 <=#1 -0.14673;
				 twiddleFactorimgB6 <=#1 -0.989177;
				 stateIp1B6<=#1 70;
				 stateIp2B6<=#1 198;

				 //(71,199)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[199];
				 realIp2B7 <= realWorkingBuffer[199];
				 twiddleFactorRealB7 <=#1 -0.170962;
				 twiddleFactorimgB7 <=#1 -0.985278;
				 stateIp1B7<=#1 71;
				 stateIp2B7<=#1 199;
			 end
			 234 : begin

				 //(72,200)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[200];
				 realIp2B0 <= realWorkingBuffer[200];
				 twiddleFactorRealB0 <=#1 -0.19509;
				 twiddleFactorimgB0 <=#1 -0.980785;
				 stateIp1B0<=#1 72;
				 stateIp2B0<=#1 200;

				 //(73,201)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[201];
				 realIp2B1 <= realWorkingBuffer[201];
				 twiddleFactorRealB1 <=#1 -0.219101;
				 twiddleFactorimgB1 <=#1 -0.975702;
				 stateIp1B1<=#1 73;
				 stateIp2B1<=#1 201;

				 //(74,202)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[202];
				 realIp2B2 <= realWorkingBuffer[202];
				 twiddleFactorRealB2 <=#1 -0.24298;
				 twiddleFactorimgB2 <=#1 -0.970031;
				 stateIp1B2<=#1 74;
				 stateIp2B2<=#1 202;

				 //(75,203)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[203];
				 realIp2B3 <= realWorkingBuffer[203];
				 twiddleFactorRealB3 <=#1 -0.266713;
				 twiddleFactorimgB3 <=#1 -0.963776;
				 stateIp1B3<=#1 75;
				 stateIp2B3<=#1 203;

				 //(76,204)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[204];
				 realIp2B4 <= realWorkingBuffer[204];
				 twiddleFactorRealB4 <=#1 -0.290285;
				 twiddleFactorimgB4 <=#1 -0.95694;
				 stateIp1B4<=#1 76;
				 stateIp2B4<=#1 204;

				 //(77,205)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[205];
				 realIp2B5 <= realWorkingBuffer[205];
				 twiddleFactorRealB5 <=#1 -0.313682;
				 twiddleFactorimgB5 <=#1 -0.949528;
				 stateIp1B5<=#1 77;
				 stateIp2B5<=#1 205;

				 //(78,206)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[206];
				 realIp2B6 <= realWorkingBuffer[206];
				 twiddleFactorRealB6 <=#1 -0.33689;
				 twiddleFactorimgB6 <=#1 -0.941544;
				 stateIp1B6<=#1 78;
				 stateIp2B6<=#1 206;

				 //(79,207)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[207];
				 realIp2B7 <= realWorkingBuffer[207];
				 twiddleFactorRealB7 <=#1 -0.359895;
				 twiddleFactorimgB7 <=#1 -0.932993;
				 stateIp1B7<=#1 79;
				 stateIp2B7<=#1 207;
			 end
			 235 : begin

				 //(80,208)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[208];
				 realIp2B0 <= realWorkingBuffer[208];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 208;

				 //(81,209)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[209];
				 realIp2B1 <= realWorkingBuffer[209];
				 twiddleFactorRealB1 <=#1 -0.405241;
				 twiddleFactorimgB1 <=#1 -0.91421;
				 stateIp1B1<=#1 81;
				 stateIp2B1<=#1 209;

				 //(82,210)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[210];
				 realIp2B2 <= realWorkingBuffer[210];
				 twiddleFactorRealB2 <=#1 -0.427555;
				 twiddleFactorimgB2 <=#1 -0.903989;
				 stateIp1B2<=#1 82;
				 stateIp2B2<=#1 210;

				 //(83,211)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[211];
				 realIp2B3 <= realWorkingBuffer[211];
				 twiddleFactorRealB3 <=#1 -0.449611;
				 twiddleFactorimgB3 <=#1 -0.893224;
				 stateIp1B3<=#1 83;
				 stateIp2B3<=#1 211;

				 //(84,212)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[212];
				 realIp2B4 <= realWorkingBuffer[212];
				 twiddleFactorRealB4 <=#1 -0.471397;
				 twiddleFactorimgB4 <=#1 -0.881921;
				 stateIp1B4<=#1 84;
				 stateIp2B4<=#1 212;

				 //(85,213)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[213];
				 realIp2B5 <= realWorkingBuffer[213];
				 twiddleFactorRealB5 <=#1 -0.492898;
				 twiddleFactorimgB5 <=#1 -0.870087;
				 stateIp1B5<=#1 85;
				 stateIp2B5<=#1 213;

				 //(86,214)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[214];
				 realIp2B6 <= realWorkingBuffer[214];
				 twiddleFactorRealB6 <=#1 -0.514103;
				 twiddleFactorimgB6 <=#1 -0.857729;
				 stateIp1B6<=#1 86;
				 stateIp2B6<=#1 214;

				 //(87,215)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[215];
				 realIp2B7 <= realWorkingBuffer[215];
				 twiddleFactorRealB7 <=#1 -0.534998;
				 twiddleFactorimgB7 <=#1 -0.844854;
				 stateIp1B7<=#1 87;
				 stateIp2B7<=#1 215;
			 end
			 236 : begin

				 //(88,216)
				 imgIp1B0 <= imagWorkingBuffer[88];
				 realIp1B0 <= realWorkingBuffer[88];
				 imgIp2B0 <= imagWorkingBuffer[216];
				 realIp2B0 <= realWorkingBuffer[216];
				 twiddleFactorRealB0 <=#1 -0.55557;
				 twiddleFactorimgB0 <=#1 -0.83147;
				 stateIp1B0<=#1 88;
				 stateIp2B0<=#1 216;

				 //(89,217)
				 imgIp1B1 <= imagWorkingBuffer[89];
				 realIp1B1 <= realWorkingBuffer[89];
				 imgIp2B1 <= imagWorkingBuffer[217];
				 realIp2B1 <= realWorkingBuffer[217];
				 twiddleFactorRealB1 <=#1 -0.575808;
				 twiddleFactorimgB1 <=#1 -0.817585;
				 stateIp1B1<=#1 89;
				 stateIp2B1<=#1 217;

				 //(90,218)
				 imgIp1B2 <= imagWorkingBuffer[90];
				 realIp1B2 <= realWorkingBuffer[90];
				 imgIp2B2 <= imagWorkingBuffer[218];
				 realIp2B2 <= realWorkingBuffer[218];
				 twiddleFactorRealB2 <=#1 -0.595699;
				 twiddleFactorimgB2 <=#1 -0.803208;
				 stateIp1B2<=#1 90;
				 stateIp2B2<=#1 218;

				 //(91,219)
				 imgIp1B3 <= imagWorkingBuffer[91];
				 realIp1B3 <= realWorkingBuffer[91];
				 imgIp2B3 <= imagWorkingBuffer[219];
				 realIp2B3 <= realWorkingBuffer[219];
				 twiddleFactorRealB3 <=#1 -0.615232;
				 twiddleFactorimgB3 <=#1 -0.788346;
				 stateIp1B3<=#1 91;
				 stateIp2B3<=#1 219;

				 //(92,220)
				 imgIp1B4 <= imagWorkingBuffer[92];
				 realIp1B4 <= realWorkingBuffer[92];
				 imgIp2B4 <= imagWorkingBuffer[220];
				 realIp2B4 <= realWorkingBuffer[220];
				 twiddleFactorRealB4 <=#1 -0.634393;
				 twiddleFactorimgB4 <=#1 -0.77301;
				 stateIp1B4<=#1 92;
				 stateIp2B4<=#1 220;

				 //(93,221)
				 imgIp1B5 <= imagWorkingBuffer[93];
				 realIp1B5 <= realWorkingBuffer[93];
				 imgIp2B5 <= imagWorkingBuffer[221];
				 realIp2B5 <= realWorkingBuffer[221];
				 twiddleFactorRealB5 <=#1 -0.653173;
				 twiddleFactorimgB5 <=#1 -0.757209;
				 stateIp1B5<=#1 93;
				 stateIp2B5<=#1 221;

				 //(94,222)
				 imgIp1B6 <= imagWorkingBuffer[94];
				 realIp1B6 <= realWorkingBuffer[94];
				 imgIp2B6 <= imagWorkingBuffer[222];
				 realIp2B6 <= realWorkingBuffer[222];
				 twiddleFactorRealB6 <=#1 -0.671559;
				 twiddleFactorimgB6 <=#1 -0.740951;
				 stateIp1B6<=#1 94;
				 stateIp2B6<=#1 222;

				 //(95,223)
				 imgIp1B7 <= imagWorkingBuffer[95];
				 realIp1B7 <= realWorkingBuffer[95];
				 imgIp2B7 <= imagWorkingBuffer[223];
				 realIp2B7 <= realWorkingBuffer[223];
				 twiddleFactorRealB7 <=#1 -0.689541;
				 twiddleFactorimgB7 <=#1 -0.724247;
				 stateIp1B7<=#1 95;
				 stateIp2B7<=#1 223;
			 end
			 237 : begin

				 //(96,224)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[224];
				 realIp2B0 <= realWorkingBuffer[224];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 224;

				 //(97,225)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[225];
				 realIp2B1 <= realWorkingBuffer[225];
				 twiddleFactorRealB1 <=#1 -0.724247;
				 twiddleFactorimgB1 <=#1 -0.689541;
				 stateIp1B1<=#1 97;
				 stateIp2B1<=#1 225;

				 //(98,226)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[226];
				 realIp2B2 <= realWorkingBuffer[226];
				 twiddleFactorRealB2 <=#1 -0.740951;
				 twiddleFactorimgB2 <=#1 -0.671559;
				 stateIp1B2<=#1 98;
				 stateIp2B2<=#1 226;

				 //(99,227)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[227];
				 realIp2B3 <= realWorkingBuffer[227];
				 twiddleFactorRealB3 <=#1 -0.757209;
				 twiddleFactorimgB3 <=#1 -0.653173;
				 stateIp1B3<=#1 99;
				 stateIp2B3<=#1 227;

				 //(100,228)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[228];
				 realIp2B4 <= realWorkingBuffer[228];
				 twiddleFactorRealB4 <=#1 -0.77301;
				 twiddleFactorimgB4 <=#1 -0.634393;
				 stateIp1B4<=#1 100;
				 stateIp2B4<=#1 228;

				 //(101,229)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[229];
				 realIp2B5 <= realWorkingBuffer[229];
				 twiddleFactorRealB5 <=#1 -0.788346;
				 twiddleFactorimgB5 <=#1 -0.615232;
				 stateIp1B5<=#1 101;
				 stateIp2B5<=#1 229;

				 //(102,230)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[230];
				 realIp2B6 <= realWorkingBuffer[230];
				 twiddleFactorRealB6 <=#1 -0.803208;
				 twiddleFactorimgB6 <=#1 -0.595699;
				 stateIp1B6<=#1 102;
				 stateIp2B6<=#1 230;

				 //(103,231)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[231];
				 realIp2B7 <= realWorkingBuffer[231];
				 twiddleFactorRealB7 <=#1 -0.817585;
				 twiddleFactorimgB7 <=#1 -0.575808;
				 stateIp1B7<=#1 103;
				 stateIp2B7<=#1 231;
			 end
			 238 : begin

				 //(104,232)
				 imgIp1B0 <= imagWorkingBuffer[104];
				 realIp1B0 <= realWorkingBuffer[104];
				 imgIp2B0 <= imagWorkingBuffer[232];
				 realIp2B0 <= realWorkingBuffer[232];
				 twiddleFactorRealB0 <=#1 -0.83147;
				 twiddleFactorimgB0 <=#1 -0.55557;
				 stateIp1B0<=#1 104;
				 stateIp2B0<=#1 232;

				 //(105,233)
				 imgIp1B1 <= imagWorkingBuffer[105];
				 realIp1B1 <= realWorkingBuffer[105];
				 imgIp2B1 <= imagWorkingBuffer[233];
				 realIp2B1 <= realWorkingBuffer[233];
				 twiddleFactorRealB1 <=#1 -0.844854;
				 twiddleFactorimgB1 <=#1 -0.534998;
				 stateIp1B1<=#1 105;
				 stateIp2B1<=#1 233;

				 //(106,234)
				 imgIp1B2 <= imagWorkingBuffer[106];
				 realIp1B2 <= realWorkingBuffer[106];
				 imgIp2B2 <= imagWorkingBuffer[234];
				 realIp2B2 <= realWorkingBuffer[234];
				 twiddleFactorRealB2 <=#1 -0.857729;
				 twiddleFactorimgB2 <=#1 -0.514103;
				 stateIp1B2<=#1 106;
				 stateIp2B2<=#1 234;

				 //(107,235)
				 imgIp1B3 <= imagWorkingBuffer[107];
				 realIp1B3 <= realWorkingBuffer[107];
				 imgIp2B3 <= imagWorkingBuffer[235];
				 realIp2B3 <= realWorkingBuffer[235];
				 twiddleFactorRealB3 <=#1 -0.870087;
				 twiddleFactorimgB3 <=#1 -0.492898;
				 stateIp1B3<=#1 107;
				 stateIp2B3<=#1 235;

				 //(108,236)
				 imgIp1B4 <= imagWorkingBuffer[108];
				 realIp1B4 <= realWorkingBuffer[108];
				 imgIp2B4 <= imagWorkingBuffer[236];
				 realIp2B4 <= realWorkingBuffer[236];
				 twiddleFactorRealB4 <=#1 -0.881921;
				 twiddleFactorimgB4 <=#1 -0.471397;
				 stateIp1B4<=#1 108;
				 stateIp2B4<=#1 236;

				 //(109,237)
				 imgIp1B5 <= imagWorkingBuffer[109];
				 realIp1B5 <= realWorkingBuffer[109];
				 imgIp2B5 <= imagWorkingBuffer[237];
				 realIp2B5 <= realWorkingBuffer[237];
				 twiddleFactorRealB5 <=#1 -0.893224;
				 twiddleFactorimgB5 <=#1 -0.449611;
				 stateIp1B5<=#1 109;
				 stateIp2B5<=#1 237;

				 //(110,238)
				 imgIp1B6 <= imagWorkingBuffer[110];
				 realIp1B6 <= realWorkingBuffer[110];
				 imgIp2B6 <= imagWorkingBuffer[238];
				 realIp2B6 <= realWorkingBuffer[238];
				 twiddleFactorRealB6 <=#1 -0.903989;
				 twiddleFactorimgB6 <=#1 -0.427555;
				 stateIp1B6<=#1 110;
				 stateIp2B6<=#1 238;

				 //(111,239)
				 imgIp1B7 <= imagWorkingBuffer[111];
				 realIp1B7 <= realWorkingBuffer[111];
				 imgIp2B7 <= imagWorkingBuffer[239];
				 realIp2B7 <= realWorkingBuffer[239];
				 twiddleFactorRealB7 <=#1 -0.91421;
				 twiddleFactorimgB7 <=#1 -0.405241;
				 stateIp1B7<=#1 111;
				 stateIp2B7<=#1 239;
			 end
			 239 : begin

				 //(112,240)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[240];
				 realIp2B0 <= realWorkingBuffer[240];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 112;
				 stateIp2B0<=#1 240;

				 //(113,241)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[241];
				 realIp2B1 <= realWorkingBuffer[241];
				 twiddleFactorRealB1 <=#1 -0.932993;
				 twiddleFactorimgB1 <=#1 -0.359895;
				 stateIp1B1<=#1 113;
				 stateIp2B1<=#1 241;

				 //(114,242)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[242];
				 realIp2B2 <= realWorkingBuffer[242];
				 twiddleFactorRealB2 <=#1 -0.941544;
				 twiddleFactorimgB2 <=#1 -0.33689;
				 stateIp1B2<=#1 114;
				 stateIp2B2<=#1 242;

				 //(115,243)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[243];
				 realIp2B3 <= realWorkingBuffer[243];
				 twiddleFactorRealB3 <=#1 -0.949528;
				 twiddleFactorimgB3 <=#1 -0.313682;
				 stateIp1B3<=#1 115;
				 stateIp2B3<=#1 243;

				 //(116,244)
				 imgIp1B4 <= imagWorkingBuffer[116];
				 realIp1B4 <= realWorkingBuffer[116];
				 imgIp2B4 <= imagWorkingBuffer[244];
				 realIp2B4 <= realWorkingBuffer[244];
				 twiddleFactorRealB4 <=#1 -0.95694;
				 twiddleFactorimgB4 <=#1 -0.290285;
				 stateIp1B4<=#1 116;
				 stateIp2B4<=#1 244;

				 //(117,245)
				 imgIp1B5 <= imagWorkingBuffer[117];
				 realIp1B5 <= realWorkingBuffer[117];
				 imgIp2B5 <= imagWorkingBuffer[245];
				 realIp2B5 <= realWorkingBuffer[245];
				 twiddleFactorRealB5 <=#1 -0.963776;
				 twiddleFactorimgB5 <=#1 -0.266713;
				 stateIp1B5<=#1 117;
				 stateIp2B5<=#1 245;

				 //(118,246)
				 imgIp1B6 <= imagWorkingBuffer[118];
				 realIp1B6 <= realWorkingBuffer[118];
				 imgIp2B6 <= imagWorkingBuffer[246];
				 realIp2B6 <= realWorkingBuffer[246];
				 twiddleFactorRealB6 <=#1 -0.970031;
				 twiddleFactorimgB6 <=#1 -0.24298;
				 stateIp1B6<=#1 118;
				 stateIp2B6<=#1 246;

				 //(119,247)
				 imgIp1B7 <= imagWorkingBuffer[119];
				 realIp1B7 <= realWorkingBuffer[119];
				 imgIp2B7 <= imagWorkingBuffer[247];
				 realIp2B7 <= realWorkingBuffer[247];
				 twiddleFactorRealB7 <=#1 -0.975702;
				 twiddleFactorimgB7 <=#1 -0.219101;
				 stateIp1B7<=#1 119;
				 stateIp2B7<=#1 247;
			 end
			 240 : begin

				 //(120,248)
				 imgIp1B0 <= imagWorkingBuffer[120];
				 realIp1B0 <= realWorkingBuffer[120];
				 imgIp2B0 <= imagWorkingBuffer[248];
				 realIp2B0 <= realWorkingBuffer[248];
				 twiddleFactorRealB0 <=#1 -0.980785;
				 twiddleFactorimgB0 <=#1 -0.19509;
				 stateIp1B0<=#1 120;
				 stateIp2B0<=#1 248;

				 //(121,249)
				 imgIp1B1 <= imagWorkingBuffer[121];
				 realIp1B1 <= realWorkingBuffer[121];
				 imgIp2B1 <= imagWorkingBuffer[249];
				 realIp2B1 <= realWorkingBuffer[249];
				 twiddleFactorRealB1 <=#1 -0.985278;
				 twiddleFactorimgB1 <=#1 -0.170962;
				 stateIp1B1<=#1 121;
				 stateIp2B1<=#1 249;

				 //(122,250)
				 imgIp1B2 <= imagWorkingBuffer[122];
				 realIp1B2 <= realWorkingBuffer[122];
				 imgIp2B2 <= imagWorkingBuffer[250];
				 realIp2B2 <= realWorkingBuffer[250];
				 twiddleFactorRealB2 <=#1 -0.989177;
				 twiddleFactorimgB2 <=#1 -0.14673;
				 stateIp1B2<=#1 122;
				 stateIp2B2<=#1 250;

				 //(123,251)
				 imgIp1B3 <= imagWorkingBuffer[123];
				 realIp1B3 <= realWorkingBuffer[123];
				 imgIp2B3 <= imagWorkingBuffer[251];
				 realIp2B3 <= realWorkingBuffer[251];
				 twiddleFactorRealB3 <=#1 -0.99248;
				 twiddleFactorimgB3 <=#1 -0.122411;
				 stateIp1B3<=#1 123;
				 stateIp2B3<=#1 251;

				 //(124,252)
				 imgIp1B4 <= imagWorkingBuffer[124];
				 realIp1B4 <= realWorkingBuffer[124];
				 imgIp2B4 <= imagWorkingBuffer[252];
				 realIp2B4 <= realWorkingBuffer[252];
				 twiddleFactorRealB4 <=#1 -0.995185;
				 twiddleFactorimgB4 <=#1 -0.098017;
				 stateIp1B4<=#1 124;
				 stateIp2B4<=#1 252;

				 //(125,253)
				 imgIp1B5 <= imagWorkingBuffer[125];
				 realIp1B5 <= realWorkingBuffer[125];
				 imgIp2B5 <= imagWorkingBuffer[253];
				 realIp2B5 <= realWorkingBuffer[253];
				 twiddleFactorRealB5 <=#1 -0.99729;
				 twiddleFactorimgB5 <=#1 -0.073565;
				 stateIp1B5<=#1 125;
				 stateIp2B5<=#1 253;

				 //(126,254)
				 imgIp1B6 <= imagWorkingBuffer[126];
				 realIp1B6 <= realWorkingBuffer[126];
				 imgIp2B6 <= imagWorkingBuffer[254];
				 realIp2B6 <= realWorkingBuffer[254];
				 twiddleFactorRealB6 <=#1 -0.998795;
				 twiddleFactorimgB6 <=#1 -0.049068;
				 stateIp1B6<=#1 126;
				 stateIp2B6<=#1 254;

				 //(127,255)
				 imgIp1B7 <= imagWorkingBuffer[127];
				 realIp1B7 <= realWorkingBuffer[127];
				 imgIp2B7 <= imagWorkingBuffer[255];
				 realIp2B7 <= realWorkingBuffer[255];
				 twiddleFactorRealB7 <=#1 -0.999699;
				 twiddleFactorimgB7 <=#1 -0.024541;
				 stateIp1B7<=#1 127;
				 stateIp2B7<=#1 255;
			 end
			 241 : begin

				 //(256,384)
				 imgIp1B0 <= imagWorkingBuffer[256];
				 realIp1B0 <= realWorkingBuffer[256];
				 imgIp2B0 <= imagWorkingBuffer[384];
				 realIp2B0 <= realWorkingBuffer[384];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 256;
				 stateIp2B0<=#1 384;

				 //(257,385)
				 imgIp1B1 <= imagWorkingBuffer[257];
				 realIp1B1 <= realWorkingBuffer[257];
				 imgIp2B1 <= imagWorkingBuffer[385];
				 realIp2B1 <= realWorkingBuffer[385];
				 twiddleFactorRealB1 <=#1 0.999699;
				 twiddleFactorimgB1 <=#1 -0.024541;
				 stateIp1B1<=#1 257;
				 stateIp2B1<=#1 385;

				 //(258,386)
				 imgIp1B2 <= imagWorkingBuffer[258];
				 realIp1B2 <= realWorkingBuffer[258];
				 imgIp2B2 <= imagWorkingBuffer[386];
				 realIp2B2 <= realWorkingBuffer[386];
				 twiddleFactorRealB2 <=#1 0.998795;
				 twiddleFactorimgB2 <=#1 -0.049068;
				 stateIp1B2<=#1 258;
				 stateIp2B2<=#1 386;

				 //(259,387)
				 imgIp1B3 <= imagWorkingBuffer[259];
				 realIp1B3 <= realWorkingBuffer[259];
				 imgIp2B3 <= imagWorkingBuffer[387];
				 realIp2B3 <= realWorkingBuffer[387];
				 twiddleFactorRealB3 <=#1 0.99729;
				 twiddleFactorimgB3 <=#1 -0.073565;
				 stateIp1B3<=#1 259;
				 stateIp2B3<=#1 387;

				 //(260,388)
				 imgIp1B4 <= imagWorkingBuffer[260];
				 realIp1B4 <= realWorkingBuffer[260];
				 imgIp2B4 <= imagWorkingBuffer[388];
				 realIp2B4 <= realWorkingBuffer[388];
				 twiddleFactorRealB4 <=#1 0.995185;
				 twiddleFactorimgB4 <=#1 -0.098017;
				 stateIp1B4<=#1 260;
				 stateIp2B4<=#1 388;

				 //(261,389)
				 imgIp1B5 <= imagWorkingBuffer[261];
				 realIp1B5 <= realWorkingBuffer[261];
				 imgIp2B5 <= imagWorkingBuffer[389];
				 realIp2B5 <= realWorkingBuffer[389];
				 twiddleFactorRealB5 <=#1 0.99248;
				 twiddleFactorimgB5 <=#1 -0.122411;
				 stateIp1B5<=#1 261;
				 stateIp2B5<=#1 389;

				 //(262,390)
				 imgIp1B6 <= imagWorkingBuffer[262];
				 realIp1B6 <= realWorkingBuffer[262];
				 imgIp2B6 <= imagWorkingBuffer[390];
				 realIp2B6 <= realWorkingBuffer[390];
				 twiddleFactorRealB6 <=#1 0.989177;
				 twiddleFactorimgB6 <=#1 -0.14673;
				 stateIp1B6<=#1 262;
				 stateIp2B6<=#1 390;

				 //(263,391)
				 imgIp1B7 <= imagWorkingBuffer[263];
				 realIp1B7 <= realWorkingBuffer[263];
				 imgIp2B7 <= imagWorkingBuffer[391];
				 realIp2B7 <= realWorkingBuffer[391];
				 twiddleFactorRealB7 <=#1 0.985278;
				 twiddleFactorimgB7 <=#1 -0.170962;
				 stateIp1B7<=#1 263;
				 stateIp2B7<=#1 391;
			 end
			 242 : begin

				 //(264,392)
				 imgIp1B0 <= imagWorkingBuffer[264];
				 realIp1B0 <= realWorkingBuffer[264];
				 imgIp2B0 <= imagWorkingBuffer[392];
				 realIp2B0 <= realWorkingBuffer[392];
				 twiddleFactorRealB0 <=#1 0.980785;
				 twiddleFactorimgB0 <=#1 -0.19509;
				 stateIp1B0<=#1 264;
				 stateIp2B0<=#1 392;

				 //(265,393)
				 imgIp1B1 <= imagWorkingBuffer[265];
				 realIp1B1 <= realWorkingBuffer[265];
				 imgIp2B1 <= imagWorkingBuffer[393];
				 realIp2B1 <= realWorkingBuffer[393];
				 twiddleFactorRealB1 <=#1 0.975702;
				 twiddleFactorimgB1 <=#1 -0.219101;
				 stateIp1B1<=#1 265;
				 stateIp2B1<=#1 393;

				 //(266,394)
				 imgIp1B2 <= imagWorkingBuffer[266];
				 realIp1B2 <= realWorkingBuffer[266];
				 imgIp2B2 <= imagWorkingBuffer[394];
				 realIp2B2 <= realWorkingBuffer[394];
				 twiddleFactorRealB2 <=#1 0.970031;
				 twiddleFactorimgB2 <=#1 -0.24298;
				 stateIp1B2<=#1 266;
				 stateIp2B2<=#1 394;

				 //(267,395)
				 imgIp1B3 <= imagWorkingBuffer[267];
				 realIp1B3 <= realWorkingBuffer[267];
				 imgIp2B3 <= imagWorkingBuffer[395];
				 realIp2B3 <= realWorkingBuffer[395];
				 twiddleFactorRealB3 <=#1 0.963776;
				 twiddleFactorimgB3 <=#1 -0.266713;
				 stateIp1B3<=#1 267;
				 stateIp2B3<=#1 395;

				 //(268,396)
				 imgIp1B4 <= imagWorkingBuffer[268];
				 realIp1B4 <= realWorkingBuffer[268];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=#1 0.95694;
				 twiddleFactorimgB4 <=#1 -0.290285;
				 stateIp1B4<=#1 268;
				 stateIp2B4<=#1 396;

				 //(269,397)
				 imgIp1B5 <= imagWorkingBuffer[269];
				 realIp1B5 <= realWorkingBuffer[269];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=#1 0.949528;
				 twiddleFactorimgB5 <=#1 -0.313682;
				 stateIp1B5<=#1 269;
				 stateIp2B5<=#1 397;

				 //(270,398)
				 imgIp1B6 <= imagWorkingBuffer[270];
				 realIp1B6 <= realWorkingBuffer[270];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=#1 0.941544;
				 twiddleFactorimgB6 <=#1 -0.33689;
				 stateIp1B6<=#1 270;
				 stateIp2B6<=#1 398;

				 //(271,399)
				 imgIp1B7 <= imagWorkingBuffer[271];
				 realIp1B7 <= realWorkingBuffer[271];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=#1 0.932993;
				 twiddleFactorimgB7 <=#1 -0.359895;
				 stateIp1B7<=#1 271;
				 stateIp2B7<=#1 399;
			 end
			 243 : begin

				 //(272,400)
				 imgIp1B0 <= imagWorkingBuffer[272];
				 realIp1B0 <= realWorkingBuffer[272];
				 imgIp2B0 <= imagWorkingBuffer[400];
				 realIp2B0 <= realWorkingBuffer[400];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 272;
				 stateIp2B0<=#1 400;

				 //(273,401)
				 imgIp1B1 <= imagWorkingBuffer[273];
				 realIp1B1 <= realWorkingBuffer[273];
				 imgIp2B1 <= imagWorkingBuffer[401];
				 realIp2B1 <= realWorkingBuffer[401];
				 twiddleFactorRealB1 <=#1 0.91421;
				 twiddleFactorimgB1 <=#1 -0.405241;
				 stateIp1B1<=#1 273;
				 stateIp2B1<=#1 401;

				 //(274,402)
				 imgIp1B2 <= imagWorkingBuffer[274];
				 realIp1B2 <= realWorkingBuffer[274];
				 imgIp2B2 <= imagWorkingBuffer[402];
				 realIp2B2 <= realWorkingBuffer[402];
				 twiddleFactorRealB2 <=#1 0.903989;
				 twiddleFactorimgB2 <=#1 -0.427555;
				 stateIp1B2<=#1 274;
				 stateIp2B2<=#1 402;

				 //(275,403)
				 imgIp1B3 <= imagWorkingBuffer[275];
				 realIp1B3 <= realWorkingBuffer[275];
				 imgIp2B3 <= imagWorkingBuffer[403];
				 realIp2B3 <= realWorkingBuffer[403];
				 twiddleFactorRealB3 <=#1 0.893224;
				 twiddleFactorimgB3 <=#1 -0.449611;
				 stateIp1B3<=#1 275;
				 stateIp2B3<=#1 403;

				 //(276,404)
				 imgIp1B4 <= imagWorkingBuffer[276];
				 realIp1B4 <= realWorkingBuffer[276];
				 imgIp2B4 <= imagWorkingBuffer[404];
				 realIp2B4 <= realWorkingBuffer[404];
				 twiddleFactorRealB4 <=#1 0.881921;
				 twiddleFactorimgB4 <=#1 -0.471397;
				 stateIp1B4<=#1 276;
				 stateIp2B4<=#1 404;

				 //(277,405)
				 imgIp1B5 <= imagWorkingBuffer[277];
				 realIp1B5 <= realWorkingBuffer[277];
				 imgIp2B5 <= imagWorkingBuffer[405];
				 realIp2B5 <= realWorkingBuffer[405];
				 twiddleFactorRealB5 <=#1 0.870087;
				 twiddleFactorimgB5 <=#1 -0.492898;
				 stateIp1B5<=#1 277;
				 stateIp2B5<=#1 405;

				 //(278,406)
				 imgIp1B6 <= imagWorkingBuffer[278];
				 realIp1B6 <= realWorkingBuffer[278];
				 imgIp2B6 <= imagWorkingBuffer[406];
				 realIp2B6 <= realWorkingBuffer[406];
				 twiddleFactorRealB6 <=#1 0.857729;
				 twiddleFactorimgB6 <=#1 -0.514103;
				 stateIp1B6<=#1 278;
				 stateIp2B6<=#1 406;

				 //(279,407)
				 imgIp1B7 <= imagWorkingBuffer[279];
				 realIp1B7 <= realWorkingBuffer[279];
				 imgIp2B7 <= imagWorkingBuffer[407];
				 realIp2B7 <= realWorkingBuffer[407];
				 twiddleFactorRealB7 <=#1 0.844854;
				 twiddleFactorimgB7 <=#1 -0.534998;
				 stateIp1B7<=#1 279;
				 stateIp2B7<=#1 407;
			 end
			 244 : begin

				 //(280,408)
				 imgIp1B0 <= imagWorkingBuffer[280];
				 realIp1B0 <= realWorkingBuffer[280];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=#1 0.83147;
				 twiddleFactorimgB0 <=#1 -0.55557;
				 stateIp1B0<=#1 280;
				 stateIp2B0<=#1 408;

				 //(281,409)
				 imgIp1B1 <= imagWorkingBuffer[281];
				 realIp1B1 <= realWorkingBuffer[281];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=#1 0.817585;
				 twiddleFactorimgB1 <=#1 -0.575808;
				 stateIp1B1<=#1 281;
				 stateIp2B1<=#1 409;

				 //(282,410)
				 imgIp1B2 <= imagWorkingBuffer[282];
				 realIp1B2 <= realWorkingBuffer[282];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=#1 0.803208;
				 twiddleFactorimgB2 <=#1 -0.595699;
				 stateIp1B2<=#1 282;
				 stateIp2B2<=#1 410;

				 //(283,411)
				 imgIp1B3 <= imagWorkingBuffer[283];
				 realIp1B3 <= realWorkingBuffer[283];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=#1 0.788346;
				 twiddleFactorimgB3 <=#1 -0.615232;
				 stateIp1B3<=#1 283;
				 stateIp2B3<=#1 411;

				 //(284,412)
				 imgIp1B4 <= imagWorkingBuffer[284];
				 realIp1B4 <= realWorkingBuffer[284];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=#1 0.77301;
				 twiddleFactorimgB4 <=#1 -0.634393;
				 stateIp1B4<=#1 284;
				 stateIp2B4<=#1 412;

				 //(285,413)
				 imgIp1B5 <= imagWorkingBuffer[285];
				 realIp1B5 <= realWorkingBuffer[285];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=#1 0.757209;
				 twiddleFactorimgB5 <=#1 -0.653173;
				 stateIp1B5<=#1 285;
				 stateIp2B5<=#1 413;

				 //(286,414)
				 imgIp1B6 <= imagWorkingBuffer[286];
				 realIp1B6 <= realWorkingBuffer[286];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=#1 0.740951;
				 twiddleFactorimgB6 <=#1 -0.671559;
				 stateIp1B6<=#1 286;
				 stateIp2B6<=#1 414;

				 //(287,415)
				 imgIp1B7 <= imagWorkingBuffer[287];
				 realIp1B7 <= realWorkingBuffer[287];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 0.724247;
				 twiddleFactorimgB7 <=#1 -0.689541;
				 stateIp1B7<=#1 287;
				 stateIp2B7<=#1 415;
			 end
			 245 : begin

				 //(288,416)
				 imgIp1B0 <= imagWorkingBuffer[288];
				 realIp1B0 <= realWorkingBuffer[288];
				 imgIp2B0 <= imagWorkingBuffer[416];
				 realIp2B0 <= realWorkingBuffer[416];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 288;
				 stateIp2B0<=#1 416;

				 //(289,417)
				 imgIp1B1 <= imagWorkingBuffer[289];
				 realIp1B1 <= realWorkingBuffer[289];
				 imgIp2B1 <= imagWorkingBuffer[417];
				 realIp2B1 <= realWorkingBuffer[417];
				 twiddleFactorRealB1 <=#1 0.689541;
				 twiddleFactorimgB1 <=#1 -0.724247;
				 stateIp1B1<=#1 289;
				 stateIp2B1<=#1 417;

				 //(290,418)
				 imgIp1B2 <= imagWorkingBuffer[290];
				 realIp1B2 <= realWorkingBuffer[290];
				 imgIp2B2 <= imagWorkingBuffer[418];
				 realIp2B2 <= realWorkingBuffer[418];
				 twiddleFactorRealB2 <=#1 0.671559;
				 twiddleFactorimgB2 <=#1 -0.740951;
				 stateIp1B2<=#1 290;
				 stateIp2B2<=#1 418;

				 //(291,419)
				 imgIp1B3 <= imagWorkingBuffer[291];
				 realIp1B3 <= realWorkingBuffer[291];
				 imgIp2B3 <= imagWorkingBuffer[419];
				 realIp2B3 <= realWorkingBuffer[419];
				 twiddleFactorRealB3 <=#1 0.653173;
				 twiddleFactorimgB3 <=#1 -0.757209;
				 stateIp1B3<=#1 291;
				 stateIp2B3<=#1 419;

				 //(292,420)
				 imgIp1B4 <= imagWorkingBuffer[292];
				 realIp1B4 <= realWorkingBuffer[292];
				 imgIp2B4 <= imagWorkingBuffer[420];
				 realIp2B4 <= realWorkingBuffer[420];
				 twiddleFactorRealB4 <=#1 0.634393;
				 twiddleFactorimgB4 <=#1 -0.77301;
				 stateIp1B4<=#1 292;
				 stateIp2B4<=#1 420;

				 //(293,421)
				 imgIp1B5 <= imagWorkingBuffer[293];
				 realIp1B5 <= realWorkingBuffer[293];
				 imgIp2B5 <= imagWorkingBuffer[421];
				 realIp2B5 <= realWorkingBuffer[421];
				 twiddleFactorRealB5 <=#1 0.615232;
				 twiddleFactorimgB5 <=#1 -0.788346;
				 stateIp1B5<=#1 293;
				 stateIp2B5<=#1 421;

				 //(294,422)
				 imgIp1B6 <= imagWorkingBuffer[294];
				 realIp1B6 <= realWorkingBuffer[294];
				 imgIp2B6 <= imagWorkingBuffer[422];
				 realIp2B6 <= realWorkingBuffer[422];
				 twiddleFactorRealB6 <=#1 0.595699;
				 twiddleFactorimgB6 <=#1 -0.803208;
				 stateIp1B6<=#1 294;
				 stateIp2B6<=#1 422;

				 //(295,423)
				 imgIp1B7 <= imagWorkingBuffer[295];
				 realIp1B7 <= realWorkingBuffer[295];
				 imgIp2B7 <= imagWorkingBuffer[423];
				 realIp2B7 <= realWorkingBuffer[423];
				 twiddleFactorRealB7 <=#1 0.575808;
				 twiddleFactorimgB7 <=#1 -0.817585;
				 stateIp1B7<=#1 295;
				 stateIp2B7<=#1 423;
			 end
			 246 : begin

				 //(296,424)
				 imgIp1B0 <= imagWorkingBuffer[296];
				 realIp1B0 <= realWorkingBuffer[296];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=#1 0.55557;
				 twiddleFactorimgB0 <=#1 -0.83147;
				 stateIp1B0<=#1 296;
				 stateIp2B0<=#1 424;

				 //(297,425)
				 imgIp1B1 <= imagWorkingBuffer[297];
				 realIp1B1 <= realWorkingBuffer[297];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=#1 0.534998;
				 twiddleFactorimgB1 <=#1 -0.844854;
				 stateIp1B1<=#1 297;
				 stateIp2B1<=#1 425;

				 //(298,426)
				 imgIp1B2 <= imagWorkingBuffer[298];
				 realIp1B2 <= realWorkingBuffer[298];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=#1 0.514103;
				 twiddleFactorimgB2 <=#1 -0.857729;
				 stateIp1B2<=#1 298;
				 stateIp2B2<=#1 426;

				 //(299,427)
				 imgIp1B3 <= imagWorkingBuffer[299];
				 realIp1B3 <= realWorkingBuffer[299];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=#1 0.492898;
				 twiddleFactorimgB3 <=#1 -0.870087;
				 stateIp1B3<=#1 299;
				 stateIp2B3<=#1 427;

				 //(300,428)
				 imgIp1B4 <= imagWorkingBuffer[300];
				 realIp1B4 <= realWorkingBuffer[300];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=#1 0.471397;
				 twiddleFactorimgB4 <=#1 -0.881921;
				 stateIp1B4<=#1 300;
				 stateIp2B4<=#1 428;

				 //(301,429)
				 imgIp1B5 <= imagWorkingBuffer[301];
				 realIp1B5 <= realWorkingBuffer[301];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=#1 0.449611;
				 twiddleFactorimgB5 <=#1 -0.893224;
				 stateIp1B5<=#1 301;
				 stateIp2B5<=#1 429;

				 //(302,430)
				 imgIp1B6 <= imagWorkingBuffer[302];
				 realIp1B6 <= realWorkingBuffer[302];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=#1 0.427555;
				 twiddleFactorimgB6 <=#1 -0.903989;
				 stateIp1B6<=#1 302;
				 stateIp2B6<=#1 430;

				 //(303,431)
				 imgIp1B7 <= imagWorkingBuffer[303];
				 realIp1B7 <= realWorkingBuffer[303];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 0.405241;
				 twiddleFactorimgB7 <=#1 -0.91421;
				 stateIp1B7<=#1 303;
				 stateIp2B7<=#1 431;
			 end
			 247 : begin

				 //(304,432)
				 imgIp1B0 <= imagWorkingBuffer[304];
				 realIp1B0 <= realWorkingBuffer[304];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 304;
				 stateIp2B0<=#1 432;

				 //(305,433)
				 imgIp1B1 <= imagWorkingBuffer[305];
				 realIp1B1 <= realWorkingBuffer[305];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=#1 0.359895;
				 twiddleFactorimgB1 <=#1 -0.932993;
				 stateIp1B1<=#1 305;
				 stateIp2B1<=#1 433;

				 //(306,434)
				 imgIp1B2 <= imagWorkingBuffer[306];
				 realIp1B2 <= realWorkingBuffer[306];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=#1 0.33689;
				 twiddleFactorimgB2 <=#1 -0.941544;
				 stateIp1B2<=#1 306;
				 stateIp2B2<=#1 434;

				 //(307,435)
				 imgIp1B3 <= imagWorkingBuffer[307];
				 realIp1B3 <= realWorkingBuffer[307];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=#1 0.313682;
				 twiddleFactorimgB3 <=#1 -0.949528;
				 stateIp1B3<=#1 307;
				 stateIp2B3<=#1 435;

				 //(308,436)
				 imgIp1B4 <= imagWorkingBuffer[308];
				 realIp1B4 <= realWorkingBuffer[308];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=#1 0.290285;
				 twiddleFactorimgB4 <=#1 -0.95694;
				 stateIp1B4<=#1 308;
				 stateIp2B4<=#1 436;

				 //(309,437)
				 imgIp1B5 <= imagWorkingBuffer[309];
				 realIp1B5 <= realWorkingBuffer[309];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=#1 0.266713;
				 twiddleFactorimgB5 <=#1 -0.963776;
				 stateIp1B5<=#1 309;
				 stateIp2B5<=#1 437;

				 //(310,438)
				 imgIp1B6 <= imagWorkingBuffer[310];
				 realIp1B6 <= realWorkingBuffer[310];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=#1 0.24298;
				 twiddleFactorimgB6 <=#1 -0.970031;
				 stateIp1B6<=#1 310;
				 stateIp2B6<=#1 438;

				 //(311,439)
				 imgIp1B7 <= imagWorkingBuffer[311];
				 realIp1B7 <= realWorkingBuffer[311];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=#1 0.219101;
				 twiddleFactorimgB7 <=#1 -0.975702;
				 stateIp1B7<=#1 311;
				 stateIp2B7<=#1 439;
			 end
			 248 : begin

				 //(312,440)
				 imgIp1B0 <= imagWorkingBuffer[312];
				 realIp1B0 <= realWorkingBuffer[312];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=#1 0.19509;
				 twiddleFactorimgB0 <=#1 -0.980785;
				 stateIp1B0<=#1 312;
				 stateIp2B0<=#1 440;

				 //(313,441)
				 imgIp1B1 <= imagWorkingBuffer[313];
				 realIp1B1 <= realWorkingBuffer[313];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=#1 0.170962;
				 twiddleFactorimgB1 <=#1 -0.985278;
				 stateIp1B1<=#1 313;
				 stateIp2B1<=#1 441;

				 //(314,442)
				 imgIp1B2 <= imagWorkingBuffer[314];
				 realIp1B2 <= realWorkingBuffer[314];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=#1 0.14673;
				 twiddleFactorimgB2 <=#1 -0.989177;
				 stateIp1B2<=#1 314;
				 stateIp2B2<=#1 442;

				 //(315,443)
				 imgIp1B3 <= imagWorkingBuffer[315];
				 realIp1B3 <= realWorkingBuffer[315];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=#1 0.122411;
				 twiddleFactorimgB3 <=#1 -0.99248;
				 stateIp1B3<=#1 315;
				 stateIp2B3<=#1 443;

				 //(316,444)
				 imgIp1B4 <= imagWorkingBuffer[316];
				 realIp1B4 <= realWorkingBuffer[316];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=#1 0.098017;
				 twiddleFactorimgB4 <=#1 -0.995185;
				 stateIp1B4<=#1 316;
				 stateIp2B4<=#1 444;

				 //(317,445)
				 imgIp1B5 <= imagWorkingBuffer[317];
				 realIp1B5 <= realWorkingBuffer[317];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=#1 0.073565;
				 twiddleFactorimgB5 <=#1 -0.99729;
				 stateIp1B5<=#1 317;
				 stateIp2B5<=#1 445;

				 //(318,446)
				 imgIp1B6 <= imagWorkingBuffer[318];
				 realIp1B6 <= realWorkingBuffer[318];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 0.049068;
				 twiddleFactorimgB6 <=#1 -0.998795;
				 stateIp1B6<=#1 318;
				 stateIp2B6<=#1 446;

				 //(319,447)
				 imgIp1B7 <= imagWorkingBuffer[319];
				 realIp1B7 <= realWorkingBuffer[319];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 0.024541;
				 twiddleFactorimgB7 <=#1 -0.999699;
				 stateIp1B7<=#1 319;
				 stateIp2B7<=#1 447;
			 end
			 249 : begin

				 //(320,448)
				 imgIp1B0 <= imagWorkingBuffer[320];
				 realIp1B0 <= realWorkingBuffer[320];
				 imgIp2B0 <= imagWorkingBuffer[448];
				 realIp2B0 <= realWorkingBuffer[448];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 320;
				 stateIp2B0<=#1 448;

				 //(321,449)
				 imgIp1B1 <= imagWorkingBuffer[321];
				 realIp1B1 <= realWorkingBuffer[321];
				 imgIp2B1 <= imagWorkingBuffer[449];
				 realIp2B1 <= realWorkingBuffer[449];
				 twiddleFactorRealB1 <=#1 -0.024541;
				 twiddleFactorimgB1 <=#1 -0.999699;
				 stateIp1B1<=#1 321;
				 stateIp2B1<=#1 449;

				 //(322,450)
				 imgIp1B2 <= imagWorkingBuffer[322];
				 realIp1B2 <= realWorkingBuffer[322];
				 imgIp2B2 <= imagWorkingBuffer[450];
				 realIp2B2 <= realWorkingBuffer[450];
				 twiddleFactorRealB2 <=#1 -0.049068;
				 twiddleFactorimgB2 <=#1 -0.998795;
				 stateIp1B2<=#1 322;
				 stateIp2B2<=#1 450;

				 //(323,451)
				 imgIp1B3 <= imagWorkingBuffer[323];
				 realIp1B3 <= realWorkingBuffer[323];
				 imgIp2B3 <= imagWorkingBuffer[451];
				 realIp2B3 <= realWorkingBuffer[451];
				 twiddleFactorRealB3 <=#1 -0.073565;
				 twiddleFactorimgB3 <=#1 -0.99729;
				 stateIp1B3<=#1 323;
				 stateIp2B3<=#1 451;

				 //(324,452)
				 imgIp1B4 <= imagWorkingBuffer[324];
				 realIp1B4 <= realWorkingBuffer[324];
				 imgIp2B4 <= imagWorkingBuffer[452];
				 realIp2B4 <= realWorkingBuffer[452];
				 twiddleFactorRealB4 <=#1 -0.098017;
				 twiddleFactorimgB4 <=#1 -0.995185;
				 stateIp1B4<=#1 324;
				 stateIp2B4<=#1 452;

				 //(325,453)
				 imgIp1B5 <= imagWorkingBuffer[325];
				 realIp1B5 <= realWorkingBuffer[325];
				 imgIp2B5 <= imagWorkingBuffer[453];
				 realIp2B5 <= realWorkingBuffer[453];
				 twiddleFactorRealB5 <=#1 -0.122411;
				 twiddleFactorimgB5 <=#1 -0.99248;
				 stateIp1B5<=#1 325;
				 stateIp2B5<=#1 453;

				 //(326,454)
				 imgIp1B6 <= imagWorkingBuffer[326];
				 realIp1B6 <= realWorkingBuffer[326];
				 imgIp2B6 <= imagWorkingBuffer[454];
				 realIp2B6 <= realWorkingBuffer[454];
				 twiddleFactorRealB6 <=#1 -0.14673;
				 twiddleFactorimgB6 <=#1 -0.989177;
				 stateIp1B6<=#1 326;
				 stateIp2B6<=#1 454;

				 //(327,455)
				 imgIp1B7 <= imagWorkingBuffer[327];
				 realIp1B7 <= realWorkingBuffer[327];
				 imgIp2B7 <= imagWorkingBuffer[455];
				 realIp2B7 <= realWorkingBuffer[455];
				 twiddleFactorRealB7 <=#1 -0.170962;
				 twiddleFactorimgB7 <=#1 -0.985278;
				 stateIp1B7<=#1 327;
				 stateIp2B7<=#1 455;
			 end
			 250 : begin

				 //(328,456)
				 imgIp1B0 <= imagWorkingBuffer[328];
				 realIp1B0 <= realWorkingBuffer[328];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=#1 -0.19509;
				 twiddleFactorimgB0 <=#1 -0.980785;
				 stateIp1B0<=#1 328;
				 stateIp2B0<=#1 456;

				 //(329,457)
				 imgIp1B1 <= imagWorkingBuffer[329];
				 realIp1B1 <= realWorkingBuffer[329];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=#1 -0.219101;
				 twiddleFactorimgB1 <=#1 -0.975702;
				 stateIp1B1<=#1 329;
				 stateIp2B1<=#1 457;

				 //(330,458)
				 imgIp1B2 <= imagWorkingBuffer[330];
				 realIp1B2 <= realWorkingBuffer[330];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=#1 -0.24298;
				 twiddleFactorimgB2 <=#1 -0.970031;
				 stateIp1B2<=#1 330;
				 stateIp2B2<=#1 458;

				 //(331,459)
				 imgIp1B3 <= imagWorkingBuffer[331];
				 realIp1B3 <= realWorkingBuffer[331];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=#1 -0.266713;
				 twiddleFactorimgB3 <=#1 -0.963776;
				 stateIp1B3<=#1 331;
				 stateIp2B3<=#1 459;

				 //(332,460)
				 imgIp1B4 <= imagWorkingBuffer[332];
				 realIp1B4 <= realWorkingBuffer[332];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=#1 -0.290285;
				 twiddleFactorimgB4 <=#1 -0.95694;
				 stateIp1B4<=#1 332;
				 stateIp2B4<=#1 460;

				 //(333,461)
				 imgIp1B5 <= imagWorkingBuffer[333];
				 realIp1B5 <= realWorkingBuffer[333];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=#1 -0.313682;
				 twiddleFactorimgB5 <=#1 -0.949528;
				 stateIp1B5<=#1 333;
				 stateIp2B5<=#1 461;

				 //(334,462)
				 imgIp1B6 <= imagWorkingBuffer[334];
				 realIp1B6 <= realWorkingBuffer[334];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=#1 -0.33689;
				 twiddleFactorimgB6 <=#1 -0.941544;
				 stateIp1B6<=#1 334;
				 stateIp2B6<=#1 462;

				 //(335,463)
				 imgIp1B7 <= imagWorkingBuffer[335];
				 realIp1B7 <= realWorkingBuffer[335];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 -0.359895;
				 twiddleFactorimgB7 <=#1 -0.932993;
				 stateIp1B7<=#1 335;
				 stateIp2B7<=#1 463;
			 end
			 251 : begin

				 //(336,464)
				 imgIp1B0 <= imagWorkingBuffer[336];
				 realIp1B0 <= realWorkingBuffer[336];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 336;
				 stateIp2B0<=#1 464;

				 //(337,465)
				 imgIp1B1 <= imagWorkingBuffer[337];
				 realIp1B1 <= realWorkingBuffer[337];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=#1 -0.405241;
				 twiddleFactorimgB1 <=#1 -0.91421;
				 stateIp1B1<=#1 337;
				 stateIp2B1<=#1 465;

				 //(338,466)
				 imgIp1B2 <= imagWorkingBuffer[338];
				 realIp1B2 <= realWorkingBuffer[338];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=#1 -0.427555;
				 twiddleFactorimgB2 <=#1 -0.903989;
				 stateIp1B2<=#1 338;
				 stateIp2B2<=#1 466;

				 //(339,467)
				 imgIp1B3 <= imagWorkingBuffer[339];
				 realIp1B3 <= realWorkingBuffer[339];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=#1 -0.449611;
				 twiddleFactorimgB3 <=#1 -0.893224;
				 stateIp1B3<=#1 339;
				 stateIp2B3<=#1 467;

				 //(340,468)
				 imgIp1B4 <= imagWorkingBuffer[340];
				 realIp1B4 <= realWorkingBuffer[340];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=#1 -0.471397;
				 twiddleFactorimgB4 <=#1 -0.881921;
				 stateIp1B4<=#1 340;
				 stateIp2B4<=#1 468;

				 //(341,469)
				 imgIp1B5 <= imagWorkingBuffer[341];
				 realIp1B5 <= realWorkingBuffer[341];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=#1 -0.492898;
				 twiddleFactorimgB5 <=#1 -0.870087;
				 stateIp1B5<=#1 341;
				 stateIp2B5<=#1 469;

				 //(342,470)
				 imgIp1B6 <= imagWorkingBuffer[342];
				 realIp1B6 <= realWorkingBuffer[342];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=#1 -0.514103;
				 twiddleFactorimgB6 <=#1 -0.857729;
				 stateIp1B6<=#1 342;
				 stateIp2B6<=#1 470;

				 //(343,471)
				 imgIp1B7 <= imagWorkingBuffer[343];
				 realIp1B7 <= realWorkingBuffer[343];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=#1 -0.534998;
				 twiddleFactorimgB7 <=#1 -0.844854;
				 stateIp1B7<=#1 343;
				 stateIp2B7<=#1 471;
			 end
			 252 : begin

				 //(344,472)
				 imgIp1B0 <= imagWorkingBuffer[344];
				 realIp1B0 <= realWorkingBuffer[344];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=#1 -0.55557;
				 twiddleFactorimgB0 <=#1 -0.83147;
				 stateIp1B0<=#1 344;
				 stateIp2B0<=#1 472;

				 //(345,473)
				 imgIp1B1 <= imagWorkingBuffer[345];
				 realIp1B1 <= realWorkingBuffer[345];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=#1 -0.575808;
				 twiddleFactorimgB1 <=#1 -0.817585;
				 stateIp1B1<=#1 345;
				 stateIp2B1<=#1 473;

				 //(346,474)
				 imgIp1B2 <= imagWorkingBuffer[346];
				 realIp1B2 <= realWorkingBuffer[346];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=#1 -0.595699;
				 twiddleFactorimgB2 <=#1 -0.803208;
				 stateIp1B2<=#1 346;
				 stateIp2B2<=#1 474;

				 //(347,475)
				 imgIp1B3 <= imagWorkingBuffer[347];
				 realIp1B3 <= realWorkingBuffer[347];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=#1 -0.615232;
				 twiddleFactorimgB3 <=#1 -0.788346;
				 stateIp1B3<=#1 347;
				 stateIp2B3<=#1 475;

				 //(348,476)
				 imgIp1B4 <= imagWorkingBuffer[348];
				 realIp1B4 <= realWorkingBuffer[348];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=#1 -0.634393;
				 twiddleFactorimgB4 <=#1 -0.77301;
				 stateIp1B4<=#1 348;
				 stateIp2B4<=#1 476;

				 //(349,477)
				 imgIp1B5 <= imagWorkingBuffer[349];
				 realIp1B5 <= realWorkingBuffer[349];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=#1 -0.653173;
				 twiddleFactorimgB5 <=#1 -0.757209;
				 stateIp1B5<=#1 349;
				 stateIp2B5<=#1 477;

				 //(350,478)
				 imgIp1B6 <= imagWorkingBuffer[350];
				 realIp1B6 <= realWorkingBuffer[350];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 -0.671559;
				 twiddleFactorimgB6 <=#1 -0.740951;
				 stateIp1B6<=#1 350;
				 stateIp2B6<=#1 478;

				 //(351,479)
				 imgIp1B7 <= imagWorkingBuffer[351];
				 realIp1B7 <= realWorkingBuffer[351];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 -0.689541;
				 twiddleFactorimgB7 <=#1 -0.724247;
				 stateIp1B7<=#1 351;
				 stateIp2B7<=#1 479;
			 end
			 253 : begin

				 //(352,480)
				 imgIp1B0 <= imagWorkingBuffer[352];
				 realIp1B0 <= realWorkingBuffer[352];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 352;
				 stateIp2B0<=#1 480;

				 //(353,481)
				 imgIp1B1 <= imagWorkingBuffer[353];
				 realIp1B1 <= realWorkingBuffer[353];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=#1 -0.724247;
				 twiddleFactorimgB1 <=#1 -0.689541;
				 stateIp1B1<=#1 353;
				 stateIp2B1<=#1 481;

				 //(354,482)
				 imgIp1B2 <= imagWorkingBuffer[354];
				 realIp1B2 <= realWorkingBuffer[354];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=#1 -0.740951;
				 twiddleFactorimgB2 <=#1 -0.671559;
				 stateIp1B2<=#1 354;
				 stateIp2B2<=#1 482;

				 //(355,483)
				 imgIp1B3 <= imagWorkingBuffer[355];
				 realIp1B3 <= realWorkingBuffer[355];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=#1 -0.757209;
				 twiddleFactorimgB3 <=#1 -0.653173;
				 stateIp1B3<=#1 355;
				 stateIp2B3<=#1 483;

				 //(356,484)
				 imgIp1B4 <= imagWorkingBuffer[356];
				 realIp1B4 <= realWorkingBuffer[356];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=#1 -0.77301;
				 twiddleFactorimgB4 <=#1 -0.634393;
				 stateIp1B4<=#1 356;
				 stateIp2B4<=#1 484;

				 //(357,485)
				 imgIp1B5 <= imagWorkingBuffer[357];
				 realIp1B5 <= realWorkingBuffer[357];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=#1 -0.788346;
				 twiddleFactorimgB5 <=#1 -0.615232;
				 stateIp1B5<=#1 357;
				 stateIp2B5<=#1 485;

				 //(358,486)
				 imgIp1B6 <= imagWorkingBuffer[358];
				 realIp1B6 <= realWorkingBuffer[358];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=#1 -0.803208;
				 twiddleFactorimgB6 <=#1 -0.595699;
				 stateIp1B6<=#1 358;
				 stateIp2B6<=#1 486;

				 //(359,487)
				 imgIp1B7 <= imagWorkingBuffer[359];
				 realIp1B7 <= realWorkingBuffer[359];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=#1 -0.817585;
				 twiddleFactorimgB7 <=#1 -0.575808;
				 stateIp1B7<=#1 359;
				 stateIp2B7<=#1 487;
			 end
			 254 : begin

				 //(360,488)
				 imgIp1B0 <= imagWorkingBuffer[360];
				 realIp1B0 <= realWorkingBuffer[360];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=#1 -0.83147;
				 twiddleFactorimgB0 <=#1 -0.55557;
				 stateIp1B0<=#1 360;
				 stateIp2B0<=#1 488;

				 //(361,489)
				 imgIp1B1 <= imagWorkingBuffer[361];
				 realIp1B1 <= realWorkingBuffer[361];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=#1 -0.844854;
				 twiddleFactorimgB1 <=#1 -0.534998;
				 stateIp1B1<=#1 361;
				 stateIp2B1<=#1 489;

				 //(362,490)
				 imgIp1B2 <= imagWorkingBuffer[362];
				 realIp1B2 <= realWorkingBuffer[362];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=#1 -0.857729;
				 twiddleFactorimgB2 <=#1 -0.514103;
				 stateIp1B2<=#1 362;
				 stateIp2B2<=#1 490;

				 //(363,491)
				 imgIp1B3 <= imagWorkingBuffer[363];
				 realIp1B3 <= realWorkingBuffer[363];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=#1 -0.870087;
				 twiddleFactorimgB3 <=#1 -0.492898;
				 stateIp1B3<=#1 363;
				 stateIp2B3<=#1 491;

				 //(364,492)
				 imgIp1B4 <= imagWorkingBuffer[364];
				 realIp1B4 <= realWorkingBuffer[364];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=#1 -0.881921;
				 twiddleFactorimgB4 <=#1 -0.471397;
				 stateIp1B4<=#1 364;
				 stateIp2B4<=#1 492;

				 //(365,493)
				 imgIp1B5 <= imagWorkingBuffer[365];
				 realIp1B5 <= realWorkingBuffer[365];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=#1 -0.893224;
				 twiddleFactorimgB5 <=#1 -0.449611;
				 stateIp1B5<=#1 365;
				 stateIp2B5<=#1 493;

				 //(366,494)
				 imgIp1B6 <= imagWorkingBuffer[366];
				 realIp1B6 <= realWorkingBuffer[366];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 -0.903989;
				 twiddleFactorimgB6 <=#1 -0.427555;
				 stateIp1B6<=#1 366;
				 stateIp2B6<=#1 494;

				 //(367,495)
				 imgIp1B7 <= imagWorkingBuffer[367];
				 realIp1B7 <= realWorkingBuffer[367];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 -0.91421;
				 twiddleFactorimgB7 <=#1 -0.405241;
				 stateIp1B7<=#1 367;
				 stateIp2B7<=#1 495;
			 end
			 255 : begin

				 //(368,496)
				 imgIp1B0 <= imagWorkingBuffer[368];
				 realIp1B0 <= realWorkingBuffer[368];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 368;
				 stateIp2B0<=#1 496;

				 //(369,497)
				 imgIp1B1 <= imagWorkingBuffer[369];
				 realIp1B1 <= realWorkingBuffer[369];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=#1 -0.932993;
				 twiddleFactorimgB1 <=#1 -0.359895;
				 stateIp1B1<=#1 369;
				 stateIp2B1<=#1 497;

				 //(370,498)
				 imgIp1B2 <= imagWorkingBuffer[370];
				 realIp1B2 <= realWorkingBuffer[370];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=#1 -0.941544;
				 twiddleFactorimgB2 <=#1 -0.33689;
				 stateIp1B2<=#1 370;
				 stateIp2B2<=#1 498;

				 //(371,499)
				 imgIp1B3 <= imagWorkingBuffer[371];
				 realIp1B3 <= realWorkingBuffer[371];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=#1 -0.949528;
				 twiddleFactorimgB3 <=#1 -0.313682;
				 stateIp1B3<=#1 371;
				 stateIp2B3<=#1 499;

				 //(372,500)
				 imgIp1B4 <= imagWorkingBuffer[372];
				 realIp1B4 <= realWorkingBuffer[372];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=#1 -0.95694;
				 twiddleFactorimgB4 <=#1 -0.290285;
				 stateIp1B4<=#1 372;
				 stateIp2B4<=#1 500;

				 //(373,501)
				 imgIp1B5 <= imagWorkingBuffer[373];
				 realIp1B5 <= realWorkingBuffer[373];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=#1 -0.963776;
				 twiddleFactorimgB5 <=#1 -0.266713;
				 stateIp1B5<=#1 373;
				 stateIp2B5<=#1 501;

				 //(374,502)
				 imgIp1B6 <= imagWorkingBuffer[374];
				 realIp1B6 <= realWorkingBuffer[374];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=#1 -0.970031;
				 twiddleFactorimgB6 <=#1 -0.24298;
				 stateIp1B6<=#1 374;
				 stateIp2B6<=#1 502;

				 //(375,503)
				 imgIp1B7 <= imagWorkingBuffer[375];
				 realIp1B7 <= realWorkingBuffer[375];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=#1 -0.975702;
				 twiddleFactorimgB7 <=#1 -0.219101;
				 stateIp1B7<=#1 375;
				 stateIp2B7<=#1 503;
			 end
			 256 : begin

				 //(376,504)
				 imgIp1B0 <= imagWorkingBuffer[376];
				 realIp1B0 <= realWorkingBuffer[376];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=#1 -0.980785;
				 twiddleFactorimgB0 <=#1 -0.19509;
				 stateIp1B0<=#1 376;
				 stateIp2B0<=#1 504;

				 //(377,505)
				 imgIp1B1 <= imagWorkingBuffer[377];
				 realIp1B1 <= realWorkingBuffer[377];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=#1 -0.985278;
				 twiddleFactorimgB1 <=#1 -0.170962;
				 stateIp1B1<=#1 377;
				 stateIp2B1<=#1 505;

				 //(378,506)
				 imgIp1B2 <= imagWorkingBuffer[378];
				 realIp1B2 <= realWorkingBuffer[378];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=#1 -0.989177;
				 twiddleFactorimgB2 <=#1 -0.14673;
				 stateIp1B2<=#1 378;
				 stateIp2B2<=#1 506;

				 //(379,507)
				 imgIp1B3 <= imagWorkingBuffer[379];
				 realIp1B3 <= realWorkingBuffer[379];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=#1 -0.99248;
				 twiddleFactorimgB3 <=#1 -0.122411;
				 stateIp1B3<=#1 379;
				 stateIp2B3<=#1 507;

				 //(380,508)
				 imgIp1B4 <= imagWorkingBuffer[380];
				 realIp1B4 <= realWorkingBuffer[380];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 -0.995185;
				 twiddleFactorimgB4 <=#1 -0.098017;
				 stateIp1B4<=#1 380;
				 stateIp2B4<=#1 508;

				 //(381,509)
				 imgIp1B5 <= imagWorkingBuffer[381];
				 realIp1B5 <= realWorkingBuffer[381];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 -0.99729;
				 twiddleFactorimgB5 <=#1 -0.073565;
				 stateIp1B5<=#1 381;
				 stateIp2B5<=#1 509;

				 //(382,510)
				 imgIp1B6 <= imagWorkingBuffer[382];
				 realIp1B6 <= realWorkingBuffer[382];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 -0.998795;
				 twiddleFactorimgB6 <=#1 -0.049068;
				 stateIp1B6<=#1 382;
				 stateIp2B6<=#1 510;

				 //(383,511)
				 imgIp1B7 <= imagWorkingBuffer[383];
				 realIp1B7 <= realWorkingBuffer[383];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.999699;
				 twiddleFactorimgB7 <=#1 -0.024541;
				 stateIp1B7<=#1 383;
				 stateIp2B7<=#1 511;
			 end
			 257 : begin

				 //(0,256)
				 imgIp1B0 <= imagWorkingBuffer[0];
				 realIp1B0 <= realWorkingBuffer[0];
				 imgIp2B0 <= imagWorkingBuffer[256];
				 realIp2B0 <= realWorkingBuffer[256];
				 twiddleFactorRealB0 <=#1 1.0;
				 twiddleFactorimgB0 <=#1 0.0;
				 stateIp1B0<=#1 0;
				 stateIp2B0<=#1 256;

				 lastStageFlag<=#1 1;

				 //(1,257)
				 imgIp1B1 <= imagWorkingBuffer[1];
				 realIp1B1 <= realWorkingBuffer[1];
				 imgIp2B1 <= imagWorkingBuffer[257];
				 realIp2B1 <= realWorkingBuffer[257];
				 twiddleFactorRealB1 <=#1 0.999925;
				 twiddleFactorimgB1 <=#1 -0.012272;
				 stateIp1B1<=#1 1;
				 stateIp2B1<=#1 257;

				 //(2,258)
				 imgIp1B2 <= imagWorkingBuffer[2];
				 realIp1B2 <= realWorkingBuffer[2];
				 imgIp2B2 <= imagWorkingBuffer[258];
				 realIp2B2 <= realWorkingBuffer[258];
				 twiddleFactorRealB2 <=#1 0.999699;
				 twiddleFactorimgB2 <=#1 -0.024541;
				 stateIp1B2<=#1 2;
				 stateIp2B2<=#1 258;

				 //(3,259)
				 imgIp1B3 <= imagWorkingBuffer[3];
				 realIp1B3 <= realWorkingBuffer[3];
				 imgIp2B3 <= imagWorkingBuffer[259];
				 realIp2B3 <= realWorkingBuffer[259];
				 twiddleFactorRealB3 <=#1 0.999322;
				 twiddleFactorimgB3 <=#1 -0.036807;
				 stateIp1B3<=#1 3;
				 stateIp2B3<=#1 259;

				 //(4,260)
				 imgIp1B4 <= imagWorkingBuffer[4];
				 realIp1B4 <= realWorkingBuffer[4];
				 imgIp2B4 <= imagWorkingBuffer[260];
				 realIp2B4 <= realWorkingBuffer[260];
				 twiddleFactorRealB4 <=#1 0.998795;
				 twiddleFactorimgB4 <=#1 -0.049068;
				 stateIp1B4<=#1 4;
				 stateIp2B4<=#1 260;

				 //(5,261)
				 imgIp1B5 <= imagWorkingBuffer[5];
				 realIp1B5 <= realWorkingBuffer[5];
				 imgIp2B5 <= imagWorkingBuffer[261];
				 realIp2B5 <= realWorkingBuffer[261];
				 twiddleFactorRealB5 <=#1 0.998118;
				 twiddleFactorimgB5 <=#1 -0.061321;
				 stateIp1B5<=#1 5;
				 stateIp2B5<=#1 261;

				 //(6,262)
				 imgIp1B6 <= imagWorkingBuffer[6];
				 realIp1B6 <= realWorkingBuffer[6];
				 imgIp2B6 <= imagWorkingBuffer[262];
				 realIp2B6 <= realWorkingBuffer[262];
				 twiddleFactorRealB6 <=#1 0.99729;
				 twiddleFactorimgB6 <=#1 -0.073565;
				 stateIp1B6<=#1 6;
				 stateIp2B6<=#1 262;

				 //(7,263)
				 imgIp1B7 <= imagWorkingBuffer[7];
				 realIp1B7 <= realWorkingBuffer[7];
				 imgIp2B7 <= imagWorkingBuffer[263];
				 realIp2B7 <= realWorkingBuffer[263];
				 twiddleFactorRealB7 <=#1 0.996313;
				 twiddleFactorimgB7 <=#1 -0.085797;
				 stateIp1B7<=#1 7;
				 stateIp2B7<=#1 263;
			 end
			 258 : begin

				 //(8,264)
				 imgIp1B0 <= imagWorkingBuffer[8];
				 realIp1B0 <= realWorkingBuffer[8];
				 imgIp2B0 <= imagWorkingBuffer[264];
				 realIp2B0 <= realWorkingBuffer[264];
				 twiddleFactorRealB0 <=#1 0.995185;
				 twiddleFactorimgB0 <=#1 -0.098017;
				 stateIp1B0<=#1 8;
				 stateIp2B0<=#1 264;

				 //(9,265)
				 imgIp1B1 <= imagWorkingBuffer[9];
				 realIp1B1 <= realWorkingBuffer[9];
				 imgIp2B1 <= imagWorkingBuffer[265];
				 realIp2B1 <= realWorkingBuffer[265];
				 twiddleFactorRealB1 <=#1 0.993907;
				 twiddleFactorimgB1 <=#1 -0.110222;
				 stateIp1B1<=#1 9;
				 stateIp2B1<=#1 265;

				 //(10,266)
				 imgIp1B2 <= imagWorkingBuffer[10];
				 realIp1B2 <= realWorkingBuffer[10];
				 imgIp2B2 <= imagWorkingBuffer[266];
				 realIp2B2 <= realWorkingBuffer[266];
				 twiddleFactorRealB2 <=#1 0.99248;
				 twiddleFactorimgB2 <=#1 -0.122411;
				 stateIp1B2<=#1 10;
				 stateIp2B2<=#1 266;

				 //(11,267)
				 imgIp1B3 <= imagWorkingBuffer[11];
				 realIp1B3 <= realWorkingBuffer[11];
				 imgIp2B3 <= imagWorkingBuffer[267];
				 realIp2B3 <= realWorkingBuffer[267];
				 twiddleFactorRealB3 <=#1 0.990903;
				 twiddleFactorimgB3 <=#1 -0.134581;
				 stateIp1B3<=#1 11;
				 stateIp2B3<=#1 267;

				 //(12,268)
				 imgIp1B4 <= imagWorkingBuffer[12];
				 realIp1B4 <= realWorkingBuffer[12];
				 imgIp2B4 <= imagWorkingBuffer[268];
				 realIp2B4 <= realWorkingBuffer[268];
				 twiddleFactorRealB4 <=#1 0.989177;
				 twiddleFactorimgB4 <=#1 -0.14673;
				 stateIp1B4<=#1 12;
				 stateIp2B4<=#1 268;

				 //(13,269)
				 imgIp1B5 <= imagWorkingBuffer[13];
				 realIp1B5 <= realWorkingBuffer[13];
				 imgIp2B5 <= imagWorkingBuffer[269];
				 realIp2B5 <= realWorkingBuffer[269];
				 twiddleFactorRealB5 <=#1 0.987301;
				 twiddleFactorimgB5 <=#1 -0.158858;
				 stateIp1B5<=#1 13;
				 stateIp2B5<=#1 269;

				 //(14,270)
				 imgIp1B6 <= imagWorkingBuffer[14];
				 realIp1B6 <= realWorkingBuffer[14];
				 imgIp2B6 <= imagWorkingBuffer[270];
				 realIp2B6 <= realWorkingBuffer[270];
				 twiddleFactorRealB6 <=#1 0.985278;
				 twiddleFactorimgB6 <=#1 -0.170962;
				 stateIp1B6<=#1 14;
				 stateIp2B6<=#1 270;

				 //(15,271)
				 imgIp1B7 <= imagWorkingBuffer[15];
				 realIp1B7 <= realWorkingBuffer[15];
				 imgIp2B7 <= imagWorkingBuffer[271];
				 realIp2B7 <= realWorkingBuffer[271];
				 twiddleFactorRealB7 <=#1 0.983105;
				 twiddleFactorimgB7 <=#1 -0.18304;
				 stateIp1B7<=#1 15;
				 stateIp2B7<=#1 271;
			 end
			 259 : begin

				 //(16,272)
				 imgIp1B0 <= imagWorkingBuffer[16];
				 realIp1B0 <= realWorkingBuffer[16];
				 imgIp2B0 <= imagWorkingBuffer[272];
				 realIp2B0 <= realWorkingBuffer[272];
				 twiddleFactorRealB0 <=#1 0.980785;
				 twiddleFactorimgB0 <=#1 -0.19509;
				 stateIp1B0<=#1 16;
				 stateIp2B0<=#1 272;

				 //(17,273)
				 imgIp1B1 <= imagWorkingBuffer[17];
				 realIp1B1 <= realWorkingBuffer[17];
				 imgIp2B1 <= imagWorkingBuffer[273];
				 realIp2B1 <= realWorkingBuffer[273];
				 twiddleFactorRealB1 <=#1 0.978317;
				 twiddleFactorimgB1 <=#1 -0.207111;
				 stateIp1B1<=#1 17;
				 stateIp2B1<=#1 273;

				 //(18,274)
				 imgIp1B2 <= imagWorkingBuffer[18];
				 realIp1B2 <= realWorkingBuffer[18];
				 imgIp2B2 <= imagWorkingBuffer[274];
				 realIp2B2 <= realWorkingBuffer[274];
				 twiddleFactorRealB2 <=#1 0.975702;
				 twiddleFactorimgB2 <=#1 -0.219101;
				 stateIp1B2<=#1 18;
				 stateIp2B2<=#1 274;

				 //(19,275)
				 imgIp1B3 <= imagWorkingBuffer[19];
				 realIp1B3 <= realWorkingBuffer[19];
				 imgIp2B3 <= imagWorkingBuffer[275];
				 realIp2B3 <= realWorkingBuffer[275];
				 twiddleFactorRealB3 <=#1 0.97294;
				 twiddleFactorimgB3 <=#1 -0.231058;
				 stateIp1B3<=#1 19;
				 stateIp2B3<=#1 275;

				 //(20,276)
				 imgIp1B4 <= imagWorkingBuffer[20];
				 realIp1B4 <= realWorkingBuffer[20];
				 imgIp2B4 <= imagWorkingBuffer[276];
				 realIp2B4 <= realWorkingBuffer[276];
				 twiddleFactorRealB4 <=#1 0.970031;
				 twiddleFactorimgB4 <=#1 -0.24298;
				 stateIp1B4<=#1 20;
				 stateIp2B4<=#1 276;

				 //(21,277)
				 imgIp1B5 <= imagWorkingBuffer[21];
				 realIp1B5 <= realWorkingBuffer[21];
				 imgIp2B5 <= imagWorkingBuffer[277];
				 realIp2B5 <= realWorkingBuffer[277];
				 twiddleFactorRealB5 <=#1 0.966976;
				 twiddleFactorimgB5 <=#1 -0.254866;
				 stateIp1B5<=#1 21;
				 stateIp2B5<=#1 277;

				 //(22,278)
				 imgIp1B6 <= imagWorkingBuffer[22];
				 realIp1B6 <= realWorkingBuffer[22];
				 imgIp2B6 <= imagWorkingBuffer[278];
				 realIp2B6 <= realWorkingBuffer[278];
				 twiddleFactorRealB6 <=#1 0.963776;
				 twiddleFactorimgB6 <=#1 -0.266713;
				 stateIp1B6<=#1 22;
				 stateIp2B6<=#1 278;

				 //(23,279)
				 imgIp1B7 <= imagWorkingBuffer[23];
				 realIp1B7 <= realWorkingBuffer[23];
				 imgIp2B7 <= imagWorkingBuffer[279];
				 realIp2B7 <= realWorkingBuffer[279];
				 twiddleFactorRealB7 <=#1 0.960431;
				 twiddleFactorimgB7 <=#1 -0.27852;
				 stateIp1B7<=#1 23;
				 stateIp2B7<=#1 279;
			 end
			 260 : begin

				 //(24,280)
				 imgIp1B0 <= imagWorkingBuffer[24];
				 realIp1B0 <= realWorkingBuffer[24];
				 imgIp2B0 <= imagWorkingBuffer[280];
				 realIp2B0 <= realWorkingBuffer[280];
				 twiddleFactorRealB0 <=#1 0.95694;
				 twiddleFactorimgB0 <=#1 -0.290285;
				 stateIp1B0<=#1 24;
				 stateIp2B0<=#1 280;

				 //(25,281)
				 imgIp1B1 <= imagWorkingBuffer[25];
				 realIp1B1 <= realWorkingBuffer[25];
				 imgIp2B1 <= imagWorkingBuffer[281];
				 realIp2B1 <= realWorkingBuffer[281];
				 twiddleFactorRealB1 <=#1 0.953306;
				 twiddleFactorimgB1 <=#1 -0.302006;
				 stateIp1B1<=#1 25;
				 stateIp2B1<=#1 281;

				 //(26,282)
				 imgIp1B2 <= imagWorkingBuffer[26];
				 realIp1B2 <= realWorkingBuffer[26];
				 imgIp2B2 <= imagWorkingBuffer[282];
				 realIp2B2 <= realWorkingBuffer[282];
				 twiddleFactorRealB2 <=#1 0.949528;
				 twiddleFactorimgB2 <=#1 -0.313682;
				 stateIp1B2<=#1 26;
				 stateIp2B2<=#1 282;

				 //(27,283)
				 imgIp1B3 <= imagWorkingBuffer[27];
				 realIp1B3 <= realWorkingBuffer[27];
				 imgIp2B3 <= imagWorkingBuffer[283];
				 realIp2B3 <= realWorkingBuffer[283];
				 twiddleFactorRealB3 <=#1 0.945607;
				 twiddleFactorimgB3 <=#1 -0.32531;
				 stateIp1B3<=#1 27;
				 stateIp2B3<=#1 283;

				 //(28,284)
				 imgIp1B4 <= imagWorkingBuffer[28];
				 realIp1B4 <= realWorkingBuffer[28];
				 imgIp2B4 <= imagWorkingBuffer[284];
				 realIp2B4 <= realWorkingBuffer[284];
				 twiddleFactorRealB4 <=#1 0.941544;
				 twiddleFactorimgB4 <=#1 -0.33689;
				 stateIp1B4<=#1 28;
				 stateIp2B4<=#1 284;

				 //(29,285)
				 imgIp1B5 <= imagWorkingBuffer[29];
				 realIp1B5 <= realWorkingBuffer[29];
				 imgIp2B5 <= imagWorkingBuffer[285];
				 realIp2B5 <= realWorkingBuffer[285];
				 twiddleFactorRealB5 <=#1 0.937339;
				 twiddleFactorimgB5 <=#1 -0.348419;
				 stateIp1B5<=#1 29;
				 stateIp2B5<=#1 285;

				 //(30,286)
				 imgIp1B6 <= imagWorkingBuffer[30];
				 realIp1B6 <= realWorkingBuffer[30];
				 imgIp2B6 <= imagWorkingBuffer[286];
				 realIp2B6 <= realWorkingBuffer[286];
				 twiddleFactorRealB6 <=#1 0.932993;
				 twiddleFactorimgB6 <=#1 -0.359895;
				 stateIp1B6<=#1 30;
				 stateIp2B6<=#1 286;

				 //(31,287)
				 imgIp1B7 <= imagWorkingBuffer[31];
				 realIp1B7 <= realWorkingBuffer[31];
				 imgIp2B7 <= imagWorkingBuffer[287];
				 realIp2B7 <= realWorkingBuffer[287];
				 twiddleFactorRealB7 <=#1 0.928506;
				 twiddleFactorimgB7 <=#1 -0.371317;
				 stateIp1B7<=#1 31;
				 stateIp2B7<=#1 287;
			 end
			 261 : begin

				 //(32,288)
				 imgIp1B0 <= imagWorkingBuffer[32];
				 realIp1B0 <= realWorkingBuffer[32];
				 imgIp2B0 <= imagWorkingBuffer[288];
				 realIp2B0 <= realWorkingBuffer[288];
				 twiddleFactorRealB0 <=#1 0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 32;
				 stateIp2B0<=#1 288;

				 //(33,289)
				 imgIp1B1 <= imagWorkingBuffer[33];
				 realIp1B1 <= realWorkingBuffer[33];
				 imgIp2B1 <= imagWorkingBuffer[289];
				 realIp2B1 <= realWorkingBuffer[289];
				 twiddleFactorRealB1 <=#1 0.919114;
				 twiddleFactorimgB1 <=#1 -0.393992;
				 stateIp1B1<=#1 33;
				 stateIp2B1<=#1 289;

				 //(34,290)
				 imgIp1B2 <= imagWorkingBuffer[34];
				 realIp1B2 <= realWorkingBuffer[34];
				 imgIp2B2 <= imagWorkingBuffer[290];
				 realIp2B2 <= realWorkingBuffer[290];
				 twiddleFactorRealB2 <=#1 0.91421;
				 twiddleFactorimgB2 <=#1 -0.405241;
				 stateIp1B2<=#1 34;
				 stateIp2B2<=#1 290;

				 //(35,291)
				 imgIp1B3 <= imagWorkingBuffer[35];
				 realIp1B3 <= realWorkingBuffer[35];
				 imgIp2B3 <= imagWorkingBuffer[291];
				 realIp2B3 <= realWorkingBuffer[291];
				 twiddleFactorRealB3 <=#1 0.909168;
				 twiddleFactorimgB3 <=#1 -0.41643;
				 stateIp1B3<=#1 35;
				 stateIp2B3<=#1 291;

				 //(36,292)
				 imgIp1B4 <= imagWorkingBuffer[36];
				 realIp1B4 <= realWorkingBuffer[36];
				 imgIp2B4 <= imagWorkingBuffer[292];
				 realIp2B4 <= realWorkingBuffer[292];
				 twiddleFactorRealB4 <=#1 0.903989;
				 twiddleFactorimgB4 <=#1 -0.427555;
				 stateIp1B4<=#1 36;
				 stateIp2B4<=#1 292;

				 //(37,293)
				 imgIp1B5 <= imagWorkingBuffer[37];
				 realIp1B5 <= realWorkingBuffer[37];
				 imgIp2B5 <= imagWorkingBuffer[293];
				 realIp2B5 <= realWorkingBuffer[293];
				 twiddleFactorRealB5 <=#1 0.898674;
				 twiddleFactorimgB5 <=#1 -0.438616;
				 stateIp1B5<=#1 37;
				 stateIp2B5<=#1 293;

				 //(38,294)
				 imgIp1B6 <= imagWorkingBuffer[38];
				 realIp1B6 <= realWorkingBuffer[38];
				 imgIp2B6 <= imagWorkingBuffer[294];
				 realIp2B6 <= realWorkingBuffer[294];
				 twiddleFactorRealB6 <=#1 0.893224;
				 twiddleFactorimgB6 <=#1 -0.449611;
				 stateIp1B6<=#1 38;
				 stateIp2B6<=#1 294;

				 //(39,295)
				 imgIp1B7 <= imagWorkingBuffer[39];
				 realIp1B7 <= realWorkingBuffer[39];
				 imgIp2B7 <= imagWorkingBuffer[295];
				 realIp2B7 <= realWorkingBuffer[295];
				 twiddleFactorRealB7 <=#1 0.88764;
				 twiddleFactorimgB7 <=#1 -0.460539;
				 stateIp1B7<=#1 39;
				 stateIp2B7<=#1 295;
			 end
			 262 : begin

				 //(40,296)
				 imgIp1B0 <= imagWorkingBuffer[40];
				 realIp1B0 <= realWorkingBuffer[40];
				 imgIp2B0 <= imagWorkingBuffer[296];
				 realIp2B0 <= realWorkingBuffer[296];
				 twiddleFactorRealB0 <=#1 0.881921;
				 twiddleFactorimgB0 <=#1 -0.471397;
				 stateIp1B0<=#1 40;
				 stateIp2B0<=#1 296;

				 //(41,297)
				 imgIp1B1 <= imagWorkingBuffer[41];
				 realIp1B1 <= realWorkingBuffer[41];
				 imgIp2B1 <= imagWorkingBuffer[297];
				 realIp2B1 <= realWorkingBuffer[297];
				 twiddleFactorRealB1 <=#1 0.87607;
				 twiddleFactorimgB1 <=#1 -0.482184;
				 stateIp1B1<=#1 41;
				 stateIp2B1<=#1 297;

				 //(42,298)
				 imgIp1B2 <= imagWorkingBuffer[42];
				 realIp1B2 <= realWorkingBuffer[42];
				 imgIp2B2 <= imagWorkingBuffer[298];
				 realIp2B2 <= realWorkingBuffer[298];
				 twiddleFactorRealB2 <=#1 0.870087;
				 twiddleFactorimgB2 <=#1 -0.492898;
				 stateIp1B2<=#1 42;
				 stateIp2B2<=#1 298;

				 //(43,299)
				 imgIp1B3 <= imagWorkingBuffer[43];
				 realIp1B3 <= realWorkingBuffer[43];
				 imgIp2B3 <= imagWorkingBuffer[299];
				 realIp2B3 <= realWorkingBuffer[299];
				 twiddleFactorRealB3 <=#1 0.863973;
				 twiddleFactorimgB3 <=#1 -0.503538;
				 stateIp1B3<=#1 43;
				 stateIp2B3<=#1 299;

				 //(44,300)
				 imgIp1B4 <= imagWorkingBuffer[44];
				 realIp1B4 <= realWorkingBuffer[44];
				 imgIp2B4 <= imagWorkingBuffer[300];
				 realIp2B4 <= realWorkingBuffer[300];
				 twiddleFactorRealB4 <=#1 0.857729;
				 twiddleFactorimgB4 <=#1 -0.514103;
				 stateIp1B4<=#1 44;
				 stateIp2B4<=#1 300;

				 //(45,301)
				 imgIp1B5 <= imagWorkingBuffer[45];
				 realIp1B5 <= realWorkingBuffer[45];
				 imgIp2B5 <= imagWorkingBuffer[301];
				 realIp2B5 <= realWorkingBuffer[301];
				 twiddleFactorRealB5 <=#1 0.851355;
				 twiddleFactorimgB5 <=#1 -0.52459;
				 stateIp1B5<=#1 45;
				 stateIp2B5<=#1 301;

				 //(46,302)
				 imgIp1B6 <= imagWorkingBuffer[46];
				 realIp1B6 <= realWorkingBuffer[46];
				 imgIp2B6 <= imagWorkingBuffer[302];
				 realIp2B6 <= realWorkingBuffer[302];
				 twiddleFactorRealB6 <=#1 0.844854;
				 twiddleFactorimgB6 <=#1 -0.534998;
				 stateIp1B6<=#1 46;
				 stateIp2B6<=#1 302;

				 //(47,303)
				 imgIp1B7 <= imagWorkingBuffer[47];
				 realIp1B7 <= realWorkingBuffer[47];
				 imgIp2B7 <= imagWorkingBuffer[303];
				 realIp2B7 <= realWorkingBuffer[303];
				 twiddleFactorRealB7 <=#1 0.838225;
				 twiddleFactorimgB7 <=#1 -0.545325;
				 stateIp1B7<=#1 47;
				 stateIp2B7<=#1 303;
			 end
			 263 : begin

				 //(48,304)
				 imgIp1B0 <= imagWorkingBuffer[48];
				 realIp1B0 <= realWorkingBuffer[48];
				 imgIp2B0 <= imagWorkingBuffer[304];
				 realIp2B0 <= realWorkingBuffer[304];
				 twiddleFactorRealB0 <=#1 0.83147;
				 twiddleFactorimgB0 <=#1 -0.55557;
				 stateIp1B0<=#1 48;
				 stateIp2B0<=#1 304;

				 //(49,305)
				 imgIp1B1 <= imagWorkingBuffer[49];
				 realIp1B1 <= realWorkingBuffer[49];
				 imgIp2B1 <= imagWorkingBuffer[305];
				 realIp2B1 <= realWorkingBuffer[305];
				 twiddleFactorRealB1 <=#1 0.824589;
				 twiddleFactorimgB1 <=#1 -0.565732;
				 stateIp1B1<=#1 49;
				 stateIp2B1<=#1 305;

				 //(50,306)
				 imgIp1B2 <= imagWorkingBuffer[50];
				 realIp1B2 <= realWorkingBuffer[50];
				 imgIp2B2 <= imagWorkingBuffer[306];
				 realIp2B2 <= realWorkingBuffer[306];
				 twiddleFactorRealB2 <=#1 0.817585;
				 twiddleFactorimgB2 <=#1 -0.575808;
				 stateIp1B2<=#1 50;
				 stateIp2B2<=#1 306;

				 //(51,307)
				 imgIp1B3 <= imagWorkingBuffer[51];
				 realIp1B3 <= realWorkingBuffer[51];
				 imgIp2B3 <= imagWorkingBuffer[307];
				 realIp2B3 <= realWorkingBuffer[307];
				 twiddleFactorRealB3 <=#1 0.810457;
				 twiddleFactorimgB3 <=#1 -0.585798;
				 stateIp1B3<=#1 51;
				 stateIp2B3<=#1 307;

				 //(52,308)
				 imgIp1B4 <= imagWorkingBuffer[52];
				 realIp1B4 <= realWorkingBuffer[52];
				 imgIp2B4 <= imagWorkingBuffer[308];
				 realIp2B4 <= realWorkingBuffer[308];
				 twiddleFactorRealB4 <=#1 0.803208;
				 twiddleFactorimgB4 <=#1 -0.595699;
				 stateIp1B4<=#1 52;
				 stateIp2B4<=#1 308;

				 //(53,309)
				 imgIp1B5 <= imagWorkingBuffer[53];
				 realIp1B5 <= realWorkingBuffer[53];
				 imgIp2B5 <= imagWorkingBuffer[309];
				 realIp2B5 <= realWorkingBuffer[309];
				 twiddleFactorRealB5 <=#1 0.795837;
				 twiddleFactorimgB5 <=#1 -0.605511;
				 stateIp1B5<=#1 53;
				 stateIp2B5<=#1 309;

				 //(54,310)
				 imgIp1B6 <= imagWorkingBuffer[54];
				 realIp1B6 <= realWorkingBuffer[54];
				 imgIp2B6 <= imagWorkingBuffer[310];
				 realIp2B6 <= realWorkingBuffer[310];
				 twiddleFactorRealB6 <=#1 0.788346;
				 twiddleFactorimgB6 <=#1 -0.615232;
				 stateIp1B6<=#1 54;
				 stateIp2B6<=#1 310;

				 //(55,311)
				 imgIp1B7 <= imagWorkingBuffer[55];
				 realIp1B7 <= realWorkingBuffer[55];
				 imgIp2B7 <= imagWorkingBuffer[311];
				 realIp2B7 <= realWorkingBuffer[311];
				 twiddleFactorRealB7 <=#1 0.780737;
				 twiddleFactorimgB7 <=#1 -0.624859;
				 stateIp1B7<=#1 55;
				 stateIp2B7<=#1 311;
			 end
			 264 : begin

				 //(56,312)
				 imgIp1B0 <= imagWorkingBuffer[56];
				 realIp1B0 <= realWorkingBuffer[56];
				 imgIp2B0 <= imagWorkingBuffer[312];
				 realIp2B0 <= realWorkingBuffer[312];
				 twiddleFactorRealB0 <=#1 0.77301;
				 twiddleFactorimgB0 <=#1 -0.634393;
				 stateIp1B0<=#1 56;
				 stateIp2B0<=#1 312;

				 //(57,313)
				 imgIp1B1 <= imagWorkingBuffer[57];
				 realIp1B1 <= realWorkingBuffer[57];
				 imgIp2B1 <= imagWorkingBuffer[313];
				 realIp2B1 <= realWorkingBuffer[313];
				 twiddleFactorRealB1 <=#1 0.765167;
				 twiddleFactorimgB1 <=#1 -0.643832;
				 stateIp1B1<=#1 57;
				 stateIp2B1<=#1 313;

				 //(58,314)
				 imgIp1B2 <= imagWorkingBuffer[58];
				 realIp1B2 <= realWorkingBuffer[58];
				 imgIp2B2 <= imagWorkingBuffer[314];
				 realIp2B2 <= realWorkingBuffer[314];
				 twiddleFactorRealB2 <=#1 0.757209;
				 twiddleFactorimgB2 <=#1 -0.653173;
				 stateIp1B2<=#1 58;
				 stateIp2B2<=#1 314;

				 //(59,315)
				 imgIp1B3 <= imagWorkingBuffer[59];
				 realIp1B3 <= realWorkingBuffer[59];
				 imgIp2B3 <= imagWorkingBuffer[315];
				 realIp2B3 <= realWorkingBuffer[315];
				 twiddleFactorRealB3 <=#1 0.749136;
				 twiddleFactorimgB3 <=#1 -0.662416;
				 stateIp1B3<=#1 59;
				 stateIp2B3<=#1 315;

				 //(60,316)
				 imgIp1B4 <= imagWorkingBuffer[60];
				 realIp1B4 <= realWorkingBuffer[60];
				 imgIp2B4 <= imagWorkingBuffer[316];
				 realIp2B4 <= realWorkingBuffer[316];
				 twiddleFactorRealB4 <=#1 0.740951;
				 twiddleFactorimgB4 <=#1 -0.671559;
				 stateIp1B4<=#1 60;
				 stateIp2B4<=#1 316;

				 //(61,317)
				 imgIp1B5 <= imagWorkingBuffer[61];
				 realIp1B5 <= realWorkingBuffer[61];
				 imgIp2B5 <= imagWorkingBuffer[317];
				 realIp2B5 <= realWorkingBuffer[317];
				 twiddleFactorRealB5 <=#1 0.732654;
				 twiddleFactorimgB5 <=#1 -0.680601;
				 stateIp1B5<=#1 61;
				 stateIp2B5<=#1 317;

				 //(62,318)
				 imgIp1B6 <= imagWorkingBuffer[62];
				 realIp1B6 <= realWorkingBuffer[62];
				 imgIp2B6 <= imagWorkingBuffer[318];
				 realIp2B6 <= realWorkingBuffer[318];
				 twiddleFactorRealB6 <=#1 0.724247;
				 twiddleFactorimgB6 <=#1 -0.689541;
				 stateIp1B6<=#1 62;
				 stateIp2B6<=#1 318;

				 //(63,319)
				 imgIp1B7 <= imagWorkingBuffer[63];
				 realIp1B7 <= realWorkingBuffer[63];
				 imgIp2B7 <= imagWorkingBuffer[319];
				 realIp2B7 <= realWorkingBuffer[319];
				 twiddleFactorRealB7 <=#1 0.715731;
				 twiddleFactorimgB7 <=#1 -0.698376;
				 stateIp1B7<=#1 63;
				 stateIp2B7<=#1 319;
			 end
			 265 : begin

				 //(64,320)
				 imgIp1B0 <= imagWorkingBuffer[64];
				 realIp1B0 <= realWorkingBuffer[64];
				 imgIp2B0 <= imagWorkingBuffer[320];
				 realIp2B0 <= realWorkingBuffer[320];
				 twiddleFactorRealB0 <=#1 0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 64;
				 stateIp2B0<=#1 320;

				 //(65,321)
				 imgIp1B1 <= imagWorkingBuffer[65];
				 realIp1B1 <= realWorkingBuffer[65];
				 imgIp2B1 <= imagWorkingBuffer[321];
				 realIp2B1 <= realWorkingBuffer[321];
				 twiddleFactorRealB1 <=#1 0.698376;
				 twiddleFactorimgB1 <=#1 -0.715731;
				 stateIp1B1<=#1 65;
				 stateIp2B1<=#1 321;

				 //(66,322)
				 imgIp1B2 <= imagWorkingBuffer[66];
				 realIp1B2 <= realWorkingBuffer[66];
				 imgIp2B2 <= imagWorkingBuffer[322];
				 realIp2B2 <= realWorkingBuffer[322];
				 twiddleFactorRealB2 <=#1 0.689541;
				 twiddleFactorimgB2 <=#1 -0.724247;
				 stateIp1B2<=#1 66;
				 stateIp2B2<=#1 322;

				 //(67,323)
				 imgIp1B3 <= imagWorkingBuffer[67];
				 realIp1B3 <= realWorkingBuffer[67];
				 imgIp2B3 <= imagWorkingBuffer[323];
				 realIp2B3 <= realWorkingBuffer[323];
				 twiddleFactorRealB3 <=#1 0.680601;
				 twiddleFactorimgB3 <=#1 -0.732654;
				 stateIp1B3<=#1 67;
				 stateIp2B3<=#1 323;

				 //(68,324)
				 imgIp1B4 <= imagWorkingBuffer[68];
				 realIp1B4 <= realWorkingBuffer[68];
				 imgIp2B4 <= imagWorkingBuffer[324];
				 realIp2B4 <= realWorkingBuffer[324];
				 twiddleFactorRealB4 <=#1 0.671559;
				 twiddleFactorimgB4 <=#1 -0.740951;
				 stateIp1B4<=#1 68;
				 stateIp2B4<=#1 324;

				 //(69,325)
				 imgIp1B5 <= imagWorkingBuffer[69];
				 realIp1B5 <= realWorkingBuffer[69];
				 imgIp2B5 <= imagWorkingBuffer[325];
				 realIp2B5 <= realWorkingBuffer[325];
				 twiddleFactorRealB5 <=#1 0.662416;
				 twiddleFactorimgB5 <=#1 -0.749136;
				 stateIp1B5<=#1 69;
				 stateIp2B5<=#1 325;

				 //(70,326)
				 imgIp1B6 <= imagWorkingBuffer[70];
				 realIp1B6 <= realWorkingBuffer[70];
				 imgIp2B6 <= imagWorkingBuffer[326];
				 realIp2B6 <= realWorkingBuffer[326];
				 twiddleFactorRealB6 <=#1 0.653173;
				 twiddleFactorimgB6 <=#1 -0.757209;
				 stateIp1B6<=#1 70;
				 stateIp2B6<=#1 326;

				 //(71,327)
				 imgIp1B7 <= imagWorkingBuffer[71];
				 realIp1B7 <= realWorkingBuffer[71];
				 imgIp2B7 <= imagWorkingBuffer[327];
				 realIp2B7 <= realWorkingBuffer[327];
				 twiddleFactorRealB7 <=#1 0.643832;
				 twiddleFactorimgB7 <=#1 -0.765167;
				 stateIp1B7<=#1 71;
				 stateIp2B7<=#1 327;
			 end
			 266 : begin

				 //(72,328)
				 imgIp1B0 <= imagWorkingBuffer[72];
				 realIp1B0 <= realWorkingBuffer[72];
				 imgIp2B0 <= imagWorkingBuffer[328];
				 realIp2B0 <= realWorkingBuffer[328];
				 twiddleFactorRealB0 <=#1 0.634393;
				 twiddleFactorimgB0 <=#1 -0.77301;
				 stateIp1B0<=#1 72;
				 stateIp2B0<=#1 328;

				 //(73,329)
				 imgIp1B1 <= imagWorkingBuffer[73];
				 realIp1B1 <= realWorkingBuffer[73];
				 imgIp2B1 <= imagWorkingBuffer[329];
				 realIp2B1 <= realWorkingBuffer[329];
				 twiddleFactorRealB1 <=#1 0.624859;
				 twiddleFactorimgB1 <=#1 -0.780737;
				 stateIp1B1<=#1 73;
				 stateIp2B1<=#1 329;

				 //(74,330)
				 imgIp1B2 <= imagWorkingBuffer[74];
				 realIp1B2 <= realWorkingBuffer[74];
				 imgIp2B2 <= imagWorkingBuffer[330];
				 realIp2B2 <= realWorkingBuffer[330];
				 twiddleFactorRealB2 <=#1 0.615232;
				 twiddleFactorimgB2 <=#1 -0.788346;
				 stateIp1B2<=#1 74;
				 stateIp2B2<=#1 330;

				 //(75,331)
				 imgIp1B3 <= imagWorkingBuffer[75];
				 realIp1B3 <= realWorkingBuffer[75];
				 imgIp2B3 <= imagWorkingBuffer[331];
				 realIp2B3 <= realWorkingBuffer[331];
				 twiddleFactorRealB3 <=#1 0.605511;
				 twiddleFactorimgB3 <=#1 -0.795837;
				 stateIp1B3<=#1 75;
				 stateIp2B3<=#1 331;

				 //(76,332)
				 imgIp1B4 <= imagWorkingBuffer[76];
				 realIp1B4 <= realWorkingBuffer[76];
				 imgIp2B4 <= imagWorkingBuffer[332];
				 realIp2B4 <= realWorkingBuffer[332];
				 twiddleFactorRealB4 <=#1 0.595699;
				 twiddleFactorimgB4 <=#1 -0.803208;
				 stateIp1B4<=#1 76;
				 stateIp2B4<=#1 332;

				 //(77,333)
				 imgIp1B5 <= imagWorkingBuffer[77];
				 realIp1B5 <= realWorkingBuffer[77];
				 imgIp2B5 <= imagWorkingBuffer[333];
				 realIp2B5 <= realWorkingBuffer[333];
				 twiddleFactorRealB5 <=#1 0.585798;
				 twiddleFactorimgB5 <=#1 -0.810457;
				 stateIp1B5<=#1 77;
				 stateIp2B5<=#1 333;

				 //(78,334)
				 imgIp1B6 <= imagWorkingBuffer[78];
				 realIp1B6 <= realWorkingBuffer[78];
				 imgIp2B6 <= imagWorkingBuffer[334];
				 realIp2B6 <= realWorkingBuffer[334];
				 twiddleFactorRealB6 <=#1 0.575808;
				 twiddleFactorimgB6 <=#1 -0.817585;
				 stateIp1B6<=#1 78;
				 stateIp2B6<=#1 334;

				 //(79,335)
				 imgIp1B7 <= imagWorkingBuffer[79];
				 realIp1B7 <= realWorkingBuffer[79];
				 imgIp2B7 <= imagWorkingBuffer[335];
				 realIp2B7 <= realWorkingBuffer[335];
				 twiddleFactorRealB7 <=#1 0.565732;
				 twiddleFactorimgB7 <=#1 -0.824589;
				 stateIp1B7<=#1 79;
				 stateIp2B7<=#1 335;
			 end
			 267 : begin

				 //(80,336)
				 imgIp1B0 <= imagWorkingBuffer[80];
				 realIp1B0 <= realWorkingBuffer[80];
				 imgIp2B0 <= imagWorkingBuffer[336];
				 realIp2B0 <= realWorkingBuffer[336];
				 twiddleFactorRealB0 <=#1 0.55557;
				 twiddleFactorimgB0 <=#1 -0.83147;
				 stateIp1B0<=#1 80;
				 stateIp2B0<=#1 336;

				 //(81,337)
				 imgIp1B1 <= imagWorkingBuffer[81];
				 realIp1B1 <= realWorkingBuffer[81];
				 imgIp2B1 <= imagWorkingBuffer[337];
				 realIp2B1 <= realWorkingBuffer[337];
				 twiddleFactorRealB1 <=#1 0.545325;
				 twiddleFactorimgB1 <=#1 -0.838225;
				 stateIp1B1<=#1 81;
				 stateIp2B1<=#1 337;

				 //(82,338)
				 imgIp1B2 <= imagWorkingBuffer[82];
				 realIp1B2 <= realWorkingBuffer[82];
				 imgIp2B2 <= imagWorkingBuffer[338];
				 realIp2B2 <= realWorkingBuffer[338];
				 twiddleFactorRealB2 <=#1 0.534998;
				 twiddleFactorimgB2 <=#1 -0.844854;
				 stateIp1B2<=#1 82;
				 stateIp2B2<=#1 338;

				 //(83,339)
				 imgIp1B3 <= imagWorkingBuffer[83];
				 realIp1B3 <= realWorkingBuffer[83];
				 imgIp2B3 <= imagWorkingBuffer[339];
				 realIp2B3 <= realWorkingBuffer[339];
				 twiddleFactorRealB3 <=#1 0.52459;
				 twiddleFactorimgB3 <=#1 -0.851355;
				 stateIp1B3<=#1 83;
				 stateIp2B3<=#1 339;

				 //(84,340)
				 imgIp1B4 <= imagWorkingBuffer[84];
				 realIp1B4 <= realWorkingBuffer[84];
				 imgIp2B4 <= imagWorkingBuffer[340];
				 realIp2B4 <= realWorkingBuffer[340];
				 twiddleFactorRealB4 <=#1 0.514103;
				 twiddleFactorimgB4 <=#1 -0.857729;
				 stateIp1B4<=#1 84;
				 stateIp2B4<=#1 340;

				 //(85,341)
				 imgIp1B5 <= imagWorkingBuffer[85];
				 realIp1B5 <= realWorkingBuffer[85];
				 imgIp2B5 <= imagWorkingBuffer[341];
				 realIp2B5 <= realWorkingBuffer[341];
				 twiddleFactorRealB5 <=#1 0.503538;
				 twiddleFactorimgB5 <=#1 -0.863973;
				 stateIp1B5<=#1 85;
				 stateIp2B5<=#1 341;

				 //(86,342)
				 imgIp1B6 <= imagWorkingBuffer[86];
				 realIp1B6 <= realWorkingBuffer[86];
				 imgIp2B6 <= imagWorkingBuffer[342];
				 realIp2B6 <= realWorkingBuffer[342];
				 twiddleFactorRealB6 <=#1 0.492898;
				 twiddleFactorimgB6 <=#1 -0.870087;
				 stateIp1B6<=#1 86;
				 stateIp2B6<=#1 342;

				 //(87,343)
				 imgIp1B7 <= imagWorkingBuffer[87];
				 realIp1B7 <= realWorkingBuffer[87];
				 imgIp2B7 <= imagWorkingBuffer[343];
				 realIp2B7 <= realWorkingBuffer[343];
				 twiddleFactorRealB7 <=#1 0.482184;
				 twiddleFactorimgB7 <=#1 -0.87607;
				 stateIp1B7<=#1 87;
				 stateIp2B7<=#1 343;
			 end
			 268 : begin

				 //(88,344)
				 imgIp1B0 <= imagWorkingBuffer[88];
				 realIp1B0 <= realWorkingBuffer[88];
				 imgIp2B0 <= imagWorkingBuffer[344];
				 realIp2B0 <= realWorkingBuffer[344];
				 twiddleFactorRealB0 <=#1 0.471397;
				 twiddleFactorimgB0 <=#1 -0.881921;
				 stateIp1B0<=#1 88;
				 stateIp2B0<=#1 344;

				 //(89,345)
				 imgIp1B1 <= imagWorkingBuffer[89];
				 realIp1B1 <= realWorkingBuffer[89];
				 imgIp2B1 <= imagWorkingBuffer[345];
				 realIp2B1 <= realWorkingBuffer[345];
				 twiddleFactorRealB1 <=#1 0.460539;
				 twiddleFactorimgB1 <=#1 -0.88764;
				 stateIp1B1<=#1 89;
				 stateIp2B1<=#1 345;

				 //(90,346)
				 imgIp1B2 <= imagWorkingBuffer[90];
				 realIp1B2 <= realWorkingBuffer[90];
				 imgIp2B2 <= imagWorkingBuffer[346];
				 realIp2B2 <= realWorkingBuffer[346];
				 twiddleFactorRealB2 <=#1 0.449611;
				 twiddleFactorimgB2 <=#1 -0.893224;
				 stateIp1B2<=#1 90;
				 stateIp2B2<=#1 346;

				 //(91,347)
				 imgIp1B3 <= imagWorkingBuffer[91];
				 realIp1B3 <= realWorkingBuffer[91];
				 imgIp2B3 <= imagWorkingBuffer[347];
				 realIp2B3 <= realWorkingBuffer[347];
				 twiddleFactorRealB3 <=#1 0.438616;
				 twiddleFactorimgB3 <=#1 -0.898674;
				 stateIp1B3<=#1 91;
				 stateIp2B3<=#1 347;

				 //(92,348)
				 imgIp1B4 <= imagWorkingBuffer[92];
				 realIp1B4 <= realWorkingBuffer[92];
				 imgIp2B4 <= imagWorkingBuffer[348];
				 realIp2B4 <= realWorkingBuffer[348];
				 twiddleFactorRealB4 <=#1 0.427555;
				 twiddleFactorimgB4 <=#1 -0.903989;
				 stateIp1B4<=#1 92;
				 stateIp2B4<=#1 348;

				 //(93,349)
				 imgIp1B5 <= imagWorkingBuffer[93];
				 realIp1B5 <= realWorkingBuffer[93];
				 imgIp2B5 <= imagWorkingBuffer[349];
				 realIp2B5 <= realWorkingBuffer[349];
				 twiddleFactorRealB5 <=#1 0.41643;
				 twiddleFactorimgB5 <=#1 -0.909168;
				 stateIp1B5<=#1 93;
				 stateIp2B5<=#1 349;

				 //(94,350)
				 imgIp1B6 <= imagWorkingBuffer[94];
				 realIp1B6 <= realWorkingBuffer[94];
				 imgIp2B6 <= imagWorkingBuffer[350];
				 realIp2B6 <= realWorkingBuffer[350];
				 twiddleFactorRealB6 <=#1 0.405241;
				 twiddleFactorimgB6 <=#1 -0.91421;
				 stateIp1B6<=#1 94;
				 stateIp2B6<=#1 350;

				 //(95,351)
				 imgIp1B7 <= imagWorkingBuffer[95];
				 realIp1B7 <= realWorkingBuffer[95];
				 imgIp2B7 <= imagWorkingBuffer[351];
				 realIp2B7 <= realWorkingBuffer[351];
				 twiddleFactorRealB7 <=#1 0.393992;
				 twiddleFactorimgB7 <=#1 -0.919114;
				 stateIp1B7<=#1 95;
				 stateIp2B7<=#1 351;
			 end
			 269 : begin

				 //(96,352)
				 imgIp1B0 <= imagWorkingBuffer[96];
				 realIp1B0 <= realWorkingBuffer[96];
				 imgIp2B0 <= imagWorkingBuffer[352];
				 realIp2B0 <= realWorkingBuffer[352];
				 twiddleFactorRealB0 <=#1 0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 96;
				 stateIp2B0<=#1 352;

				 //(97,353)
				 imgIp1B1 <= imagWorkingBuffer[97];
				 realIp1B1 <= realWorkingBuffer[97];
				 imgIp2B1 <= imagWorkingBuffer[353];
				 realIp2B1 <= realWorkingBuffer[353];
				 twiddleFactorRealB1 <=#1 0.371317;
				 twiddleFactorimgB1 <=#1 -0.928506;
				 stateIp1B1<=#1 97;
				 stateIp2B1<=#1 353;

				 //(98,354)
				 imgIp1B2 <= imagWorkingBuffer[98];
				 realIp1B2 <= realWorkingBuffer[98];
				 imgIp2B2 <= imagWorkingBuffer[354];
				 realIp2B2 <= realWorkingBuffer[354];
				 twiddleFactorRealB2 <=#1 0.359895;
				 twiddleFactorimgB2 <=#1 -0.932993;
				 stateIp1B2<=#1 98;
				 stateIp2B2<=#1 354;

				 //(99,355)
				 imgIp1B3 <= imagWorkingBuffer[99];
				 realIp1B3 <= realWorkingBuffer[99];
				 imgIp2B3 <= imagWorkingBuffer[355];
				 realIp2B3 <= realWorkingBuffer[355];
				 twiddleFactorRealB3 <=#1 0.348419;
				 twiddleFactorimgB3 <=#1 -0.937339;
				 stateIp1B3<=#1 99;
				 stateIp2B3<=#1 355;

				 //(100,356)
				 imgIp1B4 <= imagWorkingBuffer[100];
				 realIp1B4 <= realWorkingBuffer[100];
				 imgIp2B4 <= imagWorkingBuffer[356];
				 realIp2B4 <= realWorkingBuffer[356];
				 twiddleFactorRealB4 <=#1 0.33689;
				 twiddleFactorimgB4 <=#1 -0.941544;
				 stateIp1B4<=#1 100;
				 stateIp2B4<=#1 356;

				 //(101,357)
				 imgIp1B5 <= imagWorkingBuffer[101];
				 realIp1B5 <= realWorkingBuffer[101];
				 imgIp2B5 <= imagWorkingBuffer[357];
				 realIp2B5 <= realWorkingBuffer[357];
				 twiddleFactorRealB5 <=#1 0.32531;
				 twiddleFactorimgB5 <=#1 -0.945607;
				 stateIp1B5<=#1 101;
				 stateIp2B5<=#1 357;

				 //(102,358)
				 imgIp1B6 <= imagWorkingBuffer[102];
				 realIp1B6 <= realWorkingBuffer[102];
				 imgIp2B6 <= imagWorkingBuffer[358];
				 realIp2B6 <= realWorkingBuffer[358];
				 twiddleFactorRealB6 <=#1 0.313682;
				 twiddleFactorimgB6 <=#1 -0.949528;
				 stateIp1B6<=#1 102;
				 stateIp2B6<=#1 358;

				 //(103,359)
				 imgIp1B7 <= imagWorkingBuffer[103];
				 realIp1B7 <= realWorkingBuffer[103];
				 imgIp2B7 <= imagWorkingBuffer[359];
				 realIp2B7 <= realWorkingBuffer[359];
				 twiddleFactorRealB7 <=#1 0.302006;
				 twiddleFactorimgB7 <=#1 -0.953306;
				 stateIp1B7<=#1 103;
				 stateIp2B7<=#1 359;
			 end
			 270 : begin

				 //(104,360)
				 imgIp1B0 <= imagWorkingBuffer[104];
				 realIp1B0 <= realWorkingBuffer[104];
				 imgIp2B0 <= imagWorkingBuffer[360];
				 realIp2B0 <= realWorkingBuffer[360];
				 twiddleFactorRealB0 <=#1 0.290285;
				 twiddleFactorimgB0 <=#1 -0.95694;
				 stateIp1B0<=#1 104;
				 stateIp2B0<=#1 360;

				 //(105,361)
				 imgIp1B1 <= imagWorkingBuffer[105];
				 realIp1B1 <= realWorkingBuffer[105];
				 imgIp2B1 <= imagWorkingBuffer[361];
				 realIp2B1 <= realWorkingBuffer[361];
				 twiddleFactorRealB1 <=#1 0.27852;
				 twiddleFactorimgB1 <=#1 -0.960431;
				 stateIp1B1<=#1 105;
				 stateIp2B1<=#1 361;

				 //(106,362)
				 imgIp1B2 <= imagWorkingBuffer[106];
				 realIp1B2 <= realWorkingBuffer[106];
				 imgIp2B2 <= imagWorkingBuffer[362];
				 realIp2B2 <= realWorkingBuffer[362];
				 twiddleFactorRealB2 <=#1 0.266713;
				 twiddleFactorimgB2 <=#1 -0.963776;
				 stateIp1B2<=#1 106;
				 stateIp2B2<=#1 362;

				 //(107,363)
				 imgIp1B3 <= imagWorkingBuffer[107];
				 realIp1B3 <= realWorkingBuffer[107];
				 imgIp2B3 <= imagWorkingBuffer[363];
				 realIp2B3 <= realWorkingBuffer[363];
				 twiddleFactorRealB3 <=#1 0.254866;
				 twiddleFactorimgB3 <=#1 -0.966976;
				 stateIp1B3<=#1 107;
				 stateIp2B3<=#1 363;

				 //(108,364)
				 imgIp1B4 <= imagWorkingBuffer[108];
				 realIp1B4 <= realWorkingBuffer[108];
				 imgIp2B4 <= imagWorkingBuffer[364];
				 realIp2B4 <= realWorkingBuffer[364];
				 twiddleFactorRealB4 <=#1 0.24298;
				 twiddleFactorimgB4 <=#1 -0.970031;
				 stateIp1B4<=#1 108;
				 stateIp2B4<=#1 364;

				 //(109,365)
				 imgIp1B5 <= imagWorkingBuffer[109];
				 realIp1B5 <= realWorkingBuffer[109];
				 imgIp2B5 <= imagWorkingBuffer[365];
				 realIp2B5 <= realWorkingBuffer[365];
				 twiddleFactorRealB5 <=#1 0.231058;
				 twiddleFactorimgB5 <=#1 -0.97294;
				 stateIp1B5<=#1 109;
				 stateIp2B5<=#1 365;

				 //(110,366)
				 imgIp1B6 <= imagWorkingBuffer[110];
				 realIp1B6 <= realWorkingBuffer[110];
				 imgIp2B6 <= imagWorkingBuffer[366];
				 realIp2B6 <= realWorkingBuffer[366];
				 twiddleFactorRealB6 <=#1 0.219101;
				 twiddleFactorimgB6 <=#1 -0.975702;
				 stateIp1B6<=#1 110;
				 stateIp2B6<=#1 366;

				 //(111,367)
				 imgIp1B7 <= imagWorkingBuffer[111];
				 realIp1B7 <= realWorkingBuffer[111];
				 imgIp2B7 <= imagWorkingBuffer[367];
				 realIp2B7 <= realWorkingBuffer[367];
				 twiddleFactorRealB7 <=#1 0.207111;
				 twiddleFactorimgB7 <=#1 -0.978317;
				 stateIp1B7<=#1 111;
				 stateIp2B7<=#1 367;
			 end
			 271 : begin

				 //(112,368)
				 imgIp1B0 <= imagWorkingBuffer[112];
				 realIp1B0 <= realWorkingBuffer[112];
				 imgIp2B0 <= imagWorkingBuffer[368];
				 realIp2B0 <= realWorkingBuffer[368];
				 twiddleFactorRealB0 <=#1 0.19509;
				 twiddleFactorimgB0 <=#1 -0.980785;
				 stateIp1B0<=#1 112;
				 stateIp2B0<=#1 368;

				 //(113,369)
				 imgIp1B1 <= imagWorkingBuffer[113];
				 realIp1B1 <= realWorkingBuffer[113];
				 imgIp2B1 <= imagWorkingBuffer[369];
				 realIp2B1 <= realWorkingBuffer[369];
				 twiddleFactorRealB1 <=#1 0.18304;
				 twiddleFactorimgB1 <=#1 -0.983105;
				 stateIp1B1<=#1 113;
				 stateIp2B1<=#1 369;

				 //(114,370)
				 imgIp1B2 <= imagWorkingBuffer[114];
				 realIp1B2 <= realWorkingBuffer[114];
				 imgIp2B2 <= imagWorkingBuffer[370];
				 realIp2B2 <= realWorkingBuffer[370];
				 twiddleFactorRealB2 <=#1 0.170962;
				 twiddleFactorimgB2 <=#1 -0.985278;
				 stateIp1B2<=#1 114;
				 stateIp2B2<=#1 370;

				 //(115,371)
				 imgIp1B3 <= imagWorkingBuffer[115];
				 realIp1B3 <= realWorkingBuffer[115];
				 imgIp2B3 <= imagWorkingBuffer[371];
				 realIp2B3 <= realWorkingBuffer[371];
				 twiddleFactorRealB3 <=#1 0.158858;
				 twiddleFactorimgB3 <=#1 -0.987301;
				 stateIp1B3<=#1 115;
				 stateIp2B3<=#1 371;

				 //(116,372)
				 imgIp1B4 <= imagWorkingBuffer[116];
				 realIp1B4 <= realWorkingBuffer[116];
				 imgIp2B4 <= imagWorkingBuffer[372];
				 realIp2B4 <= realWorkingBuffer[372];
				 twiddleFactorRealB4 <=#1 0.14673;
				 twiddleFactorimgB4 <=#1 -0.989177;
				 stateIp1B4<=#1 116;
				 stateIp2B4<=#1 372;

				 //(117,373)
				 imgIp1B5 <= imagWorkingBuffer[117];
				 realIp1B5 <= realWorkingBuffer[117];
				 imgIp2B5 <= imagWorkingBuffer[373];
				 realIp2B5 <= realWorkingBuffer[373];
				 twiddleFactorRealB5 <=#1 0.134581;
				 twiddleFactorimgB5 <=#1 -0.990903;
				 stateIp1B5<=#1 117;
				 stateIp2B5<=#1 373;

				 //(118,374)
				 imgIp1B6 <= imagWorkingBuffer[118];
				 realIp1B6 <= realWorkingBuffer[118];
				 imgIp2B6 <= imagWorkingBuffer[374];
				 realIp2B6 <= realWorkingBuffer[374];
				 twiddleFactorRealB6 <=#1 0.122411;
				 twiddleFactorimgB6 <=#1 -0.99248;
				 stateIp1B6<=#1 118;
				 stateIp2B6<=#1 374;

				 //(119,375)
				 imgIp1B7 <= imagWorkingBuffer[119];
				 realIp1B7 <= realWorkingBuffer[119];
				 imgIp2B7 <= imagWorkingBuffer[375];
				 realIp2B7 <= realWorkingBuffer[375];
				 twiddleFactorRealB7 <=#1 0.110222;
				 twiddleFactorimgB7 <=#1 -0.993907;
				 stateIp1B7<=#1 119;
				 stateIp2B7<=#1 375;
			 end
			 272 : begin

				 //(120,376)
				 imgIp1B0 <= imagWorkingBuffer[120];
				 realIp1B0 <= realWorkingBuffer[120];
				 imgIp2B0 <= imagWorkingBuffer[376];
				 realIp2B0 <= realWorkingBuffer[376];
				 twiddleFactorRealB0 <=#1 0.098017;
				 twiddleFactorimgB0 <=#1 -0.995185;
				 stateIp1B0<=#1 120;
				 stateIp2B0<=#1 376;

				 //(121,377)
				 imgIp1B1 <= imagWorkingBuffer[121];
				 realIp1B1 <= realWorkingBuffer[121];
				 imgIp2B1 <= imagWorkingBuffer[377];
				 realIp2B1 <= realWorkingBuffer[377];
				 twiddleFactorRealB1 <=#1 0.085797;
				 twiddleFactorimgB1 <=#1 -0.996313;
				 stateIp1B1<=#1 121;
				 stateIp2B1<=#1 377;

				 //(122,378)
				 imgIp1B2 <= imagWorkingBuffer[122];
				 realIp1B2 <= realWorkingBuffer[122];
				 imgIp2B2 <= imagWorkingBuffer[378];
				 realIp2B2 <= realWorkingBuffer[378];
				 twiddleFactorRealB2 <=#1 0.073565;
				 twiddleFactorimgB2 <=#1 -0.99729;
				 stateIp1B2<=#1 122;
				 stateIp2B2<=#1 378;

				 //(123,379)
				 imgIp1B3 <= imagWorkingBuffer[123];
				 realIp1B3 <= realWorkingBuffer[123];
				 imgIp2B3 <= imagWorkingBuffer[379];
				 realIp2B3 <= realWorkingBuffer[379];
				 twiddleFactorRealB3 <=#1 0.061321;
				 twiddleFactorimgB3 <=#1 -0.998118;
				 stateIp1B3<=#1 123;
				 stateIp2B3<=#1 379;

				 //(124,380)
				 imgIp1B4 <= imagWorkingBuffer[124];
				 realIp1B4 <= realWorkingBuffer[124];
				 imgIp2B4 <= imagWorkingBuffer[380];
				 realIp2B4 <= realWorkingBuffer[380];
				 twiddleFactorRealB4 <=#1 0.049068;
				 twiddleFactorimgB4 <=#1 -0.998795;
				 stateIp1B4<=#1 124;
				 stateIp2B4<=#1 380;

				 //(125,381)
				 imgIp1B5 <= imagWorkingBuffer[125];
				 realIp1B5 <= realWorkingBuffer[125];
				 imgIp2B5 <= imagWorkingBuffer[381];
				 realIp2B5 <= realWorkingBuffer[381];
				 twiddleFactorRealB5 <=#1 0.036807;
				 twiddleFactorimgB5 <=#1 -0.999322;
				 stateIp1B5<=#1 125;
				 stateIp2B5<=#1 381;

				 //(126,382)
				 imgIp1B6 <= imagWorkingBuffer[126];
				 realIp1B6 <= realWorkingBuffer[126];
				 imgIp2B6 <= imagWorkingBuffer[382];
				 realIp2B6 <= realWorkingBuffer[382];
				 twiddleFactorRealB6 <=#1 0.024541;
				 twiddleFactorimgB6 <=#1 -0.999699;
				 stateIp1B6<=#1 126;
				 stateIp2B6<=#1 382;

				 //(127,383)
				 imgIp1B7 <= imagWorkingBuffer[127];
				 realIp1B7 <= realWorkingBuffer[127];
				 imgIp2B7 <= imagWorkingBuffer[383];
				 realIp2B7 <= realWorkingBuffer[383];
				 twiddleFactorRealB7 <=#1 0.012272;
				 twiddleFactorimgB7 <=#1 -0.999925;
				 stateIp1B7<=#1 127;
				 stateIp2B7<=#1 383;
			 end
			 273 : begin

				 //(128,384)
				 imgIp1B0 <= imagWorkingBuffer[128];
				 realIp1B0 <= realWorkingBuffer[128];
				 imgIp2B0 <= imagWorkingBuffer[384];
				 realIp2B0 <= realWorkingBuffer[384];
				 twiddleFactorRealB0 <=#1 0.0;
				 twiddleFactorimgB0 <=#1 -1.0;
				 stateIp1B0<=#1 128;
				 stateIp2B0<=#1 384;

				 //(129,385)
				 imgIp1B1 <= imagWorkingBuffer[129];
				 realIp1B1 <= realWorkingBuffer[129];
				 imgIp2B1 <= imagWorkingBuffer[385];
				 realIp2B1 <= realWorkingBuffer[385];
				 twiddleFactorRealB1 <=#1 -0.012272;
				 twiddleFactorimgB1 <=#1 -0.999925;
				 stateIp1B1<=#1 129;
				 stateIp2B1<=#1 385;

				 //(130,386)
				 imgIp1B2 <= imagWorkingBuffer[130];
				 realIp1B2 <= realWorkingBuffer[130];
				 imgIp2B2 <= imagWorkingBuffer[386];
				 realIp2B2 <= realWorkingBuffer[386];
				 twiddleFactorRealB2 <=#1 -0.024541;
				 twiddleFactorimgB2 <=#1 -0.999699;
				 stateIp1B2<=#1 130;
				 stateIp2B2<=#1 386;

				 //(131,387)
				 imgIp1B3 <= imagWorkingBuffer[131];
				 realIp1B3 <= realWorkingBuffer[131];
				 imgIp2B3 <= imagWorkingBuffer[387];
				 realIp2B3 <= realWorkingBuffer[387];
				 twiddleFactorRealB3 <=#1 -0.036807;
				 twiddleFactorimgB3 <=#1 -0.999322;
				 stateIp1B3<=#1 131;
				 stateIp2B3<=#1 387;

				 //(132,388)
				 imgIp1B4 <= imagWorkingBuffer[132];
				 realIp1B4 <= realWorkingBuffer[132];
				 imgIp2B4 <= imagWorkingBuffer[388];
				 realIp2B4 <= realWorkingBuffer[388];
				 twiddleFactorRealB4 <=#1 -0.049068;
				 twiddleFactorimgB4 <=#1 -0.998795;
				 stateIp1B4<=#1 132;
				 stateIp2B4<=#1 388;

				 //(133,389)
				 imgIp1B5 <= imagWorkingBuffer[133];
				 realIp1B5 <= realWorkingBuffer[133];
				 imgIp2B5 <= imagWorkingBuffer[389];
				 realIp2B5 <= realWorkingBuffer[389];
				 twiddleFactorRealB5 <=#1 -0.061321;
				 twiddleFactorimgB5 <=#1 -0.998118;
				 stateIp1B5<=#1 133;
				 stateIp2B5<=#1 389;

				 //(134,390)
				 imgIp1B6 <= imagWorkingBuffer[134];
				 realIp1B6 <= realWorkingBuffer[134];
				 imgIp2B6 <= imagWorkingBuffer[390];
				 realIp2B6 <= realWorkingBuffer[390];
				 twiddleFactorRealB6 <=#1 -0.073565;
				 twiddleFactorimgB6 <=#1 -0.99729;
				 stateIp1B6<=#1 134;
				 stateIp2B6<=#1 390;

				 //(135,391)
				 imgIp1B7 <= imagWorkingBuffer[135];
				 realIp1B7 <= realWorkingBuffer[135];
				 imgIp2B7 <= imagWorkingBuffer[391];
				 realIp2B7 <= realWorkingBuffer[391];
				 twiddleFactorRealB7 <=#1 -0.085797;
				 twiddleFactorimgB7 <=#1 -0.996313;
				 stateIp1B7<=#1 135;
				 stateIp2B7<=#1 391;
			 end
			 274 : begin

				 //(136,392)
				 imgIp1B0 <= imagWorkingBuffer[136];
				 realIp1B0 <= realWorkingBuffer[136];
				 imgIp2B0 <= imagWorkingBuffer[392];
				 realIp2B0 <= realWorkingBuffer[392];
				 twiddleFactorRealB0 <=#1 -0.098017;
				 twiddleFactorimgB0 <=#1 -0.995185;
				 stateIp1B0<=#1 136;
				 stateIp2B0<=#1 392;

				 //(137,393)
				 imgIp1B1 <= imagWorkingBuffer[137];
				 realIp1B1 <= realWorkingBuffer[137];
				 imgIp2B1 <= imagWorkingBuffer[393];
				 realIp2B1 <= realWorkingBuffer[393];
				 twiddleFactorRealB1 <=#1 -0.110222;
				 twiddleFactorimgB1 <=#1 -0.993907;
				 stateIp1B1<=#1 137;
				 stateIp2B1<=#1 393;

				 //(138,394)
				 imgIp1B2 <= imagWorkingBuffer[138];
				 realIp1B2 <= realWorkingBuffer[138];
				 imgIp2B2 <= imagWorkingBuffer[394];
				 realIp2B2 <= realWorkingBuffer[394];
				 twiddleFactorRealB2 <=#1 -0.122411;
				 twiddleFactorimgB2 <=#1 -0.99248;
				 stateIp1B2<=#1 138;
				 stateIp2B2<=#1 394;

				 //(139,395)
				 imgIp1B3 <= imagWorkingBuffer[139];
				 realIp1B3 <= realWorkingBuffer[139];
				 imgIp2B3 <= imagWorkingBuffer[395];
				 realIp2B3 <= realWorkingBuffer[395];
				 twiddleFactorRealB3 <=#1 -0.134581;
				 twiddleFactorimgB3 <=#1 -0.990903;
				 stateIp1B3<=#1 139;
				 stateIp2B3<=#1 395;

				 //(140,396)
				 imgIp1B4 <= imagWorkingBuffer[140];
				 realIp1B4 <= realWorkingBuffer[140];
				 imgIp2B4 <= imagWorkingBuffer[396];
				 realIp2B4 <= realWorkingBuffer[396];
				 twiddleFactorRealB4 <=#1 -0.14673;
				 twiddleFactorimgB4 <=#1 -0.989177;
				 stateIp1B4<=#1 140;
				 stateIp2B4<=#1 396;

				 //(141,397)
				 imgIp1B5 <= imagWorkingBuffer[141];
				 realIp1B5 <= realWorkingBuffer[141];
				 imgIp2B5 <= imagWorkingBuffer[397];
				 realIp2B5 <= realWorkingBuffer[397];
				 twiddleFactorRealB5 <=#1 -0.158858;
				 twiddleFactorimgB5 <=#1 -0.987301;
				 stateIp1B5<=#1 141;
				 stateIp2B5<=#1 397;

				 //(142,398)
				 imgIp1B6 <= imagWorkingBuffer[142];
				 realIp1B6 <= realWorkingBuffer[142];
				 imgIp2B6 <= imagWorkingBuffer[398];
				 realIp2B6 <= realWorkingBuffer[398];
				 twiddleFactorRealB6 <=#1 -0.170962;
				 twiddleFactorimgB6 <=#1 -0.985278;
				 stateIp1B6<=#1 142;
				 stateIp2B6<=#1 398;

				 //(143,399)
				 imgIp1B7 <= imagWorkingBuffer[143];
				 realIp1B7 <= realWorkingBuffer[143];
				 imgIp2B7 <= imagWorkingBuffer[399];
				 realIp2B7 <= realWorkingBuffer[399];
				 twiddleFactorRealB7 <=#1 -0.18304;
				 twiddleFactorimgB7 <=#1 -0.983105;
				 stateIp1B7<=#1 143;
				 stateIp2B7<=#1 399;
			 end
			 275 : begin

				 //(144,400)
				 imgIp1B0 <= imagWorkingBuffer[144];
				 realIp1B0 <= realWorkingBuffer[144];
				 imgIp2B0 <= imagWorkingBuffer[400];
				 realIp2B0 <= realWorkingBuffer[400];
				 twiddleFactorRealB0 <=#1 -0.19509;
				 twiddleFactorimgB0 <=#1 -0.980785;
				 stateIp1B0<=#1 144;
				 stateIp2B0<=#1 400;

				 //(145,401)
				 imgIp1B1 <= imagWorkingBuffer[145];
				 realIp1B1 <= realWorkingBuffer[145];
				 imgIp2B1 <= imagWorkingBuffer[401];
				 realIp2B1 <= realWorkingBuffer[401];
				 twiddleFactorRealB1 <=#1 -0.207111;
				 twiddleFactorimgB1 <=#1 -0.978317;
				 stateIp1B1<=#1 145;
				 stateIp2B1<=#1 401;

				 //(146,402)
				 imgIp1B2 <= imagWorkingBuffer[146];
				 realIp1B2 <= realWorkingBuffer[146];
				 imgIp2B2 <= imagWorkingBuffer[402];
				 realIp2B2 <= realWorkingBuffer[402];
				 twiddleFactorRealB2 <=#1 -0.219101;
				 twiddleFactorimgB2 <=#1 -0.975702;
				 stateIp1B2<=#1 146;
				 stateIp2B2<=#1 402;

				 //(147,403)
				 imgIp1B3 <= imagWorkingBuffer[147];
				 realIp1B3 <= realWorkingBuffer[147];
				 imgIp2B3 <= imagWorkingBuffer[403];
				 realIp2B3 <= realWorkingBuffer[403];
				 twiddleFactorRealB3 <=#1 -0.231058;
				 twiddleFactorimgB3 <=#1 -0.97294;
				 stateIp1B3<=#1 147;
				 stateIp2B3<=#1 403;

				 //(148,404)
				 imgIp1B4 <= imagWorkingBuffer[148];
				 realIp1B4 <= realWorkingBuffer[148];
				 imgIp2B4 <= imagWorkingBuffer[404];
				 realIp2B4 <= realWorkingBuffer[404];
				 twiddleFactorRealB4 <=#1 -0.24298;
				 twiddleFactorimgB4 <=#1 -0.970031;
				 stateIp1B4<=#1 148;
				 stateIp2B4<=#1 404;

				 //(149,405)
				 imgIp1B5 <= imagWorkingBuffer[149];
				 realIp1B5 <= realWorkingBuffer[149];
				 imgIp2B5 <= imagWorkingBuffer[405];
				 realIp2B5 <= realWorkingBuffer[405];
				 twiddleFactorRealB5 <=#1 -0.254866;
				 twiddleFactorimgB5 <=#1 -0.966976;
				 stateIp1B5<=#1 149;
				 stateIp2B5<=#1 405;

				 //(150,406)
				 imgIp1B6 <= imagWorkingBuffer[150];
				 realIp1B6 <= realWorkingBuffer[150];
				 imgIp2B6 <= imagWorkingBuffer[406];
				 realIp2B6 <= realWorkingBuffer[406];
				 twiddleFactorRealB6 <=#1 -0.266713;
				 twiddleFactorimgB6 <=#1 -0.963776;
				 stateIp1B6<=#1 150;
				 stateIp2B6<=#1 406;

				 //(151,407)
				 imgIp1B7 <= imagWorkingBuffer[151];
				 realIp1B7 <= realWorkingBuffer[151];
				 imgIp2B7 <= imagWorkingBuffer[407];
				 realIp2B7 <= realWorkingBuffer[407];
				 twiddleFactorRealB7 <=#1 -0.27852;
				 twiddleFactorimgB7 <=#1 -0.960431;
				 stateIp1B7<=#1 151;
				 stateIp2B7<=#1 407;
			 end
			 276 : begin

				 //(152,408)
				 imgIp1B0 <= imagWorkingBuffer[152];
				 realIp1B0 <= realWorkingBuffer[152];
				 imgIp2B0 <= imagWorkingBuffer[408];
				 realIp2B0 <= realWorkingBuffer[408];
				 twiddleFactorRealB0 <=#1 -0.290285;
				 twiddleFactorimgB0 <=#1 -0.95694;
				 stateIp1B0<=#1 152;
				 stateIp2B0<=#1 408;

				 //(153,409)
				 imgIp1B1 <= imagWorkingBuffer[153];
				 realIp1B1 <= realWorkingBuffer[153];
				 imgIp2B1 <= imagWorkingBuffer[409];
				 realIp2B1 <= realWorkingBuffer[409];
				 twiddleFactorRealB1 <=#1 -0.302006;
				 twiddleFactorimgB1 <=#1 -0.953306;
				 stateIp1B1<=#1 153;
				 stateIp2B1<=#1 409;

				 //(154,410)
				 imgIp1B2 <= imagWorkingBuffer[154];
				 realIp1B2 <= realWorkingBuffer[154];
				 imgIp2B2 <= imagWorkingBuffer[410];
				 realIp2B2 <= realWorkingBuffer[410];
				 twiddleFactorRealB2 <=#1 -0.313682;
				 twiddleFactorimgB2 <=#1 -0.949528;
				 stateIp1B2<=#1 154;
				 stateIp2B2<=#1 410;

				 //(155,411)
				 imgIp1B3 <= imagWorkingBuffer[155];
				 realIp1B3 <= realWorkingBuffer[155];
				 imgIp2B3 <= imagWorkingBuffer[411];
				 realIp2B3 <= realWorkingBuffer[411];
				 twiddleFactorRealB3 <=#1 -0.32531;
				 twiddleFactorimgB3 <=#1 -0.945607;
				 stateIp1B3<=#1 155;
				 stateIp2B3<=#1 411;

				 //(156,412)
				 imgIp1B4 <= imagWorkingBuffer[156];
				 realIp1B4 <= realWorkingBuffer[156];
				 imgIp2B4 <= imagWorkingBuffer[412];
				 realIp2B4 <= realWorkingBuffer[412];
				 twiddleFactorRealB4 <=#1 -0.33689;
				 twiddleFactorimgB4 <=#1 -0.941544;
				 stateIp1B4<=#1 156;
				 stateIp2B4<=#1 412;

				 //(157,413)
				 imgIp1B5 <= imagWorkingBuffer[157];
				 realIp1B5 <= realWorkingBuffer[157];
				 imgIp2B5 <= imagWorkingBuffer[413];
				 realIp2B5 <= realWorkingBuffer[413];
				 twiddleFactorRealB5 <=#1 -0.348419;
				 twiddleFactorimgB5 <=#1 -0.937339;
				 stateIp1B5<=#1 157;
				 stateIp2B5<=#1 413;

				 //(158,414)
				 imgIp1B6 <= imagWorkingBuffer[158];
				 realIp1B6 <= realWorkingBuffer[158];
				 imgIp2B6 <= imagWorkingBuffer[414];
				 realIp2B6 <= realWorkingBuffer[414];
				 twiddleFactorRealB6 <=#1 -0.359895;
				 twiddleFactorimgB6 <=#1 -0.932993;
				 stateIp1B6<=#1 158;
				 stateIp2B6<=#1 414;

				 //(159,415)
				 imgIp1B7 <= imagWorkingBuffer[159];
				 realIp1B7 <= realWorkingBuffer[159];
				 imgIp2B7 <= imagWorkingBuffer[415];
				 realIp2B7 <= realWorkingBuffer[415];
				 twiddleFactorRealB7 <=#1 -0.371317;
				 twiddleFactorimgB7 <=#1 -0.928506;
				 stateIp1B7<=#1 159;
				 stateIp2B7<=#1 415;
			 end
			 277 : begin

				 //(160,416)
				 imgIp1B0 <= imagWorkingBuffer[160];
				 realIp1B0 <= realWorkingBuffer[160];
				 imgIp2B0 <= imagWorkingBuffer[416];
				 realIp2B0 <= realWorkingBuffer[416];
				 twiddleFactorRealB0 <=#1 -0.382683;
				 twiddleFactorimgB0 <=#1 -0.92388;
				 stateIp1B0<=#1 160;
				 stateIp2B0<=#1 416;

				 //(161,417)
				 imgIp1B1 <= imagWorkingBuffer[161];
				 realIp1B1 <= realWorkingBuffer[161];
				 imgIp2B1 <= imagWorkingBuffer[417];
				 realIp2B1 <= realWorkingBuffer[417];
				 twiddleFactorRealB1 <=#1 -0.393992;
				 twiddleFactorimgB1 <=#1 -0.919114;
				 stateIp1B1<=#1 161;
				 stateIp2B1<=#1 417;

				 //(162,418)
				 imgIp1B2 <= imagWorkingBuffer[162];
				 realIp1B2 <= realWorkingBuffer[162];
				 imgIp2B2 <= imagWorkingBuffer[418];
				 realIp2B2 <= realWorkingBuffer[418];
				 twiddleFactorRealB2 <=#1 -0.405241;
				 twiddleFactorimgB2 <=#1 -0.91421;
				 stateIp1B2<=#1 162;
				 stateIp2B2<=#1 418;

				 //(163,419)
				 imgIp1B3 <= imagWorkingBuffer[163];
				 realIp1B3 <= realWorkingBuffer[163];
				 imgIp2B3 <= imagWorkingBuffer[419];
				 realIp2B3 <= realWorkingBuffer[419];
				 twiddleFactorRealB3 <=#1 -0.41643;
				 twiddleFactorimgB3 <=#1 -0.909168;
				 stateIp1B3<=#1 163;
				 stateIp2B3<=#1 419;

				 //(164,420)
				 imgIp1B4 <= imagWorkingBuffer[164];
				 realIp1B4 <= realWorkingBuffer[164];
				 imgIp2B4 <= imagWorkingBuffer[420];
				 realIp2B4 <= realWorkingBuffer[420];
				 twiddleFactorRealB4 <=#1 -0.427555;
				 twiddleFactorimgB4 <=#1 -0.903989;
				 stateIp1B4<=#1 164;
				 stateIp2B4<=#1 420;

				 //(165,421)
				 imgIp1B5 <= imagWorkingBuffer[165];
				 realIp1B5 <= realWorkingBuffer[165];
				 imgIp2B5 <= imagWorkingBuffer[421];
				 realIp2B5 <= realWorkingBuffer[421];
				 twiddleFactorRealB5 <=#1 -0.438616;
				 twiddleFactorimgB5 <=#1 -0.898674;
				 stateIp1B5<=#1 165;
				 stateIp2B5<=#1 421;

				 //(166,422)
				 imgIp1B6 <= imagWorkingBuffer[166];
				 realIp1B6 <= realWorkingBuffer[166];
				 imgIp2B6 <= imagWorkingBuffer[422];
				 realIp2B6 <= realWorkingBuffer[422];
				 twiddleFactorRealB6 <=#1 -0.449611;
				 twiddleFactorimgB6 <=#1 -0.893224;
				 stateIp1B6<=#1 166;
				 stateIp2B6<=#1 422;

				 //(167,423)
				 imgIp1B7 <= imagWorkingBuffer[167];
				 realIp1B7 <= realWorkingBuffer[167];
				 imgIp2B7 <= imagWorkingBuffer[423];
				 realIp2B7 <= realWorkingBuffer[423];
				 twiddleFactorRealB7 <=#1 -0.460539;
				 twiddleFactorimgB7 <=#1 -0.88764;
				 stateIp1B7<=#1 167;
				 stateIp2B7<=#1 423;
			 end
			 278 : begin

				 //(168,424)
				 imgIp1B0 <= imagWorkingBuffer[168];
				 realIp1B0 <= realWorkingBuffer[168];
				 imgIp2B0 <= imagWorkingBuffer[424];
				 realIp2B0 <= realWorkingBuffer[424];
				 twiddleFactorRealB0 <=#1 -0.471397;
				 twiddleFactorimgB0 <=#1 -0.881921;
				 stateIp1B0<=#1 168;
				 stateIp2B0<=#1 424;

				 //(169,425)
				 imgIp1B1 <= imagWorkingBuffer[169];
				 realIp1B1 <= realWorkingBuffer[169];
				 imgIp2B1 <= imagWorkingBuffer[425];
				 realIp2B1 <= realWorkingBuffer[425];
				 twiddleFactorRealB1 <=#1 -0.482184;
				 twiddleFactorimgB1 <=#1 -0.87607;
				 stateIp1B1<=#1 169;
				 stateIp2B1<=#1 425;

				 //(170,426)
				 imgIp1B2 <= imagWorkingBuffer[170];
				 realIp1B2 <= realWorkingBuffer[170];
				 imgIp2B2 <= imagWorkingBuffer[426];
				 realIp2B2 <= realWorkingBuffer[426];
				 twiddleFactorRealB2 <=#1 -0.492898;
				 twiddleFactorimgB2 <=#1 -0.870087;
				 stateIp1B2<=#1 170;
				 stateIp2B2<=#1 426;

				 //(171,427)
				 imgIp1B3 <= imagWorkingBuffer[171];
				 realIp1B3 <= realWorkingBuffer[171];
				 imgIp2B3 <= imagWorkingBuffer[427];
				 realIp2B3 <= realWorkingBuffer[427];
				 twiddleFactorRealB3 <=#1 -0.503538;
				 twiddleFactorimgB3 <=#1 -0.863973;
				 stateIp1B3<=#1 171;
				 stateIp2B3<=#1 427;

				 //(172,428)
				 imgIp1B4 <= imagWorkingBuffer[172];
				 realIp1B4 <= realWorkingBuffer[172];
				 imgIp2B4 <= imagWorkingBuffer[428];
				 realIp2B4 <= realWorkingBuffer[428];
				 twiddleFactorRealB4 <=#1 -0.514103;
				 twiddleFactorimgB4 <=#1 -0.857729;
				 stateIp1B4<=#1 172;
				 stateIp2B4<=#1 428;

				 //(173,429)
				 imgIp1B5 <= imagWorkingBuffer[173];
				 realIp1B5 <= realWorkingBuffer[173];
				 imgIp2B5 <= imagWorkingBuffer[429];
				 realIp2B5 <= realWorkingBuffer[429];
				 twiddleFactorRealB5 <=#1 -0.52459;
				 twiddleFactorimgB5 <=#1 -0.851355;
				 stateIp1B5<=#1 173;
				 stateIp2B5<=#1 429;

				 //(174,430)
				 imgIp1B6 <= imagWorkingBuffer[174];
				 realIp1B6 <= realWorkingBuffer[174];
				 imgIp2B6 <= imagWorkingBuffer[430];
				 realIp2B6 <= realWorkingBuffer[430];
				 twiddleFactorRealB6 <=#1 -0.534998;
				 twiddleFactorimgB6 <=#1 -0.844854;
				 stateIp1B6<=#1 174;
				 stateIp2B6<=#1 430;

				 //(175,431)
				 imgIp1B7 <= imagWorkingBuffer[175];
				 realIp1B7 <= realWorkingBuffer[175];
				 imgIp2B7 <= imagWorkingBuffer[431];
				 realIp2B7 <= realWorkingBuffer[431];
				 twiddleFactorRealB7 <=#1 -0.545325;
				 twiddleFactorimgB7 <=#1 -0.838225;
				 stateIp1B7<=#1 175;
				 stateIp2B7<=#1 431;
			 end
			 279 : begin

				 //(176,432)
				 imgIp1B0 <= imagWorkingBuffer[176];
				 realIp1B0 <= realWorkingBuffer[176];
				 imgIp2B0 <= imagWorkingBuffer[432];
				 realIp2B0 <= realWorkingBuffer[432];
				 twiddleFactorRealB0 <=#1 -0.55557;
				 twiddleFactorimgB0 <=#1 -0.83147;
				 stateIp1B0<=#1 176;
				 stateIp2B0<=#1 432;

				 //(177,433)
				 imgIp1B1 <= imagWorkingBuffer[177];
				 realIp1B1 <= realWorkingBuffer[177];
				 imgIp2B1 <= imagWorkingBuffer[433];
				 realIp2B1 <= realWorkingBuffer[433];
				 twiddleFactorRealB1 <=#1 -0.565732;
				 twiddleFactorimgB1 <=#1 -0.824589;
				 stateIp1B1<=#1 177;
				 stateIp2B1<=#1 433;

				 //(178,434)
				 imgIp1B2 <= imagWorkingBuffer[178];
				 realIp1B2 <= realWorkingBuffer[178];
				 imgIp2B2 <= imagWorkingBuffer[434];
				 realIp2B2 <= realWorkingBuffer[434];
				 twiddleFactorRealB2 <=#1 -0.575808;
				 twiddleFactorimgB2 <=#1 -0.817585;
				 stateIp1B2<=#1 178;
				 stateIp2B2<=#1 434;

				 //(179,435)
				 imgIp1B3 <= imagWorkingBuffer[179];
				 realIp1B3 <= realWorkingBuffer[179];
				 imgIp2B3 <= imagWorkingBuffer[435];
				 realIp2B3 <= realWorkingBuffer[435];
				 twiddleFactorRealB3 <=#1 -0.585798;
				 twiddleFactorimgB3 <=#1 -0.810457;
				 stateIp1B3<=#1 179;
				 stateIp2B3<=#1 435;

				 //(180,436)
				 imgIp1B4 <= imagWorkingBuffer[180];
				 realIp1B4 <= realWorkingBuffer[180];
				 imgIp2B4 <= imagWorkingBuffer[436];
				 realIp2B4 <= realWorkingBuffer[436];
				 twiddleFactorRealB4 <=#1 -0.595699;
				 twiddleFactorimgB4 <=#1 -0.803208;
				 stateIp1B4<=#1 180;
				 stateIp2B4<=#1 436;

				 //(181,437)
				 imgIp1B5 <= imagWorkingBuffer[181];
				 realIp1B5 <= realWorkingBuffer[181];
				 imgIp2B5 <= imagWorkingBuffer[437];
				 realIp2B5 <= realWorkingBuffer[437];
				 twiddleFactorRealB5 <=#1 -0.605511;
				 twiddleFactorimgB5 <=#1 -0.795837;
				 stateIp1B5<=#1 181;
				 stateIp2B5<=#1 437;

				 //(182,438)
				 imgIp1B6 <= imagWorkingBuffer[182];
				 realIp1B6 <= realWorkingBuffer[182];
				 imgIp2B6 <= imagWorkingBuffer[438];
				 realIp2B6 <= realWorkingBuffer[438];
				 twiddleFactorRealB6 <=#1 -0.615232;
				 twiddleFactorimgB6 <=#1 -0.788346;
				 stateIp1B6<=#1 182;
				 stateIp2B6<=#1 438;

				 //(183,439)
				 imgIp1B7 <= imagWorkingBuffer[183];
				 realIp1B7 <= realWorkingBuffer[183];
				 imgIp2B7 <= imagWorkingBuffer[439];
				 realIp2B7 <= realWorkingBuffer[439];
				 twiddleFactorRealB7 <=#1 -0.624859;
				 twiddleFactorimgB7 <=#1 -0.780737;
				 stateIp1B7<=#1 183;
				 stateIp2B7<=#1 439;
			 end
			 280 : begin

				 //(184,440)
				 imgIp1B0 <= imagWorkingBuffer[184];
				 realIp1B0 <= realWorkingBuffer[184];
				 imgIp2B0 <= imagWorkingBuffer[440];
				 realIp2B0 <= realWorkingBuffer[440];
				 twiddleFactorRealB0 <=#1 -0.634393;
				 twiddleFactorimgB0 <=#1 -0.77301;
				 stateIp1B0<=#1 184;
				 stateIp2B0<=#1 440;

				 //(185,441)
				 imgIp1B1 <= imagWorkingBuffer[185];
				 realIp1B1 <= realWorkingBuffer[185];
				 imgIp2B1 <= imagWorkingBuffer[441];
				 realIp2B1 <= realWorkingBuffer[441];
				 twiddleFactorRealB1 <=#1 -0.643832;
				 twiddleFactorimgB1 <=#1 -0.765167;
				 stateIp1B1<=#1 185;
				 stateIp2B1<=#1 441;

				 //(186,442)
				 imgIp1B2 <= imagWorkingBuffer[186];
				 realIp1B2 <= realWorkingBuffer[186];
				 imgIp2B2 <= imagWorkingBuffer[442];
				 realIp2B2 <= realWorkingBuffer[442];
				 twiddleFactorRealB2 <=#1 -0.653173;
				 twiddleFactorimgB2 <=#1 -0.757209;
				 stateIp1B2<=#1 186;
				 stateIp2B2<=#1 442;

				 //(187,443)
				 imgIp1B3 <= imagWorkingBuffer[187];
				 realIp1B3 <= realWorkingBuffer[187];
				 imgIp2B3 <= imagWorkingBuffer[443];
				 realIp2B3 <= realWorkingBuffer[443];
				 twiddleFactorRealB3 <=#1 -0.662416;
				 twiddleFactorimgB3 <=#1 -0.749136;
				 stateIp1B3<=#1 187;
				 stateIp2B3<=#1 443;

				 //(188,444)
				 imgIp1B4 <= imagWorkingBuffer[188];
				 realIp1B4 <= realWorkingBuffer[188];
				 imgIp2B4 <= imagWorkingBuffer[444];
				 realIp2B4 <= realWorkingBuffer[444];
				 twiddleFactorRealB4 <=#1 -0.671559;
				 twiddleFactorimgB4 <=#1 -0.740951;
				 stateIp1B4<=#1 188;
				 stateIp2B4<=#1 444;

				 //(189,445)
				 imgIp1B5 <= imagWorkingBuffer[189];
				 realIp1B5 <= realWorkingBuffer[189];
				 imgIp2B5 <= imagWorkingBuffer[445];
				 realIp2B5 <= realWorkingBuffer[445];
				 twiddleFactorRealB5 <=#1 -0.680601;
				 twiddleFactorimgB5 <=#1 -0.732654;
				 stateIp1B5<=#1 189;
				 stateIp2B5<=#1 445;

				 //(190,446)
				 imgIp1B6 <= imagWorkingBuffer[190];
				 realIp1B6 <= realWorkingBuffer[190];
				 imgIp2B6 <= imagWorkingBuffer[446];
				 realIp2B6 <= realWorkingBuffer[446];
				 twiddleFactorRealB6 <=#1 -0.689541;
				 twiddleFactorimgB6 <=#1 -0.724247;
				 stateIp1B6<=#1 190;
				 stateIp2B6<=#1 446;

				 //(191,447)
				 imgIp1B7 <= imagWorkingBuffer[191];
				 realIp1B7 <= realWorkingBuffer[191];
				 imgIp2B7 <= imagWorkingBuffer[447];
				 realIp2B7 <= realWorkingBuffer[447];
				 twiddleFactorRealB7 <=#1 -0.698376;
				 twiddleFactorimgB7 <=#1 -0.715731;
				 stateIp1B7<=#1 191;
				 stateIp2B7<=#1 447;
			 end
			 281 : begin

				 //(192,448)
				 imgIp1B0 <= imagWorkingBuffer[192];
				 realIp1B0 <= realWorkingBuffer[192];
				 imgIp2B0 <= imagWorkingBuffer[448];
				 realIp2B0 <= realWorkingBuffer[448];
				 twiddleFactorRealB0 <=#1 -0.707107;
				 twiddleFactorimgB0 <=#1 -0.707107;
				 stateIp1B0<=#1 192;
				 stateIp2B0<=#1 448;

				 //(193,449)
				 imgIp1B1 <= imagWorkingBuffer[193];
				 realIp1B1 <= realWorkingBuffer[193];
				 imgIp2B1 <= imagWorkingBuffer[449];
				 realIp2B1 <= realWorkingBuffer[449];
				 twiddleFactorRealB1 <=#1 -0.715731;
				 twiddleFactorimgB1 <=#1 -0.698376;
				 stateIp1B1<=#1 193;
				 stateIp2B1<=#1 449;

				 //(194,450)
				 imgIp1B2 <= imagWorkingBuffer[194];
				 realIp1B2 <= realWorkingBuffer[194];
				 imgIp2B2 <= imagWorkingBuffer[450];
				 realIp2B2 <= realWorkingBuffer[450];
				 twiddleFactorRealB2 <=#1 -0.724247;
				 twiddleFactorimgB2 <=#1 -0.689541;
				 stateIp1B2<=#1 194;
				 stateIp2B2<=#1 450;

				 //(195,451)
				 imgIp1B3 <= imagWorkingBuffer[195];
				 realIp1B3 <= realWorkingBuffer[195];
				 imgIp2B3 <= imagWorkingBuffer[451];
				 realIp2B3 <= realWorkingBuffer[451];
				 twiddleFactorRealB3 <=#1 -0.732654;
				 twiddleFactorimgB3 <=#1 -0.680601;
				 stateIp1B3<=#1 195;
				 stateIp2B3<=#1 451;

				 //(196,452)
				 imgIp1B4 <= imagWorkingBuffer[196];
				 realIp1B4 <= realWorkingBuffer[196];
				 imgIp2B4 <= imagWorkingBuffer[452];
				 realIp2B4 <= realWorkingBuffer[452];
				 twiddleFactorRealB4 <=#1 -0.740951;
				 twiddleFactorimgB4 <=#1 -0.671559;
				 stateIp1B4<=#1 196;
				 stateIp2B4<=#1 452;

				 //(197,453)
				 imgIp1B5 <= imagWorkingBuffer[197];
				 realIp1B5 <= realWorkingBuffer[197];
				 imgIp2B5 <= imagWorkingBuffer[453];
				 realIp2B5 <= realWorkingBuffer[453];
				 twiddleFactorRealB5 <=#1 -0.749136;
				 twiddleFactorimgB5 <=#1 -0.662416;
				 stateIp1B5<=#1 197;
				 stateIp2B5<=#1 453;

				 //(198,454)
				 imgIp1B6 <= imagWorkingBuffer[198];
				 realIp1B6 <= realWorkingBuffer[198];
				 imgIp2B6 <= imagWorkingBuffer[454];
				 realIp2B6 <= realWorkingBuffer[454];
				 twiddleFactorRealB6 <=#1 -0.757209;
				 twiddleFactorimgB6 <=#1 -0.653173;
				 stateIp1B6<=#1 198;
				 stateIp2B6<=#1 454;

				 //(199,455)
				 imgIp1B7 <= imagWorkingBuffer[199];
				 realIp1B7 <= realWorkingBuffer[199];
				 imgIp2B7 <= imagWorkingBuffer[455];
				 realIp2B7 <= realWorkingBuffer[455];
				 twiddleFactorRealB7 <=#1 -0.765167;
				 twiddleFactorimgB7 <=#1 -0.643832;
				 stateIp1B7<=#1 199;
				 stateIp2B7<=#1 455;
			 end
			 282 : begin

				 //(200,456)
				 imgIp1B0 <= imagWorkingBuffer[200];
				 realIp1B0 <= realWorkingBuffer[200];
				 imgIp2B0 <= imagWorkingBuffer[456];
				 realIp2B0 <= realWorkingBuffer[456];
				 twiddleFactorRealB0 <=#1 -0.77301;
				 twiddleFactorimgB0 <=#1 -0.634393;
				 stateIp1B0<=#1 200;
				 stateIp2B0<=#1 456;

				 //(201,457)
				 imgIp1B1 <= imagWorkingBuffer[201];
				 realIp1B1 <= realWorkingBuffer[201];
				 imgIp2B1 <= imagWorkingBuffer[457];
				 realIp2B1 <= realWorkingBuffer[457];
				 twiddleFactorRealB1 <=#1 -0.780737;
				 twiddleFactorimgB1 <=#1 -0.624859;
				 stateIp1B1<=#1 201;
				 stateIp2B1<=#1 457;

				 //(202,458)
				 imgIp1B2 <= imagWorkingBuffer[202];
				 realIp1B2 <= realWorkingBuffer[202];
				 imgIp2B2 <= imagWorkingBuffer[458];
				 realIp2B2 <= realWorkingBuffer[458];
				 twiddleFactorRealB2 <=#1 -0.788346;
				 twiddleFactorimgB2 <=#1 -0.615232;
				 stateIp1B2<=#1 202;
				 stateIp2B2<=#1 458;

				 //(203,459)
				 imgIp1B3 <= imagWorkingBuffer[203];
				 realIp1B3 <= realWorkingBuffer[203];
				 imgIp2B3 <= imagWorkingBuffer[459];
				 realIp2B3 <= realWorkingBuffer[459];
				 twiddleFactorRealB3 <=#1 -0.795837;
				 twiddleFactorimgB3 <=#1 -0.605511;
				 stateIp1B3<=#1 203;
				 stateIp2B3<=#1 459;

				 //(204,460)
				 imgIp1B4 <= imagWorkingBuffer[204];
				 realIp1B4 <= realWorkingBuffer[204];
				 imgIp2B4 <= imagWorkingBuffer[460];
				 realIp2B4 <= realWorkingBuffer[460];
				 twiddleFactorRealB4 <=#1 -0.803208;
				 twiddleFactorimgB4 <=#1 -0.595699;
				 stateIp1B4<=#1 204;
				 stateIp2B4<=#1 460;

				 //(205,461)
				 imgIp1B5 <= imagWorkingBuffer[205];
				 realIp1B5 <= realWorkingBuffer[205];
				 imgIp2B5 <= imagWorkingBuffer[461];
				 realIp2B5 <= realWorkingBuffer[461];
				 twiddleFactorRealB5 <=#1 -0.810457;
				 twiddleFactorimgB5 <=#1 -0.585798;
				 stateIp1B5<=#1 205;
				 stateIp2B5<=#1 461;

				 //(206,462)
				 imgIp1B6 <= imagWorkingBuffer[206];
				 realIp1B6 <= realWorkingBuffer[206];
				 imgIp2B6 <= imagWorkingBuffer[462];
				 realIp2B6 <= realWorkingBuffer[462];
				 twiddleFactorRealB6 <=#1 -0.817585;
				 twiddleFactorimgB6 <=#1 -0.575808;
				 stateIp1B6<=#1 206;
				 stateIp2B6<=#1 462;

				 //(207,463)
				 imgIp1B7 <= imagWorkingBuffer[207];
				 realIp1B7 <= realWorkingBuffer[207];
				 imgIp2B7 <= imagWorkingBuffer[463];
				 realIp2B7 <= realWorkingBuffer[463];
				 twiddleFactorRealB7 <=#1 -0.824589;
				 twiddleFactorimgB7 <=#1 -0.565732;
				 stateIp1B7<=#1 207;
				 stateIp2B7<=#1 463;
			 end
			 283 : begin

				 //(208,464)
				 imgIp1B0 <= imagWorkingBuffer[208];
				 realIp1B0 <= realWorkingBuffer[208];
				 imgIp2B0 <= imagWorkingBuffer[464];
				 realIp2B0 <= realWorkingBuffer[464];
				 twiddleFactorRealB0 <=#1 -0.83147;
				 twiddleFactorimgB0 <=#1 -0.55557;
				 stateIp1B0<=#1 208;
				 stateIp2B0<=#1 464;

				 //(209,465)
				 imgIp1B1 <= imagWorkingBuffer[209];
				 realIp1B1 <= realWorkingBuffer[209];
				 imgIp2B1 <= imagWorkingBuffer[465];
				 realIp2B1 <= realWorkingBuffer[465];
				 twiddleFactorRealB1 <=#1 -0.838225;
				 twiddleFactorimgB1 <=#1 -0.545325;
				 stateIp1B1<=#1 209;
				 stateIp2B1<=#1 465;

				 //(210,466)
				 imgIp1B2 <= imagWorkingBuffer[210];
				 realIp1B2 <= realWorkingBuffer[210];
				 imgIp2B2 <= imagWorkingBuffer[466];
				 realIp2B2 <= realWorkingBuffer[466];
				 twiddleFactorRealB2 <=#1 -0.844854;
				 twiddleFactorimgB2 <=#1 -0.534998;
				 stateIp1B2<=#1 210;
				 stateIp2B2<=#1 466;

				 //(211,467)
				 imgIp1B3 <= imagWorkingBuffer[211];
				 realIp1B3 <= realWorkingBuffer[211];
				 imgIp2B3 <= imagWorkingBuffer[467];
				 realIp2B3 <= realWorkingBuffer[467];
				 twiddleFactorRealB3 <=#1 -0.851355;
				 twiddleFactorimgB3 <=#1 -0.52459;
				 stateIp1B3<=#1 211;
				 stateIp2B3<=#1 467;

				 //(212,468)
				 imgIp1B4 <= imagWorkingBuffer[212];
				 realIp1B4 <= realWorkingBuffer[212];
				 imgIp2B4 <= imagWorkingBuffer[468];
				 realIp2B4 <= realWorkingBuffer[468];
				 twiddleFactorRealB4 <=#1 -0.857729;
				 twiddleFactorimgB4 <=#1 -0.514103;
				 stateIp1B4<=#1 212;
				 stateIp2B4<=#1 468;

				 //(213,469)
				 imgIp1B5 <= imagWorkingBuffer[213];
				 realIp1B5 <= realWorkingBuffer[213];
				 imgIp2B5 <= imagWorkingBuffer[469];
				 realIp2B5 <= realWorkingBuffer[469];
				 twiddleFactorRealB5 <=#1 -0.863973;
				 twiddleFactorimgB5 <=#1 -0.503538;
				 stateIp1B5<=#1 213;
				 stateIp2B5<=#1 469;

				 //(214,470)
				 imgIp1B6 <= imagWorkingBuffer[214];
				 realIp1B6 <= realWorkingBuffer[214];
				 imgIp2B6 <= imagWorkingBuffer[470];
				 realIp2B6 <= realWorkingBuffer[470];
				 twiddleFactorRealB6 <=#1 -0.870087;
				 twiddleFactorimgB6 <=#1 -0.492898;
				 stateIp1B6<=#1 214;
				 stateIp2B6<=#1 470;

				 //(215,471)
				 imgIp1B7 <= imagWorkingBuffer[215];
				 realIp1B7 <= realWorkingBuffer[215];
				 imgIp2B7 <= imagWorkingBuffer[471];
				 realIp2B7 <= realWorkingBuffer[471];
				 twiddleFactorRealB7 <=#1 -0.87607;
				 twiddleFactorimgB7 <=#1 -0.482184;
				 stateIp1B7<=#1 215;
				 stateIp2B7<=#1 471;
			 end
			 284 : begin

				 //(216,472)
				 imgIp1B0 <= imagWorkingBuffer[216];
				 realIp1B0 <= realWorkingBuffer[216];
				 imgIp2B0 <= imagWorkingBuffer[472];
				 realIp2B0 <= realWorkingBuffer[472];
				 twiddleFactorRealB0 <=#1 -0.881921;
				 twiddleFactorimgB0 <=#1 -0.471397;
				 stateIp1B0<=#1 216;
				 stateIp2B0<=#1 472;

				 //(217,473)
				 imgIp1B1 <= imagWorkingBuffer[217];
				 realIp1B1 <= realWorkingBuffer[217];
				 imgIp2B1 <= imagWorkingBuffer[473];
				 realIp2B1 <= realWorkingBuffer[473];
				 twiddleFactorRealB1 <=#1 -0.88764;
				 twiddleFactorimgB1 <=#1 -0.460539;
				 stateIp1B1<=#1 217;
				 stateIp2B1<=#1 473;

				 //(218,474)
				 imgIp1B2 <= imagWorkingBuffer[218];
				 realIp1B2 <= realWorkingBuffer[218];
				 imgIp2B2 <= imagWorkingBuffer[474];
				 realIp2B2 <= realWorkingBuffer[474];
				 twiddleFactorRealB2 <=#1 -0.893224;
				 twiddleFactorimgB2 <=#1 -0.449611;
				 stateIp1B2<=#1 218;
				 stateIp2B2<=#1 474;

				 //(219,475)
				 imgIp1B3 <= imagWorkingBuffer[219];
				 realIp1B3 <= realWorkingBuffer[219];
				 imgIp2B3 <= imagWorkingBuffer[475];
				 realIp2B3 <= realWorkingBuffer[475];
				 twiddleFactorRealB3 <=#1 -0.898674;
				 twiddleFactorimgB3 <=#1 -0.438616;
				 stateIp1B3<=#1 219;
				 stateIp2B3<=#1 475;

				 //(220,476)
				 imgIp1B4 <= imagWorkingBuffer[220];
				 realIp1B4 <= realWorkingBuffer[220];
				 imgIp2B4 <= imagWorkingBuffer[476];
				 realIp2B4 <= realWorkingBuffer[476];
				 twiddleFactorRealB4 <=#1 -0.903989;
				 twiddleFactorimgB4 <=#1 -0.427555;
				 stateIp1B4<=#1 220;
				 stateIp2B4<=#1 476;

				 //(221,477)
				 imgIp1B5 <= imagWorkingBuffer[221];
				 realIp1B5 <= realWorkingBuffer[221];
				 imgIp2B5 <= imagWorkingBuffer[477];
				 realIp2B5 <= realWorkingBuffer[477];
				 twiddleFactorRealB5 <=#1 -0.909168;
				 twiddleFactorimgB5 <=#1 -0.41643;
				 stateIp1B5<=#1 221;
				 stateIp2B5<=#1 477;

				 //(222,478)
				 imgIp1B6 <= imagWorkingBuffer[222];
				 realIp1B6 <= realWorkingBuffer[222];
				 imgIp2B6 <= imagWorkingBuffer[478];
				 realIp2B6 <= realWorkingBuffer[478];
				 twiddleFactorRealB6 <=#1 -0.91421;
				 twiddleFactorimgB6 <=#1 -0.405241;
				 stateIp1B6<=#1 222;
				 stateIp2B6<=#1 478;

				 //(223,479)
				 imgIp1B7 <= imagWorkingBuffer[223];
				 realIp1B7 <= realWorkingBuffer[223];
				 imgIp2B7 <= imagWorkingBuffer[479];
				 realIp2B7 <= realWorkingBuffer[479];
				 twiddleFactorRealB7 <=#1 -0.919114;
				 twiddleFactorimgB7 <=#1 -0.393992;
				 stateIp1B7<=#1 223;
				 stateIp2B7<=#1 479;
			 end
			 285 : begin

				 //(224,480)
				 imgIp1B0 <= imagWorkingBuffer[224];
				 realIp1B0 <= realWorkingBuffer[224];
				 imgIp2B0 <= imagWorkingBuffer[480];
				 realIp2B0 <= realWorkingBuffer[480];
				 twiddleFactorRealB0 <=#1 -0.92388;
				 twiddleFactorimgB0 <=#1 -0.382683;
				 stateIp1B0<=#1 224;
				 stateIp2B0<=#1 480;

				 //(225,481)
				 imgIp1B1 <= imagWorkingBuffer[225];
				 realIp1B1 <= realWorkingBuffer[225];
				 imgIp2B1 <= imagWorkingBuffer[481];
				 realIp2B1 <= realWorkingBuffer[481];
				 twiddleFactorRealB1 <=#1 -0.928506;
				 twiddleFactorimgB1 <=#1 -0.371317;
				 stateIp1B1<=#1 225;
				 stateIp2B1<=#1 481;

				 //(226,482)
				 imgIp1B2 <= imagWorkingBuffer[226];
				 realIp1B2 <= realWorkingBuffer[226];
				 imgIp2B2 <= imagWorkingBuffer[482];
				 realIp2B2 <= realWorkingBuffer[482];
				 twiddleFactorRealB2 <=#1 -0.932993;
				 twiddleFactorimgB2 <=#1 -0.359895;
				 stateIp1B2<=#1 226;
				 stateIp2B2<=#1 482;

				 //(227,483)
				 imgIp1B3 <= imagWorkingBuffer[227];
				 realIp1B3 <= realWorkingBuffer[227];
				 imgIp2B3 <= imagWorkingBuffer[483];
				 realIp2B3 <= realWorkingBuffer[483];
				 twiddleFactorRealB3 <=#1 -0.937339;
				 twiddleFactorimgB3 <=#1 -0.348419;
				 stateIp1B3<=#1 227;
				 stateIp2B3<=#1 483;

				 //(228,484)
				 imgIp1B4 <= imagWorkingBuffer[228];
				 realIp1B4 <= realWorkingBuffer[228];
				 imgIp2B4 <= imagWorkingBuffer[484];
				 realIp2B4 <= realWorkingBuffer[484];
				 twiddleFactorRealB4 <=#1 -0.941544;
				 twiddleFactorimgB4 <=#1 -0.33689;
				 stateIp1B4<=#1 228;
				 stateIp2B4<=#1 484;

				 //(229,485)
				 imgIp1B5 <= imagWorkingBuffer[229];
				 realIp1B5 <= realWorkingBuffer[229];
				 imgIp2B5 <= imagWorkingBuffer[485];
				 realIp2B5 <= realWorkingBuffer[485];
				 twiddleFactorRealB5 <=#1 -0.945607;
				 twiddleFactorimgB5 <=#1 -0.32531;
				 stateIp1B5<=#1 229;
				 stateIp2B5<=#1 485;

				 //(230,486)
				 imgIp1B6 <= imagWorkingBuffer[230];
				 realIp1B6 <= realWorkingBuffer[230];
				 imgIp2B6 <= imagWorkingBuffer[486];
				 realIp2B6 <= realWorkingBuffer[486];
				 twiddleFactorRealB6 <=#1 -0.949528;
				 twiddleFactorimgB6 <=#1 -0.313682;
				 stateIp1B6<=#1 230;
				 stateIp2B6<=#1 486;

				 //(231,487)
				 imgIp1B7 <= imagWorkingBuffer[231];
				 realIp1B7 <= realWorkingBuffer[231];
				 imgIp2B7 <= imagWorkingBuffer[487];
				 realIp2B7 <= realWorkingBuffer[487];
				 twiddleFactorRealB7 <=#1 -0.953306;
				 twiddleFactorimgB7 <=#1 -0.302006;
				 stateIp1B7<=#1 231;
				 stateIp2B7<=#1 487;
			 end
			 286 : begin

				 //(232,488)
				 imgIp1B0 <= imagWorkingBuffer[232];
				 realIp1B0 <= realWorkingBuffer[232];
				 imgIp2B0 <= imagWorkingBuffer[488];
				 realIp2B0 <= realWorkingBuffer[488];
				 twiddleFactorRealB0 <=#1 -0.95694;
				 twiddleFactorimgB0 <=#1 -0.290285;
				 stateIp1B0<=#1 232;
				 stateIp2B0<=#1 488;

				 //(233,489)
				 imgIp1B1 <= imagWorkingBuffer[233];
				 realIp1B1 <= realWorkingBuffer[233];
				 imgIp2B1 <= imagWorkingBuffer[489];
				 realIp2B1 <= realWorkingBuffer[489];
				 twiddleFactorRealB1 <=#1 -0.960431;
				 twiddleFactorimgB1 <=#1 -0.27852;
				 stateIp1B1<=#1 233;
				 stateIp2B1<=#1 489;

				 //(234,490)
				 imgIp1B2 <= imagWorkingBuffer[234];
				 realIp1B2 <= realWorkingBuffer[234];
				 imgIp2B2 <= imagWorkingBuffer[490];
				 realIp2B2 <= realWorkingBuffer[490];
				 twiddleFactorRealB2 <=#1 -0.963776;
				 twiddleFactorimgB2 <=#1 -0.266713;
				 stateIp1B2<=#1 234;
				 stateIp2B2<=#1 490;

				 //(235,491)
				 imgIp1B3 <= imagWorkingBuffer[235];
				 realIp1B3 <= realWorkingBuffer[235];
				 imgIp2B3 <= imagWorkingBuffer[491];
				 realIp2B3 <= realWorkingBuffer[491];
				 twiddleFactorRealB3 <=#1 -0.966976;
				 twiddleFactorimgB3 <=#1 -0.254866;
				 stateIp1B3<=#1 235;
				 stateIp2B3<=#1 491;

				 //(236,492)
				 imgIp1B4 <= imagWorkingBuffer[236];
				 realIp1B4 <= realWorkingBuffer[236];
				 imgIp2B4 <= imagWorkingBuffer[492];
				 realIp2B4 <= realWorkingBuffer[492];
				 twiddleFactorRealB4 <=#1 -0.970031;
				 twiddleFactorimgB4 <=#1 -0.24298;
				 stateIp1B4<=#1 236;
				 stateIp2B4<=#1 492;

				 //(237,493)
				 imgIp1B5 <= imagWorkingBuffer[237];
				 realIp1B5 <= realWorkingBuffer[237];
				 imgIp2B5 <= imagWorkingBuffer[493];
				 realIp2B5 <= realWorkingBuffer[493];
				 twiddleFactorRealB5 <=#1 -0.97294;
				 twiddleFactorimgB5 <=#1 -0.231058;
				 stateIp1B5<=#1 237;
				 stateIp2B5<=#1 493;

				 //(238,494)
				 imgIp1B6 <= imagWorkingBuffer[238];
				 realIp1B6 <= realWorkingBuffer[238];
				 imgIp2B6 <= imagWorkingBuffer[494];
				 realIp2B6 <= realWorkingBuffer[494];
				 twiddleFactorRealB6 <=#1 -0.975702;
				 twiddleFactorimgB6 <=#1 -0.219101;
				 stateIp1B6<=#1 238;
				 stateIp2B6<=#1 494;

				 //(239,495)
				 imgIp1B7 <= imagWorkingBuffer[239];
				 realIp1B7 <= realWorkingBuffer[239];
				 imgIp2B7 <= imagWorkingBuffer[495];
				 realIp2B7 <= realWorkingBuffer[495];
				 twiddleFactorRealB7 <=#1 -0.978317;
				 twiddleFactorimgB7 <=#1 -0.207111;
				 stateIp1B7<=#1 239;
				 stateIp2B7<=#1 495;
			 end
			 287 : begin

				 //(240,496)
				 imgIp1B0 <= imagWorkingBuffer[240];
				 realIp1B0 <= realWorkingBuffer[240];
				 imgIp2B0 <= imagWorkingBuffer[496];
				 realIp2B0 <= realWorkingBuffer[496];
				 twiddleFactorRealB0 <=#1 -0.980785;
				 twiddleFactorimgB0 <=#1 -0.19509;
				 stateIp1B0<=#1 240;
				 stateIp2B0<=#1 496;

				 //(241,497)
				 imgIp1B1 <= imagWorkingBuffer[241];
				 realIp1B1 <= realWorkingBuffer[241];
				 imgIp2B1 <= imagWorkingBuffer[497];
				 realIp2B1 <= realWorkingBuffer[497];
				 twiddleFactorRealB1 <=#1 -0.983105;
				 twiddleFactorimgB1 <=#1 -0.18304;
				 stateIp1B1<=#1 241;
				 stateIp2B1<=#1 497;

				 //(242,498)
				 imgIp1B2 <= imagWorkingBuffer[242];
				 realIp1B2 <= realWorkingBuffer[242];
				 imgIp2B2 <= imagWorkingBuffer[498];
				 realIp2B2 <= realWorkingBuffer[498];
				 twiddleFactorRealB2 <=#1 -0.985278;
				 twiddleFactorimgB2 <=#1 -0.170962;
				 stateIp1B2<=#1 242;
				 stateIp2B2<=#1 498;

				 //(243,499)
				 imgIp1B3 <= imagWorkingBuffer[243];
				 realIp1B3 <= realWorkingBuffer[243];
				 imgIp2B3 <= imagWorkingBuffer[499];
				 realIp2B3 <= realWorkingBuffer[499];
				 twiddleFactorRealB3 <=#1 -0.987301;
				 twiddleFactorimgB3 <=#1 -0.158858;
				 stateIp1B3<=#1 243;
				 stateIp2B3<=#1 499;

				 //(244,500)
				 imgIp1B4 <= imagWorkingBuffer[244];
				 realIp1B4 <= realWorkingBuffer[244];
				 imgIp2B4 <= imagWorkingBuffer[500];
				 realIp2B4 <= realWorkingBuffer[500];
				 twiddleFactorRealB4 <=#1 -0.989177;
				 twiddleFactorimgB4 <=#1 -0.14673;
				 stateIp1B4<=#1 244;
				 stateIp2B4<=#1 500;

				 //(245,501)
				 imgIp1B5 <= imagWorkingBuffer[245];
				 realIp1B5 <= realWorkingBuffer[245];
				 imgIp2B5 <= imagWorkingBuffer[501];
				 realIp2B5 <= realWorkingBuffer[501];
				 twiddleFactorRealB5 <=#1 -0.990903;
				 twiddleFactorimgB5 <=#1 -0.134581;
				 stateIp1B5<=#1 245;
				 stateIp2B5<=#1 501;

				 //(246,502)
				 imgIp1B6 <= imagWorkingBuffer[246];
				 realIp1B6 <= realWorkingBuffer[246];
				 imgIp2B6 <= imagWorkingBuffer[502];
				 realIp2B6 <= realWorkingBuffer[502];
				 twiddleFactorRealB6 <=#1 -0.99248;
				 twiddleFactorimgB6 <=#1 -0.122411;
				 stateIp1B6<=#1 246;
				 stateIp2B6<=#1 502;

				 //(247,503)
				 imgIp1B7 <= imagWorkingBuffer[247];
				 realIp1B7 <= realWorkingBuffer[247];
				 imgIp2B7 <= imagWorkingBuffer[503];
				 realIp2B7 <= realWorkingBuffer[503];
				 twiddleFactorRealB7 <=#1 -0.993907;
				 twiddleFactorimgB7 <=#1 -0.110222;
				 stateIp1B7<=#1 247;
				 stateIp2B7<=#1 503;
			 end
			 288 : begin

				 //(248,504)
				 imgIp1B0 <= imagWorkingBuffer[248];
				 realIp1B0 <= realWorkingBuffer[248];
				 imgIp2B0 <= imagWorkingBuffer[504];
				 realIp2B0 <= realWorkingBuffer[504];
				 twiddleFactorRealB0 <=#1 -0.995185;
				 twiddleFactorimgB0 <=#1 -0.098017;
				 stateIp1B0<=#1 248;
				 stateIp2B0<=#1 504;

				 //(249,505)
				 imgIp1B1 <= imagWorkingBuffer[249];
				 realIp1B1 <= realWorkingBuffer[249];
				 imgIp2B1 <= imagWorkingBuffer[505];
				 realIp2B1 <= realWorkingBuffer[505];
				 twiddleFactorRealB1 <=#1 -0.996313;
				 twiddleFactorimgB1 <=#1 -0.085797;
				 stateIp1B1<=#1 249;
				 stateIp2B1<=#1 505;

				 //(250,506)
				 imgIp1B2 <= imagWorkingBuffer[250];
				 realIp1B2 <= realWorkingBuffer[250];
				 imgIp2B2 <= imagWorkingBuffer[506];
				 realIp2B2 <= realWorkingBuffer[506];
				 twiddleFactorRealB2 <=#1 -0.99729;
				 twiddleFactorimgB2 <=#1 -0.073565;
				 stateIp1B2<=#1 250;
				 stateIp2B2<=#1 506;

				 //(251,507)
				 imgIp1B3 <= imagWorkingBuffer[251];
				 realIp1B3 <= realWorkingBuffer[251];
				 imgIp2B3 <= imagWorkingBuffer[507];
				 realIp2B3 <= realWorkingBuffer[507];
				 twiddleFactorRealB3 <=#1 -0.998118;
				 twiddleFactorimgB3 <=#1 -0.061321;
				 stateIp1B3<=#1 251;
				 stateIp2B3<=#1 507;

				 //(252,508)
				 imgIp1B4 <= imagWorkingBuffer[252];
				 realIp1B4 <= realWorkingBuffer[252];
				 imgIp2B4 <= imagWorkingBuffer[508];
				 realIp2B4 <= realWorkingBuffer[508];
				 twiddleFactorRealB4 <=#1 -0.998795;
				 twiddleFactorimgB4 <=#1 -0.049068;
				 stateIp1B4<=#1 252;
				 stateIp2B4<=#1 508;

				 //(253,509)
				 imgIp1B5 <= imagWorkingBuffer[253];
				 realIp1B5 <= realWorkingBuffer[253];
				 imgIp2B5 <= imagWorkingBuffer[509];
				 realIp2B5 <= realWorkingBuffer[509];
				 twiddleFactorRealB5 <=#1 -0.999322;
				 twiddleFactorimgB5 <=#1 -0.036807;
				 stateIp1B5<=#1 253;
				 stateIp2B5<=#1 509;

				 //(254,510)
				 imgIp1B6 <= imagWorkingBuffer[254];
				 realIp1B6 <= realWorkingBuffer[254];
				 imgIp2B6 <= imagWorkingBuffer[510];
				 realIp2B6 <= realWorkingBuffer[510];
				 twiddleFactorRealB6 <=#1 -0.999699;
				 twiddleFactorimgB6 <=#1 -0.024541;
				 stateIp1B6<=#1 254;
				 stateIp2B6<=#1 510;

				 //(255,511)
				 imgIp1B7 <= imagWorkingBuffer[255];
				 realIp1B7 <= realWorkingBuffer[255];
				 imgIp2B7 <= imagWorkingBuffer[511];
				 realIp2B7 <= realWorkingBuffer[511];
				 twiddleFactorRealB7 <=#1 -0.999925;
				 twiddleFactorimgB7 <=#1 -0.012272;
				 stateIp1B7<=#1 255;
				 stateIp2B7<=#1 511;
			 end
		endcase
	end
end
endmodule
