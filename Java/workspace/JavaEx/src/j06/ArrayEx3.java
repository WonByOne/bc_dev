package j06;

public class ArrayEx3 {

	public static void main(String[] args) {
		int m[][] = new int[][] {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
		for(int i=0;i<m.length;i++) {			// 행
			for(int j=0;j<m[i].length;j++) {	// 열
				System.out.print("m["+i+"]["+j+"] : "+m[i][j]+"\t");;
			}
			System.out.println();
		}
		
		System.out.println();
		
		// 가변 배열
		int a[] = { 10, 20, 30 };		// 초기값 때는 new 생략 가능(그래도 heap 영역) 내부적으로는 같음
		int b[] = { 40, 50, 60, 70 };
		int n[][] = { a, b };
		
		for(int i=0;i<n.length;i++) {			// 행
			for(int j=0;j<n[i].length;j++) {	// 열
				System.out.print("n["+i+"]["+j+"] : "+n[i][j]+"\t");;
			}
			System.out.println();
		}
		
		
		
	}

}
