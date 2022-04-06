package j06;

/* Wrapper Class	// lang package
 
	boolean		Boolean
	byte		Byte
	char 		Character	* 주의
	double		Double
	float		Float
	int			Integer		* 주의
	short		Short
	long		Long
	void		Void
	
*/

public class WrapperEx {

	public static void main(String[] args) {

		
//		String s = a.parseInt();
			
		System.out.println(Integer.MAX_VALUE); 	// 필드명 대문자 약속
		System.out.println(Integer.MIN_VALUE); 	// 필드명 대문자 약속
		
		System.out.println(Integer.BYTES);
		System.out.println();
		
		Integer a = new Integer(20);	// int a = 10; 과 같이 됨 * 오토박싱
//		Integer b = new Integer("ABC");	// Integer의 예외
		
		int c = Integer.parseInt("123");
//		int d = Integer.parseInt("ABC"); // 예외처리 필요
		
		System.out.println(" 2진수 : " + Integer.toBinaryString(a));
		System.out.println(" 8진수 : " + Integer.toOctalString(a));
		System.out.println("16진수 : " + Integer.toHexString(200));
		System.out.println();
		
		System.out.println("10진수 : " + 10);
		System.out.println(" 8진수 : " + 010);	// prefix 0  :  8진수
		System.out.println("16진수 : " + 0x10);	// prefix 0x : 16진수
		System.out.println("16진수 : " + 0xff);	// prefix 0x : ff == 255
		
		
		
		// 오토박싱(객체로) / 언박싱(객체를 풀어줌) 		v1.5 부터
		
		Integer aa = 10;			
		// aa는 stack영역 주소 - heap 영역에 10 자동으로
		// Integer aa = new Integer(10);
		
		int bb = new Integer(10);	// int bb = 10; 
		
		
//		System.out.println(s);
		
		
		
	}

}
