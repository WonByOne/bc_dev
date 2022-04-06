package j05;

public class StringEx {

	
	public void ed(String a, String b) {
		
		if (a == b) System.out.println("Equal"); 	// 주소 비교
		else System.out.println("Different");
		if(a.equals(b)) System.out.println("Equal");
		else System.out.println("Different");
		System.out.println();
	}
	
	public static void main(String[] args) {
		// Math
		
		// Math m = new math();
		
		
		System.out.println(Math.random());
		
		StringEx me = new StringEx();
		
		// String
		
		String s1 = "Hello";			// 자바에서 문자열은 String 객체다. heap 영역에 자동 생성
		String s2 = "Hello";			// "Hello" 라는 객체가 생성되어서 재사용 된다!
		
		me.ed(s1,s2);		
			
		
		String s3 = new String("Hello");	// 생성자 호출
		String s4 = new String("Hello");
		
		me.ed(s3, s4);
		
		
		String s5 = "a";
						
		me.ed(s1, s5);
		
		s5 = "Hello";			// Hello 재사용
		
		me.ed(s1, s5);
		
		s5 = s5.replace("o", " ");
		
//		StringBuffer
		
//		StringBuffer s6 = new StringBuffer(s1);
		
		
		s1 += " Java!!";		// Hello Java!! 객체 생김 기존 Hello는 Garbage가 된다. 
		
		me.ed(s1, s2);
		
		
		// String Method
		System.out.println("charAt : " + s1.charAt(6));
		System.out.println("compareTo : " + s1.compareTo("Hello") ); // 다른 갯수 리턴
		System.out.println("concat : " + s1.concat("!!")); 	// s1은 그대로
		System.out.println("concat : " + s1);
		System.out.println("endsWith : " + s1.endsWith("!!"));
		System.out.println("endsWith : " + s1.endsWith("!!!"));
		System.out.println("startsWith : " + s1.startsWith("He"));
		System.out.println("startsWith : " + s1.startsWith("Ho"));
		System.out.println("indexOf : " + s1.indexOf('a'));			// 첫번째 a
		System.out.println("lastIndexOf : " + s1.lastIndexOf('a'));	// 첫번째 a
		System.out.println("lengh : "+ s1.length()); 				// null 제외
		System.out.println("replace : " + s1.replace( 'a', 'c'));
		
		String[] ss = s1.split("a");   	// a를 없애고 자름
		for(int i=0; i<ss.length; i++) {
			System.out.println("split : " + ss[i]);
		}
		
		System.out.println("substring : " + s1.substring(6));
		System.out.println("substring : " + s1.substring(6, 11));	// endIndex : -1 마지막에 \0으로 대체됨
		
		System.out.println("toLowerCase : " + s1.toLowerCase());
		System.out.println("toUpperCase : " + s1.toUpperCase());
				
		
		String str = "     a a   a    ";
		System.out.println("str : " + str);
		System.out.println("trim : " + str.trim());	// 앞뒤 여백 지우기
		
		String a = "123";
//		int b = (int) a;
		int b = Integer.parseInt(a);
		
		int c = 100;
		
//		String d = (String) c;
		String d = String.valueOf(c);
		double e = 10.5;
		String f = String.valueOf(e);
		
		
		
		
		
	}

}
