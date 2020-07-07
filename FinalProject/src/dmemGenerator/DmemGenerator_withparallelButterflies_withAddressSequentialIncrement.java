package dmemGenerator;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;

import twiddleFactorgenerator.Twiddles_256;

public class DmemGenerator_withparallelButterflies_withAddressSequentialIncrement {
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
	int Npoint=256;
	int numberOfStages=8;
	int numberOfBitsToRepresetAllStates=11;//(Npoint/2)*numberOfStages;
	int noOfBitsUsedForRepresentingEachNumber=30;int numberOfBitsToaddress=12;


	// int n=2;
	public static void main(String[] args) throws ParseException, IOException {
		DmemGenerator_withparallelButterflies_withAddressSequentialIncrement obj=new DmemGenerator_withparallelButterflies_withAddressSequentialIncrement();
		obj.caseStatementGenerator();
	}

	int counter=0;
	boolean stage0flag=false;
	int count;
	int caseVariable=1;
	public void caseStatementGenerator() throws IOException{
		BufferedWriter writer = new BufferedWriter(new FileWriter("gen/caseOutput.v"));
		printHardCodeStatements(writer);		
		printDefaultCaseStatements(writer);
		for (int stage = 0; stage < numberOfStages; stage++) {
			int currentStage;
			if(stage==0) {currentStage=numberOfStages-1;stage0flag=true;}
			else {currentStage=stage;stage0flag=false;}
			for(int p=0; p<Npoint/Math.pow ( 2, (currentStage+1));p++){
				int firstVariable=(int) ((Math.pow ( 2, (currentStage+1)))*p);
				for(int q=0;q<(int)Math.pow ( 2, (currentStage));q++){		
					int input1=firstVariable+q;
					int input2=firstVariable+q+(int)Math.pow ( 2, (currentStage));		
					printCaseStatements(writer,input1,input2,currentStage,q);	
					System.out.println(input1+" : "+input2+" ::stage =  "+currentStage);

				}
			}
		}
		writer.write("\t\t\t "+(numberOfBitsToRepresetAllStates)+"'d"+257+" : begin\n");
		writer.write("\t\t\t\toutputFlag<=1'b1;\n");
		writer.write("\t\t\tend\n");

		writer.write("\t\tendcase\n");
		writer.write("\tend\n");
		writer.write("end\n");
		writer.write("endmodule\n");
		writer.flush();
		writer.close();
	}



