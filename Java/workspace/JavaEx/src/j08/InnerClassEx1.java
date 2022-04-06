package j08;


// Inner Class
// 외부 클래스 멤버 참조 가능
// static 변수 못 가짐
// 외부 클랙스 객체 생성 후 내부 클래스 객체 생성 가능

// Local 	특정한 method 내에 클래스가 정의된 경우
// 간단한 기능을 가지는 임시 클래스
// 선언한 method 안에서만 객체화 할 수 있다 
// method 외부에서 사용할 수 없다.
// modifier 사용할 수 없다.

// Static	클래스가 static으로 선언된 경우
// static 변수가 있는 경우
// 외부 클래스의 static 멤버만 참조 가능

// Anonymous
// 한 번만 사용하고 버려야 할 객체의 경우

/*
	class Outer  	- int a
 					- disp()	- class InnerLocal	- int c
 													- disp()
  					- class InnerMember			- int b		// 멤버 내부 클래스
  												- disp()
					- static class InnerStatic	- int d		// 멤버 내부 클래스에만 static 가능
												- disp()
	abstract class InnerAnony	- int e	// 사용할 때 내부클래스로 사용 현재는 그냥 추상 클래스
								- disp()
*/					


class Outer{	// 외부 클래스
	
	private int a = 10;
	public void disp() {
		System.out.println("Outer : "+a);
//		System.out.println("Outer : "+b); 	// 내부클래스 멤버 접근 불가 - 지역변수 개념
		
		class InnerLocal {
			private int c = 30;
			public void disp() {
				System.out.println("InnerLocal a : "+a);
				System.out.println("InnerLocal c : "+c);
			}
		} // class InnerLocal
		InnerLocal il = new InnerLocal();
		il.disp();
	}
	
	// 멤버 내부 클래스
	class InnerMember {
		private int b = 20;
		public void disp() {
			System.out.println("InnerMember a : "+a);	// 외부클래스 멤버 접근 가능
			System.out.println("InnerMember b : "+b);
		}
	} // class InnerMember
	
	// Static 내부 클래스
	static class InnerStatic {		// static class로 만들어야한다.
		private static int d = 40; 	// static 변수를 사용해야한다면				
		public void disp() {
//			System.out.println("InnerStatic a : "+a);	// 외부클래스 static 멤버 접근 불가
			System.out.println("InnerStatic d : "+d);
		}
	} // class InnerStatic
	
} // class Outer

abstract class InnerAnony {
	int e = 50;
	public abstract void disp();
} // class InnerAnony


public class InnerClassEx1 {

	public static void main(String[] args) {
		
//		Outer.InnerMember im = new Outer().new InnerMember();	// 일회용 객체
		
		Outer out = new Outer();								// 외부 객체도 사용할 거라면
		Outer.InnerMember im = out.new InnerMember();	
		im.disp();
		
		out.disp();
		
		// Static Inner Class
		Outer.InnerStatic is = new Outer.InnerStatic();
		is.disp();
		
		// Anonymous Inner Class
		InnerAnony ia = new InnerAnony() {		// 중괄호 이후부터 클래스 완성
			public void disp() {
				System.out.println("InnerAnony e : "+e);
			}
		};
		
		ia.disp();
	
		new InnerAnony() {
			public void disp() {
				System.out.println("InnerAnony e : "+e);
			}
		}.disp();	// 
		
		
	}

}
