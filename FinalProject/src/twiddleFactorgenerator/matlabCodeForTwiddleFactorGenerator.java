package twiddleFactorgenerator;

public class matlabCodeForTwiddleFactorGenerator {

	int clear, clc;

	// Define input parameters
	int N = 8; // FFT size (Must be an integer power of 2)
	String Structure = "Dec_in_Time";  // Choose Dec-in-time butterflies
	//String Structure = 'Dec_in_Freq'; // Choose Dec-in-frequency butterflies

	// Start of processing
	int Num_Stages = (int) (Math.log(N)/Math.log(2)); // Number of stages
	int StageStart = 1; // First stage to compute
	int StageStop = Num_Stages; //  Last stage to compute
	int ButterStart = 1; // First butterfly to compute
	int ButterStop = N/2; //Last butterfly to compute
	int Pointer = 0; // Init 'results' row pointer

	public void calculate(){
		for (int Stage_Num=StageStart;Stage_Num<=StageStop;Stage_Num++){
			if(Structure == "Dec_in_Time"){
				for(int Butter_Num=ButterStart;Butter_Num<= ButterStop;Butter_Num++){
					double Twid = Math.floor((2^Stage_Num*(Butter_Num-1))/N);
					// Compute bit reversal of Twid
					int Twid_Bit_Rev = 0; 
					for(int I = Num_Stages-2;I>=0;I--){
						if (Twid>=(2^I)){
							Twid_Bit_Rev = Twid_Bit_Rev + 2^(Num_Stages-I-2);
							Twid = Twid - (2^I);
						}
					}

						// End bit reversal 'I' loop
						int A1 = Twid_Bit_Rev; //Angle A1
						int A2 = Twid_Bit_Rev + N/2; // Angle A2
						Pointer = Pointer +1;
						System.out.println("[Stage_Num - "+Stage_Num+" : Butter_Num - "+Butter_Num+" : A1 - "+A1+" : A2 - "+A2+"]");    
					}
			}
			else{
				for(int Twiddle_Num=1;Twiddle_Num< N/(2^Stage_Num);Twiddle_Num++){
					double Twid = (2^Stage_Num*(Twiddle_Num-1))/2; //Compute integer
					Pointer = Pointer +1;
					System.out.println("[Stage_Num: "+Stage_Num+"Twiddle_Num"+Twiddle_Num+"Twid"+Twid+"]");    
				} // End 'if'
			}// End Stage_Num loop
		}
	}
	public static void main(String[] args) {
		matlabCodeForTwiddleFactorGenerator obj=new matlabCodeForTwiddleFactorGenerator();
		obj.calculate();
	}
}
