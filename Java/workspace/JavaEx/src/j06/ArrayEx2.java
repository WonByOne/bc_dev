package j06;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

public class ArrayEx2 {

	public static int Max(int[] m) {
		int max = m[0];
		for(int i=0;i<m.length;i++) {
			if (m[i] > max) max = m[i];	// 처음 코딩 - 직관적으로 생각했음 
//			if (max < m[i]) max = m[i];	// 가급적 상수를 앞으로 - 선생님 설명
			// 그런데 계속 변하는 max를 변수로 봐야하지 않을까?
		}
		return max;
	}
	
	public static int Min(int[] m) {
		int min = m[0];
		for(int i=0;i<m.length;i++) {
			if (min > m[i]) min = m[i];
		}
		return min;
	}
	
	public static void printArr(int[] m) {
		for(int i=0;i<m.length;i++) {
			System.out.println();
		}
			
	}
	
//	public static int[] Rank_(int[] m) {
//		
//		
//		int r[] = new int[m.length];
//		int cnt = 0;
//		for(int i=0;i<m.length-1;i++) {
//			for(int j=i+1;j<m.length;j++) {
//				if(m[i]<m[j]) {
//					cnt++; 	// 보다 큰 수가 cnt 개 만큼 있다.
//					r[i]= m.length-cnt; // 순위 바뀜;
//				}	
//				
//				else ;					// 순위 안 바뀜
//					
//			}
//		}
//				
//		return r; 
//	}
	
	
	public static int[] Rank(int[] m) {
		// 바뀔 때 마다 순위를 +1 해주는 방법
		
		
		int r[] = new int[m.length];
		for(int i=0;i<m.length;i++) {
			r[i] = 1;
			for(int j=0;j<m.length;j++) {
				if(m[i]<m[j]) r[i]++; // 순위 바뀜;
				else ;					// 순위 안 바뀜
					
			}
		}
				
		return r; 
	}
	

	// Selection Sort	
//	public static void SortAsc(int[] m) {	// 출력까지 
//		int tmp;
//		for(int i=0;i<m.length-1;i++) {		// 전체 방보다 하나 적게
//			for(int j=i+1;j<m.length;j++) {
//				if(m[i]>m[j]) {				// 오름차순
//					tmp = m[i];
//					m[i] = m[j]; 			// 서로 바꿈;
//					m[j] = tmp;
//				}				
//			}
//		}
//		for(int i=0;i<m.length;i++)
//			System.out.println("Sort["+i+"] : "+m[i]);
//		
//		System.out.println();
//	}
	
	public static int[] SortDec(int[] m) {	
		int tmp;
		for(int i=0;i<m.length-1;i++) {		// 전체 방보다 하나 적게
			for(int j=i+1;j<m.length;j++) {
				if(m[i]<m[j]) {				// 내림차순
					tmp = m[i];
					m[i] = m[j]; 			// 서로 바꿈
					m[j] = tmp;
				}				
			}
		}
				
		return m; // 정렬된 배열을 리턴
	}
	
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader( new InputStreamReader( System.in ) );
		int m[] = new int[5];
		
		for(int i=0;i<m.length;i++) {
			System.out.print("정수 "+(i+1)+" : ");
			m[i] = Integer.parseInt(br.readLine());
		}
		System.out.println();
		
			
		// 배열 출력하기
		printArr(m);
		
		for(int i=0;i<m.length;i++) {
			System.out.println("m["+i+"] : "+m[i]);
		}
		
		System.out.println("Max : "+Max(m));
		System.out.println("Min : "+Min(m));
		System.out.println();
		
		// 석차 구하기
//		int Rank_[]= Rank_(m);		
		int Rank[] = Rank(m);
		
		for(int i=0;i<Rank.length;i++)
		System.out.println("Rank["+i+"] : "+Rank[i]);
		System.out.println();
		
		// Sort
		// SortAsc(m);
		Arrays.sort(m);
		
		// m = SortDec(m);
		for(int i=0;i<m.length;i++)
			System.out.println("Sort["+i+"] : "+m[i]);
		
		
	}

}
