package j01;

/*
변수		변하는 값 / 메모리 할당
자료형	키워드	크기		기본값
鸚뤄옙筌�占썲ㅇ占쏙쭪怨ㅼ삕筌ｏ옙	boolean	1bit	false	// 冶⑨옙�뜝�룞�삕筌Ｑ띿삕筌ｏ옙�뜝�럩占썲ㅇ占썲뜝�럩占썲뜝占� 1byte �뜝�룞�삕鸚뤄옙筌�占�, 0 != false
�뜝�럩占썲㎤占쏙㎗占썲뜝�럩猿�	byte	1byte	0		2^8 -128 ~ 127
	short	2byte	0
	int		4byte	0		�뜝�럩占썲㎤占쏙㎗占� 筌욌�媛밧ㅇ占썲ㅇ占�
	long	8byte	0
冶⑨옙�뜝�럩占쏙㎗占썲뜝�럩猿�	float	4byte 	0.0     冶⑨옙�뜝�럩占쏙㎗�벝�삕筌욑옙 7�뜝�룞�삕鸚뤄옙筌욑옙
	double  8byte	0.0		冶⑨옙�뜝�럩占쏙㎗�벝�삕筌욑옙 14�뜝�룞�삕鸚뤄옙筌욑옙	冶⑨옙�뜝�럩占쏙㎗占� 筌욌�媛밧ㅇ占썲ㅇ占�
문자 char		2byte	\u0000  2^16 65535 �뜝�럩�렅鸚뤄옙�뜝�룞�삕�뜝�럩占쏙㎖占� null   
鸚뤄옙筌욊낀�삕�뜝�럩占쏙쭪占�			2char�뜝�룞�삕鸚룐뫗占�	null 	// 冶⑨옙筌욑옙鸚룐뫗占썲뜝�룞�삕 鸚뤄옙筌≪럩占쏙㎗占� �뜝�룞�삕冶⑨옙筌ｏ옙 +鸚뤄옙筌욑옙 鸚뤄옙�뜝�럩占쏙쭪占쏙쭪紐뚯삕 �뜝�룞�삕冶⑨옙�뜝占�
*/

// int a =  10; // 鸚뤄옙筌욊퉮占쏙㎗占� 冶⑨옙筌욌�占쏙㎖占� = 鸚뤄옙�뜝�럩占쏙㎖�뫁占쏙쭪占� �뜝�룞�삕鸚뤄옙筌�占�

public class VariableEx {

	public static void main(String[] args) {
		boolean a = true;
		System.out.println("boolean : " + a);
		
		byte b = -128;		// -128 ~ 127
		System.out.println("byte : " + b);
		
		short c = 32767;	// -32768 ~ 32767
		System.out.println("short : " + c);
		
		long d = 10L;		// 10L long java에서는 의미 없음
		System.out.println("long : "+ d);

		float e = 5.5F;		// float = double
		System.out.println("float : " + e);
		
		char f = '월';
		System.out.println("char : " + f);
		
		String g = "ABC";	// char �뜝�럩爰쇔뜝�룞�삕�뜝�룞�삕
		System.out.println("String : " + g);
				
		//	 0   1   2   3
		// | A | B | C | \0 |   // null
		
	
		// �뜝�럩猿쒎ㅇ占쏙쭪源띿삕筌욑옙
		// int num1 = 10.5;   	// int 4byte = double 8byte
		int num1 = (int) 10.5; 	// 강제 형변환
		System.out.println(num1);
		double num2 = 10;		// double 8byte = int 4byte �뜝�룞�삕鸚뤄옙冶⑨옙 �뜝�럩猿쒎ㅇ占쏙쭪源띿삕筌욑옙
		System.out.println(num2);
		
		
	}

}
