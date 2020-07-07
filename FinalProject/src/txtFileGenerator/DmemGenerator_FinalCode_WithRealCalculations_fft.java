package txtFileGenerator;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;

import twiddleFactorgenerator.Twiddles_256;
import twiddleFactorgenerator.Twiddles_512_fft;

public class DmemGenerator_FinalCode_WithRealCalculations_fft {
	double pi=3.14;
	//256 bits
	//	int Npoint=256;
	//	int numberOfStages=8;
	//	int numberOfBitsToRepresetAllStates=10;//(Npoint/2)*numberOfStages;
	//	int noOfBitsUsedForRepresentingEachNumber=20;

	//16 bits
	//	int Npoint=16;
	//	int numberOfStages=4;
	//	int numberOfBitsToRepresetAllStates=6;//(Npoint/2)*numberOfStages;
	//	int noOfBitsUsedForRepresentingEachNumber=20;

	//8 bits
	int Npoint=512;
	int noOfMultipliers=8;
	int numberOfStages=Integer.toBinaryString((Npoint-1)).length();
	int totalNumberOfStates=(int)(((Npoint/2)*numberOfStages)/noOfMultipliers);
	int numberOfBitsToRepresetAllStates=Integer.toBinaryString(totalNumberOfStates-1).length();
	int numberOfBitsToRepresentNPoint=Integer.toBinaryString(Npoint-1).length();
	int numberOfBitsToaddress=12;


	// int n=2;
	public static void main(String[] args) throws ParseException, IOException {
		DmemGenerator_FinalCode_WithRealCalculations_fft obj=new DmemGenerator_FinalCode_WithRealCalculations_fft();
		obj.caseStatementGenerator();
	}

	int counter=0;
	int count;
	int caseVariable=1;
	boolean stage0flag;
	public void caseStatementGenerator() throws IOException{
		BufferedWriter writer = new BufferedWriter(new FileWriter("gen/fftCalculator.v"));
		printHardCodeStatements(writer);		
		printDefaultCaseStatements(writer);
		for (int stage = 0; stage < numberOfStages; stage++) {
			if(stage==0) {stage0flag=true;}
			else {stage0flag=false;}
			double end=Npoint/Math.pow ( 2, (stage+1));
			for(int p=0; p<end;p++){
				int firstVariable=(int) ((Math.pow ( 2, (stage+1)))*p);
				int end2=(int)Math.pow ( 2, (stage));
				for(int q=0;q<end2;q++){		
					int input1=firstVariable+q;
					int input2=firstVariable+q+(int)Math.pow ( 2, (stage));		
					printCaseStatements(writer,input1,input2,stage,q,(stage+1==numberOfStages && p==0 && q==0),(stage==0 && p==0 && q==0) );	
					System.out.println(input1+" : "+input2+" ::stage =  "+stage);

				}
			}
		}
		//		writer.write("\t\t\t "+(numberOfBitsToRepresetAllStates)+"'d"+257+" : begin\n");
		//		writer.write("\t\t\t\toutputFlag<=1'b1;\n");
		//		writer.write("\t\t\tend\n");

		writer.write("\t\tendcase\n");
		writer.write("\tend\n");
		writer.write("end\n");
		writer.write("endmodule\n");
		writer.flush();
		writer.close();
	}



