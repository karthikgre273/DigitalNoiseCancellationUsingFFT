package txtFileGenerator;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;

public class DmemGenerator {
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
		DmemGenerator obj=new DmemGenerator();
		obj.caseStatementGenerator();
	}
	
	boolean stage0flag=false;

	public void caseStatementGenerator() throws IOException{
		int caseVariable=1;
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
					printCaseStatements(writer,caseVariable,input1,input2,currentStage,q);
					caseVariable++;					
				}
			}
		}
		
		writer.write("\t\tendcase\n");
		writer.write("end\n");
		writer.write("endmodule\n");
		writer.close();
	}
	
	private void printHardCodeStatements(BufferedWriter writer) throws IOException {

		writer.write("module dataMem(input["+(numberOfBitsToRepresetAllStates-1)+":0] currentState,"
				+ "\ninput["+(numberOfBitsToaddress-1)+":0] stateIp1,stateIp2,stateIp3,"
				+ "\ninput ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complexInput1,RealInput1,complexInput2,RealInput2,complexInput3,RealInput3,"
				+ "\noutput reg ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complexOut1,complexOut2,realOut1,realOut2,twiddleFactorReal,twiddleFactorComplx,"
				+ "\noutput reg ["+(numberOfBitsToaddress-1)+":0] stateOp1,stateOp2,"
				+ "\noutput reg outputFlag,"
				+ "\ninput["+(numberOfBitsToaddress-1)+":0] outputAddress,"
				+ "\noutput reg ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complexOutput,realOutput);\n");

		writer.write("\n//		     ---------------------------\n");
		writer.write("//from counter 	--> |state  		  	|-->\n");
		writer.write("//		--> |ReIp1  		  ReOp1	|-->\n");
		writer.write("//		--> |ReIp2   		  ReOp2	|-->\n");
		writer.write("//		--> |ReIp3 		  	|-->\n");
		writer.write("//		--> |CmpIp1		 CmpOp1	|-->\n");
		writer.write("//		--> |CmpIp2		 CmpOp2	|-->\n");
		writer.write("//		--> |CmpIp3		 	|-->\n");
		writer.write("//		--> |state1	     TwiddleRe  |-->\n");
		writer.write("//		--> |state2       TwiddleCmplxOp|-->\n");
		writer.write("//		--> |state3	        pushout	|-->\n");
		writer.write("//		--> |currentstate    		|<--\n");
		writer.write("//		    |			 state1	|-->\n");
		writer.write("//		    |			 state2	|-->\n");
		writer.write("//		     -----------^-------o-------\n");
		writer.write("//				|	|                \n");                                           
		writer.write("//			      clock   reset\n\n");


		writer.write("reg ["+(noOfBitsUsedForRepresentingEachNumber-1)+":0] complxMem[0:"+((Npoint*(numberOfStages+1))-1)+"],realMem[0:"+((Npoint*(numberOfStages+1))-1)+"];\n");

		writer.write("always @(*) begin\n");
		writer.write("	// output transfer begin\n");
		
		writer.write("\t\tif((stateIp2+"+(Npoint)+")>12'd2048) begin\n");
		writer.write("\t\toutputFlag<=1'b1;\n");
		writer.write("\t\tend\n");
		
		writer.write("\t\tcomplexOutput<=complxMem[outputAddress];\n");
		writer.write("\t\trealOutput<=realMem[outputAddress];\n");
		
		//write back
		writer.write("\t\trealMem[stateIp1]<=RealInput1;\n");
		writer.write("\t\trealMem[stateIp2]<=RealInput2;\n");
		writer.write("\t\trealMem[stateIp3]<=RealInput3;\n");
		writer.write("\t\tcomplxMem[stateIp1]<=complexInput1;\n");
		writer.write("\t\tcomplxMem[stateIp2]<=complexInput2;\n");
		writer.write("\t\tcomplxMem[stateIp3]<=complexInput3;\n");

		writer.write("\t\tcase (currentState)\n");
		
	}
	
		
	private void printCaseStatements(BufferedWriter writer, int caseVariable, int input1, int input2, int currentStage, int q) throws IOException {
		writer.write("\t\t\t "+(numberOfBitsToRepresetAllStates)+"'d"+caseVariable+++" : begin\n");
		writer.write("\t\t\t\t //("+input1+","+input2+")\n");
		writer.write("\t\t\t\t complexOut1 = complxMem["+AddressGenerator(currentStage,input1)+"];\n");
		writer.write("\t\t\t\t realOut1 = realMem["+AddressGenerator(currentStage,input1)+"];\n");
		writer.write("\t\t\t\t complexOut2 = complxMem["+AddressGenerator(currentStage,input2)+"];\n");
		writer.write("\t\t\t\t realOut2 = realMem["+AddressGenerator(currentStage,input2)+"];\n");	
		
		double real=twiddleFactorComputation(false,currentStage,q);
		double imag=twiddleFactorComputation(true,currentStage,q);
		

		writer.write("\t\t\t\t twiddleFactorReal ="+real+";\n");

		writer.write("\t\t\t\t twiddleFactorComplx ="+(-imag)+";\n");
		
		writer.write("\t\t\t\t stateOp1<="+(numberOfBitsToaddress)+"'d" +(AddressGenerator(currentStage,input1)+Npoint)+";\n");
		writer.write("\t\t\t\t stateOp2<="+(numberOfBitsToaddress)+"'d" +(AddressGenerator(currentStage,input2)+Npoint)+";\n");
		writer.write("\t\t\t end\n");
	}
	private void printDefaultCaseStatements(BufferedWriter writer) throws IOException {
		writer.write("\t\t\t 0: begin\n");
		writer.write("\t\t\t\t complexOut1 <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
		writer.write("\t\t\t\t realOut1 <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
		writer.write("\t\t\t\t complexOut2 <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
		writer.write("\t\t\t\t realOut2 <= "+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
		writer.write("\t\t\t\t twiddleFactorReal <="+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
		writer.write("\t\t\t\t twiddleFactorComplx <="+(noOfBitsUsedForRepresentingEachNumber)+"'d0;\n");
		writer.write("\t\t\t\t stateOp1<="+( numberOfBitsToRepresetAllStates)+"'d0;\n");
		writer.write("\t\t\t\t stateOp2<="+(numberOfBitsToRepresetAllStates)+"'d0;\n");
		writer.write("\t\toutputFlag<=1'b0;\n");
		writer.write("\t\t\t end\n");
		writer.write("\t\t\t default: begin\n");
		writer.write("\t\t\t\t complexOut1 = "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		writer.write("\t\t\t\t realOut1 = "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		writer.write("\t\t\t\t complexOut2 = "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		writer.write("\t\t\t\t realOut2 = "+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");				
		writer.write("\t\t\t\t twiddleFactorReal ="+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		writer.write("\t\t\t\t twiddleFactorComplx ="+(noOfBitsUsedForRepresentingEachNumber)+"'dx;\n");
		writer.write("\t\t\t end\n");
	}

	private int AddressGenerator(int currentStage, int level) {
		int stage=currentStage;
		if(stage0flag)stage=0;
		return stage*Npoint+level;

	}

	public double twiddleFactorComputation(boolean complexValue,int currentStage, int k){		

		double real;
		double imag;
		if(stage0flag){
			real=Math.pow(2, 20);
			imag=0;
		}
		else{
			real=Math.cos(pi*k/Math.pow(2, currentStage))*(Math.pow(2, 20));
			imag=Math.sin(pi*k/Math.pow(2, currentStage))*(Math.pow(2, 20));
		}
		if(complexValue)return imag;
		else return real;
	}	
}

