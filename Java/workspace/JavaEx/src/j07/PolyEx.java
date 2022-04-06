package j07;
// 다형성

abstract class Design {
	int a = 5, b = 7;
	double area;
	public abstract void calc();	// 면적 계산
	public void disp() {			// 면적 출력
		System.out.println(this.getClass().getSimpleName()+"\t: "+area);
	}
}
class Rect extends Design {
	
	public void calc() {
		area = a * b;
	}
	
//	public void disp() {
//		System.out.println("Rectangle\t: "+area);
//	}
	
}

class Tri extends Design {
	
	public void calc() {
		area = a * b / 2.0;
	}
	
//	public void disp() {
//		System.out.println("Triangle\t: "+area);
//	}
}

class Circle extends Design {
	
	public void calc() {
		area = a * a * Math.PI;
	}
	
//	public void disp() {
//		System.out.println("Cirle\t\t: "+area);
//	}
}


public class PolyEx {

	public static void main(String[] args) {
		Design de[] = { new Rect(), new Tri(), new Circle()};	// 객체의 주소를 배열로
															 	// 자식 객체를 부모형에 넣는 셈
		for(Design d : de) {
			d.calc();			// de[0].disp(); 실질적으로는 Design 자료형 호출 - 주소로 자식 객체 억세스
			d.disp();			// 들어가는 것은 하나인데 나오는 건 여러개.
		}						// 전화기의 back() 버튼.. 메뉴/전화/메세지 등등에 따라 다르게 작동
		
		
		Rect r = new Rect();
//		Tri t = new Tri();
//		Circle c = new Circle();
//		
		r.calc();
		r.disp();
//		
//		t.cals();
//		t.disp();
//		
//		c.cals();
//		c.disp();
		
		
	}

}