	private void printCaseStatements(BufferedWriter writer, int input1, int input2, int currentStage, int q, boolean lastStage,boolean firstStage) throws IOException {


		if(count%noOfMultipliers ==0){
			writer.write("\t\t\t "+caseVariable+++" : begin\n");
		}

		if(firstStage) {
			writer.write("\n\t\t\t\t lastStageFlag<=1'b0;\n");
		}

		writer.write("\n\t\t\t\t //("+input1+","+input2+")\n");

		//writer.write("\t\t\t\t pushinB"+count%noOfMultipliers+" <= 1'b1;\n");
		writer.write("\t\t\t\t imgIp1B"+count%noOfMultipliers+" <=#1 imagWorkingBuffer["+input1+"];\n");
		writer.write("\t\t\t\t realIp1B"+count%noOfMultipliers+" <=#1 realWorkingBuffer["+input1+"];\n");
		writer.write("\t\t\t\t imgIp2B"+count%noOfMultipliers+" <=#1 imagWorkingBuffer["+input2+"];\n");
		writer.write("\t\t\t\t realIp2B"+count%noOfMultipliers+" <=#1 realWorkingBuffer["+input2+"];\n");

		double real = 0;
		double imag = 0;
		switch (Npoint) {
		case 256:
			real=Twiddles_256.generate(false,currentStage,q);
			imag=Twiddles_256.generate(true,currentStage,q);
			break;
		case 512:
			real=Twiddles_512_fft.generate(false,currentStage,q);
			imag=Twiddles_512_fft.generate(true,currentStage,q);
			break;
		default:
			break;
		}


		writer.write("\t\t\t\t twiddleFactorRealB"+count%noOfMultipliers+" <=#1 "+real+";\n");

		writer.write("\t\t\t\t twiddleFactorimgB"+count%noOfMultipliers+" <=#1 "+imag+";\n");



		writer.write("\t\t\t\t stateIp1B"+count%noOfMultipliers+"<=#1 "+input1+";\n");
		writer.write("\t\t\t\t stateIp2B"+count%noOfMultipliers+"<=#1 "+input2+";\n");
		if(lastStage) {
			writer.write("\n\t\t\t\t lastStageFlag<=#1 1;\n");
			writer.flush();
		}
		if(count%noOfMultipliers ==(noOfMultipliers-1)) {

			writer.write("\t\t\t end\n");
		}
		count++;
	}
	private void printDefaultCaseStatements(BufferedWriter writer) throws IOException {
		writer.write("\t\t\t default: begin\n");
		for(int i=0;i<noOfMultipliers;i++){
			writer.write("\t\t\t\t pushinB"+i%noOfMultipliers+" <=#1 1'b0;\n");
			writer.write("\t\t\t\t imgIp1B"+i%noOfMultipliers+" <=#1 0.0;\n");
			writer.write("\t\t\t\t realIp1B"+i%noOfMultipliers+" <=#1 0.0;\n");
			writer.write("\t\t\t\t imgIp2B"+i%noOfMultipliers+" <=#1 0.0;\n");
			writer.write("\t\t\t\t realIp2B"+i%noOfMultipliers+" <=#1 0.0;\n");
			writer.write("\t\t\t\t twiddleFactorRealB"+i%noOfMultipliers+" <=#1 0.0;\n");
			writer.write("\t\t\t\t twiddleFactorimgB"+i%noOfMultipliers+" <=#1 0.0;\n");
			writer.write("\t\t\t\t stateIp1B"+i%noOfMultipliers+"<=#1 0;\n");
			writer.write("\t\t\t\t stateIp2B"+i%noOfMultipliers+"<=#1 0;\n\n");
		}
		writer.write("\t\t\t end\n");		
		//		writer.write("\t\t\t default: begin\n");
		//		for(int i=0;i<noOfMultipliers;i++){		
		//			writer.write("\t\t\t\t imgIp1B"+i%noOfMultipliers+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		//			writer.write("\t\t\t\t realIp1B"+i%noOfMultipliers+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		//			writer.write("\t\t\t\t imgIp2B"+i%noOfMultipliers+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		//			writer.write("\t\t\t\t realIp2B"+i%noOfMultipliers+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		//			writer.write("\t\t\t\t twiddleFactorRealB"+i%noOfMultipliers+" <="+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		//			writer.write("\t\t\t\t twiddleFactorimgB"+i%noOfMultipliers+" <="+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		//			writer.write("\t\t\t\t stateIp1B"+i%noOfMultipliers+"<="+( numberOfBitsToRepresetAllStates)+"'dx;\n");
		//			writer.write("\t\t\t\t stateIp2B"+i%noOfMultipliers+"<="+(numberOfBitsToRepresetAllStates)+"'dx;\n\n");}
		//		writer.write("\t\t\t end\n");

	}

	private int AddressGenerator(int currentStage, int level) {
		int stage=currentStage;
		if(stage0flag)stage=0;
		return stage*Npoint+level+1;

	}

	public int twiddleFactorComputation(boolean complexValue,int currentStage, int k){
		int real;
		int imag;
		if(stage0flag){
			real=(int) (Math.pow(2, 20));
			imag=0;
		}
		//		DecimalFormat f = new DecimalFormat(".###");
		else{
			real=(int)(Math.cos(2*pi*k/Npoint)*(Math.pow(2, 20)));
			imag=(int)(-Math.sin(2*pi*k/Npoint)*(Math.pow(2, 20)));
			System.out.println(Math.cos(2*pi*k/Npoint)+ " : "+ real);
			System.out.println(Math.sin(2*pi*k/Npoint)+ " : "+ imag);
			//			real=Math.cos(pi*k/Math.pow(2, currentStage));
			//			imag=-Math.sin(pi*k/Math.pow(2, currentStage));
		}
		//		String realFormated=f.format(real);
		//		String imagFormated=f.format(imag);
		if(complexValue)return imag;
		else return real;
	}	

