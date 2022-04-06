package j06;

// 달팽이 해볼것

public class ArrayEx5 {

	public static void printArr(int m[][]) {
		for(int i=0;i<m.length;i++) {
			for(int j=0;j<m[i].length;j++) {
				System.out.print(String.format("%2d", m[i][j])+"\t");
			}
			System.out.println();
		}
		System.out.println();
	}
	
	public static int[][] rowInc(int n[][], int i) {
		
		for(int j=i;j<n[i].length;j++) {
			n[i][j] += 1;	
		}
		
		return n;
		
	}
	
	public static int[][] colInc(int n[][], int j) {
		
		for(int i=0;i<n.length-1;i++) {
			n[i][j] += 1;	
		}
		return n;
		
	}
	
	public static void main(String[] args) {
		
		int size = 5;
		int m[][] = new int[size][size];
		int n[][] = new int[size][size];
		int cnt = 0;
		
//		for(int i=0;i<m.length;i++) {
//			for(int j=0;j<m[i].length;j++) {
//				m[i][j] = ++cnt;
//				m[j][i] = ++cnt;	// 열 먼저
//				if(j==m[i].length/2 || i == m.length/2) 							// 십자가
//				if(i==j || i+j==m[i].length-1) 										// X 모양
//				if(i == 0 || i == m.length-1 || j == 0 || j == m[i].length-1) 		// 테두리				
//				if(!(i == 0 || i == m.length-1 || j == 0 || j == m[i].length-1))	// 테두리 제외
//		
//					m[i][j] = ++ cnt;
//			}
//		}
			

//		for(int i=0;i<m.length/2+1;i++) {
//			for(int j=m[i].length/2-i;j<m[i].length/2+i+1;j++) {
//					m[i][j] = ++ cnt;
//			}
//		}
//			
//		for(int i=m.length/2+1;i<m.length;i++) {
//			for(int j=i-m.length/2;j<m[i].length-i+m.length/2;j++) {
//				m[i][j] = ++ cnt;
//			}
//			
//		}

		int a = size/2;
		int b = size/2;
		
		for(int i=0;i<m.length;i++) {
			for(int j=a; j<=b;j++) {
				m[i][j]= ++cnt;
			}
			if (i < size/2)	{
				a--; b++;
			} else {
				a++; b--;
			}	
		}
		
		printArr(m);
		
	
		// 행을 순차증가 하면서 ㄱ모양으로 역순으로 스캔하면서 ㄴ자모양으로 출력 번갈아가면서 행과 열을 축소  
		// 행열이 짝수이거나 행과 열이 다를 때는??
		
		cnt = 0;
		int row = n.length - 1;
		int col = n[0].length -1;
		
		for(int k=0;k<size;k++) {
			if(k%2==0) {
				for(int i=0+k/2;i<=row-k/2;i++) {		// 순서대로 증가 
					for(int j=0+k/2;j<=col-k/2;j++) {
									
						if(i == 0+k/2 || j == col-k/2)	// ㄱ자 모양
							n[i][j] = ++ cnt;
					}
				}
			} else {
				for(int i=row-k/2;i>=1+k/2;i--) {		// 역순 스캔 
					for(int j=col-1-k/2;j>=0+k/2;j--) {	
										
						if(i == row-k/2 || j == k/2) 	// ㄴ 자 모양
							n[i][j] = ++ cnt;
					}
				}	
			}
		}
		
		
		
		
//		for(int i=0;i<n.length;i++) {
//			
//				n = rowInc(n, i);// row행 순차증가
//			
//				for(int j=0;j<n[i].length;j++) {
//					
//					// 세로행 증가
////					n = colInc(n, n[i].length-1); 
					
			
//				}
//							
//		}
	
		printArr(n);

	}
}

