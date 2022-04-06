package j01;

// 연산자


/* �뜝�럡占썲뜝�럡占썲뜝�룞�삕 �뜝�럡占썲뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
1. 증감연산자
	++ --
2. 산술연산자
	* / % + - 
3. 쉬프트연산자
	<< >> >>>
4. 비교(관계)연산자
	< > <= >= == !=
5. 비트연산자
	& | ^ ~ 		~ (1의 보수 /bit not)는 1번  * 2의 보수 = 1의 보수 + 1
6. 논리연산자
	&& || !			! (부정연산자/논리 not)는 1번
7. 조건(삼항)연산자
	? :
8. 대입연산자
	= += -= *= /= %=
 
*/


public class OperatorEx1 {

	public static void main(String[] args) {
		int a = 10, b = 10;
		System.out.println("a : " + a + '\t' + "b : " + b);

		b = ++a;	// 선 증가
		System.out.println("a : " + a + '\t' + "b : " + b);
		
		b = a++;	// 후 증가
		System.out.println("a : " + a + '\t' + "b : " + b);
		
		a = b = 10;
		System.out.println("a : " + ++a + '\t' + "b : " + b++);
		// 					a : 11				  b : 10
		
		System.out.println("a : " + a + '\t' + "b : " + b);
		// 					a : 11				  b : 11
	
	    System.out.println(5 / 2);			// int
	    System.out.println(5 / 2.0);		
	    System.out.println(5.0 / 2);		
	    System.out.println(5 / (double) 2);	
	 
	    System.out.println(5 / 2.0f);      	// float
	    System.out.println('A' + 1);		// int
	    
	    System.out.println( 5 % 2 );		// remainder
	    
	    
	}

}