	private void printHardCodeStatements(BufferedWriter writer) throws IOException {
		writer.write("`include \"Butterfly.v\"\n");
		writer.write("module fftCalculator(\n");
		writer.write("input clock,reset,"
				+ "\ninput real realInput,imagInput,"
				+ "\ninput startIn,"
				+ "\noutput reg outputFlag,"
				+ "\noutput real realOutput,imagOutput);\n");

		writer.write("\n\nwire lastStageFlagOp;"
				+ "\ninteger state;"
				+ "\ninteger i;"
				+ "\nreg ["+(numberOfBitsToRepresentNPoint-1)+":0] outputAddress;\n");
		writer.write("reg writeBack,lastStageFlag,computationAvailbleFlag;\n");
		writer.write("reg["+(numberOfBitsToRepresentNPoint-1)+":0] inputAddressCounter,reversedAddress;"
				+ "\nreg inputDataStartFLag;"
				+ "\nwire startFlagDetected;"
				+ "\nreg inputBufferFlag;"
				+ "\nreg computationFlag,OutputMemoryRightEnable;\n");


		for (int i=0;i<=noOfMultipliers-1;i++) {
			writer.write(" \nreg pushinB"+i+";"
					+ "\nwire pushoutB"+i+";"
					+ "\nreal realIp1B"+i+",realIp2B"+i+",imgIp1B"+i+",imgIp2B"+i+";"
					+ "\nreal twiddleFactorRealB"+i+",twiddleFactorimgB"+i+";"
					+ "\nreg ["+(numberOfBitsToRepresetAllStates-1)+":0] stateIp1B"+i+",stateIp2B"+i+";"
					+ "\nreal  ReOp1B"+i+",ReOp2B"+i+",imgOp1B"+i+",imgOp2B"+i+";"
					+ "\nwire ["+(numberOfBitsToRepresetAllStates-1)+":0] stateOp1B"+i+",stateOp2B"+i+";\n");
		}

		writer.write ("real imagInputBuffer [0:"+(Npoint-1)+"] , imagWorkingBuffer[0:"+(Npoint-1)+"],imagOuptutBuff[0:"+(Npoint-1)+"];\n");
		writer.write ("real realInputBuffer [0:"+(Npoint-1)+"] , realWorkingBuffer[0:"+(Npoint-1)+"],realOutputBuff[0:"+(Npoint-1)+"];\n");

		writer.write("real testImaInp, testImaw,testImao;\n");
		writer.write("real testRealInp, testRealw,testRealo;\n");


		for(int i=0; i<=noOfMultipliers-1;i++) {

			writer.write("Butterfly buff"+(i+1)+"(lastStageFlag,clock,reset,pushinB"+i+",pushoutB"+i+","
					+ "realIp1B"+i+",realIp2B"+i+",imgIp1B"+i+",imgIp2B"+i+",twiddleFactorRealB"+i+",twiddleFactorimgB"+i+","
					+ "stateIp1B"+i+",stateIp2B"+i+","
					+ "ReOp1B"+i+",ReOp2B"+i+",imgOp1B"+i+",imgOp2B"+i+","
					+ "stateOp1B"+i+",stateOp2B"+i+","
					+ "lastStageFlagOp);\n\n");		
		}

		writer.write("//assign complexOutput=complxMem[outputAddress];\n");
		writer.write("//assign realOutput=realMem[outputAddress];\n");


		writer.write("always @(*) begin");
		writer.write("\n\tif(reset) begin");
		writer.write("\n\t\trealOutput= 0;"
				+ "\n\t\timagOutput= 0;");

		writer.write("\n\tend\n\telse begin");
		writer.write("\n\t\tif(inputDataStartFLag) begin"
				+ "\n\t\t\treversedAddress= ({");

		for(int i=0;i<numberOfBitsToRepresentNPoint;i++) {
			if(i!=numberOfBitsToRepresentNPoint-1)
				writer.write("inputAddressCounter["+i+"],");
			else
				writer.write("inputAddressCounter["+i+"]");
		}

		writer.write("});");
		writer.write("\n\t\tend");
		writer.write("\n\t\telse ");
		writer.write("\n\t\t\t reversedAddress=0;");

		writer.write("\n\t\trealOutput<=#1  realOutputBuff[(outputAddress)];");
		writer.write("\n\t\timagOutput<=#1  imagOuptutBuff[(outputAddress)];");
		writer.write("\n\t\ttestRealInp <=#1  realInputBuffer[128];");

		writer.write("\n\tend");
		writer.write("\nend");

		writer.write("\n\nalways @(posedge clock or posedge reset ) begin\n");
		writer.write("\n\tif(reset) begin");
		writer.write("\n\t\tfor(i=0;i<"+Npoint+";i=i+1) begin");
		writer.write("\n\t\t\trealWorkingBuffer[i]<=#1  0.0;");
		writer.write("\n\t\t\timagWorkingBuffer[i]<=#1  0.0;");
		writer.write("\n\t\t\trealInputBuffer[i]<=#1  0.0;");
		writer.write("\n\t\t\timagInputBuffer[i]<=#1  0.0;");
		writer.write("\n\t\t\trealOutputBuff[i]<=#1  0.0;");
		writer.write("\n\t\t\timagOuptutBuff[i]<=#1  0.0;");
		writer.write("\n\t\tend");
		writer.write("\n\t\tinputAddressCounter<=#1 0;"
				+ "\n\t\tinputBufferFlag<=#1 0;"
				+ "\n\t\tcomputationFlag<=#1 0;"
				+ "\n\t\tcomputationAvailbleFlag<=#1 0;"
				+ "\n\t\tlastStageFlag<=#1 0;"
				+ "\n\t\tstate<=#1 1;"
				+ "\n\t\toutputAddress<=#1 0;"
				+ "\n\t\toutputFlag<=#1 0;"
				+ "\n\t\twriteBack<=#1 0;"
				+ "\n\t\tinputDataStartFLag<=#1 0;");
		writer.write("\n\tend");
		writer.write("\n\telse begin");
		writer.write("\n\t\tif(startIn) begin");
		writer.write("\n\t\t\tinputAddressCounter <= #1 1;");
		writer.write("\n\t\t\trealInputBuffer[0] <= #1 realInput;");
		writer.write("\n\t\t\timagInputBuffer[0] <= #1 imagInput;");
		writer.write("\n\t\t\tinputDataStartFLag<=#1 1;");
		writer.write("\n\t\tend");
		writer.write("\n\t\telse if(inputDataStartFLag) begin");
		writer.write("\n\t\t\tinputAddressCounter <= #1 (inputAddressCounter+1)%"+Npoint+";");
		writer.write("\n\t\t\trealInputBuffer[reversedAddress] <= #1 realInput;");
		writer.write("\n\t\t\timagInputBuffer[reversedAddress] <= #1 imagInput;");
		writer.write("\n\t\t\tif(inputAddressCounter=="+(Npoint-1)+") begin");
		writer.write("\n\t\t\t\tinputBufferFlag<= #1 1;");
		writer.write("\n\t\t\t\tinputDataStartFLag<=#1 0;");
		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\tend");
		writer.write("\n\t\t\telse if(inputBufferFlag) begin");
		writer.write("\n\t\t\t\tfor(i=0;i<"+Npoint+";i=i+1) begin");
		writer.write("\n\t\t\t\t\trealWorkingBuffer[i] <= #1 realInputBuffer[i];");
		writer.write("\n\t\t\t\t\timagWorkingBuffer[i] <= #1 imagInputBuffer[i];");
		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\t\tinputBufferFlag<=#1 0;");
		writer.write("\n\t\t\t\tcomputationFlag<=#1 1;");
		writer.write("\n\t\t\t\t//computationAvailbleFlag<=#1 computationFlag?1:0;");
		writer.write("\n\t\t\t\tstate<=#1 1;");
		writer.write("\n\t\t\tend");
		writer.write("\n\t\t\telse if(computationFlag) begin");
		writer.write("\n\t\t\t\tif(state==0)");
		writer.write("\n\t\t\t\t\tstate<=#1 1;");
		writer.write("\n\t\t\t\telse if(state=="+totalNumberOfStates+") begin");
		writer.write("\n\t\t\t\t\tstate<=#1 0;");
		writer.write("\n\t\t\t\t\tcomputationFlag<=#1 0;");
		writer.write("\n\t\t\t\t\tlastStageFlag<=#1 0;");
		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\t\telse");
		writer.write("\n\t\t\t\t\tstate<=#1 (state+1);");
		for(int i=0;i<noOfMultipliers;i++){
			writer.write("\n\t\t\t\tpushinB"+i+"<=#1 1;");
		}
		writer.write("\n\t\t\tend");
		writer.write("\n\t\t\telse begin");
		writer.write("\n\t\t\t\tstate<=#1 0;");
		for(int i=0;i<noOfMultipliers;i++){
			writer.write("\n\t\t\t\tpushinB"+i+"<=#1 0;");
		}
		writer.write("\n\t\t\t\tif(stateOp2B"+(noOfMultipliers-1)+"=="+(Npoint-1)+") begin");
		writer.write("\n\t\t\t\t\tcomputationFlag<=#1 0;");
		writer.write("\n\t\t\t\t\twriteBack<=#1 1;");
		writer.write("\n\t\t\t\t\toutputAddress<=#1 0;");
		writer.write("\n\t\t\t\t\tcomputationFlag<=#1 0;");
		writer.write("\n\t\t\t\t\toutputFlag<=#1 1;");
		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\tend");
		writer.write("\n\t\t\t\tif(lastStageFlagOp) begin");
		for(int i=0;i<noOfMultipliers;i++){
			writer.write("\n\t\t\t\t\tif(pushoutB"+i+") begin");
			writer.write("\n\t\t\t\t\t\trealOutputBuff[stateOp1B"+i+"]<=#1 ReOp1B"+i+";");
			writer.write("\n\t\t\t\t\t\trealOutputBuff[stateOp2B"+i+"]<=#1 ReOp2B"+i+";");
			writer.write("\n\t\t\t\t\t\timagOuptutBuff[stateOp1B"+i+"]<=#1 imgOp1B"+i+";");
			writer.write("\n\t\t\t\t\t\timagOuptutBuff[stateOp2B"+i+"]<=#1 imgOp2B"+i+";");
			writer.write("\n\t\t\t\t\tend\n");
		}
//		writer.write("\n\t\t\t\tif(stateOp2B3=="+(Npoint-1)+") begin");
//		writer.write("\n\t\t\t\t\tcomputationFlag<=#1 (computationAvailbleFlag || inputBufferFlag)?1:0;");
//		writer.write("\n\t\t\t\t\tcomputationAvailbleFlag<=#1 0;");
//		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\t\telse begin");

		for(int i=0;i<=3;i++) {
			writer.write("\n\t\t\t\t\tif(pushoutB"+i+") begin");
			writer.write("\n\t\t\t\t\t\trealWorkingBuffer[stateOp1B"+i+"]<=#1 ReOp1B"+i+";");
			writer.write("\n\t\t\t\t\t\trealWorkingBuffer[stateOp2B"+i+"]<=#1 ReOp2B"+i+";");
			writer.write("\n\t\t\t\t\t\timagWorkingBuffer[stateOp1B"+i+"]<=#1 imgOp1B"+i+";");
			writer.write("\n\t\t\t\t\t\timagWorkingBuffer[stateOp2B"+i+"]<=#1 imgOp2B"+i+";");
			writer.write("\n\t\t\t\t\tend");
		}
		writer.write("\n\t\t\t\tend");
		
//		writer.write("\n\t\t\t\tif(lastStageFlagOp==1 && stateOp2B"+noOfMultipliers+"=="+(Npoint-1)+") begin");
//		writer.write("\n\t\t\t\toutputFlag<=#3 1'b1;");
//		writer.write("\n\t\t\t\twriteBack<=#1 1'b1;");
//		writer.write("\n\t\t\t\toutputAddress<=#1 12'd0;");
//		writer.write("\n\t\t\tend");
		
		writer.write("\n\t\t\tif(writeBack) begin");
		writer.write("\n\t\t\t\toutputAddress<=#1 outputAddress+1;");
		writer.write("\n\t\t\t\tif(outputAddress=="+(Npoint-1)+") begin");
		writer.write("\n\t\t\t\t\toutputAddress<=#1 0;");
		writer.write("\n\t\t\t\t\twriteBack<=#1 1'b0;");
//		writer.write("\n\t\t\t\tend");
//		writer.write("\n\t\t\t\telse begin");
//		writer.write("\n\t\t\t\t\toutputAddress<=#1 outputAddress+12'd1;");
		writer.write("\n\t\t\t\t\toutputFlag<=#1 1'b0;");
		writer.write("\n\t\t\t\tend");
		writer.write("\n\t\t\tend");
		
		//write back

		writer.write("\n\t\tcase (state)\n");

	}


	public int reverseBits(int a) {
		long result = 0;
		int i = 7;
		while(a > 0){
			result += (a % 2) * Math.pow(2, i);
			i--;                        
			a = a/2;
		}
		return (int) result+1;
	}
}

