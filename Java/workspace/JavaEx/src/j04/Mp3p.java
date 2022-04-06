package j04;

// Class	Mp3p
// 속성		color 색상
//			memory
// 멤버함수	setColor()
//			setMemory()
//			getColor()
//			getMemory()
//


public class Mp3p {				

	private String color;
	private int memory;
//	public int memory;
	
	
//	setter
	
	public void setColor( String c ) {
		if(c.equals("빨간색") || c.equals("파란색") || c.equals("노란색")) color = c;
		// 문자열은 == 로 비교시 주소를 비교한다
		else System.out.println("잘못된 색상");
	}
	
	public void setMemory( int m ) {
		
		double mem = m; 
	    int cnt = 0;
		
	    if (mem % 2 != 0) {
			System.out.println("지원하지 않는 용량");
			
	    while(true ) {
			cnt++;
			mem = mem / 2.0;
						
			if (mem == 2 && cnt < 4) memory = m;
			break;
				
			}	
	    }
		
		
		if (m == 64 || m == 128 || m == 256)	memory = m;
		else System.out.println("지원하지 않는 용량");
		
	}
	
//	getter
	
	public String getColor () {
		return color;

	}
	
	public int getMemory() {
		return memory;
	}
	
	public void printMp3p() {
		System.out.println("색상 : " + color);
		System.out.println("용량 : " + memory);
	}

	
	
	
//		/* static heap(new<->delete(JVM)) stack 골라서 사용 */            int a = 0; <- 스택에 자동할당(자동으로 메모리 반납)
	public static void main(String[] args) {  	// main member
		Mp3p m3;   			// 참조 변수 *C에서 포인터 변수  *heap 영역의 주소를 static 영역에 저장
		
		m3 = new Mp3p(); 	// 객체 생성 / 인스턴스 * Java에서는 heap에 할당할 수 밖에 없다
		
		m3.setColor("빨간색");
		m3.setMemory(64);
		m3.printMp3p();
		
//		System.out.println("색상 : " + m3.getColor());   	// .out 앞의 점은 static?
		System.out.println("색상 : " + m3.color);			// 캡슐화 구현x java에서는 private도 접근이 가능하다	
		System.out.println("용량 : " + m3.getMemory());
		
		Mp3p m4 = new Mp3p();
		m4.setColor("금색");
		m4.setMemory(512);
		m4.printMp3p();
		
		
	}

}
