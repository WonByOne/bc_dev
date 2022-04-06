package j06;


public class ArrayEx4 {

	public static void printArr(int m[][]) {
		for(int i=0;i<m.length;i++) {
			for(int j=0;j<m[i].length;j++) {
				System.out.print(String.format("%3d", m[i][j])+"\t");
			}
			System.out.println();
		}
		System.out.println();
	}
	
	public static int[][] Sum(int m[][]) {
			
		for(int i=0;i<m.length-1;i++) {
			for(int j=0;j<m[i].length-1;j++) {
				m[i][m[i].length-1] += m[i][j];  // 맞음
				m[m.length-1][j] += m[i][j];
				m[m.length-1][m[i].length-1] += m[i][j];
			}
			
		}
		return m;
	}
	public static void main(String[] args) {
//		int m[][] = {{1, 2, 3, 0},
//					 {4, 5, 6, 0},
//					 {7, 8, 9, 0},
//					 {0, 0, 0, 0}};
		
		
		int m[][] = {{1, 2, 3, 4, 0},
					 {5, 6, 7, 8, 0},
					 {9, 10, 11, 12, 0},
					 {0, 0, 0, 0, 0}};
				     
		printArr(m);
		
		m = Sum(m);
		
		printArr(m);
		
		
		
	}

}
