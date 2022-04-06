package j05;

// class	public default
// member	public default protected private


// default public class EncapEx {   // wrong 
// class EncapEx {                  // default

class Encap {						// default : only main is public when making other class in same file
	private int a = 10;
	protected int b = 20;
	int c = 30;				// default
	public int d = 40;
	
	public int getA() {		// a에 대신 접근해주는 역할
		return a;
	}
	
}

public class EncapEx {   			// 클래스 앞에는 대개 public
	
	private int aa = 1;
	protected int bb = 2;
	int cc = 3;
	public int dd = 4;

	public static void main(String[] args) {
		EncapEx ee = new EncapEx();
		System.out.println("aa : " + ee.aa);	// private 이지만 main이 같은 member이기 때문에 가능
		System.out.println("bb : " + ee.bb);
		System.out.println("cc : " + ee.cc);
		System.out.println("dd : " + ee.dd);
		
		
		Encap ec = new Encap();
		
//		System.out.println("a : " + ec.a);	// 같은 멤버끼리만 가능 (in Encap class)
		System.out.println("a : " + ec.getA() );
		
		System.out.println("b : " + ec.b);	// 상속 (or same package)
		System.out.println("c : " + ec.c);	// same package
		System.out.println("d : " + ec.d);	// 아무나 접근
		
	}

}
