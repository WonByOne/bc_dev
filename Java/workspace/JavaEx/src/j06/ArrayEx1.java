package j06;

// 배열
// 연속적 메모리할당 (컬렉션과 나중에 비교)
// in Java, Array is an OBJ

public class ArrayEx1 {

	public static void main(String[] args) {
		
		// int m[3]; stack에 할당 - Java에서는 불가능
		
		// new -> OBJ라는 의미, heap 영역 메모리 할당
		int n[] = new int[3];				// 빈 배열
		int m[] = new int[]	{ 10, 20, 30 };	// 초기값
		
		for(int i=0;i<m.length;i++) {
			System.out.println("m["+i+"] : "+m[i]);
		}
		
		System.out.println();		

		// 개선된 루프  - since v1.5		
		for(int a : m) {	// 배열이나 컬렉션만 올 수 있다 같은 자료형만 가능
							// index 사용 불가
			System.out.println(a);
		}
		
		
	}

}
