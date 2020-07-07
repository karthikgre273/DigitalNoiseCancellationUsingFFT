package Tools;

public class BitReversal {

	
	
	public static void main(String[] args) {
		BitReversal bitreverse=new BitReversal();
		System.out.println(bitreverse.reverse(3));
		
		
	}
	
	 public long reverse(long a) {
	        long result = 0;
	        int i = 2;
	        while(a > 0){
	            result += (a % 2) * Math.pow(2, i);
	            i--;                        
	            a = a/2;
	        }
	        return (int) result;
}
	
	public int reverseBits(int n) {        
		int rev = 0;
	 
    // traversing bits of 'n' 
    // from the right
    while (n > 0) 
    {
        // bitwise left shift 
        // 'rev' by 1
        rev <<= 1;

        // if current bit is '1'
        if ((int)(n & 1) == 1)
            rev ^= 1;

        // bitwise right shift 
        //'n' by 1
        n >>= 1;
    }
    // required number
    return rev;
   }
}
