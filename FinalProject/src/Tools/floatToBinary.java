package Tools;

public class floatToBinary {


	public static void main(String[] args) {
		double a= -1;
		System.out.println("float value : "+a+"\nBinary Value : "+computeBinaryValue(a));
	}
	
	public static String computeBinaryValue(double a){
		String returnString="";
		if(a<0)returnString=""+1;
		else returnString=""+0;
		double absoluteValue=Math.abs(a);
		returnString=returnString+""+(int) (absoluteValue);
		//System.out.println(returnString);
		double decimalPart=(absoluteValue>=1)?(absoluteValue-1):absoluteValue;
		double term;
		int realPart=0;
		for(int i=0;i<18;i++){
			term=decimalPart*2;
			//System.out.println(decimalPart+"*2 = "+term);
			decimalPart=(term>1)?(term-1):term;
			realPart=(int) (term);
			if(realPart>1){
				System.err.println("found");
			}
			returnString=returnString+""+realPart;
			//System.out.println("realPart="+realPart);
		}
		return returnString;
		
	}
	
	
//	private static String floatPointToBinary(float f){
//        int intBits = Float.floatToIntBits(f);
//        int rawIntBits = Float.floatToRawIntBits(f);
//        System.out.printf("f = %f  intBits = %d  " +
//                          "rawIntBits = %d%n", f, intBits, rawIntBits);
//        float toFloat = Float.intBitsToFloat(intBits);
//        System.out.printf("toFloat = %f%n", toFloat);
// 
//        int sign     = intBits & 0x80000000;
//        int exponent = intBits & 0x7f800000;
//        int mantissa = intBits & 0x007fffff;
//        System.out.printf("sign = %d  exponent = %d  mantissa = %d%n",
//                           sign, exponent, mantissa);
// 
//        String binarySign = Integer.toBinaryString(sign);
//        String binaryExponent = Integer.toBinaryString(exponent);
//        String binaryMantissa = Integer.toBinaryString(mantissa);
//        System.out.printf("binarySign     = %s%nbinaryExponent = %s%n" +
//                          "binaryMantissa = %s%n", binarySign,
//                           binaryExponent, binaryMantissa);
//		return binarySign+binaryExponent+binaryMantissa;
//	}
}
