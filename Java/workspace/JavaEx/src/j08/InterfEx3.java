package j08;
// Adapter Class

interface Inf1 {
	int a = 10;
	public int getA();
}
interface Inf2 {
	int b = 20;
	public int getB();
}
abstract class InfSuper implements Inf1, Inf2{	// interface의 모든 abstract method를 구현해놓은 class
	public int getA() {								
		return a;
	}
	public abstract int getB();
}

public class InterfEx3 extends InfSuper{
	public int getB() {		// 자식 클래스에서 인터페이스 method를 구현하면 부모 클래스가 추상 클래스이어야 한다.
		return b;
	}
	
	public static void main(String[] args) {

	}

}