	private void printCaseStatements(BufferedWriter writer, int input1, int input2, int currentStage, int q) throws IOException {
		if(count%4 ==0){
			writer.write("\t\t\t "+(numberOfBitsToRepresetAllStates)+"'d"+caseVariable+++" : begin\n");
		}
		writer.write("\n\t\t\t\t //("+input1+","+input2+")\n");

		writer.write("\t\t\t\t pushinB"+count%4+" <= 1'b1;\n");

		writer.write("\t\t\t\t complexIp1B"+count%4+" = complxMem["+AddressGenerator(currentStage,input1)+"];\n");
		writer.write("\t\t\t\t realIp1B"+count%4+" = realMem["+AddressGenerator(currentStage,input1)+"];\n");
		writer.write("\t\t\t\t complexIp2B"+count%4+" = complxMem["+AddressGenerator(currentStage,input2)+"];\n");
		writer.write("\t\t\t\t realIp2B"+count%4+" = realMem["+AddressGenerator(currentStage,input2)+"];\n");

		int real=Twiddles_256.generate(false,stage0flag?0:currentStage,q);
		int imag=Twiddles_256.generate(true,stage0flag?0:currentStage,q);


		writer.write("\t\t\t\t twiddleFactorRealB"+count%4+" ="+real+";\n");

		writer.write("\t\t\t\t twiddleFactorComplxB"+count%4+" ="+imag+";\n");

		if(stage0flag){
			writer.write("\t\t\t\t stateIp1B"+count%4+"<="+(numberOfBitsToaddress)+"'d" +(2*(count+1)+Npoint-1)+";\n");
			writer.write("\t\t\t\t stateIp2B"+count%4+"<="+(numberOfBitsToaddress)+"'d" +(2*(count+1)+Npoint)+";\n");
		}
		else{
			writer.write("\t\t\t\t stateIp1B"+count%4+"<="+(numberOfBitsToaddress)+"'d" +(AddressGenerator(currentStage,input1)+Npoint)+";\n");
			writer.write("\t\t\t\t stateIp2B"+count%4+"<="+(numberOfBitsToaddress)+"'d" +(AddressGenerator(currentStage,input2)+Npoint)+";\n");
		}
		if(count%4 ==3)
			writer.write("\t\t\t end\n");
		count++;
	}
	private void printDefaultCaseStatements(BufferedWriter writer) throws IOException {
		writer.write("\t\t\t 0: begin\n");
		for(int i=0;i<4;i++){
			writer.write("\t\t\t\t pushinB"+i%4+" <= 1'b0;\n");
			writer.write("\t\t\t\t complexIp1B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
			writer.write("\t\t\t\t realIp1B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
			writer.write("\t\t\t\t complexIp2B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
			writer.write("\t\t\t\t realIp2B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
			writer.write("\t\t\t\t twiddleFactorRealB"+i%4+" <="+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
			writer.write("\t\t\t\t twiddleFactorComplxB"+i%4+" <="+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
			writer.write("\t\t\t\t stateIp1B"+i%4+"<="+( numberOfBitsToRepresetAllStates)+"'d0;\n");
			writer.write("\t\t\t\t stateIp2B"+i%4+"<="+(numberOfBitsToRepresetAllStates)+"'d0;\n\n");
		}
		writer.write("\t\t\t end\n");		
		writer.write("\t\t\t default: begin\n");
		for(int i=0;i<4;i++){		
			writer.write("\t\t\t\t complexIp1B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
			writer.write("\t\t\t\t realIp1B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
			writer.write("\t\t\t\t complexIp2B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
			writer.write("\t\t\t\t realIp2B"+i%4+" <= "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
			writer.write("\t\t\t\t twiddleFactorRealB"+i%4+" <="+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
			writer.write("\t\t\t\t twiddleFactorComplxB"+i%4+" <="+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
			writer.write("\t\t\t\t stateIp1B"+i%4+"<="+( numberOfBitsToRepresetAllStates)+"'dx;\n");
			writer.write("\t\t\t\t stateIp2B"+i%4+"<="+(numberOfBitsToRepresetAllStates)+"'dx;\n\n");}
		writer.write("\t\t\t end\n");

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
		writer.write("module dataMem(input clock,reset,input["+(numberOfBitsToRepresetAllStates-1)+":0] currentState,"
				+ "\ninput["+(numberOfBitsToaddress-1)+":0] stateIp,"
				+ "\ninput ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complexInput,RealInput,"
				+ "\noutput reg outputFlag,"
				+ "\ninput["+(numberOfBitsToaddress-1)+":0] outputAddress,"
				+ "\noutput ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complexOutput,realOutput);\n");



		writer.write("\n\n\nreg ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complxMem[0:"+((Npoint*(numberOfStages+1))-1)+"],realMem[0:"+((Npoint*(numberOfStages+1))-1)+"];\n");


		writer.write(" \nreg pushinB0;"
				+ "\nwire pushoutB0;"
				+ "\nreg [29:0] realIp1B0,realIp2B0,complexIp1B0,complexIp2B0,twiddleFactorRealB0,twiddleFactorComplxB0;"
				+ "\nreg [11:0] stateIp1B0,stateIp2B0;"
				+ "\nwire [29:0]  ReOp1B0,ReOp2B0,CmpOp1B0,CmpOp2B0;"
				+ "\nwire [11:0] stateOp1B0,stateOp2B0;\n");

		writer.write(" \nreg pushinB1;"
				+ "\nwire pushoutB1;"
				+ "\nreg [29:0] realIp1B1,realIp2B1,complexIp1B1,complexIp2B1,twiddleFactorRealB1,twiddleFactorComplxB1;"
				+ "\nreg [11:0] stateIp1B1,stateIp2B1;"
				+ "\nwire [29:0]  ReOp1B1,ReOp2B1,CmpOp1B1,CmpOp2B1;"
				+ "\nwire [11:0] stateOp1B1,stateOp2B1;\n");

		writer.write(" \nreg pushinB2;"
				+ "\nwire pushoutB2;"
				+ "\nreg [29:0] realIp1B2,realIp2B2,complexIp1B2,complexIp2B2,twiddleFactorRealB2,twiddleFactorComplxB2;"
				+ "\nreg [11:0] stateIp1B2,stateIp2B2;"
				+ "\nwire [29:0]  ReOp1B2,ReOp2B2,CmpOp1B2,CmpOp2B2;"
				+ "\nwire [11:0] stateOp1B2,stateOp2B2;\n");

		writer.write(" \nreg pushinB3;"
				+ "\nwire pushoutB3;"
				+ "\nreg [29:0] realIp1B3,realIp2B3,complexIp1B3,complexIp2B3,twiddleFactorRealB3,twiddleFactorComplxB3;"
				+ "\nreg [11:0] stateIp1B3,stateIp2B3;"
				+ "\nwire [29:0]  ReOp1B3,ReOp2B3,CmpOp1B3,CmpOp2B3;"
				+ "\nwire [11:0] stateOp1B3,stateOp2B3;\n\n");

		writer.write("Butterfly buff1(clock,reset,pushinB0,pushoutB0,"
				+ "realIp1B0,realIp2B0,complexIp1B0,complexIp2B0,twiddleFactorRealB0,twiddleFactorComplxB0,"
				+ "stateIp1B0,stateIp2B0,"
				+ "ReOp1B0,ReOp2B0,CmpOp1B0,CmpOp2B0,"
				+ "stateOp1B0,stateOp2B0);\n\n");

		writer.write("Butterfly buff2(clock,reset,pushinB1,pushoutB1,"
				+ "realIp1B1,realIp2B1,complexIp1B1,complexIp2B1,twiddleFactorRealB1,twiddleFactorComplxB1,"
				+ "stateIp1B1,stateIp2B1,"
				+ "ReOp1B1,ReOp2B1,CmpOp1B1,CmpOp2B1,"
				+ "stateOp1B1,stateOp2B1);\n\n");

		writer.write("Butterfly buff3(clock,reset,pushinB2,pushoutB2,"
				+ "realIp1B2,realIp2B2,complexIp1B2,complexIp2B2,twiddleFactorRealB2,twiddleFactorComplxB2,"
				+ "stateIp1B2,stateIp2B2,"
				+ "ReOp1B2,ReOp2B2,CmpOp1B2,CmpOp2B2,"
				+ "stateOp1B2,stateOp2B2);\n\n");

		writer.write("Butterfly buff4(clock,reset,pushinB3,pushoutB3,"
				+ "realIp1B3,realIp2B3,complexIp1B3,complexIp2B3,twiddleFactorRealB3,twiddleFactorComplxB3,"
				+ "stateIp1B3,stateIp2B3,"
				+ "ReOp1B3,ReOp2B3,CmpOp1B3,CmpOp2B3,"
				+ "stateOp1B3,stateOp2B3);\n\n");

		writer.write("assign complexOutput=complxMem[outputAddress];\n");
		writer.write("assign realOutput=realMem[outputAddress];\n");

		writer.write("always @(posedge clock) begin\n");
		for(int i=0;i<4;i++){
			writer.write("\tif(pushoutB"+i+") begin\n");
			writer.write("\t\trealMem[stateOp1B"+i+"]<=ReOp1B"+i+";\n");
			writer.write("\t\trealMem[stateOp2B"+i+"]<=ReOp2B"+i+";\n");
			writer.write("\t\tcomplxMem[stateOp1B"+i+"]<=CmpOp1B"+i+";\n");
			writer.write("\t\tcomplxMem[stateOp2B"+i+"]<=CmpOp2B"+i+";\n\n");
			writer.write("\tend\n");
		}
		writer.write("end\n");


		writer.write("always @(*) begin\n");
		writer.write("\tif(reset) begin\n");
		writer.write("\t\toutputFlag<=1'b0;\n");
		writer.write("\tend\n");
		writer.write("\telse begin\n");


		writer.write("	// output transfer begin\n");

		//write back
		writer.write("\t\tcomplxMem[stateIp]<=complexInput;\n");
		writer.write("\t\trealMem[stateIp]<=RealInput;\n");

		writer.write("\t\tcase (currentState)\n");

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

