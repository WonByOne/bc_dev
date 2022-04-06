package j07;

public class ClassStudy {
	int m[];							// 참조변수만 만들고
	
	public ClassStudy(int ... m) {		// 컨스트럭터 integer 여러개 받은 걸 배열로 처리
		this.m = m;						// 받아온 배열로 객체 생성
	}

//	public String getName() {
//		String name = new Object() {}.getClass().getEnclosingMethod().getName();
//		
//		return name;
//		
//	}
//	public void Print {
//		public void call();
//	}
//	public void print() {
//		final String methodName = new Object() {}.getClass().getEnclosingMethod().getName();
//		System.out.println(methodName+"\t: "+);
//	}
	
	public int total() {
		int tot=0;
//		for(int i=0;i<m.length;i++) { 	
//			tot += m[i];	
//		}
		for(int i : m) {				// 개선된 for
			tot += i;
		}
		return tot;
	}
	
	public double average() {
		return total()/(double)m.length;
	}
	
	public String pass() {
//		if (total()/m.length>=70) return "Pass";
//		return "Fail";
		return total()/m.length >= 70 ? "Pass" : "Fail";// 삼항연산 사용
	}
	
	public static void main(String[] args) {
		ClassStudy cs = new ClassStudy(87, 55, 65);		// 컨스트럭터 필요
		System.out.println("Total\t: "+cs.total());  	// total()이라는 함수명을 가져올 수 없을까 
		System.out.println("Average\t: "+cs.average());
		System.out.println("Pass\t: "+cs.pass());
		
	}

}
