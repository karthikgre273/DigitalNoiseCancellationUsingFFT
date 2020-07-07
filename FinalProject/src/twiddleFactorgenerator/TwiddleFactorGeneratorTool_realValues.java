package twiddleFactorgenerator;

import java.io.IOException;
import java.text.ParseException;

public class TwiddleFactorGeneratorTool_realValues {
	double pi=3.14;


	//8 bits
	int Npoint=512;
	int numberOfStages=9;

	// int n=2;
	public static void main(String[] args) throws ParseException, IOException {
		TwiddleFactorGeneratorTool_realValues obj=new TwiddleFactorGeneratorTool_realValues();
		obj.caseStatementGenerator();
	}

	boolean stage0flag=false;
	int count;
	int caseVariable=1;
	public void caseStatementGenerator() throws IOException{
		System.out.println("package txtFileGenerator;\n\n"
				+ "public class Twiddles_512 {\n"
				+ "\tpublic static double generate(boolean imag,int currentStage, int level){\n"
				+ "\t\tswitch (currentStage){"); 

		for (int stage = 0; stage < numberOfStages; stage++) {
			int currentStage;
//			if(stage==0) {
//				currentStage=numberOfStages-1;stage0flag=true;
//				continue;
//
//			}
			System.out.println("\t\t\tcase "+stage+":");
			System.out.println("\t\t\t\tswitch(level){");
			currentStage=stage;stage0flag=false;
			//System.out.println(Npoint/Math.pow ( 2, (currentStage+1)));
			//			for(int p=0; p<Npoint/Math.pow ( 2, (currentStage+1));p++){
			//				int firstVariable=(int) ((Math.pow ( 2, (currentStage+1)))*p);
			//System.out.println((int)Math.pow ( 2, (currentStage)));
			int numberOfTwiddles=(int)(Npoint/Math.pow ( 2, (numberOfStages-currentStage)))-1;

			for(int q=0;q<=numberOfTwiddles;q++){
				//int input1=firstVariable+q;
				//int input2=firstVariable+q+(int)Math.pow ( 2, (currentStage));		
				//					System.out.println("("+input1+","+input2+") ::stage =  "+stage);
				System.out.print("\t\t\t\t\tcase "+q+":");
				double real=twiddleFactorComputation(false,currentStage,q);
				double imag=twiddleFactorComputation(true,currentStage,q);
				//System.out.println(real+"+j"+imag+"\t\t\tstage =  "+stage);

				System.out.println("if(!imag) return "+(real)+";");
				System.out.println("\t\t\t\t\t\telse return "+(imag)+";");


				//				}
			}
			System.out.println("\t\t\t\t}");
		}
		System.out.println("\t\t\t}");
		System.out.println("\t\treturn 0;");
		System.out.println("\t}");
		System.out.println("}");
	}



	public double twiddleFactorComputation(boolean complexValue,int currentStage, int  k){
		double real;
		double imag;
		//		if(stage0flag){
		//			real=(Math.pow(2, 20));
		//			imag=0;
		//		}
		//		DecimalFormat f = new DecimalFormat(".###");
		//		else{

		double n=k * (Math.pow(2, numberOfStages-1-currentStage));
		real=(Math.cos(2*pi*n/Npoint));
		imag=-(Math.sin(2*pi*n/Npoint));


		//			real=Math.cos(pi*k/Math.pow(2, currentStage));
		//			imag=-Math.sin(pi*k/Math.pow(2, currentStage));
		//		}
		//		String realFormated=f.format(real);
		//		String imagFormated=f.format(imag);
		if(complexValue)return imag;
		else {
			if(real==7.963267107332633E-4) return 0.0;
			else return real;
		}
	}	
}

