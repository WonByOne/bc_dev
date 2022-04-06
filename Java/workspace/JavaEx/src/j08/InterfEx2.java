package j08;

interface Interface1 {
	int a = 10;
	public int getA();
}

interface Interface2  {
	int b = 20;
	public int getB();
}

interface Interface3 extends Interface1, Interface2 {	// 다중 상속 interface 끼리는 extends 상속
	int c = 30;
	public int getC();
}

public class InterfEx2 implements Interface3 {
	public int getA() {
		return a;
	}
	public int getB() {
		return b;
	}
	public int getC() {
		return c;
	}
	
	
	public static void main(String[] args) {
		InterfEx2 ie = new InterfEx2();
		System.out.println(ie.getA());
		System.out.println(ie.getB());
		System.out.println(ie.getC());
		
	}

}
