package Tools;

public class AddressFileGenerator {
	static int pointFFT=4;
	static int NumberofStages=2;
	static int pointFFTBinaryBits=3;
	static int NumOfStagesBinaryBits=2;
	public static void main(String[] args) {
		System.out.println("******************"+pointFFT+" pointFFT with "+NumberofStages+" number of stages***************");
		int M=0;
		for (int N = 1; N <= NumberofStages; N++) {
			System.out.println("******************stage: "+N+"***************");
			for (int i = 0; i < (pointFFT/(int)(Math.pow(2,N))); i++) {
				M= (int) ((Math.pow(2,N+1))*i);
				for (int p = M; p <= (M+(int)(Math.pow(2,N))-1); p++) {
					int Value1=p;
					int Value2=(int)(p+Math.pow(2,N));
					System.out.println("values : ("+Value1+","+Value2+")");
					String address_complex1=pad(Integer.toBinaryString(N),NumOfStagesBinaryBits)+1+pad(Integer.toBinaryString(Value1),pointFFTBinaryBits);
					String address_real1=pad(Integer.toBinaryString(N),NumOfStagesBinaryBits)+0+pad(Integer.toBinaryString(Value1),pointFFTBinaryBits);
					String address_real2=pad(Integer.toBinaryString(N),NumOfStagesBinaryBits)+0+pad(Integer.toBinaryString(Value2),pointFFTBinaryBits);
					String address_complex2=pad(Integer.toBinaryString(N),NumOfStagesBinaryBits)+1+pad(Integer.toBinaryString(Value2),pointFFTBinaryBits);
					System.out.println("Address 1 real : "+address_real1+" :: Complex : "+address_complex1);
					System.out.println("Address 2 real : "+address_real2+" :: Complex : "+address_complex2);
				}
			}
		}
	}
    static String pad(String s, int numDigits)
    {
        StringBuffer sb = new StringBuffer(s);
        int numZeros = numDigits - s.length();
        while(numZeros-- > 0) { 
            sb.insert(0, "0");
        }
        return sb.toString();
    }
}
